From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] ax25: Fix NULL pointer dereferences in ax25 timers
Date: Thu, 10 Mar 2022 20:06:40 +0800
Message-ID: <20220310120640.43269-1-duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, Duoming Zhou <duoming@zju.edu.cn>

There are race conditions that may lead to null pointer dereferences in
ax25_heartbeat_expiry(), ax25_t1timer_expiry(), ax25_t2timer_expiry(),
ax25_t3timer_expiry() and ax25_idletimer_expiry(), when we use
ax25_kill_by_device() to detach the ax25 device.

One of the race conditions that cause null pointer dereferences can be
shown as below:

      (Thread 1)                    |      (Thread 2)
ax25_connect()                      |
 ax25_std_establish_data_link()     |
  ax25_start_t1timer()              |
   mod_timer(&ax25->t1timer,..)     |
                                    | ax25_kill_by_device()
   (wait a time)                    |  ...
                                    |  s->ax25_dev = NULL; //(1)
   ax25_t1timer_expiry()            |
    ax25->ax25_dev->values[..] //(2)|  ...
     ...                            |

We set null to ax25_cb->ax25_dev in position (1) and dereference
the null pointer in position (2).

The corresponding fail log is shown below:
===============================================================
BUG: kernel NULL pointer dereference, address: 0000000000000050
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc6-00794-g45690b7d0
RIP: 0010:ax25_t1timer_expiry+0x12/0x40
...
Call Trace:
 call_timer_fn+0x21/0x120
 __run_timers.part.0+0x1ca/0x250
 run_timer_softirq+0x2c/0x60
 __do_softirq+0xef/0x2f3
 irq_exit_rcu+0xb6/0x100
 sysvec_apic_timer_interrupt+0xa2/0xd0
...

This patch uses ax25_disconnect() to delete timers before we set null to
ax25_cb->ax25_dev in ax25_kill_by_device(). Function ax25_disconnect()
will not return until all timers are stopped, because we have changed
del_timer() to del_timer_sync(). What`s more, we could not use syscalls
such as ax25_connect(), ax25_sendmsg() and so on to activate timers again
unless we start the device, because we have set null to ax25_cb->ax25_dev.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 net/ax25/af_ax25.c    |  4 ++--
 net/ax25/ax25_timer.c | 16 +++++-----------
 2 files changed, 7 insertions(+), 13 deletions(-)
 mode change 100644 => 100755 net/ax25/af_ax25.c
 mode change 100644 => 100755 net/ax25/ax25_timer.c

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
old mode 100644
new mode 100755
index 6bd09718077..9a93ede3307
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -89,18 +89,18 @@ static void ax25_kill_by_device(struct net_device *dev)
 			sk = s->sk;
 			if (!sk) {
 				spin_unlock_bh(&ax25_list_lock);
-				s->ax25_dev = NULL;
 				ax25_disconnect(s, ENETUNREACH);
+				s->ax25_dev = NULL;
 				spin_lock_bh(&ax25_list_lock);
 				goto again;
 			}
 			sock_hold(sk);
 			spin_unlock_bh(&ax25_list_lock);
 			lock_sock(sk);
+			ax25_disconnect(s, ENETUNREACH);
 			s->ax25_dev = NULL;
 			dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
 			ax25_dev_put(ax25_dev);
-			ax25_disconnect(s, ENETUNREACH);
 			release_sock(sk);
 			spin_lock_bh(&ax25_list_lock);
 			sock_put(sk);
diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
old mode 100644
new mode 100755
index 85865ebfdfa..403d43fe1c6
--- a/net/ax25/ax25_timer.c
+++ b/net/ax25/ax25_timer.c
@@ -75,32 +75,26 @@ void ax25_start_idletimer(ax25_cb *ax25)
 	else
 		del_timer(&ax25->idletimer);
 }
-
 void ax25_stop_heartbeat(ax25_cb *ax25)
 {
-	del_timer(&ax25->timer);
+	del_timer_sync(&ax25->timer);
 }
-
 void ax25_stop_t1timer(ax25_cb *ax25)
 {
-	del_timer(&ax25->t1timer);
+	del_timer_sync(&ax25->t1timer);
 }
-
 void ax25_stop_t2timer(ax25_cb *ax25)
 {
-	del_timer(&ax25->t2timer);
+	del_timer_sync(&ax25->t2timer);
 }
-
 void ax25_stop_t3timer(ax25_cb *ax25)
 {
-	del_timer(&ax25->t3timer);
+	del_timer_sync(&ax25->t3timer);
 }
-
 void ax25_stop_idletimer(ax25_cb *ax25)
 {
-	del_timer(&ax25->idletimer);
+	del_timer_sync(&ax25->idletimer);
 }
-
 int ax25_t1timer_running(ax25_cb *ax25)
 {
 	return timer_pending(&ax25->t1timer);
--
2.17.1

