From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Linux kernel 2.6rc1 and USCC>4/ISA
Date: Sat, 3 Jan 2004 17:41:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040103174125.A211@jeroen.pe1rxq.ampr.org>
References: <3FF6A1CA.9060003@geofizyka.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FF6A1CA.9060003@geofizyka.pl>; from sp2ong@geofizyka.pl on Sat, Jan 03, 2004 at 12:04:42 +0100
List-Id: <linux-hams.vger.kernel.org>
To: sp2ong@geofizyka.pl
Cc: linux-hams@vger.kernel.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 2004.01.03 12:04:42 +0100 sp2ong@geofizyka.pl wrote:
> Hi,
> 
> I have slackware current (is ready to use kernel 2.6.x) and I have made 
> latest kernel 2.6rc1 to use with BayCom USCC>4/ISA card (with kernel 
> 2.4.23 this card working) after load module AX25 and SCC and run sccinit 
> this application not exit and frozen console and I have not success to 
> use latest kernel with USCC card.

Not all patches (including one for your scc problem) are in 2.6.0-rc1 yet.
I have attached the remaining ones to this message.

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="ax25.2.6.0.rxq2.diff"

diff -ru linux-2.6.0.rxq.applied/net/ax25/af_ax25.c linux-2.6.0.rxq/net/ax25/af_ax25.c
--- linux-2.6.0.rxq.applied/net/ax25/af_ax25.c	2003-12-31 16:37:07.000000000 +0100
+++ linux-2.6.0.rxq/net/ax25/af_ax25.c	2003-12-31 16:18:04.000000000 +0100
@@ -247,6 +247,7 @@
 				kfree_skb(copy);
 		}
 	}
+	spin_unlock_bh(&ax25_list_lock);
 }
 
 /*
@@ -1618,16 +1619,16 @@
 	if (msg->msg_namelen != 0) {
 		struct sockaddr_ax25 *sax = (struct sockaddr_ax25 *)msg->msg_name;
 		ax25_digi digi;
-		ax25_address dest;
+		ax25_address src;
 
-		ax25_addr_parse(skb->mac.raw+1, skb->data-skb->mac.raw-1, NULL, &dest, &digi, NULL, NULL);
+		ax25_addr_parse(skb->mac.raw+1, skb->data-skb->mac.raw-1, &src, NULL, &digi, NULL, NULL);
 
 		sax->sax25_family = AF_AX25;
 		/* We set this correctly, even though we may not let the
 		   application know the digi calls further down (because it
 		   did NOT ask to know them).  This could get political... **/
 		sax->sax25_ndigis = digi.ndigi;
-		sax->sax25_call   = dest;
+		sax->sax25_call   = src;
 
 		if (sax->sax25_ndigis != 0) {
 			int ct;

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="mkiss.2.6.0.rxq.diff"

--- linux-2.6.0.rxq.applied/drivers/net/hamradio/mkiss.c	2003-12-31 16:35:40.000000000 +0100
+++ linux-2.6.0.rxq/drivers/net/hamradio/mkiss.c	2003-12-31 16:18:54.000000000 +0100
@@ -167,17 +167,17 @@
 	/* If no channels are available, allocate one */
 	if (axp == NULL && (ax25_ctrls[i] = kmalloc(sizeof(ax25_ctrl_t), GFP_KERNEL)) != NULL) {
 		axp = ax25_ctrls[i];
-		memset(axp, 0, sizeof(ax25_ctrl_t));
-
-		/* Initialize channel control data */
-		set_bit(AXF_INUSE, &axp->ctrl.flags);
-		sprintf(axp->dev.name, "ax%d", i++);
-		axp->ctrl.tty      = NULL;
-		axp->dev.base_addr = i;
-		axp->dev.priv      = (void *)&axp->ctrl;
-		axp->dev.next      = NULL;
-		axp->dev.init      = ax25_init;
 	}
+	memset(axp, 0, sizeof(ax25_ctrl_t));
+
+	/* Initialize channel control data */
+	set_bit(AXF_INUSE, &axp->ctrl.flags);
+	sprintf(axp->dev.name, "ax%d", i++);
+	axp->ctrl.tty      = NULL;
+	axp->dev.base_addr = i;
+	axp->dev.priv      = (void *)&axp->ctrl;
+	axp->dev.next      = NULL;
+	axp->dev.init      = ax25_init;
 
 	if (axp != NULL) {
 		/*

--AWniW0JNca5xppdA
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
 

--AWniW0JNca5xppdA--

