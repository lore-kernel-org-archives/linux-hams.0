From: Arnd Bergmann <arnd@kernel.org>
Subject: [RFC net-next 13/28] eql: use ndo_siocdevprivate
Date: Fri,  6 Nov 2020 23:17:28 +0100
Message-ID: <20201106221743.3271965-14-arnd@kernel.org>
References: <20201106221743.3271965-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604701111;
        bh=eiNHnuy+hNjbjFU7Amv3yBUD8VshOljAcCBAICoPPSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QM+rUOnImvpXUQa8m9VB331eo9iLMl5iqRtNhQJjHILlDnEv1nX0Fmtaj+kGqYk+1
         XoiuTrhJCwNJUaprjY8D6HOvRTfhJOzz32m6+ApMK8RF4XsVRMeh9qCykF6VMAy8hT
         nPAAZ9VJlTyX6MBlOZy0PkW3bhUBZhsmB2XUEeWY=
In-Reply-To: <20201106221743.3271965-1-arnd@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, bridge@lists.linux-foundation.org, linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>

From: Arnd Bergmann <arnd@arndb.de>

The private ioctls in eql pass the arguments correctly through ifr_data,
but the slaving_request_t and slave_config_t structures are incompatible
with compat mode and need special conversion code in the driver.

Convert to siocdevprivate for now, and return an error when called
in compat mode.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/eql.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/eql.c b/drivers/net/eql.c
index 74263f8efe1a..b8707559a0f5 100644
--- a/drivers/net/eql.c
+++ b/drivers/net/eql.c
@@ -131,7 +131,8 @@
 
 static int eql_open(struct net_device *dev);
 static int eql_close(struct net_device *dev);
-static int eql_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd);
+static int eql_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
+			      void __user *data, int cmd);
 static netdev_tx_t eql_slave_xmit(struct sk_buff *skb, struct net_device *dev);
 
 #define eql_is_slave(dev)	((dev->flags & IFF_SLAVE) == IFF_SLAVE)
@@ -170,7 +171,7 @@ static const char version[] __initconst =
 static const struct net_device_ops eql_netdev_ops = {
 	.ndo_open	= eql_open,
 	.ndo_stop	= eql_close,
-	.ndo_do_ioctl	= eql_ioctl,
+	.ndo_siocdevprivate = eql_siocdevprivate,
 	.ndo_start_xmit	= eql_slave_xmit,
 };
 
@@ -268,25 +269,29 @@ static int eql_s_slave_cfg(struct net_device *dev, slave_config_t __user *sc);
 static int eql_g_master_cfg(struct net_device *dev, master_config_t __user *mc);
 static int eql_s_master_cfg(struct net_device *dev, master_config_t __user *mc);
 
-static int eql_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
+static int eql_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
+			      void __user *data, int cmd)
 {
 	if (cmd != EQL_GETMASTRCFG && cmd != EQL_GETSLAVECFG &&
 	    !capable(CAP_NET_ADMIN))
 	  	return -EPERM;
 
+	if (in_compat_syscall()) /* to be implemented */
+		return -EOPNOTSUPP;
+
 	switch (cmd) {
 		case EQL_ENSLAVE:
-			return eql_enslave(dev, ifr->ifr_data);
+			return eql_enslave(dev, data);
 		case EQL_EMANCIPATE:
-			return eql_emancipate(dev, ifr->ifr_data);
+			return eql_emancipate(dev, data);
 		case EQL_GETSLAVECFG:
-			return eql_g_slave_cfg(dev, ifr->ifr_data);
+			return eql_g_slave_cfg(dev, data);
 		case EQL_SETSLAVECFG:
-			return eql_s_slave_cfg(dev, ifr->ifr_data);
+			return eql_s_slave_cfg(dev, data);
 		case EQL_GETMASTRCFG:
-			return eql_g_master_cfg(dev, ifr->ifr_data);
+			return eql_g_master_cfg(dev, data);
 		case EQL_SETMASTRCFG:
-			return eql_s_master_cfg(dev, ifr->ifr_data);
+			return eql_s_master_cfg(dev, data);
 		default:
 			return -EOPNOTSUPP;
 	}
-- 
2.27.0

