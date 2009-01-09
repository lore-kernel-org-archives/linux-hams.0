From: Stephen Hemminger <shemminger@linux-foundation.org>
Subject: [patch 35/45] bpqether: convert to net_device_ops
Date: Fri, 09 Jan 2009 15:01:32 -0800
Message-ID: <20090109230139.314226600@linux-foundation.org>
References: <20090109230057.575650817@linux-foundation.org>
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline; filename=bpqether-netdev.patch
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>


--- a/drivers/net/hamradio/bpqether.c	2009-01-09 14:00:32.000000000 -0800
+++ b/drivers/net/hamradio/bpqether.c	2009-01-09 14:00:32.000000000 -0800
@@ -466,16 +466,17 @@ static const struct file_operations bpq_
 
 /* ------------------------------------------------------------------------ */
 
+static const struct net_device_ops bpq_netdev_ops = {
+	.ndo_open	     = bpq_open,
+	.ndo_stop	     = bpq_close,
+	.ndo_start_xmit	     = bpq_xmit,
+	.ndo_set_mac_address = bpq_set_mac_address,
+	.ndo_do_ioctl	     = bpq_ioctl,
+};
 
 static void bpq_setup(struct net_device *dev)
 {
-
-	dev->hard_start_xmit = bpq_xmit;
-	dev->open	     = bpq_open;
-	dev->stop	     = bpq_close;
-	dev->set_mac_address = bpq_set_mac_address;
-	dev->get_stats	     = bpq_get_stats;
-	dev->do_ioctl	     = bpq_ioctl;
+	dev->netdev_ops	     = &bpq_netdev_ops;
 	dev->destructor	     = free_netdev;
 
 	memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);


