From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 3/9] Use netdev_priv in mkiss driver
Date: Sun, 30 Jan 2005 21:27:44 +0000
Message-ID: <20050130212744.GC6399@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Jeff Garzik <jgarzik@pobox.com>

Convert the mkiss driver to use netdev_priv().

 mkiss.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

Index: bk-afu/drivers/net/hamradio/mkiss.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/mkiss.c
+++ bk-afu/drivers/net/hamradio/mkiss.c
@@ -419,7 +419,7 @@
 /* Encapsulate an AX.25 packet and kick it into a TTY queue. */
 static int ax_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = netdev_priv(dev);
 
 	if (!netif_running(dev))  {
 		printk(KERN_ERR "mkiss: %s: xmit call when iface is down\n", dev->name);
@@ -483,7 +483,7 @@
 /* Open the low-level part of the AX25 channel. Easy! */
 static int ax_open(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = netdev_priv(dev);
 	unsigned long len;
 
 	if (ax->tty == NULL)
@@ -534,7 +534,7 @@
 /* Close the low-level part of the AX25 channel. Easy! */
 static int ax_close(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = netdev_priv(dev);
 
 	if (ax->tty == NULL)
 		return -EBUSY;
@@ -634,7 +634,7 @@
 static struct net_device_stats *ax_get_stats(struct net_device *dev)
 {
 	static struct net_device_stats stats;
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = netdev_priv(dev);
 
 	memset(&stats, 0, sizeof(struct net_device_stats));
 
@@ -827,7 +827,7 @@
 
 static int ax_open_dev(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = netdev_priv(dev);
 
 	if (ax->tty == NULL)
 		return -ENODEV;
@@ -839,7 +839,7 @@
 /* Initialize the driver.  Called by network startup. */
 static int ax25_init(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = netdev_priv(dev);
 
 	static char ax25_bcast[AX25_ADDR_LEN] =
 		{'Q'<<1,'S'<<1,'T'<<1,' '<<1,' '<<1,' '<<1,'0'<<1};
