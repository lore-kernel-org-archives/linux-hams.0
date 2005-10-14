From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] SMACK support for mkiss
Date: Fri, 14 Oct 2005 14:28:09 +0100
Message-ID: <20051014132809.GA24000@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: linux-hams@vger.kernel.org

SMACK (Stuttgart Modified Amateurradio CRC KISS) is a KISS variant that
uses CRC16 checksums to secure data transfers between the modem and host.
It's also used to communicate over a pty to applications such as Wampes.

Patches for Linux 2.4 by Thomas Osterried DL9SAU, upgraded to the latest
mkiss 2.6 mkiss driver by me.

Signed-off-by: Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>
Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 drivers/net/hamradio/Kconfig |    1 
 drivers/net/hamradio/mkiss.c |  178 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 148 insertions(+), 31 deletions(-)

Index: net-git/drivers/net/hamradio/Kconfig
===================================================================
--- net-git.orig/drivers/net/hamradio/Kconfig
+++ net-git/drivers/net/hamradio/Kconfig
@@ -1,6 +1,7 @@
 config MKISS
 	tristate "Serial port KISS driver"
 	depends on AX25
+	select CRC16
 	---help---
 	  KISS is a protocol used for the exchange of data between a computer
 	  and a Terminal Node Controller (a small embedded system commonly
Index: net-git/drivers/net/hamradio/mkiss.c
===================================================================
--- net-git.orig/drivers/net/hamradio/mkiss.c
+++ net-git/drivers/net/hamradio/mkiss.c
@@ -14,13 +14,14 @@
  *
  * Copyright (C) Hans Alblas PE1AYX <hans@esrac.ele.tue.nl>
  * Copyright (C) 2004, 05 Ralf Baechle DL5RB <ralf@linux-mips.org>
+ * Copyright (C) 2004, 05 Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>
  */
-
 #include <linux/config.h>
 #include <linux/module.h>
 #include <asm/system.h>
 #include <linux/bitops.h>
 #include <asm/uaccess.h>
+#include <linux/crc16.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
@@ -39,11 +40,6 @@
 
 #include <net/ax25.h>
 
-#ifdef CONFIG_INET
-#include <linux/ip.h>
-#include <linux/tcp.h>
-#endif
-
 #define AX_MTU		236
 
 /* SLIP/KISS protocol characters. */
@@ -80,9 +76,13 @@ struct mkiss {
 
 	int		mode;
         int		crcmode;	/* MW: for FlexNet, SMACK etc.  */
-#define CRC_MODE_NONE   0
-#define CRC_MODE_FLEX   1
-#define CRC_MODE_SMACK  2
+	int		crcauto;	/* CRC auto mode */
+
+#define CRC_MODE_NONE		0
+#define CRC_MODE_FLEX		1
+#define CRC_MODE_SMACK		2
+#define CRC_MODE_FLEX_TEST	3
+#define CRC_MODE_SMACK_TEST	4
 
 	atomic_t		refcnt;
 	struct semaphore	dead_sem;
@@ -151,6 +151,21 @@ static int check_crc_flex(unsigned char 
 	return 0;
 }
 
+static int check_crc_16(unsigned char *cp, int size)
+{
+	unsigned short crc = 0x0000;
+
+	if (size < 3)
+		return -1;
+
+	crc = crc16(0, cp, size);
+
+	if (crc != 0x0000)
+		return -1;
+
+	return 0;
+}
+
 /*
  * Standard encapsulation
  */
@@ -237,19 +252,42 @@ static void ax_bump(struct mkiss *ax)
 
 	spin_lock_bh(&ax->buflock);
 	if (ax->rbuff[0] > 0x0f) {
-		if (ax->rbuff[0] & 0x20) {
-		        ax->crcmode = CRC_MODE_FLEX;
+		if (ax->rbuff[0] & 0x80) {
+			if (check_crc_16(ax->rbuff, ax->rcount) < 0) {
+				ax->stats.rx_errors++;
+				spin_unlock_bh(&ax->buflock);
+
+				return;
+			}
+			if (ax->crcmode != CRC_MODE_SMACK && ax->crcauto) {
+				printk(KERN_INFO
+				       "mkiss: %s: Switchting to crc-smack\n",
+				       ax->dev->name);
+				ax->crcmode = CRC_MODE_SMACK;
+			}
+			ax->rcount -= 2;
+			*ax->rbuff &= ~0x80;
+		} else if (ax->rbuff[0] & 0x20)  {
 			if (check_crc_flex(ax->rbuff, ax->rcount) < 0) {
-			        ax->stats.rx_errors++;
+				ax->stats.rx_errors++;
+				spin_unlock_bh(&ax->buflock);
 				return;
 			}
+			if (ax->crcmode != CRC_MODE_FLEX && ax->crcauto) {
+				printk(KERN_INFO
+				       "mkiss: %s: Switchting to crc-flexnet\n",
+				       ax->dev->name);
+				ax->crcmode = CRC_MODE_FLEX;
+			}
 			ax->rcount -= 2;
-                        /* dl9sau bugfix: the trailling two bytes flexnet crc
-                         * will not be passed to the kernel. thus we have
-                         * to correct the kissparm signature, because it
-                         * indicates a crc but there's none
+
+			/*
+			 * dl9sau bugfix: the trailling two bytes flexnet crc
+			 * will not be passed to the kernel. thus we have to
+			 * correct the kissparm signature, because it indicates
+			 * a crc but there's none
 			 */
-                        *ax->rbuff &= ~0x20;
+			*ax->rbuff &= ~0x20;
 		}
  	}
 	spin_unlock_bh(&ax->buflock);
@@ -417,20 +455,69 @@ static void ax_encaps(struct net_device 
 	p = icp;
 
 	spin_lock_bh(&ax->buflock);
-        switch (ax->crcmode) {
-	         unsigned short crc;
+	if ((*p & 0x0f) != 0) {
+		/* Configuration Command (kissparms(1).
+		 * Protocol spec says: never append CRC.
+		 * This fixes a very old bug in the linux
+		 * kiss driver. -- dl9sau */
+		switch (*p & 0xff) {
+		case 0x85:
+			/* command from userspace especially for us,
+			 * not for delivery to the tnc */
+			if (len > 1) {
+				int cmd = (p[1] & 0xff);
+				switch(cmd) {
+				case 3:
+				  ax->crcmode = CRC_MODE_SMACK;
+				  break;
+				case 2:
+				  ax->crcmode = CRC_MODE_FLEX;
+				  break;
+				case 1:
+				  ax->crcmode = CRC_MODE_NONE;
+				  break;
+				case 0:
+				default:
+				  ax->crcmode = CRC_MODE_SMACK_TEST;
+				  cmd = 0;
+				}
+				ax->crcauto = (cmd ? 0 : 1);
+				printk(KERN_INFO "mkiss: %s: crc mode %s %d\n", ax->dev->name, (len) ? "set to" : "is", cmd);
+			}
+			spin_unlock_bh(&ax->buflock);
+			netif_start_queue(dev);
 
-	case CRC_MODE_FLEX:
-	         *p |= 0x20;
-	         crc = calc_crc_flex(p, len);
-		 count = kiss_esc_crc(p, (unsigned char *)ax->xbuff, crc, len+2);
-		 break;
+			return;
+		default:
+			count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
+		}
+	} else {
+		unsigned short crc;
+		switch (ax->crcmode) {
+		case CRC_MODE_SMACK_TEST:
+			ax->crcmode  = CRC_MODE_FLEX_TEST;
+			printk(KERN_INFO "mkiss: %s: Trying crc-smack\n", ax->dev->name);
+			// fall through
+		case CRC_MODE_SMACK:
+			*p |= 0x80;
+			crc = swab16(crc16(0, p, len));
+			count = kiss_esc_crc(p, (unsigned char *)ax->xbuff, crc, len+2);
+			break;
+		case CRC_MODE_FLEX_TEST:
+			ax->crcmode = CRC_MODE_NONE;
+			printk(KERN_INFO "mkiss: %s: Trying crc-flexnet\n", ax->dev->name);
+			// fall through
+		case CRC_MODE_FLEX:
+			*p |= 0x20;
+			crc = calc_crc_flex(p, len);
+			count = kiss_esc_crc(p, (unsigned char *)ax->xbuff, crc, len+2);
+			break;
+
+		default:
+			count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
+		}
+  	}
 
-	default:
-	         count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
-		 break;
-	}
-	
 	set_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
 	actual = ax->tty->driver->write(ax->tty, ax->xbuff, count);
 	ax->stats.tx_packets++;
@@ -439,8 +526,6 @@ static void ax_encaps(struct net_device 
 	ax->dev->trans_start = jiffies;
 	ax->xleft = count - actual;
 	ax->xhead = ax->xbuff + actual;
-
-	spin_unlock_bh(&ax->buflock);
 }
 
 /* Encapsulate an AX.25 packet and kick it into a TTY queue. */
@@ -643,6 +728,8 @@ static void mkiss_put(struct mkiss *ax)
 		up(&ax->dead_sem);
 }
 
+static int crc_force = 0;	/* Can be overridden with insmod */
+
 static int mkiss_open(struct tty_struct *tty)
 {
 	struct net_device *dev;
@@ -682,6 +769,33 @@ static int mkiss_open(struct tty_struct 
 	if (register_netdev(dev))
 		goto out_free_buffers;
 
+	/* after register_netdev() - because else printk smashes the kernel */
+	switch (crc_force) {
+	case 3:
+		ax->crcmode  = CRC_MODE_SMACK;
+		printk(KERN_INFO "mkiss: %s: crc mode smack forced.\n",
+		       ax->dev->name);
+		break;
+	case 2:
+		ax->crcmode  = CRC_MODE_FLEX;
+		printk(KERN_INFO "mkiss: %s: crc mode flexnet forced.\n",
+		       ax->dev->name);
+		break;
+	case 1:
+		ax->crcmode  = CRC_MODE_NONE;
+		printk(KERN_INFO "mkiss: %s: crc mode disabled.\n",
+		       ax->dev->name);
+		break;
+	case 0:
+		/* fall through */
+	default:
+		crc_force = 0;
+		printk(KERN_INFO "mkiss: %s: crc mode is auto.\n",
+		       ax->dev->name);
+		ax->crcmode  = CRC_MODE_SMACK_TEST;
+	}
+	ax->crcauto = (crc_force ? 0 : 1);
+
 	netif_start_queue(dev);
 
 	/* Done.  We have linked the TTY line to a channel. */
@@ -904,6 +1018,8 @@ static void __exit mkiss_exit_driver(voi
 
 MODULE_AUTHOR("Ralf Baechle DL5RB <ralf@linux-mips.org>");
 MODULE_DESCRIPTION("KISS driver for AX.25 over TTYs");
+MODULE_PARM(crc_force, "i");
+MODULE_PARM_DESC(crc_force, "crc [0 = auto | 1 = none | 2 = flexnet | 3 = smack]");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_LDISC(N_AX25);
 
