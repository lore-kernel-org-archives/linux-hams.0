From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH v2] ax25: Fix ax25 session cleanup problem in ax25_release
Date: Fri, 27 May 2022 23:18:22 +0800
Message-ID: <20220527151822.23217-1-duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, thomas@osterried.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>

The timers of ax25 are used for correct session cleanup.
If we use ax25_release() to close ax25 sessions and
ax25_dev is not null, the del_timer_sync() functions in
ax25_release() will execute. As a result, the sessions
could not be cleaned up correctly, because the timers
have stopped.

This patch adds a device_up flag in ax25_dev in order to
judge whether the device is up. If there are sessions to
be cleaned up, the del_timer_sync() in ax25_release() will
not execute. What's more, we add ax25_cb_del() in
ax25_kill_by_device(), because the timers have been stopped
and there are no functions that could delete ax25_cb if we
do not call ax25_release().

Fixes: 82e31755e55f ("ax25: Fix UAF bugs in ax25 timers")
Reported-and-tested-by: Thomas Osterried <thomas@osterried.de>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - Add ax25_cb_del() in ax25_kill_by_device().

 include/net/ax25.h  |  1 +
 net/ax25/af_ax25.c  | 15 ++++++++++-----
 net/ax25/ax25_dev.c |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 0f9790c455b..a427a05672e 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -228,6 +228,7 @@ typedef struct ax25_dev {
 	ax25_dama_info		dama;
 #endif
 	refcount_t		refcount;
+	bool device_up;
 } ax25_dev;
 
 typedef struct ax25_cb {
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 363d47f9453..92cbb08a6c5 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -81,6 +81,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 
 	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
 		return;
+	ax25_dev->device_up = false;
 
 	spin_lock_bh(&ax25_list_lock);
 again:
@@ -91,6 +92,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 				spin_unlock_bh(&ax25_list_lock);
 				ax25_disconnect(s, ENETUNREACH);
 				s->ax25_dev = NULL;
+				ax25_cb_del(s);
 				spin_lock_bh(&ax25_list_lock);
 				goto again;
 			}
@@ -104,6 +106,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 				ax25_dev_put(ax25_dev);
 			}
 			release_sock(sk);
+			ax25_cb_del(s);
 			spin_lock_bh(&ax25_list_lock);
 			sock_put(sk);
 			/* The entry could have been deleted from the
@@ -1053,11 +1056,13 @@ static int ax25_release(struct socket *sock)
 		ax25_destroy_socket(ax25);
 	}
 	if (ax25_dev) {
-		del_timer_sync(&ax25->timer);
-		del_timer_sync(&ax25->t1timer);
-		del_timer_sync(&ax25->t2timer);
-		del_timer_sync(&ax25->t3timer);
-		del_timer_sync(&ax25->idletimer);
+		if (!ax25_dev->device_up) {
+			del_timer_sync(&ax25->timer);
+			del_timer_sync(&ax25->t1timer);
+			del_timer_sync(&ax25->t2timer);
+			del_timer_sync(&ax25->t3timer);
+			del_timer_sync(&ax25->idletimer);
+		}
 		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
 		ax25_dev_put(ax25_dev);
 	}
diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index d2a244e1c26..5451be15e07 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -62,6 +62,7 @@ void ax25_dev_device_up(struct net_device *dev)
 	ax25_dev->dev     = dev;
 	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
 	ax25_dev->forward = NULL;
+	ax25_dev->device_up = true;
 
 	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
 	ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;
-- 
2.17.1

