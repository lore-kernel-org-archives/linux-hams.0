From: Jesper Juhl <jesper.juhl@gmail.com>
Subject: [PATCH] fix potential NULL pointer dereference in yam
Date: Sun, 14 May 2006 15:12:50 +0200
Message-ID: <200605141512.50923.jesper.juhl@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Frederic Rible <frible@teaser.fr>, Jean-Paul Roubelat <jpr@f6fbb.org>, linux-hams@vger.kernel.org, Jesper Juhl <jesper.juhl@gmail.com>

Testing a pointer for NULL after it has already been dereferenced is not
very safe.
Patch below to rework yam_open() so that `dev' is not dereferenced until
after it has been tested for NULL.

Found by coverity checker as #787

(please Cc me on replies)


Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 drivers/net/hamradio/yam.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)


--- linux-2.6.17-rc4-git2-orig/drivers/net/hamradio/yam.c	2006-05-13 21:28:27.000000000 +0200
+++ linux-2.6.17-rc4-git2/drivers/net/hamradio/yam.c	2006-05-14 15:07:00.000000000 +0200
@@ -845,15 +845,25 @@ static struct net_device_stats *yam_get_
 
 static int yam_open(struct net_device *dev)
 {
-	struct yam_port *yp = netdev_priv(dev);
+	struct yam_port *yp;
 	enum uart u;
 	int i;
-	int ret=0;
+	int ret = 0;
 
-	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n", dev->name, dev->base_addr, dev->irq);
+	if (!dev) {
+		printk(KERN_ERR "yam_open() called without device\n");
+		return -ENXIO;
+	}
 
-	if (!dev || !yp->bitrate)
+	yp = netdev_priv(dev);
+	if (!yp->bitrate) {
+		printk(KERN_ERR "%s: no bitrate\n", dev->name);
 		return -ENXIO;
+	}
+
+	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n",
+		dev->name, dev->base_addr, dev->irq);
+
 	if (!dev->base_addr || dev->base_addr > 0x1000 - YAM_EXTENT ||
 		dev->irq < 2 || dev->irq > 15) {
 		return -ENXIO;


