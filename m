From: Stephen Hemminger <shemminger@linux-foundation.org>
Subject: [patch 37/45] dmascc: convert to network_device_ops
Date: Fri, 09 Jan 2009 15:01:34 -0800
Message-ID: <20090109230139.476591719@linux-foundation.org>
References: <20090109230057.575650817@linux-foundation.org>
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline; filename=dmascc-netdev.patch
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, klaus.kudielka@ieee.org
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

--- a/drivers/net/hamradio/dmascc.c	2009-01-09 12:47:32.000000000 -0800
+++ b/drivers/net/hamradio/dmascc.c	2009-01-09 12:52:12.000000000 -0800
@@ -440,6 +440,13 @@ static void __init dev_setup(struct net_
 	memcpy(dev->dev_addr, &ax25_defaddr, AX25_ADDR_LEN);
 }
 
+static const struct net_device_ops scc_netdev_ops = {
+	.ndo_open = scc_open,
+	.ndo_stop = scc_close,
+	.ndo_start_xmit = scc_send_packet,
+	.ndo_do_ioctl = scc_ioctl,
+};
+
 static int __init setup_adapter(int card_base, int type, int n)
 {
 	int i, irq, chip;
@@ -575,11 +582,7 @@ static int __init setup_adapter(int card
 		sprintf(dev->name, "dmascc%i", 2 * n + i);
 		dev->base_addr = card_base;
 		dev->irq = irq;
-		dev->open = scc_open;
-		dev->stop = scc_close;
-		dev->do_ioctl = scc_ioctl;
-		dev->hard_start_xmit = scc_send_packet;
-		dev->get_stats = scc_get_stats;
+		dev->netdev_ops = &scc_netdev_ops;
 		dev->header_ops = &ax25_header_ops;
 		dev->set_mac_address = scc_set_mac_address;
 	}


