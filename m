From: Stephen Hemminger <shemminger@linux-foundation.org>
Subject: [patch 45/45] dmascc: convert to internal net_device_ops
Date: Fri, 09 Jan 2009 15:01:42 -0800
Message-ID: <20090109230140.086882481@linux-foundation.org>
References: <20090109230057.575650817@linux-foundation.org>
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline; filename=82596-netdev.patch
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, klaus.kudielka@ieee.org
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>


--- a/drivers/net/82596.c	2009-01-08 08:30:09.000000000 -0800
+++ b/drivers/net/82596.c	2009-01-09 14:05:18.000000000 -0800
@@ -1122,6 +1122,17 @@ static void print_eth(unsigned char *add
 static int io = 0x300;
 static int irq = 10;
 
+static const struct net_device_ops i596_netdev_ops = {
+	.ndo_open 		= i596_open,
+	.ndo_stop		= i596_close,
+	.ndo_start_xmit		= i596_start_xmit,
+	.ndo_set_multicast_list = set_multicast_list,
+	.ndo_tx_timeout		= i596_tx_timeout,
+	.ndo_change_mtu		= eth_change_mtu,
+	.ndo_set_mac_address 	= eth_mac_addr,
+	.ndo_validate_addr	= eth_validate_addr,
+};
+
 struct net_device * __init i82596_probe(int unit)
 {
 	struct net_device *dev;
@@ -1232,11 +1243,7 @@ found:
 	DEB(DEB_PROBE,printk(KERN_INFO "%s", version));
 
 	/* The 82596-specific entries in the device structure. */
-	dev->open = i596_open;
-	dev->stop = i596_close;
-	dev->hard_start_xmit = i596_start_xmit;
-	dev->set_multicast_list = set_multicast_list;
-	dev->tx_timeout = i596_tx_timeout;
+	dev->netdev_ops = &i596_netdev_ops;
 	dev->watchdog_timeo = TX_TIMEOUT;
 
 	dev->ml_priv = (void *)(dev->mem_start);


