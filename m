From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 9/9] Use netdev_priv in baycom_epp driver
Date: Sun, 30 Jan 2005 21:48:07 +0000
Message-ID: <20050130214806.GI6399@linux-mips.org>
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

 baycom_epp.c |   53 ++++++++++-------------------------------------------
 1 files changed, 10 insertions(+), 43 deletions(-)

Index: bk-afu/drivers/net/hamradio/baycom_epp.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/baycom_epp.c
+++ bk-afu/drivers/net/hamradio/baycom_epp.c
@@ -68,25 +68,7 @@
 /* --------------------------------------------------------------------- */
 
 static const char paranoia_str[] = KERN_ERR 
-"baycom_epp: bad magic number for hdlcdrv_state struct in routine %s\n";
-
-#define baycom_paranoia_check(dev,routine,retval)                                              \
-({                                                                                             \
-	if (!dev || !dev->priv || ((struct baycom_state *)dev->priv)->magic != BAYCOM_MAGIC) { \
-		printk(paranoia_str, routine);                                                 \
-		return retval;                                                                 \
-	}                                                                                      \
-})
-
-#define baycom_paranoia_check_void(dev,routine)                                                \
-({                                                                                             \
-	if (!dev || !dev->priv || ((struct baycom_state *)dev->priv)->magic != BAYCOM_MAGIC) { \
-		printk(paranoia_str, routine);                                                 \
-		return;                                                                        \
-	}                                                                                      \
-})
-
-/* --------------------------------------------------------------------- */
+	"baycom_epp: bad magic number for hdlcdrv_state struct in routine %s\n";
 
 static const char bc_drvname[] = "baycom_epp";
 static const char bc_drvinfo[] = KERN_INFO "baycom_epp: (C) 1998-2000 Thomas Sailer, HB9JNX/AE4WA\n"
@@ -747,7 +729,6 @@
 	unsigned int time1 = 0, time2 = 0, time3 = 0;
 	int cnt, cnt2;
 	
-	baycom_paranoia_check_void(dev, "epp_bh");
 	bc = netdev_priv(dev);
 	if (!bc->work_running)
 		return;
@@ -863,10 +844,8 @@
 
 static int baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
-	struct baycom_state *bc;
+	struct baycom_state *bc = netdev_priv(dev);
 
-	baycom_paranoia_check(dev, "baycom_send_packet", 0);
-	bc = netdev_priv(dev);
 	if (skb->data[0] != 0) {
 		do_kiss_params(bc, skb->data, skb->len);
 		dev_kfree_skb(skb);
@@ -899,10 +878,8 @@
 
 static struct net_device_stats *baycom_get_stats(struct net_device *dev)
 {
-	struct baycom_state *bc;
+	struct baycom_state *bc = netdev_priv(dev);
 
-	baycom_paranoia_check(dev, "baycom_get_stats", NULL);
-	bc = netdev_priv(dev);
 	/* 
 	 * Get the current statistics.  This may be called with the
 	 * card open or closed. 
@@ -915,10 +892,8 @@
 static void epp_wakeup(void *handle)
 {
         struct net_device *dev = (struct net_device *)handle;
-        struct baycom_state *bc;
+        struct baycom_state *bc = netdev_priv(dev);
 
-	baycom_paranoia_check_void(dev, "epp_wakeup");
-        bc = netdev_priv(dev);
         printk(KERN_DEBUG "baycom_epp: %s: why am I being woken up?\n", dev->name);
         if (!parport_claim(bc->pdev))
                 printk(KERN_DEBUG "baycom_epp: %s: I'm broken.\n", dev->name);
@@ -937,16 +912,13 @@
 
 static int epp_open(struct net_device *dev)
 {
-	struct baycom_state *bc;
-        struct parport *pp;
+	struct baycom_state *bc = netdev_priv(dev);
+        struct parport *pp = parport_find_base(dev->base_addr);
 	unsigned int i, j;
 	unsigned char tmp[128];
 	unsigned char stat;
 	unsigned long tstart;
 	
-	baycom_paranoia_check(dev, "epp_open", -ENXIO);
-	bc = netdev_priv(dev);
-        pp = parport_find_base(dev->base_addr);
         if (!pp) {
                 printk(KERN_ERR "%s: parport at 0x%lx unknown\n", bc_drvname, dev->base_addr);
                 return -ENXIO;
@@ -1055,13 +1027,10 @@
 
 static int epp_close(struct net_device *dev)
 {
-	struct baycom_state *bc;
-	struct parport *pp;
+	struct baycom_state *bc = netdev_priv(dev);
+	struct parport *pp = bc->pdev->port;
 	unsigned char tmp[1];
 
-	baycom_paranoia_check(dev, "epp_close", -EINVAL);
-	bc = netdev_priv(dev);
-	pp = bc->pdev->port;
 	bc->work_running = 0;
 	flush_scheduled_work();
 	bc->stat = EPP_DCDBIT;
@@ -1117,11 +1086,9 @@
 
 static int baycom_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
-	struct baycom_state *bc;
+	struct baycom_state *bc = netdev_priv(dev);
 	struct hdlcdrv_ioctl hi;
 
-	baycom_paranoia_check(dev, "baycom_ioctl", -EINVAL);
-	bc = netdev_priv(dev);
 	if (cmd != SIOCDEVPRIVATE)
 		return -ENOIOCTLCMD;
 
@@ -1354,7 +1321,7 @@
 			free_netdev(dev);
 			break;
 		}
-		if (set_hw && baycom_setmode(dev->priv, mode[i]))
+		if (set_hw && baycom_setmode(netdev_priv(dev), mode[i]))
 			set_hw = 0;
 		baycom_device[i] = dev;
 		found++;
