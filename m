From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 4/9] Use netdev_priv in bpqether driver
Date: Sun, 30 Jan 2005 21:28:27 +0000
Message-ID: <20050130212827.GD6399@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Jeff Garzik <jgarzik@pobox.com>

Convert the bpqether driver to use netdev_priv().

 bpqether.c |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

Index: bk-afu/drivers/net/hamradio/bpqether.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/bpqether.c
+++ bk-afu/drivers/net/hamradio/bpqether.c
@@ -134,7 +134,7 @@
  */
 static inline struct net_device *bpq_get_ether_dev(struct net_device *dev)
 {
-	struct bpqdev *bpq = (struct bpqdev *) dev->priv;
+	struct bpqdev *bpq = netdev_priv(dev);
 
 	return bpq ? bpq->ethdev : NULL;
 }
@@ -191,7 +191,7 @@
 	 * we check the source address of the sender.
 	 */
 
-	bpq = (struct bpqdev *)dev->priv;
+	bpq = netdev_priv(dev);
 
 	eth = eth_hdr(skb);
 
@@ -281,7 +281,7 @@
 	*ptr++ = (size + 5) % 256;
 	*ptr++ = (size + 5) / 256;
 
-	bpq = (struct bpqdev *)dev->priv;
+	bpq = netdev_priv(dev);
 
 	if ((dev = bpq_get_ether_dev(dev)) == NULL) {
 		bpq->stats.tx_dropped++;
@@ -305,7 +305,7 @@
  */
 static struct net_device_stats *bpq_get_stats(struct net_device *dev)
 {
-	struct bpqdev *bpq = (struct bpqdev *) dev->priv;
+	struct bpqdev *bpq = netdev_priv(dev);
 
 	return &bpq->stats;
 }
@@ -332,15 +332,12 @@
 static int bpq_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
 	struct bpq_ethaddr __user *ethaddr = ifr->ifr_data;
-	struct bpqdev *bpq = dev->priv;
+	struct bpqdev *bpq = netdev_priv(dev);
 	struct bpq_req req;
 
 	if (!capable(CAP_NET_ADMIN))
 		return -EPERM;
 
-	if (bpq == NULL)		/* woops! */
-		return -ENODEV;
-
 	switch (cmd) {
 		case SIOCSBPQETHOPT:
 			if (copy_from_user(&req, ifr->ifr_data, sizeof(struct bpq_req)))
@@ -525,7 +522,7 @@
 		return -ENOMEM;
 
 		
-	bpq = ndev->priv;
+	bpq = netdev_priv(ndev);
 	dev_hold(edev);
 	bpq->ethdev = edev;
 	bpq->axdev = ndev;
@@ -554,7 +551,7 @@
 
 static void bpq_free_device(struct net_device *ndev)
 {
-	struct bpqdev *bpq = ndev->priv;
+	struct bpqdev *bpq = netdev_priv(ndev);
 
 	dev_put(bpq->ethdev);
 	list_del_rcu(&bpq->bpq_list);
