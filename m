From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] mkiss
Date: Mon, 7 Jul 2003 22:39:07 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030707223907.A8771@jeroen.pe1rxq.ampr.org>
References: <20030705211733.A255@jeroen.pe1rxq.ampr.org> <20030707001148.GC29616@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030707001148.GC29616@linux-mips.org>; from ralf@linux-mips.org on Mon, Jul 07, 2003 at 02:11:48 +0200
List-Id: <linux-hams.vger.kernel.org>
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 2003.07.07 02:11:48 +0200 Ralf Baechle DO1GRB wrote:
> The code that was setting the magic number - actually large parts of
> mkiss.c were removed in 2.4.0-prerelease.  Alan Cox did remove support
> for
> mkiss as a tty driver; the mkiss magic stuff are the last remains of it;
> they should be removed also.

This is a redone patch that removes it completly...
Ralf, can you pass this upstream?

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="mkiss-2.5.74.rxq.diff"

diff -ru linux-2.5.74/drivers/net/hamradio/mkiss.c linux-2.5.74.rxq/drivers/net/hamradio/mkiss.c
--- linux-2.5.74/drivers/net/hamradio/mkiss.c	2003-07-06 01:09:04.000000000 +0200
+++ linux-2.5.74.rxq/drivers/net/hamradio/mkiss.c	2003-07-07 21:55:58.000000000 +0200
@@ -22,6 +22,8 @@
  *	Matthias (DG2FEF)       Added support for FlexNet CRC (on special request)
  *                              Fixed bug in ax25_close(): dev_lock_wait() was
  *                              called twice, causing a deadlock.
+ *	Jeroen (PE1RXQ)		Removed old MKISS_MAGIC stuff and calls to
+ *				MOD_*_USE_COUNT
  */
 
 #include <linux/config.h>
@@ -55,15 +57,6 @@
 
 static char banner[] __initdata = KERN_INFO "mkiss: AX.25 Multikiss, Hans Albas PE1AYX\n";
 
-#define NR_MKISS 4
-#define MKISS_SERIAL_TYPE_NORMAL 1
-
-struct mkiss_channel {
-	int magic;		/* magic word */
-	int init;		/* channel exists? */
-	struct tty_struct *tty; /* link to tty control structure */
-};
-
 typedef struct ax25_ctrl {
 	struct ax_disp ctrl;	/* 				*/
 	struct net_device  dev;	/* the device			*/
@@ -310,19 +303,11 @@
 /* Send one completely decapsulated AX.25 packet to the AX.25 layer. */
 static void ax_bump(struct ax_disp *ax)
 {
-	struct ax_disp *tmp_ax;
 	struct sk_buff *skb;
-	struct mkiss_channel *mkiss;
 	int count;
 
-        tmp_ax = ax;
-
 	if (ax->rbuff[0] > 0x0f) {
-		if (ax->mkiss != NULL) {
-			mkiss= ax->mkiss->tty->driver_data;
-			if (mkiss->magic == MKISS_DRIVER_MAGIC)
-				tmp_ax = ax->mkiss;
-		} else if (ax->rbuff[0] & 0x20) {
+		if (ax->rbuff[0] & 0x20) {
 		        ax->crcmode = CRC_MODE_FLEX;
 			if (check_crc_flex(ax->rbuff, ax->rcount) < 0) {
 			        ax->rx_errors++;
@@ -346,14 +331,14 @@
 		return;
 	}
 
-	skb->dev      = tmp_ax->dev;
+	skb->dev      = ax->dev;
 	memcpy(skb_put(skb,count), ax->rbuff, count);
 	skb->mac.raw  = skb->data;
 	skb->protocol = htons(ETH_P_AX25);
 	netif_rx(skb);
-	tmp_ax->dev->last_rx = jiffies;
-	tmp_ax->rx_packets++;
-	tmp_ax->rx_bytes+=count;
+	ax->dev->last_rx = jiffies;
+	ax->rx_packets++;
+	ax->rx_bytes+=count;
 }
 
 /* Encapsulate one AX.25 packet and stuff into a TTY queue. */
@@ -361,7 +346,6 @@
 {
 	unsigned char *p;
 	int actual, count;
-	struct mkiss_channel *mkiss = ax->tty->driver_data;
 
 	if (ax->mtu != ax->dev->mtu + 73)	/* Someone has been ifconfigging */
 		ax_changedmtu(ax);
@@ -376,37 +360,26 @@
 
 	p = icp;
 
-	if (mkiss->magic  != MKISS_DRIVER_MAGIC) {
-	        switch (ax->crcmode) {
-		         unsigned short crc;
-
-		case CRC_MODE_FLEX:
-		         *p |= 0x20;
-		         crc = calc_crc_flex(p, len);
-			 count = kiss_esc_crc(p, (unsigned char *)ax->xbuff, crc, len+2);
-			 break;
+        switch (ax->crcmode) {
+	         unsigned short crc;
 
-		default:
-		         count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
-			 break;
-		}
-		ax->tty->flags |= (1 << TTY_DO_WRITE_WAKEUP);
-		actual = ax->tty->driver->write(ax->tty, 0, ax->xbuff, count);
-		ax->tx_packets++;
-		ax->tx_bytes+=actual;
-		ax->dev->trans_start = jiffies;
-		ax->xleft = count - actual;
-		ax->xhead = ax->xbuff + actual;
-	} else {
-		count = kiss_esc(p, (unsigned char *) ax->mkiss->xbuff, len);
-		ax->mkiss->tty->flags |= (1 << TTY_DO_WRITE_WAKEUP);
-		actual = ax->mkiss->tty->driver->write(ax->mkiss->tty, 0, ax->mkiss->xbuff, count);
-		ax->tx_packets++;
-		ax->tx_bytes+=actual;
-		ax->mkiss->dev->trans_start = jiffies;
-		ax->mkiss->xleft = count - actual;
-		ax->mkiss->xhead = ax->mkiss->xbuff + actual;
-	}
+	case CRC_MODE_FLEX:
+	         *p |= 0x20;
+	         crc = calc_crc_flex(p, len);
+		 count = kiss_esc_crc(p, (unsigned char *)ax->xbuff, crc, len+2);
+		 break;
+
+	default:
+	         count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
+		 break;
+	}
+	ax->tty->flags |= (1 << TTY_DO_WRITE_WAKEUP);
+	actual = ax->tty->driver->write(ax->tty, 0, ax->xbuff, count);
+	ax->tx_packets++;
+	ax->tx_bytes+=actual;
+	ax->dev->trans_start = jiffies;
+	ax->xleft = count - actual;
+	ax->xhead = ax->xbuff + actual;
 }
 
 /*
@@ -417,7 +390,6 @@
 {
 	int actual;
 	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
-	struct mkiss_channel *mkiss;
 
 	/* First make sure we're connected. */
 	if (ax == NULL || ax->magic != AX25_MAGIC || !netif_running(ax->dev))
@@ -428,12 +400,6 @@
 		 */
 		tty->flags &= ~(1 << TTY_DO_WRITE_WAKEUP);
 
-		if (ax->mkiss != NULL) {
-			mkiss= ax->mkiss->tty->driver_data;
-			if (mkiss->magic  == MKISS_DRIVER_MAGIC)
-				ax_unlock(ax->mkiss);
-	        }
-
 		netif_wake_queue(ax->dev);
 		return;
 	}
@@ -447,32 +413,12 @@
 static int ax_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct ax_disp *ax = (struct ax_disp *) dev->priv;
-	struct mkiss_channel *mkiss = ax->tty->driver_data;
-	struct ax_disp *tmp_ax;
-
-	tmp_ax = NULL;
-
-	if (mkiss->magic  == MKISS_DRIVER_MAGIC) {
-		if (skb->data[0] < 0x10)
-			skb->data[0] = skb->data[0] + 0x10;
-		tmp_ax = ax->mkiss;
-	}
 
 	if (!netif_running(dev))  {
 		printk(KERN_ERR "mkiss: %s: xmit call when iface is down\n", dev->name);
 		return 1;
 	}
 
-	if (tmp_ax != NULL)
-		if (netif_queue_stopped(tmp_ax->dev))
-			return 1;
-
-	if (tmp_ax != NULL)
-		if (netif_queue_stopped(dev)) {
-			printk(KERN_ERR "mkiss: dev busy while serial dev is free\n");
-			ax_unlock(ax);
-	        }
-
 	if (netif_queue_stopped(dev)) {
 		/*
 		 * May be we must check transmitter timeout here ?
@@ -495,8 +441,6 @@
 	/* We were not busy, so we are now... :-) */
 	if (skb != NULL) {
 		ax_lock(ax);
-		if (tmp_ax != NULL)
-			ax_lock(tmp_ax);
 		ax_encaps(ax, skb->data, skb->len);
 		kfree_skb(skb);
 	}
@@ -634,9 +578,7 @@
 static int ax25_open(struct tty_struct *tty)
 {
 	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
-	struct ax_disp *tmp_ax;
-	struct mkiss_channel *mkiss;
-	int err, cnt;
+	int err;
 
 	/* First make sure we're not already connected. */
 	if (ax && ax->magic == AX25_MAGIC)
@@ -649,9 +591,6 @@
 	ax->tty = tty;
 	tty->disc_data = ax;
 
-	ax->mkiss = NULL;
-	tmp_ax    = NULL;
-
 	if (tty->driver->flush_buffer)
 		tty->driver->flush_buffer(tty);
 	if (tty->ldisc.flush_buffer)
@@ -664,29 +603,6 @@
 	if ((err = ax_open(ax->dev)))
 		return err;
 
-	mkiss = ax->tty->driver_data;
-
-	if (mkiss->magic  == MKISS_DRIVER_MAGIC) {
-		for (cnt = 1; cnt < ax25_maxdev; cnt++) {
-			if (ax25_ctrls[cnt]) {
-				if (netif_running(&ax25_ctrls[cnt]->dev)) {
-					if (ax == &ax25_ctrls[cnt]->ctrl) {
-						cnt--;
-						tmp_ax = &ax25_ctrls[cnt]->ctrl;
-						break;
-					}
-				}
-			}
-		}
-	}
-
-	if (tmp_ax != NULL) {
-		ax->mkiss     = tmp_ax;
-		tmp_ax->mkiss = ax;
-	}
-
-	MOD_INC_USE_COUNT;
-
 	/* Done.  We have linked the TTY line to a channel. */
 	return ax->dev->base_addr;
 }
@@ -705,7 +621,6 @@
 	ax->tty        = NULL;
 
 	ax_free(ax);
-	MOD_DEC_USE_COUNT;
 }
 
 
diff -ru linux-2.5.74/drivers/net/hamradio/mkiss.h linux-2.5.74.rxq/drivers/net/hamradio/mkiss.h
--- linux-2.5.74/drivers/net/hamradio/mkiss.h	2003-07-06 01:09:04.000000000 +0200
+++ linux-2.5.74.rxq/drivers/net/hamradio/mkiss.h	2003-07-07 21:50:28.000000000 +0200
@@ -19,7 +19,6 @@
 	/* Various fields. */
 	struct tty_struct  *tty;		/* ptr to TTY structure		*/
 	struct net_device      *dev;		/* easy for intr handling	*/
-	struct ax_disp     *mkiss;		/* mkiss txport if mkiss channel*/
 
 	/* These are pointers to the malloc()ed frame buffers. */
 	unsigned char      *rbuff;		/* receiver buffer		*/
@@ -60,4 +59,3 @@
 };
 
 #define AX25_MAGIC		0x5316
-#define MKISS_DRIVER_MAGIC	1215

--AWniW0JNca5xppdA--

