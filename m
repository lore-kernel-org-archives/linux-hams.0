From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH V3] ax25: Fix refcount leaks caused by ax25_cb_del()
Date: Fri, 11 Mar 2022 09:46:24 +0800
Message-ID: <20220311014624.51117-1-duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jreuter@yaina.de, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, thomas@osterried.de, Duoming Zhou <duoming@zju.edu.cn>

The previous commit d01ffb9eee4a ("ax25: add refcount in ax25_dev to
avoid UAF bugs") and commit feef318c855a ("ax25: fix UAF bugs of
net_device caused by rebinding operation") increase the refcounts of
ax25_dev and net_device in ax25_bind() and decrease the matching refcounts
in ax25_kill_by_device() in order to prevent UAF bugs, but there are
reference count leaks.

The root cause of refcount leaks is shown below:

     (Thread 1)                      |      (Thread 2)
ax25_bind()                          |
 ...                                 |
 ax25_addr_ax25dev()                 |
  ax25_dev_hold()   //(1)            |
  ...                                |
 dev_hold_track()   //(2)            |
 ...                                 | ax25_destroy_socket()
                                     |  ax25_cb_del()
                                     |   ...
                                     |   hlist_del_init() //(3)
                                     |
                                     |
     (thread 3)                      |
ax25_kill_by_device()                |
 ...                                 |
 ax25_for_each(s, &ax25_list) {      |
  if (s->ax25_dev == ax25_dev) //(4) |
   ...                               |

Firstly, we use ax25_bind() to increase the refcount of ax25_dev in
position (1) and increase the refcount of net_device in position (2).
Then, we use ax25_cb_del() invoked by ax25_destroy_socket() to delete
ax25_cb in hlist in position (3) before calling ax25_kill_by_device().
Finally, the decrements of refcounts in ax25_kill_by_device() will not
be executed, because no s->ax25_dev equals to ax25_dev in position (4).

This patch adds a flag in ax25_dev in order to prevent reference count
leaks. If the above condition happens, the "test_bit" condition check
in ax25_kill_by_device() could pass and the refcounts could be
decreased properly.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Fixes: feef318c855a ("ax25: fix UAF bugs of net_device caused by rebinding operation")
Reported-by: Thomas Osterried <thomas@osterried.de>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in V3:
  - Use one flag in ax25_dev to check.
  - Make commit message more clearer.
  - Fix format problem.

 include/net/ax25.h  | 5 +++++
 net/ax25/af_ax25.c  | 6 ++++++
 net/ax25/ax25_dev.c | 1 +
 3 files changed, 12 insertions(+)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 8221af1811d..ea6ca385190 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -158,6 +158,10 @@ enum {
 #define	AX25_DEF_PROTOCOL	AX25_PROTO_STD_SIMPLEX	/* Standard AX.25 */
 #define AX25_DEF_DS_TIMEOUT	180000			/* DAMA timeout 3 minutes */
 
+#define AX25_DEV_INIT    0
+#define AX25_DEV_KILL    0
+#define AX25_DEV_BIND    1
+
 typedef struct ax25_uid_assoc {
 	struct hlist_node	uid_node;
 	refcount_t		refcount;
@@ -240,6 +244,7 @@ typedef struct ax25_dev {
 	ax25_dama_info		dama;
 #endif
 	refcount_t		refcount;
+	unsigned long	flag;
 } ax25_dev;
 
 typedef struct ax25_cb {
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 6bd09718077..fc564b87acc 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -86,6 +86,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
 	ax25_for_each(s, &ax25_list) {
 		if (s->ax25_dev == ax25_dev) {
+			set_bit(AX25_DEV_KILL, &ax25_dev->flag);
 			sk = s->sk;
 			if (!sk) {
 				spin_unlock_bh(&ax25_list_lock);
@@ -115,6 +116,10 @@ static void ax25_kill_by_device(struct net_device *dev)
 		}
 	}
 	spin_unlock_bh(&ax25_list_lock);
+	if (!test_bit(AX25_DEV_KILL, &ax25_dev->flag) && test_bit(AX25_DEV_BIND, &ax25_dev->flag)) {
+		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
+		ax25_dev_put(ax25_dev);
+	}
 }
 
 /*
@@ -1132,6 +1137,7 @@ static int ax25_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 done:
 	ax25_cb_add(ax25);
 	sock_reset_flag(sk, SOCK_ZAPPED);
+	set_bit(AX25_DEV_BIND, &ax25_dev->flag);
 
 out:
 	release_sock(sk);
diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index d2a244e1c26..9b04d74a1be 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -77,6 +77,7 @@ void ax25_dev_device_up(struct net_device *dev)
 	ax25_dev->values[AX25_VALUES_PACLEN]	= AX25_DEF_PACLEN;
 	ax25_dev->values[AX25_VALUES_PROTOCOL]  = AX25_DEF_PROTOCOL;
 	ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
+	ax25_dev->flag = AX25_DEV_INIT;
 
 #if defined(CONFIG_AX25_DAMA_SLAVE) || defined(CONFIG_AX25_DAMA_MASTER)
 	ax25_ds_setup_timer(ax25_dev);
-- 
2.17.1

