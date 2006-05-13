From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [ROSE] Fix dereference of skb pointer after free.
Date: Sat, 13 May 2006 12:50:15 +0100
Message-ID: <20060513115015.GA19232@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

If rose_route_frame return success we'll dereference a stale pointer.
Likely this is only going to result in bad statistics for the ROSE
interface.

Testers requested.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

---
 net/rose/rose_dev.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: linux-net/net/rose/rose_dev.c
===================================================================
--- linux-net.orig/net/rose/rose_dev.c	2006-05-05 02:46:34.000000000 +0100
+++ linux-net/net/rose/rose_dev.c	2006-05-13 12:42:44.000000000 +0100
@@ -60,6 +60,7 @@ static int rose_rebuild_header(struct sk
 	struct net_device_stats *stats = netdev_priv(dev);
 	unsigned char *bp = (unsigned char *)skb->data;
 	struct sk_buff *skbn;
+	unsigned int len;
 
 #ifdef CONFIG_INET
 	if (arp_find(bp + 7, skb)) {
@@ -76,6 +77,8 @@ static int rose_rebuild_header(struct sk
 
 	kfree_skb(skb);
 
+	len = skbn->len;
+
 	if (!rose_route_frame(skbn, NULL)) {
 		kfree_skb(skbn);
 		stats->tx_errors++;
@@ -83,7 +86,7 @@ static int rose_rebuild_header(struct sk
 	}
 
 	stats->tx_packets++;
-	stats->tx_bytes += skbn->len;
+	stats->tx_bytes += len;
 #endif
 	return 1;
 }
