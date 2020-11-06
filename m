From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC net-next 06/28] bridge: use ndo_siocdevprivate
Date: Fri,  6 Nov 2020 23:17:21 +0100
Message-ID: <20201106221743.3271965-7-arnd@kernel.org>
References: <20201106221743.3271965-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604701091;
        bh=BR+zYR3Dm83q9tUsfJZzsFi0e5w5L0IGNArcvO9ow8I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bi+lDzBo1ePiWdn/VM2k639J0e48uV9m25v+HdVm1B5ZrTJOGAAsnmK2eb1wd6bUC
         UaecT3Awtytx7aWt3xk23Z4rBeuTBeU7JtA2uQvht8OKRuLCMZ5q+WXJZ/bDwUKQmY
         ShaAoDaSb5UQRzAaWbQ2gN7MuG6UGmQPkHGImBo0=
In-Reply-To: <20201106221743.3271965-1-arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bridge-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

The bridge driver has an old set of ioctls using the SIOCDEVPRIVATE
namespace that have never worked in compat mode and are explicitly
forbidden already.

Move them over to ndo_siocdevprivate and fix compat mode for these,
because we can.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 net/bridge/br_device.c  |  1 +
 net/bridge/br_ioctl.c   | 36 ++++++++++++++++++++++++------------
 net/bridge/br_private.h |  2 ++
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 6f742fee874a..c272fa57110d 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -409,6 +409,7 @@ static const struct net_device_ops br_netdev_ops = {
 	.ndo_change_rx_flags	 = br_dev_change_rx_flags,
 	.ndo_change_mtu		 = br_change_mtu,
 	.ndo_do_ioctl		 = br_dev_ioctl,
+	.ndo_siocdevprivate	 = br_dev_siocdevprivate,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_netpoll_setup	 = br_netpoll_setup,
 	.ndo_netpoll_cleanup	 = br_netpoll_cleanup,
diff --git a/net/bridge/br_ioctl.c b/net/bridge/br_ioctl.c
index 2db800fc27ca..7fbfeb735bad 100644
--- a/net/bridge/br_ioctl.c
+++ b/net/bridge/br_ioctl.c
@@ -106,15 +106,31 @@ static int add_del_if(struct net_bridge *br, int ifindex, int isadd)
  * This interface is deprecated because it was too difficult
  * to do the translation for 32/64bit ioctl compatibility.
  */
-static int old_dev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
+int br_dev_siocdevprivate(struct net_device *dev, struct ifreq *rq, void __user *data, int cmd)
 {
 	struct net_bridge *br = netdev_priv(dev);
 	struct net_bridge_port *p = NULL;
 	unsigned long args[4];
+	void __user *argp;
 	int ret = -EOPNOTSUPP;
 
-	if (copy_from_user(args, rq->ifr_data, sizeof(args)))
-		return -EFAULT;
+	if (in_compat_syscall()) {
+		unsigned int cargs[4];
+		if (copy_from_user(cargs, data, sizeof(cargs)))
+			return -EFAULT;
+
+		args[0] = cargs[0];
+		args[1] = cargs[1];
+		args[2] = cargs[2];
+		args[3] = cargs[3];
+
+		argp = compat_ptr(args[1]);
+	} else {
+		if (copy_from_user(args, data, sizeof(args)))
+			return -EFAULT;
+
+		argp = (void __user *)args[1];
+	}
 
 	switch (args[0]) {
 	case BRCTL_ADD_IF:
@@ -171,7 +187,7 @@ static int old_dev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 			return -ENOMEM;
 
 		get_port_ifindices(br, indices, num);
-		if (copy_to_user((void __user *)args[1], indices, num*sizeof(int)))
+		if (copy_to_user(argp, indices, num*sizeof(int)))
 			num =  -EFAULT;
 		kfree(indices);
 		return num;
@@ -232,7 +248,7 @@ static int old_dev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 
 		rcu_read_unlock();
 
-		if (copy_to_user((void __user *)args[1], &p, sizeof(p)))
+		if (copy_to_user(argp, &p, sizeof(p)))
 			return -EFAULT;
 
 		return 0;
@@ -282,8 +298,7 @@ static int old_dev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	}
 
 	case BRCTL_GET_FDB_ENTRIES:
-		return get_fdb_entries(br, (void __user *)args[1],
-				       args[2], args[3]);
+		return get_fdb_entries(br, argp, args[2], args[3]);
 	}
 
 	if (!ret) {
@@ -320,7 +335,7 @@ static int old_deviceless(struct net *net, void __user *uarg)
 
 		args[2] = get_bridge_ifindices(net, indices, args[2]);
 
-		ret = copy_to_user((void __user *)args[1], indices, args[2]*sizeof(int))
+		ret = copy_to_user(uarg, indices, args[2]*sizeof(int))
 			? -EFAULT : args[2];
 
 		kfree(indices);
@@ -335,7 +350,7 @@ static int old_deviceless(struct net *net, void __user *uarg)
 		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
 			return -EPERM;
 
-		if (copy_from_user(buf, (void __user *)args[1], IFNAMSIZ))
+		if (copy_from_user(buf, uarg, IFNAMSIZ))
 			return -EFAULT;
 
 		buf[IFNAMSIZ-1] = 0;
@@ -383,9 +398,6 @@ int br_dev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	struct net_bridge *br = netdev_priv(dev);
 
 	switch (cmd) {
-	case SIOCDEVPRIVATE:
-		return old_dev_ioctl(dev, rq, cmd);
