From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH V2] ax25: Fix refcount leaks caused by ax25_cb_del()
Date: Thu, 10 Mar 2022 07:00:20 +0800
Message-ID: <20220309230020.125785-1-duoming@zju.edu.cn>
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
in ax25_kill_by_device() in order to prevent UAF bugs. But there are
reference count leaks.

If we use ax25_bind() to increase the refcounts of ax25_dev and
net_device, then, use ax25_cb_del() invoked by ax25_destroy_socket()
to delete ax25_cb in hlist before calling ax25_kill_by_device(), the
decrements of refcounts in ax25_kill_by_device() will not be executed,
because ax25_cb is deleted from the hlist.

This patch adds two flags in ax25_dev in order to prevent reference
count leaks. If we bind successfully, then, use ax25_cb_del() to
delete ax25_cb, the two "test_bit" condition checks in ax25_kill_by_device()
could pass and the refcounts could be decreased properly.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Fixes: feef318c855a ("ax25: fix UAF bugs of net_device caused by rebinding operation")
Reported-by: Thomas Osterried <thomas@osterried.de>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in V2:
  - Change memory leak to refcount leak.

 include/net/ax25.h  |  7 +++++--
 net/ax25/af_ax25.c  | 10 ++++++----
 net/ax25/ax25_dev.c |  3 ++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 8221af1811d..50b3eacada0 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -157,7 +157,9 @@ enum {
 #define AX25_DEF_PACLEN		256			/* Paclen=256 */
 #define	AX25_DEF_PROTOCOL	AX25_PROTO_STD_SIMPLEX	/* Standard AX.25 */
 #define AX25_DEF_DS_TIMEOUT	180000			/* DAMA timeout 3 minutes */
-
+#define AX25_DEV_INIT    0
+#define AX25_DEV_KILL    1
+#define AX25_DEV_BIND    2
 typedef struct ax25_uid_assoc {
 	struct hlist_node	uid_node;
 	refcount_t		refcount;
@@ -240,8 +242,9 @@ typedef struct ax25_dev {
 	ax25_dama_info		dama;
 #endif
 	refcount_t		refcount;
+	unsigned long   kill_flag;
+	unsigned long   bind_flag;
 } ax25_dev;
-
 typedef struct ax25_cb {
 	struct hlist_node	ax25_node;
 	ax25_address		source_addr, dest_addr;
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 6bd09718077..5519448378d 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -86,6 +86,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
 	ax25_for_each(s, &ax25_list) {
 		if (s->ax25_dev == ax25_dev) {
+			set_bit(AX25_DEV_KILL, &ax25_dev->kill_flag);
 			sk = s->sk;
 			if (!sk) {
 				spin_unlock_bh(&ax25_list_lock);
@@ -114,9 +115,12 @@ static void ax25_kill_by_device(struct net_device *dev)
 			goto again;
 		}
 	}
+	if(!test_bit(AX25_DEV_KILL, &ax25_dev->kill_flag) && test_bit(AX25_DEV_BIND, &ax25_dev->bind_flag)) {
+		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
+		ax25_dev_put(ax25_dev);
+	}
 	spin_unlock_bh(&ax25_list_lock);
 }
-
 /*
  *	Handle device status changes.
  */
@@ -1132,13 +1136,11 @@ static int ax25_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 done:
 	ax25_cb_add(ax25);
 	sock_reset_flag(sk, SOCK_ZAPPED);
-
+	set_bit(AX25_DEV_BIND, &ax25_dev->bind_flag);
 out:
 	release_sock(sk);
-
 	return err;
 }
-
 /*
  *	FIXME: nonblock behaviour looks like it may have a bug.
  */
diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index d2a244e1c26..7c40914e5c9 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -77,7 +77,8 @@ void ax25_dev_device_up(struct net_device *dev)
 	ax25_dev->values[AX25_VALUES_PACLEN]	= AX25_DEF_PACLEN;
 	ax25_dev->values[AX25_VALUES_PROTOCOL]  = AX25_DEF_PROTOCOL;
 	ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
-
+	ax25_dev->kill_flag = AX25_DEV_INIT;
+	ax25_dev->bind_flag = AX25_DEV_INIT;
 #if defined(CONFIG_AX25_DAMA_SLAVE) || defined(CONFIG_AX25_DAMA_MASTER)
 	ax25_ds_setup_timer(ax25_dev);
 #endif
--
2.17.1

