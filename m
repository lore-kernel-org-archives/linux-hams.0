From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH net] ax25: Fix ax25 session cleanup problem in
 ax25_release
Date: Fri, 27 May 2022 13:29:30 +0200
Message-ID: <0213B378-9CFF-456E-814E-B27A132CF8F3@osterried.de>
References: <20220525112850.102363-1-duoming@zju.edu.cn>
 <YpCHtRoxEXU7UAji@x-berg.in-berlin.de>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <YpCHtRoxEXU7UAji@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org



> Am 27.05.2022 um 10:11 schrieb Thomas Osterried <thomas@osterried.de>:
> 
> 
> I Tested several cases: this patch works as expected.

Unfortunately, there's an other case where sessions are not cleaned up:

Remote site connects:
bpq0: fm DL9SAU-15 to DL9SAU-1 ctl SABM+ 12:56:30.624845 
bpq0: fm DL9SAU-1 to DL9SAU-15 ctl UA- 12:56:30.626000 


At DL9SAU-1:

# netstat --ax25
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
DL9SAU-15  DL9SAU-1   bpq0    ESTABLISHED  000/000  0       0     

# ifconfig bpq0 down
# netstat --ax25
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
DL9SAU-15  DL9SAU-1   ???     LISTENING    000/000  0       0     
# 

Waited some time. No change.

# rmmod bpqether
# netstat --ax25
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
DL9SAU-15  DL9SAU-1   ???     LISTENING    000/000  0       0   


This is the condition:
ax25_kill_by_device()
  ...
                          if (!sk) {
                                spin_unlock_bh(&ax25_list_lock);
                                ax25_disconnect(s, ENETUNREACH);
				s->ax25_dev = NULL;
  ...

=> ax25_disconnect():
        if (reason == ENETUNREACH) {
                del_timer_sync(&ax25->timer);



-> Nothing cleans the ax25_cb up.
ax25_release() is not part of that kind of sessions.
ax25_disconect() stopped timers.


If you agree, that no concurrent process is able to re-use this ax25_cb,
and because all timers are stoppeed, the cleanup with  ax25_cb_del(s);
should be safe.


My successfull test was this:

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 363d47f94532..de417b974c07 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -91,6 +92,7 @@ static void ax25_kill_by_device(struct net_device *dev)
                                spin_unlock_bh(&ax25_list_lock);
                                ax25_disconnect(s, ENETUNREACH);
                                s->ax25_dev = NULL;
+                               ax25_cb_del(s);
                                spin_lock_bh(&ax25_list_lock);
                                goto again;
                        }


vy 73,
	- Thomas  dl9sau

> 
> 
> On Wed, May 25, 2022 at 07:28:50PM +0800, Duoming Zhou wrote:
>> The timers of ax25 are used for correct session cleanup.
>> If we use ax25_release() to close ax25 sessions and
>> ax25_dev is not null, the del_timer_sync() functions in
>> ax25_release() will execute. As a result, the sessions
>> could not be cleaned up correctly, because the timers
>> have stopped.
>> 
>> This patch adds a device_up flag in ax25_dev in order to
>> judge whether the device is up. If there are sessions to
>> be cleaned up, the del_timer_sync() in ax25_release() will
>> not execute. As a result the sessions could be cleaned up
>> correctly.
>> 
>> Fixes: 82e31755e55f ("ax25: Fix UAF bugs in ax25 timers")
>> Reported-by: Thomas Osterried <thomas@osterried.de>
>> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
>> ---
>> include/net/ax25.h  |  1 +
>> net/ax25/af_ax25.c  | 13 ++++++++-----
>> net/ax25/ax25_dev.c |  1 +
>> 3 files changed, 10 insertions(+), 5 deletions(-)
>> 
>> diff --git a/include/net/ax25.h b/include/net/ax25.h
>> index 0f9790c455b..a427a05672e 100644
>> --- a/include/net/ax25.h
>> +++ b/include/net/ax25.h
>> @@ -228,6 +228,7 @@ typedef struct ax25_dev {
>> 	ax25_dama_info		dama;
>> #endif
>> 	refcount_t		refcount;
>> +	bool device_up;
>> } ax25_dev;
>> 
>> typedef struct ax25_cb {
>> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>> index 363d47f9453..47ce6b630cc 100644
>> --- a/net/ax25/af_ax25.c
>> +++ b/net/ax25/af_ax25.c
>> @@ -81,6 +81,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>> 
>> 	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
>> 		return;
>> +	ax25_dev->device_up = false;
>> 
>> 	spin_lock_bh(&ax25_list_lock);
>> again:
>> @@ -1053,11 +1054,13 @@ static int ax25_release(struct socket *sock)
>> 		ax25_destroy_socket(ax25);
>> 	}
>> 	if (ax25_dev) {
>> -		del_timer_sync(&ax25->timer);
>> -		del_timer_sync(&ax25->t1timer);
>> -		del_timer_sync(&ax25->t2timer);
>> -		del_timer_sync(&ax25->t3timer);
>> -		del_timer_sync(&ax25->idletimer);
>> +		if (!ax25_dev->device_up) {
>> +			del_timer_sync(&ax25->timer);
>> +			del_timer_sync(&ax25->t1timer);
>> +			del_timer_sync(&ax25->t2timer);
>> +			del_timer_sync(&ax25->t3timer);
>> +			del_timer_sync(&ax25->idletimer);
>> +		}
>> 		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>> 		ax25_dev_put(ax25_dev);
>> 	}
>> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
>> index d2a244e1c26..5451be15e07 100644
>> --- a/net/ax25/ax25_dev.c
>> +++ b/net/ax25/ax25_dev.c
>> @@ -62,6 +62,7 @@ void ax25_dev_device_up(struct net_device *dev)
>> 	ax25_dev->dev     = dev;
>> 	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
>> 	ax25_dev->forward = NULL;
>> +	ax25_dev->device_up = true;
>> 
>> 	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
>> 	ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;
>> -- 
>> 2.17.1
>> 
> 

