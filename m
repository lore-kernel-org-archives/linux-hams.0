From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] hamradio driver fixes
Date: Wed, 21 Jan 2004 21:52:46 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040121215246.A211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org, jgarzik@pobox.com
Cc: ralf@linux-mips.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is the same patch as a few days back with an very old one added:
correctly updating statistics.

Jeff, can you apply this?

Thanks,
Jeroen


details:

+ scc.c usage of rtnl lock and register_netdev.
+ scc.c properly initialize timers.
+ remove cli() call in 6pack.c (The line of code that was 'protected'
couldn't have needed it anyway)
+ fix init of reused devices and remove cli()
+ scc.c statistics

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="hamradio.2.6.1.rxq2.diff"

diff -ru linux-2.6.1.org/drivers/net/hamradio/6pack.c linux-2.6.1-rxq2/drivers/net/hamradio/6pack.c
--- linux-2.6.1.org/drivers/net/hamradio/6pack.c	2004-01-09 07:59:10.000000000 +0100
+++ linux-2.6.1-rxq2/drivers/net/hamradio/6pack.c	2004-01-21 20:47:09.000000000 +0100
@@ -516,7 +516,6 @@
 static void sixpack_receive_buf(struct tty_struct *tty, const unsigned char *cp, char *fp, int count)
 {
 	unsigned char buf[512];
-	unsigned long flags;
 	int count1;
 
 	struct sixpack *sp = (struct sixpack *) tty->disc_data;
@@ -525,10 +524,7 @@
 	    !netif_running(sp->dev) || !count)
 		return;
 
-	save_flags(flags);
-	cli();
 	memcpy(buf, cp, count<sizeof(buf)? count:sizeof(buf));
-	restore_flags(flags);
 
 	/* Read the characters out of the buffer */
 
diff -ru linux-2.6.1.org/drivers/net/hamradio/mkiss.c linux-2.6.1-rxq2/drivers/net/hamradio/mkiss.c
--- linux-2.6.1.org/drivers/net/hamradio/mkiss.c	2004-01-09 08:00:04.000000000 +0100
+++ linux-2.6.1-rxq2/drivers/net/hamradio/mkiss.c	2004-01-21 20:47:09.000000000 +0100
@@ -24,6 +24,7 @@
  *                              called twice, causing a deadlock.
  *	Jeroen (PE1RXQ)		Removed old MKISS_MAGIC stuff and calls to
  *				MOD_*_USE_COUNT
+ *				Remove cli() and fix rtnl lock usage.
  */
 
 #include <linux/config.h>
@@ -167,17 +168,17 @@
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
@@ -220,7 +221,6 @@
 	struct net_device *dev = ax->dev;
 	unsigned char *xbuff, *rbuff, *oxbuff, *orbuff;
 	int len;
-	unsigned long flags;
 
 	len = dev->mtu * 2;
 
@@ -246,8 +246,7 @@
 		return;
 	}
 
-	save_flags(flags);
-	cli();
+	spin_lock_bh(ax->buflock);
 
 	oxbuff    = ax->xbuff;
 	ax->xbuff = xbuff;
@@ -278,7 +277,7 @@
 	ax->mtu      = dev->mtu + 73;
 	ax->buffsize = len;
 
-	restore_flags(flags);
+	spin_unlock_bh(ax->buflock);
 
 	if (oxbuff != NULL)
 		kfree(oxbuff);
@@ -306,6 +305,7 @@
 	struct sk_buff *skb;
 	int count;
 
+	spin_lock_bh(ax->buflock);
 	if (ax->rbuff[0] > 0x0f) {
 		if (ax->rbuff[0] & 0x20) {
 		        ax->crcmode = CRC_MODE_FLEX;
@@ -322,6 +322,7 @@
                         *ax->rbuff &= ~0x20;
 		}
  	}
+	spin_unlock_bh(ax->buflock);
 
 	count = ax->rcount;
 
@@ -332,7 +333,9 @@
 	}
 
 	skb->dev      = ax->dev;
+	spin_lock_bh(ax->buflock);
 	memcpy(skb_put(skb,count), ax->rbuff, count);
+	spin_unlock_bh(ax->buflock);
 	skb->mac.raw  = skb->data;
 	skb->protocol = htons(ETH_P_AX25);
 	netif_rx(skb);
@@ -360,6 +363,7 @@
 
 	p = icp;
 
+	spin_lock_bh(ax->buflock);
         switch (ax->crcmode) {
 	         unsigned short crc;
 
@@ -373,6 +377,7 @@
 	         count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
 		 break;
 	}
+	
 	ax->tty->flags |= (1 << TTY_DO_WRITE_WAKEUP);
 	actual = ax->tty->driver->write(ax->tty, 0, ax->xbuff, count);
 	ax->tx_packets++;
@@ -380,6 +385,8 @@
 	ax->dev->trans_start = jiffies;
 	ax->xleft = count - actual;
 	ax->xhead = ax->xbuff + actual;
+
+	spin_unlock_bh(ax->buflock);
 }
 
 /*
@@ -511,6 +518,8 @@
 
 	ax->flags   &= (1 << AXF_INUSE);      /* Clear ESCAPE & ERROR flags */
 
+	ax->buflock = SPIN_LOCK_UNLOCKED;
+
 	netif_start_queue(dev);
 	return 0;
 
@@ -750,15 +759,18 @@
 			break;
 	}
 
+	spin_lock_bh(ax->buflock);
 	if (!test_bit(AXF_ERROR, &ax->flags)) {
 		if (ax->rcount < ax->buffsize) {
 			ax->rbuff[ax->rcount++] = s;
+			spin_unlock_bh(ax->buflock);
 			return;
 		}
 
 		ax->rx_over_errors++;
 		set_bit(AXF_ERROR, &ax->flags);
 	}
+	spin_unlock_bh(ax->buflock);
 }
 
 
diff -ru linux-2.6.1.org/drivers/net/hamradio/mkiss.h linux-2.6.1-rxq2/drivers/net/hamradio/mkiss.h
--- linux-2.6.1.org/drivers/net/hamradio/mkiss.h	2004-01-09 07:59:09.000000000 +0100
+++ linux-2.6.1-rxq2/drivers/net/hamradio/mkiss.h	2004-01-21 20:47:09.000000000 +0100
@@ -56,6 +56,7 @@
 #define CRC_MODE_NONE   0
 #define CRC_MODE_FLEX   1
 #define CRC_MODE_SMACK  2
+	spinlock_t          buflock;	/* lock for rbuf and xbuf */
 };
 
 #define AX25_MAGIC		0x5316
diff -ru linux-2.6.1.org/drivers/net/hamradio/scc.c linux-2.6.1-rxq2/drivers/net/hamradio/scc.c
--- linux-2.6.1.org/drivers/net/hamradio/scc.c	2004-01-09 07:59:56.000000000 +0100
+++ linux-2.6.1-rxq2/drivers/net/hamradio/scc.c	2004-01-21 21:12:39.000000000 +0100
@@ -163,6 +163,7 @@
 #include <linux/delay.h>
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
 #include <linux/if_ether.h>
 #include <linux/if_arp.h>
 #include <linux/socket.h>
@@ -1520,8 +1521,10 @@
 	dev->priv = scc;
 	scc->dev = dev;
 	spin_lock_init(&scc->lock);
+	init_timer(&scc->tx_t);
+	init_timer(&scc->tx_wdog);
 
-	err = register_netdev(dev);
+	err = register_netdevice(dev);
 	if (err) {
 		printk(KERN_ERR "%s: can't register network device (%d)\n", 
 		       name, err);
@@ -1625,6 +1628,7 @@
 	}
 		
 	scc->dev_stat.rx_packets++;
+	scc->dev_stat.rx_bytes += skb->len;
 
 	skb->dev      = scc->dev;
 	skb->protocol = htons(ETH_P_AX25);
@@ -1651,6 +1655,7 @@
 	}
 	
 	scc->dev_stat.tx_packets++;
+	scc->dev_stat.tx_bytes += skb->len;
 	scc->stat.txframes++;
 	
 	kisscmd = *skb->data & 0x1f;
@@ -2114,10 +2119,13 @@
 	
 	sprintf(devname,"%s0", SCC_DriverName);
 	
+	rtnl_lock();
 	if (scc_net_alloc(devname, SCC_Info)) {
+		rtnl_unlock();
 		printk(KERN_ERR "z8530drv: cannot initialize module\n");
 		return -EIO;
 	}
+	rtnl_unlock();
 
 	proc_net_fops_create("z8530drv", 0, &scc_net_seq_fops);
 
diff -ru linux-2.6.1.org/include/linux/scc.h linux-2.6.1-rxq2/include/linux/scc.h
--- linux-2.6.1.org/include/linux/scc.h	2004-01-09 07:59:46.000000000 +0100
+++ linux-2.6.1-rxq2/include/linux/scc.h	2004-01-21 20:50:05.000000000 +0100
@@ -200,7 +200,7 @@
 	unsigned char fulldup;		/* Full Duplex mode 0=CSMA 1=DUP 2=ALWAYS KEYED */
 	unsigned char waittime;		/* Waittime before any transmit attempt */
 	unsigned int  maxkeyup;		/* Maximum time to transmit (seconds) */
-	unsigned char mintime;		/* Minimal offtime after MAXKEYUP timeout (seconds) */
+	unsigned int  mintime;		/* Minimal offtime after MAXKEYUP timeout (seconds) */
 	unsigned int  idletime;		/* Maximum idle time in ALWAYS KEYED mode (seconds) */
 	unsigned int  maxdefer;		/* Timer for CSMA channel busy limit */
 	unsigned char tx_inhibit;	/* Transmit is not allowed when set */	

--AWniW0JNca5xppdA--

