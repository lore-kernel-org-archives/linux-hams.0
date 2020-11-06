From: Arnd Bergmann <arnd@kernel.org>
Subject: [RFC net-next 12/28] tehuti: use ndo_siocdevprivate
Date: Fri,  6 Nov 2020 23:17:27 +0100
Message-ID: <20201106221743.3271965-13-arnd@kernel.org>
References: <20201106221743.3271965-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604701109;
        bh=PWlbZt8wWlmn+LUnXGXuQMunnnfW/Ks/7SA6eyhM52Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oMzwQM4OVxtFFKwcgJNzxD9lIMwZ8Ldhj6OoNVtOTOlOh07hOQA+sAtQsWuuZsZMl
         Wm3NC7wnZyJ4/XOyMbyFrK5kwowihD1Dxi7Y2+QvxXFEfzDs/z2M9LCIo5TP+B0Y1v
         B/nHoqZZhKRPrZkbQ0sSnUs1ZV1HjFJLUxZOnGDQ=
In-Reply-To: <20201106221743.3271965-1-arnd@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, bridge@lists.linux-foundation.org, linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>

From: Arnd Bergmann <arnd@arndb.de>

Tehuti only implements private ioctl commands, and implements
them by overriding the ifreq layout, which is broken in
compat mode.

Move it to the ndo_siocdevprivate callback in order to fix this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/tehuti/tehuti.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/tehuti/tehuti.c b/drivers/net/ethernet/tehuti/tehuti.c
index b8f4f419173f..e25524081a30 100644
--- a/drivers/net/ethernet/tehuti/tehuti.c
+++ b/drivers/net/ethernet/tehuti/tehuti.c
@@ -637,7 +637,8 @@ static int bdx_range_check(struct bdx_priv *priv, u32 offset)
 		-EINVAL : 0;
 }
 
-static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
+static int bdx_siocdevprivate(struct net_device *ndev, struct ifreq *ifr,
+			      void __user *udata, int cmd)
 {
 	struct bdx_priv *priv = netdev_priv(ndev);
 	u32 data[3];
@@ -647,7 +648,7 @@ static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
 
 	DBG("jiffies=%ld cmd=%d\n", jiffies, cmd);
 	if (cmd != SIOCDEVPRIVATE) {
-		error = copy_from_user(data, ifr->ifr_data, sizeof(data));
+		error = copy_from_user(data, udata, sizeof(data));
 		if (error) {
 			pr_err("can't copy from user\n");
 			RET(-EFAULT);
@@ -669,7 +670,7 @@ static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
 		data[2] = READ_REG(priv, data[1]);
 		DBG("read_reg(0x%x)=0x%x (dec %d)\n", data[1], data[2],
 		    data[2]);
-		error = copy_to_user(ifr->ifr_data, data, sizeof(data));
+		error = copy_to_user(udata, data, sizeof(data));
 		if (error)
 			RET(-EFAULT);
 		break;
@@ -688,15 +689,6 @@ static int bdx_ioctl_priv(struct net_device *ndev, struct ifreq *ifr, int cmd)
 	return 0;
 }
 
-static int bdx_ioctl(struct net_device *ndev, struct ifreq *ifr, int cmd)
-{
-	ENTER;
-	if (cmd >= SIOCDEVPRIVATE && cmd <= (SIOCDEVPRIVATE + 15))
-		RET(bdx_ioctl_priv(ndev, ifr, cmd));
-	else
-		RET(-EOPNOTSUPP);
-}
-
 /**
  * __bdx_vlan_rx_vid - private helper for adding/killing VLAN vid
  * @ndev: network device
@@ -1860,7 +1852,7 @@ static const struct net_device_ops bdx_netdev_ops = {
 	.ndo_stop		= bdx_close,
 	.ndo_start_xmit		= bdx_tx_transmit,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_do_ioctl		= bdx_ioctl,
+	.ndo_siocdevprivate	= bdx_siocdevprivate,
 	.ndo_set_rx_mode	= bdx_setmulti,
 	.ndo_change_mtu		= bdx_change_mtu,
 	.ndo_set_mac_address	= bdx_set_mac,
-- 
2.27.0

