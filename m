From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 8/9] Use netdev_priv in baycom_ser_fdx driver
Date: Sun, 30 Jan 2005 21:46:39 +0000
Message-ID: <20050130214639.GH6399@linux-mips.org>
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
member of struct net_device.  This was debug code only, so use BUG_ON()
instead of printk.

 baycom_ser_fdx.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

Index: bk-afu/drivers/net/hamradio/baycom_ser_fdx.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/baycom_ser_fdx.c
+++ bk-afu/drivers/net/hamradio/baycom_ser_fdx.c
@@ -530,12 +530,11 @@
 	struct baycom_state *bc;
 	struct baycom_ioctl bi;
 
-	if (!dev || !dev->priv ||
-	    ((struct baycom_state *)dev->priv)->hdrv.magic != HDLCDRV_MAGIC) {
-		printk(KERN_ERR "bc_ioctl: invalid device struct\n");
+	if (!dev)
 		return -EINVAL;
-	}
+
 	bc = netdev_priv(dev);
+	BUG_ON(bc->hdrv.magic != HDLCDRV_MAGIC);
 
 	if (cmd != SIOCDEVPRIVATE)
 		return -ENOIOCTLCMD;
