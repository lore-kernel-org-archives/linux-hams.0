From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH 2/9] Use netdev_priv in YAM driver
Date: Sat, 5 Feb 2005 18:58:34 +0000
Message-ID: <20050205185834.GA3203@linux-mips.org>
References: <20050130212621.GB6399@linux-mips.org> <420063BE.5030707@pobox.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <420063BE.5030707@pobox.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: linux-hams@vger.kernel.org

On Wed, Feb 02, 2005 at 12:23:10AM -0500, Jeff Garzik wrote:

> applied patches 2-9 to netdev-2.6 queue (thus -mm, etc.).
> 
> Not sure where patch #1 went, I don't see it (unless #1 is the reformat 
> patch)

#1 did touch only the encapsulation pseudo devices provided by the NETROM
and ROSE network protocols in net/netrom and net/rose so I did cc only to
netdev.  Thought you'd not care.  In case you do, it's attached below.

  Ralf

 netrom/nr_dev.c |    8 ++++----
 rose/rose_dev.c |    6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

Index: bk-afu/net/netrom/nr_dev.c
===================================================================
--- bk-afu.orig/net/netrom/nr_dev.c	2005-02-04 23:40:49.102007960 +0000
+++ bk-afu/net/netrom/nr_dev.c	2005-02-04 23:40:53.618321376 +0000
@@ -46,7 +46,7 @@
 
 int nr_rx_ip(struct sk_buff *skb, struct net_device *dev)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)dev->priv;
+	struct net_device_stats *stats = netdev_priv(dev);
 
 	if (!netif_running(dev)) {
 		stats->rx_errors++;
@@ -73,7 +73,7 @@
 static int nr_rebuild_header(struct sk_buff *skb)
 {
 	struct net_device *dev = skb->dev;
-	struct net_device_stats *stats = (struct net_device_stats *)dev->priv;
+	struct net_device_stats *stats = netdev_priv(dev);
 	struct sk_buff *skbn;
 	unsigned char *bp = skb->data;
 	int len;
@@ -186,7 +186,7 @@
 
 static int nr_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)dev->priv;
+	struct net_device_stats *stats = netdev_priv(dev);
 	dev_kfree_skb(skb);
 	stats->tx_errors++;
 	return 0;
@@ -194,7 +194,7 @@
 
 static struct net_device_stats *nr_get_stats(struct net_device *dev)
 {
-	return (struct net_device_stats *)dev->priv;
+	return netdev_priv(dev);
 }
 
 void nr_setup(struct net_device *dev)
Index: bk-afu/net/rose/rose_dev.c
===================================================================
--- bk-afu.orig/net/rose/rose_dev.c	2005-02-04 23:40:49.101008112 +0000
+++ bk-afu/net/rose/rose_dev.c	2005-02-04 23:40:53.619321224 +0000
@@ -57,7 +57,7 @@
 static int rose_rebuild_header(struct sk_buff *skb)
 {
 	struct net_device *dev = skb->dev;
-	struct net_device_stats *stats = (struct net_device_stats *)dev->priv;
+	struct net_device_stats *stats = netdev_priv(dev);
 	unsigned char *bp = (unsigned char *)skb->data;
 	struct sk_buff *skbn;
 
@@ -117,7 +117,7 @@
 
 static int rose_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)dev->priv;
+	struct net_device_stats *stats = netdev_priv(dev);
 
 	if (!netif_running(dev)) {
 		printk(KERN_ERR "ROSE: rose_xmit - called when iface is down\n");
@@ -130,7 +130,7 @@
 
 static struct net_device_stats *rose_get_stats(struct net_device *dev)
 {
-	return (struct net_device_stats *)dev->priv;
+	return netdev_priv(dev);
 }
 
 void rose_setup(struct net_device *dev)
