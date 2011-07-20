From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 3/7] NET: ROSE: Protect rose_callsign with a spinlock
Date: Wed, 20 Jul 2011 01:37:48 +0100
Message-ID: <85ee0c4b56ea0f34dc34bae57d5203aaa7a1a053.1311152437.git.ralf@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1311152437.git.ralf@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>

On a typical installation rose_callsign is only ever changed once at
configuration time probably after bootup so this is a very unlikely race
to be hit in real life.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>
---
 include/net/rose.h   |    2 ++
 net/rose/af_rose.c   |    7 ++++++-
 net/rose/rose_link.c |   12 +++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/net/rose.h b/include/net/rose.h
index 555dd19..0474a83 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -8,6 +8,7 @@
 #define _ROSE_H 
 
 #include <linux/rose.h>
+#include <linux/spinlock.h>
 #include <net/sock.h>
 
 #define	ROSE_ADDR_LEN			5
@@ -150,6 +151,7 @@ struct rose_sock {
 
 /* af_rose.c */
 extern ax25_address rose_callsign;
+extern spinlock_t rose_callsign_lock;
 extern int  sysctl_rose_restart_request_timeout;
 extern int  sysctl_rose_call_request_timeout;
 extern int  sysctl_rose_reset_request_timeout;
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 710df37..a339ea5 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -67,6 +67,7 @@ static DEFINE_SPINLOCK(rose_list_lock);
 static const struct proto_ops rose_proto_ops;
 
 ax25_address rose_callsign;
+DEFINE_SPINLOCK(rose_callsign_lock);
 
 /*
  * ROSE network devices are virtual network devices encapsulating ROSE
@@ -1536,7 +1537,9 @@ static int __init rose_proto_init(void)
 	if (rc != 0)
 		goto out;
 
-	rose_callsign = null_ax25_address;
+	spin_lock(&rose_callsign_lock);
+	memcpy(&rose_callsign, &null_ax25_address, sizeof(rose_callsign));
+	spin_unlock(&rose_callsign_lock);
 
 	dev_rose = kzalloc(rose_ndevs * sizeof(struct net_device *), GFP_KERNEL);
 	if (dev_rose == NULL) {
@@ -1620,8 +1623,10 @@ static void __exit rose_exit(void)
 	ax25_protocol_release(AX25_P_ROSE);
 	ax25_linkfail_release(&rose_linkfail_notifier);
 
+	spin_lock(&rose_callsign_lock);
 	if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
 		ax25_listen_release(&rose_callsign, NULL);
+	spin_unlock(&rose_callsign_lock);
 
 #ifdef CONFIG_SYSCTL
 	rose_unregister_sysctl();
diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index fa8703b..9d3322f 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -97,10 +97,16 @@ static void rose_t0timer_expiry(unsigned long param)
 static void rose_get_neigh_callsign(ax25_address *rose_call,
 	struct rose_neigh *neigh)
 {
-	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
+	spin_lock(&rose_callsign_lock);
+	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0) {
+		spin_unlock(&rose_callsign_lock);
 		memcpy(rose_call, neigh->dev->dev_addr, sizeof(rose_call));
-	else
-		memcpy(rose_call, &rose_callsign, sizeof(rose_call));
+
+		return;
+	}
+
+	memcpy(rose_call, &rose_callsign, sizeof(rose_call));
+	spin_unlock(&rose_callsign_lock);
 }
 
 /*
-- 
1.7.4.4


