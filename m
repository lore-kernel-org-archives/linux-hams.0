From: Thomas Osterried <thomas@osterried.de>
Subject: 1. incoming ax25 session cleanup and 2. re-sending DISC
Date: Fri, 27 May 2022 12:48:01 +0200
Message-ID: <4BF0AF86-10D7-412B-B890-5BD38CE32B9B@osterried.de>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Basil Gunn <basil@pacabunga.com>, "David S. Miller" <davem@davemloft.net>, Duoming Zhou <duoming@zju.edu.cn>

Hello,

now after we fixed the ax25 timer stuff, here's are proposals for
I.  fix for incoming session cleanup in ax25_disconnect() in ax25_subr.c
II. fix for disconnect behavior

I)

Situation:
  Incoming connection request from remote site.
  Session established.
  Remote site disconnects.

  bpq0: fm DL9SAU-4 to DL9SAU-1 ctl SABM+ 10:38:06.374299 
  bpq0: fm DL9SAU-1 to DL9SAU-4 ctl UA- 10:38:06.375592 
  bpq0: fm DL9SAU-4 to DL9SAU-1 ctl DISC+ 10:39:00.500327 
  bpq0: fm DL9SAU-1 to DL9SAU-4 ctl UA- 10:39:00.529162 

netstat --ax25:
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
DL9SAU-4   DL9SAU-1   ???     LISTENING    000/000  0       0     


That incoming session had no connection to a socket (-> ax25->sk is 0), and this is ok.

Cause:
ax25_subr.c:
ax25_disconnect() stops heartbeat timer:
  if (!ax25->sk || !sock_flag(ax25->sk, SOCK_DESTROY)) {
    ax25_stop_heartbeat(ax25);
  }

Soultion:
  if (ax25->sk && !sock_flag(ax25->sk, SOCK_DESTROY)) {
    ax25_stop_heartbeat(ax25);
  }


History:

1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25?id=da278622bf04f8ddb14519a2b8214e108ef26101
added ax25_stop_heartbeat(
   -> This introduced the long standing problem with ex-sessions in listening state.

2. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25?id=4a7d99ea1b27734558feb6833f180cd38a159940
added
   if (!sock_flag(ax25->sk, SOCK_DESTROY)) {
      ax25_stop_heartbeat(ax25);
which should fix the problem (
    "A socket connection made in ax.25 is not closed when session is completed.
    The heartbeat timer is stopped prematurely and this is where the socket gets closed.
    Allow heatbeat timer to run to close socket. Symptom occurs in kernels >= 4.2.0".
).
[This fixed many cases of listening state ex-sessions, but not all].
Furhermore: this patch caused segfault if ax25->sk is NULL. -> next patch:

3. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25?id=8a367e74c0120ef68c8c70d5a025648c96626df
  if (!ax25->sk || !sock_flag(ax25->sk, SOCK_DESTROY))

=> Incoming sessions with no associated ax25->sk are still (after patch #1) affected
by the problem that ax25_stop_heartbeat() is stopped and nothing cleans them up.


Incoming ax25 sessions with sk == NULL are normal, if i.e. IP mode VC is used.
heartbeat timer is needed for normal session cleanup, i.e. after receiving DISC.
Because running ax25-session cleanup did not made problems (sessions with userspace
sockets, or ip-over-ax25 sessions), I argue that the motivation for patch #1 in
the history was a panic in combination with socket-cleanups.



-> fix:

diff --git a/net/ax25/ax25_subr.c b/net/ax25/ax25_subr.c
index 3a476e4f6cd0..9ff98f46dc6b 100644
--- a/net/ax25/ax25_subr.c
+++ b/net/ax25/ax25_subr.c
@@ -268,7 +268,7 @@ void ax25_disconnect(ax25_cb *ax25, int reason)
                del_timer_sync(&ax25->t3timer);
                del_timer_sync(&ax25->idletimer);
        } else {
-               if (!ax25->sk || !sock_flag(ax25->sk, SOCK_DESTROY))
+               if (ax25->sk && !sock_flag(ax25->sk, SOCK_DESTROY))
                        ax25_stop_heartbeat(ax25);
                ax25_stop_t1timer(ax25);
                ax25_stop_t2timer(ax25);


II)

And another problem was introduced by patch #2 4a7d99ea1b27734558feb6833f180cd38a159940 mentioned above:
ax25_std_timer.c ax25_std_heartbeat_expiry() and ax25_ds_timer.c ax25_ds_heartbeat_expiry() got this in the patch:
	  case AX25_STATE_0:
	+ case AX25_STATE_2:

AX25_STATE_2 in the AX.25 state machine is "Awaiting release state".
If we send DISC (userspace), we should send DISC until we receive a UA or DM,
or sent DISC+ again until t1 expiry.
(On RF, it's not guaranteed, the first packet reaches it's destination.)


With AX25_STATE0 and AX25_STATE_2:
# call -r bpq0 dl9sau-4 &
# listen -a &
# killall call
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:32:02.400597
# netstat --ax25
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q

=> only one DISC is sent. Session is cleaned up immediately.




With only 
  case AX25_STATE_0:
we get the correct behavior again:

# call -r bpq0 dl9sau-4 &
# listen -a &
# killall call
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:15:50.755054 
# netstat --ax25
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
DL9SAU-4   DL9SAU-1   bpq0    DISC SENT    000/000  0       0   
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:15:59.977987 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:16:18.409427 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:16:47.082513 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:17:23.946644 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:18:09.010498 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:19:04.312174 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:20:07.788591 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:21:21.516020 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:22:43.436212 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:24:13.547179 
bpq0: fm DL9SAU-1 to DL9SAU-4 ctl DISC+ 12:25:53.907982 

# netstat --ax25
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
# 


=> patches:

diff --git a/net/ax25/ax25_std_timer.c b/net/ax25/ax25_std_timer.c
index b17da41210cb..17c2db85f24f 100644
--- a/net/ax25/ax25_std_timer.c
+++ b/net/ax25/ax25_std_timer.c
@@ -35,7 +35,6 @@ void ax25_std_heartbeat_expiry(ax25_cb *ax25)
 
        switch (ax25->state) {
        case AX25_STATE_0:
-       case AX25_STATE_2:
                /* Magic here: If we listen() and a new link dies before it
                   is accepted() it isn't 'dead' so doesn't get removed. */
                if (!sk || sock_flag(sk, SOCK_DESTROY) ||


and


diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
index c4f8adbf8144..35eaeef7c5c1 100644
--- a/net/ax25/ax25_ds_timer.c
+++ b/net/ax25/ax25_ds_timer.c
@@ -98,7 +98,6 @@ void ax25_ds_heartbeat_expiry(ax25_cb *ax25)
        switch (ax25->state) {
 
        case AX25_STATE_0:
-       case AX25_STATE_2:
                /* Magic here: If we listen() and a new link dies before it
                   is accepted() it isn't 'dead' so doesn't get removed. */
                if (!sk || sock_flag(sk, SOCK_DESTROY) ||


