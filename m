From: Stephen Hemminger <shemminger@linux-foundation.org>
Subject: [patch 07/45] netrom: convert to net_device_ops
Date: Fri, 09 Jan 2009 15:01:04 -0800
Message-ID: <20090109230137.222386644@linux-foundation.org>
References: <20090109230057.575650817@linux-foundation.org>
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline; filename=netrom-netdev.patch
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, Ralf Baechle <ralf@linux-mips.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

---
 include/net/netrom.h   |    4 ----
 net/netrom/af_netrom.c |    4 ++--
 net/netrom/nr_dev.c    |   26 +++++++++-----------------
 3 files changed, 11 insertions(+), 23 deletions(-)

--- a/net/netrom/nr_dev.c	2009-01-09 13:35:18.000000000 -0800
+++ b/net/netrom/nr_dev.c	2009-01-09 13:36:18.000000000 -0800
@@ -191,19 +191,21 @@ static const struct header_ops nr_header
 	.rebuild= nr_rebuild_header,
 };
 
+static const struct net_device_ops nr_netdev_ops = {
+	.ndo_open		= nr_open,
+	.ndo_stop		= nr_close,
+	.ndo_start_xmit		= nr_xmit,
+	.ndo_set_mac_address    = nr_set_mac_address,
+};
 
 void nr_setup(struct net_device *dev)
 {
 	dev->mtu		= NR_MAX_PACKET_SIZE;
-	dev->hard_start_xmit	= nr_xmit;
-	dev->open		= nr_open;
-	dev->stop		= nr_close;
-
+	dev->netdev_ops		= &nr_netdev_ops;
 	dev->header_ops		= &nr_header_ops;
 	dev->hard_header_len	= NR_NETWORK_LEN + NR_TRANSPORT_LEN;
 	dev->addr_len		= AX25_ADDR_LEN;
 	dev->type		= ARPHRD_NETROM;
-	dev->set_mac_address    = nr_set_mac_address;
 
 	/* New-style flags. */
 	dev->flags		= IFF_NOARP;


