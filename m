From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 2/9] Use netdev_priv in YAM driver
Date: Sun, 30 Jan 2005 21:26:21 +0000
Message-ID: <20050130212621.GB6399@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Jeff Garzik <jgarzik@pobox.com>

 o Convert the YAM driver to use netdev_priv().
 o If dev is valid there is no point in checking netdev_priv()'s return
   value for being NULL.
 o Fix build warning.

 yam.c |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

Index: bk-afu/drivers/net/hamradio/yam.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/yam.c
+++ bk-afu/drivers/net/hamradio/yam.c
@@ -442,7 +442,7 @@
 
 static void yam_set_uart(struct net_device *dev)
 {
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 	int divisor = 115200 / yp->baudrate;
 
 	outb(0, IER(dev->base_addr));
@@ -565,7 +565,7 @@
 
 static int yam_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
-	struct yam_port *yp = dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 
 	skb_queue_tail(&yp->send_queue, skb);
 	dev->trans_start = jiffies;
@@ -592,12 +592,11 @@
 
 static void yam_arbitrate(struct net_device *dev)
 {
-	struct yam_port *yp = dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 
-	if (!yp || yp->magic != YAM_MAGIC
-		|| yp->tx_state != TX_OFF || skb_queue_empty(&yp->send_queue)) {
+	if (yp->magic != YAM_MAGIC || yp->tx_state != TX_OFF ||
+	    skb_queue_empty(&yp->send_queue))
 		return;
-	}
 	/* tx_state is TX_OFF and there is data to send */
 
 	if (yp->dupmode) {
@@ -725,7 +724,7 @@
 
 	for (i = 0; i < NR_PORTS; i++) {
 		dev = yam_devs[i];
-		yp = dev->priv;
+		yp = netdev_priv(dev);
 
 		if (!netif_running(dev))
 			continue;
@@ -784,8 +783,8 @@
 
 static int yam_seq_show(struct seq_file *seq, void *v)
 {
-	const struct net_device *dev = v;
-	const struct yam_port *yp = dev->priv;
+	struct net_device *dev = v;
+	const struct yam_port *yp = netdev_priv(dev);
 
 	seq_printf(seq, "Device %s\n", dev->name);
 	seq_printf(seq, "  Up       %d\n", netif_running(dev));
@@ -838,10 +837,10 @@
 {
 	struct yam_port *yp;
 
-	if (!dev || !dev->priv)
+	if (!dev)
 		return NULL;
 
-	yp = (struct yam_port *) dev->priv;
+	yp = netdev_priv(dev);
 	if (yp->magic != YAM_MAGIC)
 		return NULL;
 
@@ -856,14 +855,14 @@
 
 static int yam_open(struct net_device *dev)
 {
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 	enum uart u;
 	int i;
 	int ret=0;
 
 	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n", dev->name, dev->base_addr, dev->irq);
 
-	if (!dev || !yp || !yp->bitrate)
+	if (!dev || !yp->bitrate)
 		return -ENXIO;
 	if (!dev->base_addr || dev->base_addr > 0x1000 - YAM_EXTENT ||
 		dev->irq < 2 || dev->irq > 15) {
@@ -900,7 +899,7 @@
 	/* Reset overruns for all ports - FPGA programming makes overruns */
 	for (i = 0; i < NR_PORTS; i++) {
 		struct net_device *dev = yam_devs[i];
-		struct yam_port *yp = dev->priv;
+		struct yam_port *yp = netdev_priv(dev);
 		inb(LSR(dev->base_addr));
 		yp->stats.rx_fifo_errors = 0;
 	}
@@ -919,10 +918,11 @@
 static int yam_close(struct net_device *dev)
 {
 	struct sk_buff *skb;
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 
-	if (!dev || !yp)
+	if (!dev)
 		return -EINVAL;
+
 	/*
 	 * disable interrupts
 	 */
@@ -944,7 +944,7 @@
 
 static int yam_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 	struct yamdrv_ioctl_cfg yi;
 	struct yamdrv_ioctl_mcs *ym;
 	int ioctl_cmd;
@@ -952,7 +952,7 @@
 	if (copy_from_user(&ioctl_cmd, ifr->ifr_data, sizeof(int)))
 		 return -EFAULT;
 
-	if (yp == NULL || yp->magic != YAM_MAGIC)
+	if (yp->magic != YAM_MAGIC)
 		return -EINVAL;
 
 	if (!capable(CAP_NET_ADMIN))
@@ -1091,7 +1091,7 @@
 
 static void yam_setup(struct net_device *dev)
 {
-	struct yam_port *yp = dev->priv;
+	struct yam_port *yp = netdev_priv(dev);
 
 	yp->magic = YAM_MAGIC;
 	yp->bitrate = DEFAULT_BITRATE;
