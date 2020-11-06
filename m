From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC net-next 18/28] cxgb3: use ndo_siocdevprivate
Date: Fri,  6 Nov 2020 23:17:33 +0100
Message-ID: <20201106221743.3271965-19-arnd@kernel.org>
References: <20201106221743.3271965-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604701125;
        bh=quYL6FmY9NRqROBT7gD89RdIR4mWBVj5mvB8k4ghwsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uVkT2rV+ZZT8ggUQJXoUIn5wGJbOSDXoR0riPdF5VpQNgUs0rm8nAK2xhnjcj2+Jh
         89cGeNC9su/aAcdfEYlzDhyIFeeYoAwgYme3lMgV7MGsw2axEx44564aq2qTQDGbv4
         tM3+v8w0ekwBHLWs19yiX2m9XdxkpWf7ku35ctsQ=
In-Reply-To: <20201106221743.3271965-1-arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bridge-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

cxgb3 has a private multiplexor that works correctly in compat
mode, split out the siocdevprivate callback from do_ioctl for
simplification.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
index 84ad7261e243..c79a70d370bd 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
@@ -2135,13 +2135,18 @@ static int in_range(int val, int lo, int hi)
 	return val < 0 || (val <= hi && val >= lo);
 }
 
-static int cxgb_extension_ioctl(struct net_device *dev, void __user *useraddr)
+static int cxgb_siocdevprivate(struct net_device *dev,
+			       struct ifreq *ifreq,
+			       void __user *useraddr,
+			       int cmd)
 {
 	struct port_info *pi = netdev_priv(dev);
 	struct adapter *adapter = pi->adapter;
-	u32 cmd;
 	int ret;
 
+	if (cmd != SIOCCHIOCTL)
+		return -EOPNOTSUPP;
+
 	if (copy_from_user(&cmd, useraddr, sizeof(cmd)))
 		return -EFAULT;
 
@@ -2546,8 +2551,6 @@ static int cxgb_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
 		fallthrough;
 	case SIOCGMIIPHY:
 		return mdio_mii_ioctl(&pi->phy.mdio, data, cmd);
-	case SIOCCHIOCTL:
-		return cxgb_extension_ioctl(dev, req->ifr_data);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -3181,6 +3184,7 @@ static const struct net_device_ops cxgb_netdev_ops = {
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_rx_mode	= cxgb_set_rxmode,
 	.ndo_do_ioctl		= cxgb_ioctl,
+	.ndo_siocdevprivate	= cxgb_siocdevprivate,
 	.ndo_change_mtu		= cxgb_change_mtu,
 	.ndo_set_mac_address	= cxgb_set_mac_addr,
 	.ndo_fix_features	= cxgb_fix_features,
-- 
2.27.0

