From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 7/9] Use netdev_priv in hdlcdrv driver
Date: Sun, 30 Jan 2005 21:42:01 +0000
Message-ID: <20050130214201.GG6399@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Jeff Garzik <jgarzik@pobox.com>, Thomas Sailer <sailer@scs.ch>

Eleminate the last remaining instance of a direct reference to the priv
member of struct net_device.  The paranoia check code of the same
type that has been eleminated from many other drivers, so do this here
also.

 hdlcdrv.c |   48 ++++++++----------------------------------------
 1 files changed, 8 insertions(+), 40 deletions(-)

Index: bk-afu/drivers/net/hamradio/hdlcdrv.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/hdlcdrv.c
+++ bk-afu/drivers/net/hamradio/hdlcdrv.c
@@ -427,27 +427,10 @@
  * ===================== network driver interface =========================
  */
 
-static inline int hdlcdrv_paranoia_check(struct net_device *dev,
-					const char *routine)
-{
-	if (!dev || !dev->priv || 
-	    ((struct hdlcdrv_state *)dev->priv)->magic != HDLCDRV_MAGIC) {
-		printk(KERN_ERR "hdlcdrv: bad magic number for hdlcdrv_state "
-		       "struct in routine %s\n", routine);
-		return 1;
-	}
-	return 0;
-}
-
-/* --------------------------------------------------------------------- */
-
 static int hdlcdrv_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
-	struct hdlcdrv_state *sm;
+	struct hdlcdrv_state *sm = netdev_priv(dev);
 
-	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_send_packet"))
-		return 0;
-	sm = (struct hdlcdrv_state *)dev->priv;
 	if (skb->data[0] != 0) {
 		do_kiss_params(sm, skb->data, skb->len);
 		dev_kfree_skb(skb);
@@ -475,11 +458,8 @@
 
 static struct net_device_stats *hdlcdrv_get_stats(struct net_device *dev)
 {
-	struct hdlcdrv_state *sm;
+	struct hdlcdrv_state *sm = netdev_priv(dev);
 
-	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_get_stats"))
-		return NULL;
-	sm = (struct hdlcdrv_state *)dev->priv;
 	/* 
 	 * Get the current statistics.  This may be called with the
 	 * card open or closed. 
@@ -499,13 +479,9 @@
 
 static int hdlcdrv_open(struct net_device *dev)
 {
-	struct hdlcdrv_state *s;
+	struct hdlcdrv_state *s = netdev_priv(dev);
 	int i;
 
-	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_open"))
-		return -EINVAL;
-	s = (struct hdlcdrv_state *)dev->priv;
-
 	if (!s->ops || !s->ops->open)
 		return -ENODEV;
 
@@ -540,13 +516,9 @@
 
 static int hdlcdrv_close(struct net_device *dev)
 {
-	struct hdlcdrv_state *s;
+	struct hdlcdrv_state *s = netdev_priv(dev);
 	int i = 0;
 
-	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_close"))
-		return -EINVAL;
-	s = (struct hdlcdrv_state *)dev->priv;
-
 	netif_stop_queue(dev);
 
 	if (s->ops && s->ops->close)
@@ -562,12 +534,8 @@
 
 static int hdlcdrv_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
-	struct hdlcdrv_state *s;
+	struct hdlcdrv_state *s = netdev_priv(dev);
 	struct hdlcdrv_ioctl bi;
-		
-	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_ioctl"))
-		return -EINVAL;
-	s = (struct hdlcdrv_state *)dev->priv;
 
 	if (cmd != SIOCDEVPRIVATE) {
 		if (s->ops && s->ops->ioctl)
@@ -698,7 +666,7 @@
 	static const struct hdlcdrv_channel_params dflt_ch_params = { 
 		20, 2, 10, 40, 0 
 	};
-	struct hdlcdrv_state *s = dev->priv;
+	struct hdlcdrv_state *s = netdev_priv(dev);
 
 	/*
 	 * initialize the hdlcdrv_state struct
@@ -782,7 +750,7 @@
 	/*
 	 * initialize part of the hdlcdrv_state struct
 	 */
-	s = dev->priv;
+	s = netdev_priv(dev);
 	s->magic = HDLCDRV_MAGIC;
 	s->ops = ops;
 	dev->base_addr = baseaddr;
@@ -803,7 +771,7 @@
 
 void hdlcdrv_unregister(struct net_device *dev) 
 {
-	struct hdlcdrv_state *s = dev->priv;
+	struct hdlcdrv_state *s = netdev_priv(dev);
 
 	BUG_ON(s->magic != HDLCDRV_MAGIC);
 
