From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: What happened to mkiss module
Date: Sun, 24 Jul 2005 04:45:24 -0400
Message-ID: <20050724084523.GA3130@linux-mips.org>
References: <000c01c59018$a50ec2b0$a4011fac@kb2ear1>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000c01c59018$a50ec2b0$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Weis <kb2ear@kb2ear.net>
Cc: linux-hams@vger.kernel.org

On Sun, Jul 24, 2005 at 02:26:36AM -0400, Scott Weis wrote:

> I had to reload my server due to a hard drive failure.. So I upgraded my 
> SMP server to Fedora core 4. I went to add ax25 and mkiss and found that 
> mkiss was missing.   Where did it go??  Any idea how to get around this 
> problem?

The mkiss module is not SMP proof, so the kernel won't offer it when
configuring an SMP kernel.  Below is an untested rewrite of the driver
for 2.6.13-rc3 that should fix the SMP issues.  Please test it, lemme know.
Without successful testing this driver can't go into the kernel.

Btw, if your TNC supports 6pack you should try to switch to that instead.
It's clearly the superior protocol for TNC.

  Ralf

 Kconfig |    2 
 mkiss.c | 1052 ++++++++++++++++++++++++++++++----------------------------------
 2 files changed, 508 insertions(+), 546 deletions(-)

Index: linux-cvs/drivers/net/hamradio/mkiss.c
===================================================================
--- linux-cvs.orig/drivers/net/hamradio/mkiss.c	2005-07-15 10:04:51.000000000 +0100
+++ linux-cvs/drivers/net/hamradio/mkiss.c	2005-07-15 10:04:57.000000000 +0100
@@ -1,30 +1,19 @@
 /*
- *	MKISS Driver
+ *  This program is free software; you can distribute it and/or modify it
+ *  under the terms of the GNU General Public License (Version 2) as
+ *  published by the Free Software Foundation.
  *
- *	This module:
- *		This module is free software; you can redistribute it and/or
- *		modify it under the terms of the GNU General Public License
- *		as published by the Free Software Foundation; either version
- *		2 of the License, or (at your option) any later version.
+ *  This program is distributed in the hope it will be useful, but WITHOUT
+ *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+ *  for more details.
  *
- * 		This module implements the AX.25 protocol for kernel-based
- *		devices like TTYs. It interfaces between a raw TTY, and the
- *		kernel's AX.25 protocol layers, just like slip.c.
- *		AX.25 needs to be separated from slip.c while slip.c is no
- *		longer a static kernel device since it is a module.
- *		This method clears the way to implement other kiss protocols
- *		like mkiss smack g8bpq ..... so far only mkiss is implemented.
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, write to the Free Software Foundation, Inc.,
+ *  59 Temple Place - Suite 330, Boston MA 02111-1307, USA.
  *
- * Hans Alblas <hans@esrac.ele.tue.nl>
- *
- *	History
- *	Jonathan (G4KLX)	Fixed to match Linux networking changes - 2.1.15.
- *	Matthias (DG2FEF)       Added support for FlexNet CRC (on special request)
- *                              Fixed bug in ax25_close(): dev_lock_wait() was
- *                              called twice, causing a deadlock.
- *	Jeroen (PE1RXQ)		Removed old MKISS_MAGIC stuff and calls to
- *				MOD_*_USE_COUNT
- *				Remove cli() and fix rtnl lock usage.
+ * Copyright (C) Hans Alblas PE1AYX <hans@esrac.ele.tue.nl>
+ * Copyright (C) 2004, 05 Ralf Baechle DL5RB <ralf@linux-mips.org>
  */
 
 #include <linux/config.h>
@@ -50,174 +39,301 @@
 
 #include <net/ax25.h>
 
-#include "mkiss.h"
-
 #ifdef CONFIG_INET
 #include <linux/ip.h>
 #include <linux/tcp.h>
 #endif
 
-static char banner[] __initdata = KERN_INFO "mkiss: AX.25 Multikiss, Hans Albas PE1AYX\n";
-
-typedef struct ax25_ctrl {
-	struct ax_disp ctrl;	/* 				*/
-	struct net_device  dev;	/* the device			*/
-} ax25_ctrl_t;
-
-static ax25_ctrl_t **ax25_ctrls;
+#define AX_MTU		236	
 
-int ax25_maxdev = AX25_MAXDEV;		/* Can be overridden with insmod! */
+/* SLIP/KISS protocol characters. */
+#define END             0300		/* indicates end of frame	*/
+#define ESC             0333		/* indicates byte stuffing	*/
+#define ESC_END         0334		/* ESC ESC_END means END 'data'	*/
+#define ESC_ESC         0335		/* ESC ESC_ESC means ESC 'data'	*/
+
+struct mkiss {
+	struct tty_struct	*tty;	/* ptr to TTY structure		*/
+	struct net_device	*dev;	/* easy for intr handling	*/
+
+	/* These are pointers to the malloc()ed frame buffers. */
+	spinlock_t		buflock;/* lock for rbuf and xbuf */
+	unsigned char		*rbuff;	/* receiver buffer		*/
+	int			rcount;	/* received chars counter       */
+	unsigned char		*xbuff;	/* transmitter buffer		*/
+	unsigned char		*xhead;	/* pointer to next byte to XMIT */
+	int			xleft;	/* bytes left in XMIT queue     */
+
+	struct net_device_stats	stats;
+
+	/* Detailed SLIP statistics. */
+	int		mtu;		/* Our mtu (to spot changes!)   */
+	int		buffsize;	/* Max buffers sizes            */
+
+	unsigned long	flags;		/* Flag values/ mode etc	*/
+					/* long req'd: used by set_bit --RR */
+#define AXF_INUSE	0		/* Channel in use               */
+#define AXF_ESCAPE	1               /* ESC received                 */
+#define AXF_ERROR	2               /* Parity, etc. error           */
+#define AXF_KEEPTEST	3		/* Keepalive test flag		*/
+#define AXF_OUTWAIT	4		/* is outpacket was flag	*/
+
+	int		mode;
+        int		crcmode;	/* MW: for FlexNet, SMACK etc.  */
+#define CRC_MODE_NONE   0
+#define CRC_MODE_FLEX   1
+#define CRC_MODE_SMACK  2
 
-static struct tty_ldisc	ax_ldisc;
-
-static int ax25_init(struct net_device *);
-static int kiss_esc(unsigned char *, unsigned char *, int);
-static int kiss_esc_crc(unsigned char *, unsigned char *, unsigned short, int);
-static void kiss_unesc(struct ax_disp *, unsigned char);
+	atomic_t		refcnt;
+	struct semaphore	dead_sem;
+};
 
 /*---------------------------------------------------------------------------*/
 
-static const unsigned short Crc_flex_table[] = {
-  0x0f87, 0x1e0e, 0x2c95, 0x3d1c, 0x49a3, 0x582a, 0x6ab1, 0x7b38,
-  0x83cf, 0x9246, 0xa0dd, 0xb154, 0xc5eb, 0xd462, 0xe6f9, 0xf770,
-  0x1f06, 0x0e8f, 0x3c14, 0x2d9d, 0x5922, 0x48ab, 0x7a30, 0x6bb9,
-  0x934e, 0x82c7, 0xb05c, 0xa1d5, 0xd56a, 0xc4e3, 0xf678, 0xe7f1,
-  0x2e85, 0x3f0c, 0x0d97, 0x1c1e, 0x68a1, 0x7928, 0x4bb3, 0x5a3a,
-  0xa2cd, 0xb344, 0x81df, 0x9056, 0xe4e9, 0xf560, 0xc7fb, 0xd672,
-  0x3e04, 0x2f8d, 0x1d16, 0x0c9f, 0x7820, 0x69a9, 0x5b32, 0x4abb,
-  0xb24c, 0xa3c5, 0x915e, 0x80d7, 0xf468, 0xe5e1, 0xd77a, 0xc6f3,
-  0x4d83, 0x5c0a, 0x6e91, 0x7f18, 0x0ba7, 0x1a2e, 0x28b5, 0x393c,
-  0xc1cb, 0xd042, 0xe2d9, 0xf350, 0x87ef, 0x9666, 0xa4fd, 0xb574,
-  0x5d02, 0x4c8b, 0x7e10, 0x6f99, 0x1b26, 0x0aaf, 0x3834, 0x29bd,
-  0xd14a, 0xc0c3, 0xf258, 0xe3d1, 0x976e, 0x86e7, 0xb47c, 0xa5f5,
-  0x6c81, 0x7d08, 0x4f93, 0x5e1a, 0x2aa5, 0x3b2c, 0x09b7, 0x183e,
-  0xe0c9, 0xf140, 0xc3db, 0xd252, 0xa6ed, 0xb764, 0x85ff, 0x9476,
-  0x7c00, 0x6d89, 0x5f12, 0x4e9b, 0x3a24, 0x2bad, 0x1936, 0x08bf,
-  0xf048, 0xe1c1, 0xd35a, 0xc2d3, 0xb66c, 0xa7e5, 0x957e, 0x84f7,
-  0x8b8f, 0x9a06, 0xa89d, 0xb914, 0xcdab, 0xdc22, 0xeeb9, 0xff30,
-  0x07c7, 0x164e, 0x24d5, 0x355c, 0x41e3, 0x506a, 0x62f1, 0x7378,
-  0x9b0e, 0x8a87, 0xb81c, 0xa995, 0xdd2a, 0xcca3, 0xfe38, 0xefb1,
-  0x1746, 0x06cf, 0x3454, 0x25dd, 0x5162, 0x40eb, 0x7270, 0x63f9,
-  0xaa8d, 0xbb04, 0x899f, 0x9816, 0xeca9, 0xfd20, 0xcfbb, 0xde32,
-  0x26c5, 0x374c, 0x05d7, 0x145e, 0x60e1, 0x7168, 0x43f3, 0x527a,
-  0xba0c, 0xab85, 0x991e, 0x8897, 0xfc28, 0xeda1, 0xdf3a, 0xceb3,
-  0x3644, 0x27cd, 0x1556, 0x04df, 0x7060, 0x61e9, 0x5372, 0x42fb,
-  0xc98b, 0xd802, 0xea99, 0xfb10, 0x8faf, 0x9e26, 0xacbd, 0xbd34,
-  0x45c3, 0x544a, 0x66d1, 0x7758, 0x03e7, 0x126e, 0x20f5, 0x317c,
-  0xd90a, 0xc883, 0xfa18, 0xeb91, 0x9f2e, 0x8ea7, 0xbc3c, 0xadb5,
-  0x5542, 0x44cb, 0x7650, 0x67d9, 0x1366, 0x02ef, 0x3074, 0x21fd,
-  0xe889, 0xf900, 0xcb9b, 0xda12, 0xaead, 0xbf24, 0x8dbf, 0x9c36,
-  0x64c1, 0x7548, 0x47d3, 0x565a, 0x22e5, 0x336c, 0x01f7, 0x107e,
-  0xf808, 0xe981, 0xdb1a, 0xca93, 0xbe2c, 0xafa5, 0x9d3e, 0x8cb7,
-  0x7440, 0x65c9, 0x5752, 0x46db, 0x3264, 0x23ed, 0x1176, 0x00ff
+static const unsigned short crc_flex_table[] = {
+	0x0f87, 0x1e0e, 0x2c95, 0x3d1c, 0x49a3, 0x582a, 0x6ab1, 0x7b38,
+	0x83cf, 0x9246, 0xa0dd, 0xb154, 0xc5eb, 0xd462, 0xe6f9, 0xf770,
+	0x1f06, 0x0e8f, 0x3c14, 0x2d9d, 0x5922, 0x48ab, 0x7a30, 0x6bb9,
+	0x934e, 0x82c7, 0xb05c, 0xa1d5, 0xd56a, 0xc4e3, 0xf678, 0xe7f1,
+	0x2e85, 0x3f0c, 0x0d97, 0x1c1e, 0x68a1, 0x7928, 0x4bb3, 0x5a3a,
+	0xa2cd, 0xb344, 0x81df, 0x9056, 0xe4e9, 0xf560, 0xc7fb, 0xd672,
+	0x3e04, 0x2f8d, 0x1d16, 0x0c9f, 0x7820, 0x69a9, 0x5b32, 0x4abb,
+	0xb24c, 0xa3c5, 0x915e, 0x80d7, 0xf468, 0xe5e1, 0xd77a, 0xc6f3,
+	0x4d83, 0x5c0a, 0x6e91, 0x7f18, 0x0ba7, 0x1a2e, 0x28b5, 0x393c,
+	0xc1cb, 0xd042, 0xe2d9, 0xf350, 0x87ef, 0x9666, 0xa4fd, 0xb574,
+	0x5d02, 0x4c8b, 0x7e10, 0x6f99, 0x1b26, 0x0aaf, 0x3834, 0x29bd,
+	0xd14a, 0xc0c3, 0xf258, 0xe3d1, 0x976e, 0x86e7, 0xb47c, 0xa5f5,
+	0x6c81, 0x7d08, 0x4f93, 0x5e1a, 0x2aa5, 0x3b2c, 0x09b7, 0x183e,
+	0xe0c9, 0xf140, 0xc3db, 0xd252, 0xa6ed, 0xb764, 0x85ff, 0x9476,
+	0x7c00, 0x6d89, 0x5f12, 0x4e9b, 0x3a24, 0x2bad, 0x1936, 0x08bf,
+	0xf048, 0xe1c1, 0xd35a, 0xc2d3, 0xb66c, 0xa7e5, 0x957e, 0x84f7,
+	0x8b8f, 0x9a06, 0xa89d, 0xb914, 0xcdab, 0xdc22, 0xeeb9, 0xff30,
+	0x07c7, 0x164e, 0x24d5, 0x355c, 0x41e3, 0x506a, 0x62f1, 0x7378,
+	0x9b0e, 0x8a87, 0xb81c, 0xa995, 0xdd2a, 0xcca3, 0xfe38, 0xefb1,
+	0x1746, 0x06cf, 0x3454, 0x25dd, 0x5162, 0x40eb, 0x7270, 0x63f9,
+	0xaa8d, 0xbb04, 0x899f, 0x9816, 0xeca9, 0xfd20, 0xcfbb, 0xde32,
+	0x26c5, 0x374c, 0x05d7, 0x145e, 0x60e1, 0x7168, 0x43f3, 0x527a,
+	0xba0c, 0xab85, 0x991e, 0x8897, 0xfc28, 0xeda1, 0xdf3a, 0xceb3,
+	0x3644, 0x27cd, 0x1556, 0x04df, 0x7060, 0x61e9, 0x5372, 0x42fb,
+	0xc98b, 0xd802, 0xea99, 0xfb10, 0x8faf, 0x9e26, 0xacbd, 0xbd34,
+	0x45c3, 0x544a, 0x66d1, 0x7758, 0x03e7, 0x126e, 0x20f5, 0x317c,
+	0xd90a, 0xc883, 0xfa18, 0xeb91, 0x9f2e, 0x8ea7, 0xbc3c, 0xadb5,
+	0x5542, 0x44cb, 0x7650, 0x67d9, 0x1366, 0x02ef, 0x3074, 0x21fd,
+	0xe889, 0xf900, 0xcb9b, 0xda12, 0xaead, 0xbf24, 0x8dbf, 0x9c36,
+	0x64c1, 0x7548, 0x47d3, 0x565a, 0x22e5, 0x336c, 0x01f7, 0x107e,
+	0xf808, 0xe981, 0xdb1a, 0xca93, 0xbe2c, 0xafa5, 0x9d3e, 0x8cb7,
+	0x7440, 0x65c9, 0x5752, 0x46db, 0x3264, 0x23ed, 0x1176, 0x00ff
 };
 
-/*---------------------------------------------------------------------------*/
-
 static unsigned short calc_crc_flex(unsigned char *cp, int size)
 {
-    unsigned short crc = 0xffff;
-    
-    while (size--)
-	crc = (crc << 8) ^ Crc_flex_table[((crc >> 8) ^ *cp++) & 0xff];
+	unsigned short crc = 0xffff;
 
-    return crc;
-}
+	while (size--)
+		crc = (crc << 8) ^ crc_flex_table[((crc >> 8) ^ *cp++) & 0xff];
 
-/*---------------------------------------------------------------------------*/
+	return crc;
+}
 
 static int check_crc_flex(unsigned char *cp, int size)
 {
-  unsigned short crc = 0xffff;
+	unsigned short crc = 0xffff;
 
-  if (size < 3)
-      return -1;
+	if (size < 3)
+		return -1;
 
-  while (size--)
-      crc = (crc << 8) ^ Crc_flex_table[((crc >> 8) ^ *cp++) & 0xff];
+	while (size--)
+		crc = (crc << 8) ^ crc_flex_table[((crc >> 8) ^ *cp++) & 0xff];
 
-  if ((crc & 0xffff) != 0x7070) 
-      return -1;
+	if ((crc & 0xffff) != 0x7070)
+		return -1;
 
-  return 0;
+	return 0;
 }
 
-/*---------------------------------------------------------------------------*/
+/*
+ * Standard encapsulation
+ */
 
-/* Find a free channel, and link in this `tty' line. */
-static inline struct ax_disp *ax_alloc(void)
+static int kiss_esc(unsigned char *s, unsigned char *d, int len)
 {
-	ax25_ctrl_t *axp=NULL;
-	int i;
+	unsigned char *ptr = d;
+	unsigned char c;
+
+	/*
+	 * Send an initial END character to flush out any data that may have
+	 * accumulated in the receiver due to line noise.
+	 */
 
-	for (i = 0; i < ax25_maxdev; i++) {
-		axp = ax25_ctrls[i];
+	*ptr++ = END;
 
-		/* Not allocated ? */
-		if (axp == NULL)
+	while (len-- > 0) {
+		switch (c = *s++) {
+		case END:
+			*ptr++ = ESC;
+			*ptr++ = ESC_END;
 			break;
+		case ESC:
+			*ptr++ = ESC;
+			*ptr++ = ESC_ESC;
+			break;
+		default:
+			*ptr++ = c;
+			break;
+		}
+	}
+
+	*ptr++ = END;
+
+	return ptr - d;
+}
+
+/*
+ * MW:
+ * OK its ugly, but tell me a better solution without copying the
+ * packet to a temporary buffer :-)
+ */
+static int kiss_esc_crc(unsigned char *s, unsigned char *d, unsigned short crc,
+	int len)
+{
+	unsigned char *ptr = d;
+	unsigned char c=0;
+
+	*ptr++ = END;
+	while (len > 0) {
+		if (len > 2)
+			c = *s++;
+		else if (len > 1)
+			c = crc >> 8;
+		else if (len > 0)
+			c = crc & 0xff;
+
+		len--;
 
-		/* Not in use ? */
-		if (!test_and_set_bit(AXF_INUSE, &axp->ctrl.flags))
+		switch (c) {
+		case END:
+			*ptr++ = ESC;
+			*ptr++ = ESC_END;
+			break;
+		case ESC:
+			*ptr++ = ESC;
+			*ptr++ = ESC_ESC;
 			break;
+		default:
+			*ptr++ = c;
+			break;
+		}
 	}
+	*ptr++ = END;
 
-	/* Sorry, too many, all slots in use */
-	if (i >= ax25_maxdev)
-		return NULL;
-
-	/* If no channels are available, allocate one */
-	if (axp == NULL && (ax25_ctrls[i] = kmalloc(sizeof(ax25_ctrl_t), GFP_KERNEL)) != NULL) {
-		axp = ax25_ctrls[i];
-	}
-	memset(axp, 0, sizeof(ax25_ctrl_t));
-
-	/* Initialize channel control data */
-	set_bit(AXF_INUSE, &axp->ctrl.flags);
-	sprintf(axp->dev.name, "ax%d", i++);
-	axp->ctrl.tty      = NULL;
-	axp->dev.base_addr = i;
-	axp->dev.priv      = (void *)&axp->ctrl;
-	axp->dev.next      = NULL;
-	axp->dev.init      = ax25_init;
+	return ptr - d;		
+}
 
-	if (axp != NULL) {
-		/*
-		 * register device so that it can be ifconfig'ed
-		 * ax25_init() will be called as a side-effect
-		 * SIDE-EFFECT WARNING: ax25_init() CLEARS axp->ctrl !
-		 */
-		if (register_netdev(&axp->dev) == 0) {
-			/* (Re-)Set the INUSE bit.   Very Important! */
-			set_bit(AXF_INUSE, &axp->ctrl.flags);
-			axp->ctrl.dev = &axp->dev;
-			axp->dev.priv = (void *) &axp->ctrl;
-
-			return &axp->ctrl;
-		} else {
-			clear_bit(AXF_INUSE,&axp->ctrl.flags);
-			printk(KERN_ERR "mkiss: ax_alloc() - register_netdev() failure.\n");
+/* Send one completely decapsulated AX.25 packet to the AX.25 layer. */
+static void ax_bump(struct mkiss *ax)
+{
+	struct sk_buff *skb;
+	int count;
+
+	spin_lock_bh(&ax->buflock);
+	if (ax->rbuff[0] > 0x0f) {
+		if (ax->rbuff[0] & 0x20) {
+		        ax->crcmode = CRC_MODE_FLEX;
+			if (check_crc_flex(ax->rbuff, ax->rcount) < 0) {
+			        ax->stats.rx_errors++;
+				return;
+			}
+			ax->rcount -= 2;
+                        /* dl9sau bugfix: the trailling two bytes flexnet crc
+                         * will not be passed to the kernel. thus we have
+                         * to correct the kissparm signature, because it
+                         * indicates a crc but there's none
+			 */
+                        *ax->rbuff &= ~0x20;
 		}
+ 	}
+	spin_unlock_bh(&ax->buflock);
+
+	count = ax->rcount;
+
+	if ((skb = dev_alloc_skb(count)) == NULL) {
+		printk(KERN_ERR "mkiss: %s: memory squeeze, dropping packet.\n", ax->dev->name);
+		ax->stats.rx_dropped++;
+		return;
 	}
 
-	return NULL;
+	spin_lock_bh(&ax->buflock);
+	memcpy(skb_put(skb,count), ax->rbuff, count);
+	spin_unlock_bh(&ax->buflock);
+	skb->protocol = ax25_type_trans(skb, ax->dev);
+	netif_rx(skb);
+	ax->dev->last_rx = jiffies;
+	ax->stats.rx_packets++;
+	ax->stats.rx_bytes += count;
 }
 
-/* Free an AX25 channel. */
-static inline void ax_free(struct ax_disp *ax)
+static void kiss_unesc(struct mkiss *ax, unsigned char s)
 {
-	/* Free all AX25 frame buffers. */
-	if (ax->rbuff)
-		kfree(ax->rbuff);
-	ax->rbuff = NULL;
-	if (ax->xbuff)
-		kfree(ax->xbuff);
-	ax->xbuff = NULL;
-	if (!test_and_clear_bit(AXF_INUSE, &ax->flags))
-		printk(KERN_ERR "mkiss: %s: ax_free for already free unit.\n", ax->dev->name);
+	switch (s) {
+	case END:
+		/* drop keeptest bit = VSV */
+		if (test_bit(AXF_KEEPTEST, &ax->flags))
+			clear_bit(AXF_KEEPTEST, &ax->flags);
+
+		if (!test_and_clear_bit(AXF_ERROR, &ax->flags) && (ax->rcount > 2))
+			ax_bump(ax);
+
+		clear_bit(AXF_ESCAPE, &ax->flags);
+		ax->rcount = 0;
+		return;
+
+	case ESC:
+		set_bit(AXF_ESCAPE, &ax->flags);
+		return;
+	case ESC_ESC:
+		if (test_and_clear_bit(AXF_ESCAPE, &ax->flags))
+			s = ESC;
+		break;
+	case ESC_END:
+		if (test_and_clear_bit(AXF_ESCAPE, &ax->flags))
+			s = END;
+		break;
+	}
+
+	spin_lock_bh(&ax->buflock);
+	if (!test_bit(AXF_ERROR, &ax->flags)) {
+		if (ax->rcount < ax->buffsize) {
+			ax->rbuff[ax->rcount++] = s;
+			spin_unlock_bh(&ax->buflock);
+			return;
+		}
+
+		ax->stats.rx_over_errors++;
+		set_bit(AXF_ERROR, &ax->flags);
+	}
+	spin_unlock_bh(&ax->buflock);
+}
+
+static int ax_set_mac_address(struct net_device *dev, void *addr)
+{
+	struct sockaddr_ax25 *sa = addr;
+
+	if (sa->sax25_family != AF_AX25)
+		return -EINVAL;
+
+	if (!sa->sax25_ndigis)
+		return -EINVAL;
+
+	spin_lock_irq(&dev->xmit_lock);
+	memcpy(dev->dev_addr, &sa->sax25_call, AX25_ADDR_LEN);
+	spin_unlock_irq(&dev->xmit_lock);
+
+	return 0;
 }
 
-static void ax_changedmtu(struct ax_disp *ax)
+/*---------------------------------------------------------------------------*/
+
+static void ax_changedmtu(struct mkiss *ax)
 {
 	struct net_device *dev = ax->dev;
 	unsigned char *xbuff, *rbuff, *oxbuff, *orbuff;
@@ -237,7 +353,8 @@
 	rbuff = kmalloc(len + 4, GFP_ATOMIC);
 
 	if (xbuff == NULL || rbuff == NULL)  {
-		printk(KERN_ERR "mkiss: %s: unable to grow ax25 buffers, MTU change cancelled.\n",
+		printk(KERN_ERR "mkiss: %s: unable to grow ax25 buffers, "
+		       "MTU change cancelled.\n",
 		       ax->dev->name);
 		dev->mtu = ax->mtu;
 		if (xbuff != NULL)
@@ -259,7 +376,7 @@
 			memcpy(ax->xbuff, ax->xhead, ax->xleft);
 		} else  {
 			ax->xleft = 0;
-			ax->tx_dropped++;
+			ax->stats.tx_dropped++;
 		}
 	}
 
@@ -270,7 +387,7 @@
 			memcpy(ax->rbuff, orbuff, ax->rcount);
 		} else  {
 			ax->rcount = 0;
-			ax->rx_over_errors++;
+			ax->stats.rx_over_errors++;
 			set_bit(AXF_ERROR, &ax->flags);
 		}
 	}
@@ -280,71 +397,26 @@
 
 	spin_unlock_bh(&ax->buflock);
 
-	if (oxbuff != NULL)
-		kfree(oxbuff);
-	if (orbuff != NULL)
-		kfree(orbuff);
+	kfree(oxbuff);
+	kfree(orbuff);
 }
 
 
 /* Set the "sending" flag.  This must be atomic. */
-static inline void ax_lock(struct ax_disp *ax)
+static inline void ax_lock(struct mkiss *ax)
 {
 	netif_stop_queue(ax->dev);
 }
 
 
 /* Clear the "sending" flag.  This must be atomic. */
-static inline void ax_unlock(struct ax_disp *ax)
+static inline void ax_unlock(struct mkiss *ax)
 {
 	netif_start_queue(ax->dev);
 }
 
-/* Send one completely decapsulated AX.25 packet to the AX.25 layer. */
-static void ax_bump(struct ax_disp *ax)
-{
-	struct sk_buff *skb;
-	int count;
-
-	spin_lock_bh(&ax->buflock);
-	if (ax->rbuff[0] > 0x0f) {
-		if (ax->rbuff[0] & 0x20) {
-		        ax->crcmode = CRC_MODE_FLEX;
-			if (check_crc_flex(ax->rbuff, ax->rcount) < 0) {
-			        ax->rx_errors++;
-				return;
-			}
-			ax->rcount -= 2;
-                        /* dl9sau bugfix: the trailling two bytes flexnet crc
-                         * will not be passed to the kernel. thus we have
-                         * to correct the kissparm signature, because it
-                         * indicates a crc but there's none
-			 */
-                        *ax->rbuff &= ~0x20;
-		}
- 	}
-	spin_unlock_bh(&ax->buflock);
-
-	count = ax->rcount;
-
-	if ((skb = dev_alloc_skb(count)) == NULL) {
-		printk(KERN_ERR "mkiss: %s: memory squeeze, dropping packet.\n", ax->dev->name);
-		ax->rx_dropped++;
-		return;
-	}
-
-	spin_lock_bh(&ax->buflock);
-	memcpy(skb_put(skb,count), ax->rbuff, count);
-	spin_unlock_bh(&ax->buflock);
-	skb->protocol = ax25_type_trans(skb, ax->dev);
-	netif_rx(skb);
-	ax->dev->last_rx = jiffies;
-	ax->rx_packets++;
-	ax->rx_bytes+=count;
-}
-
 /* Encapsulate one AX.25 packet and stuff into a TTY queue. */
-static void ax_encaps(struct ax_disp *ax, unsigned char *icp, int len)
+static void ax_encaps(struct mkiss *ax, unsigned char *icp, int len)
 {
 	unsigned char *p;
 	int actual, count;
@@ -355,7 +427,7 @@
 	if (len > ax->mtu) {		/* Sigh, shouldn't occur BUT ... */
 		len = ax->mtu;
 		printk(KERN_ERR "mkiss: %s: truncating oversized transmit packet!\n", ax->dev->name);
-		ax->tx_dropped++;
+		ax->stats.tx_dropped++;
 		ax_unlock(ax);
 		return;
 	}
@@ -377,10 +449,11 @@
 		 break;
 	}
 	
-	ax->tty->flags |= (1 << TTY_DO_WRITE_WAKEUP);
+	set_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
 	actual = ax->tty->driver->write(ax->tty, ax->xbuff, count);
-	ax->tx_packets++;
-	ax->tx_bytes+=actual;
+	ax->stats.tx_packets++;
+	ax->stats.tx_bytes += actual;
+
 	ax->dev->trans_start = jiffies;
 	ax->xleft = count - actual;
 	ax->xhead = ax->xbuff + actual;
@@ -388,37 +461,10 @@
 	spin_unlock_bh(&ax->buflock);
 }
 
-/*
- * Called by the driver when there's room for more data.  If we have
- * more packets to send, we send them here.
- */
-static void ax25_write_wakeup(struct tty_struct *tty)
-{
-	int actual;
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
-
-	/* First make sure we're connected. */
-	if (ax == NULL || ax->magic != AX25_MAGIC || !netif_running(ax->dev))
-		return;
-	if (ax->xleft <= 0)  {
-		/* Now serial buffer is almost free & we can start
-		 * transmission of another packet
-		 */
-		tty->flags &= ~(1 << TTY_DO_WRITE_WAKEUP);
-
-		netif_wake_queue(ax->dev);
-		return;
-	}
-
-	actual = tty->driver->write(tty, ax->xhead, ax->xleft);
-	ax->xleft -= actual;
-	ax->xhead += actual;
-}
-
 /* Encapsulate an AX.25 packet and kick it into a TTY queue. */
 static int ax_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct ax_disp *ax = netdev_priv(dev);
+	struct mkiss *ax = netdev_priv(dev);
 
 	if (!netif_running(dev))  {
 		printk(KERN_ERR "mkiss: %s: xmit call when iface is down\n", dev->name);
@@ -440,7 +486,7 @@
 		       "bad line quality" : "driver error");
 
 		ax->xleft = 0;
-		ax->tty->flags &= ~(1 << TTY_DO_WRITE_WAKEUP);
+		clear_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
 		ax_unlock(ax);
 	}
 
@@ -454,6 +500,16 @@
 	return 0;
 }
 
+static int ax_open_dev(struct net_device *dev)
+{
+	struct mkiss *ax = netdev_priv(dev);
+
+	if (ax->tty == NULL)
+		return -ENODEV;
+
+	return 0;
+}
+
 #if defined(CONFIG_AX25) || defined(CONFIG_AX25_MODULE)
 
 /* Return the frame type ID */
@@ -482,7 +538,7 @@
 /* Open the low-level part of the AX25 channel. Easy! */
 static int ax_open(struct net_device *dev)
 {
-	struct ax_disp *ax = netdev_priv(dev);
+	struct mkiss *ax = netdev_priv(dev);
 	unsigned long len;
 
 	if (ax->tty == NULL)
@@ -533,68 +589,100 @@
 /* Close the low-level part of the AX25 channel. Easy! */
 static int ax_close(struct net_device *dev)
 {
-	struct ax_disp *ax = netdev_priv(dev);
+	struct mkiss *ax = netdev_priv(dev);
 
-	if (ax->tty == NULL)
-		return -EBUSY;
-
-	ax->tty->flags &= ~(1 << TTY_DO_WRITE_WAKEUP);
+	if (ax->tty)
+		clear_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
 
 	netif_stop_queue(dev);
 
 	return 0;
 }
 
-static int ax25_receive_room(struct tty_struct *tty)
+static struct net_device_stats *ax_get_stats(struct net_device *dev)
 {
-	return 65536;  /* We can handle an infinite amount of data. :-) */
+	struct mkiss *ax = netdev_priv(dev);
+
+	return &ax->stats;
+}
+
+static void ax_setup(struct net_device *dev)
+{
+	static char ax25_bcast[AX25_ADDR_LEN] =
+		{'Q'<<1,'S'<<1,'T'<<1,' '<<1,' '<<1,' '<<1,'0'<<1};
+	static char ax25_test[AX25_ADDR_LEN] =
+		{'L'<<1,'I'<<1,'N'<<1,'U'<<1,'X'<<1,' '<<1,'1'<<1};
+
+	/* Finish setting up the DEVICE info. */
+	dev->mtu             = AX_MTU;
+	dev->hard_start_xmit = ax_xmit;
+	dev->open            = ax_open_dev;
+	dev->stop            = ax_close;
+	dev->get_stats	     = ax_get_stats;
+	dev->set_mac_address = ax_set_mac_address;
+	dev->hard_header_len = 0;
+	dev->addr_len        = 0;
+	dev->type            = ARPHRD_AX25;
+	dev->tx_queue_len    = 10;
+	dev->hard_header     = ax_header;
+	dev->rebuild_header  = ax_rebuild_header;
+
+	memcpy(dev->broadcast, ax25_bcast, AX25_ADDR_LEN);
+	memcpy(dev->dev_addr,  ax25_test,  AX25_ADDR_LEN);
+
+	dev->flags      = IFF_BROADCAST | IFF_MULTICAST;
 }
 
 /*
- * Handle the 'receiver data ready' interrupt.
- * This function is called by the 'tty_io' module in the kernel when
- * a block of data has been received, which can now be decapsulated
- * and sent on to the AX.25 layer for further processing.
+ * We have a potential race on dereferencing tty->disc_data, because the tty
+ * layer provides no locking at all - thus one cpu could be running
+ * sixpack_receive_buf while another calls sixpack_close, which zeroes
+ * tty->disc_data and frees the memory that sixpack_receive_buf is using.  The
+ * best way to fix this is to use a rwlock in the tty struct, but for now we
+ * use a single global rwlock for all ttys in ppp line discipline.
  */
-static void ax25_receive_buf(struct tty_struct *tty, const unsigned char *cp, char *fp, int count)
-{
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+static rwlock_t disc_data_lock = RW_LOCK_UNLOCKED;
 
-	if (ax == NULL || ax->magic != AX25_MAGIC || !netif_running(ax->dev))
-		return;
+static struct mkiss *mkiss_get(struct tty_struct *tty)
+{
+	struct mkiss *ax;
 
-	/*
-	 * Argh! mtu change time! - costs us the packet part received
-	 * at the change
-	 */
-	if (ax->mtu != ax->dev->mtu + 73)
-		ax_changedmtu(ax);
+	read_lock(&disc_data_lock);
+	ax = tty->disc_data;
+	if (ax)
+		atomic_inc(&ax->refcnt);
+	read_unlock(&disc_data_lock);
 
-	/* Read the characters out of the buffer */
-	while (count--) {
-		if (fp != NULL && *fp++) {
-			if (!test_and_set_bit(AXF_ERROR, &ax->flags))
-				ax->rx_errors++;
-			cp++;
-			continue;
-		}
+	return ax;
+}
 
-		kiss_unesc(ax, *cp++);
-	}
+static void mkiss_put(struct mkiss *ax)
+{
+	if (atomic_dec_and_test(&ax->refcnt))
+		up(&ax->dead_sem);
 }
 
-static int ax25_open(struct tty_struct *tty)
+static int mkiss_open(struct tty_struct *tty)
 {
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+	struct net_device *dev;
+	struct mkiss *ax;
 	int err;
 
-	/* First make sure we're not already connected. */
-	if (ax && ax->magic == AX25_MAGIC)
-		return -EEXIST;
-
-	/* OK.  Find a free AX25 channel to use. */
-	if ((ax = ax_alloc()) == NULL)
-		return -ENFILE;
+	if (!capable(CAP_NET_ADMIN))
+		return -EPERM;
+
+	dev = alloc_netdev(sizeof(struct mkiss), "ax%d", ax_setup);
+	if (!dev) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	ax = netdev_priv(dev);
+	ax->dev = dev;
+
+	spin_lock_init(&ax->buflock);
+	atomic_set(&ax->refcnt, 1);
+	init_MUTEX_LOCKED(&ax->dead_sem);
 
 	ax->tty = tty;
 	tty->disc_data = ax;
@@ -611,275 +699,186 @@
 
 	/* Done.  We have linked the TTY line to a channel. */
 	return ax->dev->base_addr;
-}
-
-static void ax25_close(struct tty_struct *tty)
-{
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
-
-	/* First make sure we're connected. */
-	if (ax == NULL || ax->magic != AX25_MAGIC)
-		return;
 
-	unregister_netdev(ax->dev);
-
-	tty->disc_data = NULL;
-	ax->tty        = NULL;
-
-	ax_free(ax);
+out:
+	return err;
 }
 
-
-static struct net_device_stats *ax_get_stats(struct net_device *dev)
+static void mkiss_close(struct tty_struct *tty)
 {
-	static struct net_device_stats stats;
-	struct ax_disp *ax = netdev_priv(dev);
+	struct mkiss *ax;
 
-	memset(&stats, 0, sizeof(struct net_device_stats));
-
-	stats.rx_packets     = ax->rx_packets;
-	stats.tx_packets     = ax->tx_packets;
-	stats.rx_bytes	     = ax->rx_bytes;
-	stats.tx_bytes       = ax->tx_bytes;
-	stats.rx_dropped     = ax->rx_dropped;
-	stats.tx_dropped     = ax->tx_dropped;
-	stats.tx_errors      = ax->tx_errors;
-	stats.rx_errors      = ax->rx_errors;
-	stats.rx_over_errors = ax->rx_over_errors;
-
-	return &stats;
-}
-
-
-/************************************************************************
- *			   STANDARD ENCAPSULATION	        	 *
- ************************************************************************/
+	write_lock(&disc_data_lock);
+	ax = tty->disc_data;
+	tty->disc_data = NULL;
+	write_unlock(&disc_data_lock);
 
-static int kiss_esc(unsigned char *s, unsigned char *d, int len)
-{
-	unsigned char *ptr = d;
-	unsigned char c;
+	if (ax == 0)
+		return;
 
 	/*
-	 * Send an initial END character to flush out any
-	 * data that may have accumulated in the receiver
-	 * due to line noise.
+	 * We have now ensured that nobody can start using ap from now on, but
+	 * we have to wait for all existing users to finish.
 	 */
+	if (!atomic_dec_and_test(&ax->refcnt))
+		down(&ax->dead_sem);
 
-	*ptr++ = END;
-
-	while (len-- > 0) {
-		switch (c = *s++) {
-			case END:
-				*ptr++ = ESC;
-				*ptr++ = ESC_END;
-				break;
-			case ESC:
-				*ptr++ = ESC;
-				*ptr++ = ESC_ESC;
-				break;
-			default:
-				*ptr++ = c;
-				break;
-		}
-	}
+	unregister_netdev(ax->dev);
 
-	*ptr++ = END;
+	/* Free all AX25 frame buffers. */
+	kfree(ax->rbuff);
+	kfree(ax->xbuff);
 
-	return ptr - d;
+	ax->tty = NULL;
 }
 
-/*
- * MW:
- * OK its ugly, but tell me a better solution without copying the
- * packet to a temporary buffer :-)
- */
-static int kiss_esc_crc(unsigned char *s, unsigned char *d, unsigned short crc, int len)
+/* Perform I/O control on an active ax25 channel. */
+static int mkiss_ioctl(struct tty_struct *tty, struct file *file,
+	unsigned int cmd, unsigned long arg)
 {
-	unsigned char *ptr = d;
-	unsigned char c=0;
-
-	*ptr++ = END;
-	while (len > 0) {
-		if (len > 2) 
-			c = *s++;
-		else if (len > 1)
-			c = crc >> 8;
-		else if (len > 0)
-			c = crc & 0xff;
+	struct mkiss *ax = mkiss_get(tty);
+	struct net_device *dev = ax->dev;
+	unsigned int tmp, err;
 
-		len--;
+	/* First make sure we're connected. */
+	if (ax == NULL)
+		return -ENXIO;
 
-		switch (c) {
-                        case END:
-                                *ptr++ = ESC;
-                                *ptr++ = ESC_END;
-                                break;
-                        case ESC:
-                                *ptr++ = ESC;
-                                *ptr++ = ESC_ESC;
-                                break;
-                        default:
-                                *ptr++ = c;
-                                break;
+	switch (cmd) {
+ 	case SIOCGIFNAME:
+		err = copy_to_user((void __user *) arg, ax->dev->name,
+		                   strlen(ax->dev->name) + 1) ? -EFAULT : 0;
+		break;
+
+	case SIOCGIFENCAP:
+		err = put_user(4, (int __user *) arg);
+		break;
+
+	case SIOCSIFENCAP:
+		if (get_user(tmp, (int __user *) arg)) {
+			err = -EFAULT;
+			break;
 		}
-	}
-	*ptr++ = END;
-	return ptr - d;		
-}
-
-static void kiss_unesc(struct ax_disp *ax, unsigned char s)
-{
-	switch (s) {
-		case END:
-			/* drop keeptest bit = VSV */
-			if (test_bit(AXF_KEEPTEST, &ax->flags))
-				clear_bit(AXF_KEEPTEST, &ax->flags);
-
-			if (!test_and_clear_bit(AXF_ERROR, &ax->flags) && (ax->rcount > 2))
-				ax_bump(ax);
-
-			clear_bit(AXF_ESCAPE, &ax->flags);
-			ax->rcount = 0;
-			return;
 
-		case ESC:
-			set_bit(AXF_ESCAPE, &ax->flags);
-			return;
-		case ESC_ESC:
-			if (test_and_clear_bit(AXF_ESCAPE, &ax->flags))
-				s = ESC;
+		ax->mode = tmp;
+		dev->addr_len        = AX25_ADDR_LEN;
+		dev->hard_header_len = AX25_KISS_HEADER_LEN +
+		                       AX25_MAX_HEADER_LEN + 3;
+		dev->type            = ARPHRD_AX25;
+
+		err = 0;
+		break;
+
+	case SIOCSIFHWADDR: {
+		struct sockaddr_ax25 ax_addr;
+
+		if (copy_from_user(&ax_addr,
+		                   (void __user *) arg, sizeof ax_addr)) {
+			err = -EFAULT;
 			break;
-		case ESC_END:
-			if (test_and_clear_bit(AXF_ESCAPE, &ax->flags))
-				s = END;
-			break;
-	}
-
-	spin_lock_bh(&ax->buflock);
-	if (!test_bit(AXF_ERROR, &ax->flags)) {
-		if (ax->rcount < ax->buffsize) {
-			ax->rbuff[ax->rcount++] = s;
-			spin_unlock_bh(&ax->buflock);
-			return;
 		}
 
-		ax->rx_over_errors++;
-		set_bit(AXF_ERROR, &ax->flags);
+		err = ax_set_mac_address(dev, &ax_addr);
+		break;
+	}
+	default:
+		err = -ENOIOCTLCMD;
 	}
-	spin_unlock_bh(&ax->buflock);
-}
-
-
-static int ax_set_mac_address(struct net_device *dev, void __user *addr)
-{
-	if (copy_from_user(dev->dev_addr, addr, AX25_ADDR_LEN))
-		return -EFAULT;
-	return 0;
-}
-
-static int ax_set_dev_mac_address(struct net_device *dev, void *addr)
-{
-	struct sockaddr *sa = addr;
 
-	memcpy(dev->dev_addr, sa->sa_data, AX25_ADDR_LEN);
+	mkiss_put(ax);
 
-	return 0;
+	return err;
 }
 
-
-/* Perform I/O control on an active ax25 channel. */
-static int ax25_disp_ioctl(struct tty_struct *tty, void *file, int cmd, void __user *arg)
+/*
+ * Handle the 'receiver data ready' interrupt.
+ * This function is called by the 'tty_io' module in the kernel when
+ * a block of data has been received, which can now be decapsulated
+ * and sent on to the AX.25 layer for further processing.
+ */
+static void mkiss_receive_buf(struct tty_struct *tty, const unsigned char *cp,
+	char *fp, int count)
 {
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
-	unsigned int tmp;
+	struct mkiss *ax = mkiss_get(tty);
 
-	/* First make sure we're connected. */
-	if (ax == NULL || ax->magic != AX25_MAGIC)
-		return -EINVAL;
+	if (!ax)
+		return;
 
-	switch (cmd) {
-	 	case SIOCGIFNAME:
-			if (copy_to_user(arg, ax->dev->name, strlen(ax->dev->name) + 1))
-				return -EFAULT;
-			return 0;
-
-		case SIOCGIFENCAP:
-			return put_user(4, (int __user *)arg);
-
-		case SIOCSIFENCAP:
-			if (get_user(tmp, (int __user *)arg))
-				return -EFAULT;
-			ax->mode = tmp;
-			ax->dev->addr_len        = AX25_ADDR_LEN;	  /* sizeof an AX.25 addr */
-			ax->dev->hard_header_len = AX25_KISS_HEADER_LEN + AX25_MAX_HEADER_LEN + 3;
-			ax->dev->type            = ARPHRD_AX25;
-			return 0;
+	/*
+	 * Argh! mtu change time! - costs us the packet part received
+	 * at the change
+	 */
+	if (ax->mtu != ax->dev->mtu + 73)
+		ax_changedmtu(ax);
 
-		 case SIOCSIFHWADDR:
-			return ax_set_mac_address(ax->dev, arg);
+	/* Read the characters out of the buffer */
+	while (count--) {
+		if (fp != NULL && *fp++) {
+			if (!test_and_set_bit(AXF_ERROR, &ax->flags))
+				ax->stats.rx_errors++;
+			cp++;
+			continue;
+		}
 
-		default:
-			return -ENOIOCTLCMD;
+		kiss_unesc(ax, *cp++);
 	}
+
+	mkiss_put(ax);
+	if (test_and_clear_bit(TTY_THROTTLED, &tty->flags)
+	    && tty->driver->unthrottle)
+		tty->driver->unthrottle(tty);
 }
 
-static int ax_open_dev(struct net_device *dev)
+static int mkiss_receive_room(struct tty_struct *tty)
 {
-	struct ax_disp *ax = netdev_priv(dev);
-
-	if (ax->tty == NULL)
-		return -ENODEV;
-
-	return 0;
+	return 65536;  /* We can handle an infinite amount of data. :-) */
 }
 
-
-/* Initialize the driver.  Called by network startup. */
-static int ax25_init(struct net_device *dev)
+/*
+ * Called by the driver when there's room for more data.  If we have
+ * more packets to send, we send them here.
+ */
+static void mkiss_write_wakeup(struct tty_struct *tty)
 {
-	struct ax_disp *ax = netdev_priv(dev);
-
-	static char ax25_bcast[AX25_ADDR_LEN] =
-		{'Q'<<1,'S'<<1,'T'<<1,' '<<1,' '<<1,' '<<1,'0'<<1};
-	static char ax25_test[AX25_ADDR_LEN] =
-		{'L'<<1,'I'<<1,'N'<<1,'U'<<1,'X'<<1,' '<<1,'1'<<1};
-
-	if (ax == NULL)		/* Allocation failed ?? */
-		return -ENODEV;
+	struct mkiss *ax = mkiss_get(tty);
+	int actual;
 
-	/* Set up the "AX25 Control Block". (And clear statistics) */
-	memset(ax, 0, sizeof (struct ax_disp));
-	ax->magic  = AX25_MAGIC;
-	ax->dev	   = dev;
+	if (!ax)
+		return;
 
-	/* Finish setting up the DEVICE info. */
-	dev->mtu             = AX_MTU;
-	dev->hard_start_xmit = ax_xmit;
-	dev->open            = ax_open_dev;
-	dev->stop            = ax_close;
-	dev->get_stats	     = ax_get_stats;
-	dev->set_mac_address = ax_set_dev_mac_address;
-	dev->hard_header_len = 0;
-	dev->addr_len        = 0;
-	dev->type            = ARPHRD_AX25;
-	dev->tx_queue_len    = 10;
-	dev->hard_header     = ax_header;
-	dev->rebuild_header  = ax_rebuild_header;
+	if (ax->xleft <= 0)  {
+		/* Now serial buffer is almost free & we can start
+		 * transmission of another packet
+		 */
+		clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 
-	memcpy(dev->broadcast, ax25_bcast, AX25_ADDR_LEN);
-	memcpy(dev->dev_addr,  ax25_test,  AX25_ADDR_LEN);
+		netif_wake_queue(ax->dev);
+		goto out;
+	}
 
-	/* New-style flags. */
-	dev->flags      = IFF_BROADCAST | IFF_MULTICAST;
+	actual = tty->driver->write(tty, ax->xhead, ax->xleft);
+	ax->xleft -= actual;
+	ax->xhead += actual;
 
-	return 0;
+out:
+	mkiss_put(ax);
 }
 
+static struct tty_ldisc ax_ldisc = {
+	.magic		= TTY_LDISC_MAGIC,
+	.name		= "mkiss",
+	.open		= mkiss_open,
+	.close		= mkiss_close,
+	.ioctl		= mkiss_ioctl,
+	.receive_buf	= mkiss_receive_buf,
+	.receive_room	= mkiss_receive_room,
+	.write_wakeup	= mkiss_write_wakeup
+};
 
-/* ******************************************************************** */
-/* *			Init MKISS driver			      * */
-/* ******************************************************************** */
+static char banner[] __initdata = KERN_INFO \
+	"mkiss: AX.25 Multikiss, Hans Albas PE1AYX\n";
+static char msg_regfail[] __initdata = KERN_ERR \
+	"mkiss: can't register line discipline (err = %d)\n";
 
 static int __init mkiss_init_driver(void)
 {
@@ -887,64 +886,27 @@
 
 	printk(banner);
 
-	if (ax25_maxdev < 4)
-	  ax25_maxdev = 4; /* Sanity */
+	if ((status = tty_register_ldisc(N_AX25, &ax_ldisc)) != 0)
+		printk(msg_regfail);
 
-	if ((ax25_ctrls = kmalloc(sizeof(void *) * ax25_maxdev, GFP_KERNEL)) == NULL) {
-		printk(KERN_ERR "mkiss: Can't allocate ax25_ctrls[] array!\n");
-		return -ENOMEM;
-	}
-
-	/* Clear the pointer array, we allocate devices when we need them */
-	memset(ax25_ctrls, 0, sizeof(void*) * ax25_maxdev); /* Pointers */
-
-	/* Fill in our line protocol discipline, and register it */
-	ax_ldisc.magic		= TTY_LDISC_MAGIC;
-	ax_ldisc.name		= "mkiss";
-	ax_ldisc.open		= ax25_open;
-	ax_ldisc.close		= ax25_close;
-	ax_ldisc.ioctl		= (int (*)(struct tty_struct *, struct file *,
-					unsigned int, unsigned long))ax25_disp_ioctl;
-	ax_ldisc.receive_buf	= ax25_receive_buf;
-	ax_ldisc.receive_room	= ax25_receive_room;
-	ax_ldisc.write_wakeup	= ax25_write_wakeup;
-
-	if ((status = tty_register_ldisc(N_AX25, &ax_ldisc)) != 0) {
-		printk(KERN_ERR "mkiss: can't register line discipline (err = %d)\n", status);
-		kfree(ax25_ctrls);
-	}
 	return status;
 }
 
+static const char msg_unregfail[] __exitdata = KERN_ERR \
+	"mkiss: can't unregister line discipline (err = %d)\n";
+
 static void __exit mkiss_exit_driver(void)
 {
-	int i;
+	int ret;
 
-	for (i = 0; i < ax25_maxdev; i++) {
-		if (ax25_ctrls[i]) {
-			/*
-			* VSV = if dev->start==0, then device
-			* unregistered while close proc.
-			*/
-			if (netif_running(&ax25_ctrls[i]->dev))
-				unregister_netdev(&ax25_ctrls[i]->dev);
-			kfree(ax25_ctrls[i]);
-		}
-	}
-
-	kfree(ax25_ctrls);
-	ax25_ctrls = NULL;
-
-	if ((i = tty_unregister_ldisc(N_AX25)))
-		printk(KERN_ERR "mkiss: can't unregister line discipline (err = %d)\n", i);
+	if ((ret = tty_unregister_ldisc(N_AX25)))
+		printk(msg_unregfail, ret);
 }
 
-MODULE_AUTHOR("Hans Albas PE1AYX <hans@esrac.ele.tue.nl>");
+MODULE_AUTHOR("Ralf Baechle DL5RB <ralf@linux-mips.org>");
 MODULE_DESCRIPTION("KISS driver for AX.25 over TTYs");
-MODULE_PARM(ax25_maxdev, "i");
-MODULE_PARM_DESC(ax25_maxdev, "number of MKISS devices");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_LDISC(N_AX25);
+
 module_init(mkiss_init_driver);
 module_exit(mkiss_exit_driver);
-
Index: linux-cvs/drivers/net/hamradio/Kconfig
===================================================================
--- linux-cvs.orig/drivers/net/hamradio/Kconfig	2005-07-15 10:04:39.000000000 +0100
+++ linux-cvs/drivers/net/hamradio/Kconfig	2005-07-15 10:04:57.000000000 +0100
@@ -1,6 +1,6 @@
 config MKISS
 	tristate "Serial port KISS driver"
-	depends on AX25 && BROKEN_ON_SMP
+	depends on AX25
 	---help---
 	  KISS is a protocol used for the exchange of data between a computer
 	  and a Terminal Node Controller (a small embedded system commonly
