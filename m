From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] scc fix for 2.6.0
Date: Thu, 25 Dec 2003 19:52:33 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031225195233.C3614@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+fexcqMh/evT6CrY"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: jgarzik@pobox.com, ralf@linux-mips.org


--+fexcqMh/evT6CrY
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a fix for the scc driver in 2.6.0
It was calling register_netdev from within a ioctl and thus holding
rtnl_lock()
It now uses register_netdevice and calls rtnl_lock() itself if outside the
ioctl.

Jeroen

--+fexcqMh/evT6CrY
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="scc-linux-2.6.0.rxq.diff"

--- linux-2.6.0/drivers/net/hamradio/scc.c	2003-12-18 03:59:27.000000000 +0100
+++ linux-2.6.0.rxq/drivers/net/hamradio/scc.c	2003-12-25 17:57:58.000000000 +0100
@@ -163,6 +163,7 @@
 #include <linux/delay.h>
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
 #include <linux/if_ether.h>
 #include <linux/if_arp.h>
 #include <linux/socket.h>
@@ -1526,7 +1527,7 @@
 	scc->dev = dev;
 	spin_lock_init(&scc->lock);
 
-	err = register_netdev(dev);
+	err = register_netdevice(dev);
 	if (err) {
 		printk(KERN_ERR "%s: can't register network device (%d)\n", 
 		       name, err);
@@ -2119,10 +2120,13 @@
 	
 	sprintf(devname,"%s0", SCC_DriverName);
 	
+	rtnl_lock();
 	if (scc_net_alloc(devname, SCC_Info)) {
+		rtnl_unlock();
 		printk(KERN_ERR "z8530drv: cannot initialize module\n");
 		return -EIO;
 	}
+	rtnl_unlock();
 
 	proc_net_fops_create("z8530drv", 0, &scc_net_seq_fops);
 

--+fexcqMh/evT6CrY--

