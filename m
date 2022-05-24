From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Date: Tue, 24 May 2022 11:25:28 +0200
Message-ID: <B0C9F5C5-898E-4682-8B32-9802E1605A9E@osterried.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <20220523135214.GE4009@kadam>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220523135214.GE4009@kadam>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Carpenter <dan.carpenter@oracle.com>, duoming@zju.edu.cn
Cc: linux-hams@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>


> Am 23.05.2022 um 15:52 schrieb Dan Carpenter <dan.carpenter@oracle.com>:
> 
> 
[..]
> 
> I tried to apply your patch but the format is wrong...  :/

I thought it would help us to discuss the problem on the mailinglist
at the code fragment.
But I also asked for testing, and then you need a working patch
Was my fault. Sorry for that.


diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 363d47f94532..498e92fb43b7 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -86,11 +86,17 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
        ax25_for_each(s, &ax25_list) {
                if (s->ax25_dev == ax25_dev) {
+                       del_timer_sync(&s->timer);
+                       del_timer_sync(&s->t1timer);
+                       del_timer_sync(&s->t2timer);
+                       del_timer_sync(&s->t3timer);
+                       del_timer_sync(&s->idletimer);
                        sk = s->sk;
                        if (!sk) {
                                spin_unlock_bh(&ax25_list_lock);
                                ax25_disconnect(s, ENETUNREACH);
                                s->ax25_dev = NULL;
+                               ax25_cb_del(s);
                                spin_lock_bh(&ax25_list_lock);
                                goto again;
                        }
@@ -104,6 +110,7 @@ static void ax25_kill_by_device(struct net_device *dev)
                                ax25_dev_put(ax25_dev);
                        }
                        release_sock(sk);
+                       ax25_cb_del(s);
                        spin_lock_bh(&ax25_list_lock);
                        sock_put(sk);
                        /* The entry could have been deleted from the
@@ -1052,12 +1059,8 @@ static int ax25_release(struct socket *sock)
                sk->sk_state_change(sk);
                ax25_destroy_socket(ax25);
        }
+
        if (ax25_dev) {
-               del_timer_sync(&ax25->timer);
-               del_timer_sync(&ax25->t1timer);
-               del_timer_sync(&ax25->t2timer);
-               del_timer_sync(&ax25->t3timer);
-               del_timer_sync(&ax25->idletimer);
                dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
                ax25_dev_put(ax25_dev);
        }


In that context, I ask to revert (as I argued in my initial mail):
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/ax25_subr.c?id=fc6d01ff9ef03b66d4a3a23b46fc3c3d8cf92009



In my diff from yesterday, I also had a part around "case AX25_STATE_0:").
This fixes another problem.
I removed it from my patch above: it has to discussed later as separate topic.


Btw, Douming, you introduced del_timer_sync().
ax25_stop_heartbeat(), ax25_stop_t1timer(), ax25_stop_t2timer(), ax25_stop_t3timer(),
ax25_stop_idletimer() from ax25_timer.c use del_timer().

Why do you use del_timer_sync() directly?
And if del_timer_sync() is needed, is it only needed in a special case,
or isn't it cleaner to change the ax25_stop_xxx() timer functions?


vy 73,
	- Thomas  dl9sau




