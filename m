From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: [PATCH] 2nd 6pack patch for 2.6.4
Date: Mon, 15 Mar 2004 19:42:00 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040315184200.GB426@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi,

below is the second 6pack patch.  A few more cleanups and most importan=
t,
it now actually tries to get the locking of the tty right, so the poten=
cial
of crashes on shutdown should now hopefully be fixed.

As before reports will be appreciated.  I don't have 6pack hardware so =
I'm
limited to test this with a TNC simulator which is only a few hours old=
,
so beware ...

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

Index: drivers/net/hamradio/6pack.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/linux/drivers/net/hamradio/6pack.c,v
retrieving revision 1.20
diff -u -r1.20 6pack.c
--- drivers/net/hamradio/6pack.c	11 Mar 2004 16:46:51 -0000	1.20
+++ drivers/net/hamradio/6pack.c	15 Mar 2004 18:29:03 -0000
@@ -3,15 +3,13 @@
  *		devices like TTY. It interfaces between a raw TTY and the
  *		kernel's AX.25 protocol layers.
  *
- * Version:	@(#)6pack.c	0.3.0	04/07/98
- *
  * Authors:	Andreas K=F6nsgen <ajk@iehk.rwth-aachen.de>
+ *              Ralf Baechle DO1GRB <ralf@linux-mips.org>
  *
- * Quite a lot of stuff "stolen" by J=F6rg Reuter from slip.c, written=
 by
+ * Quite a lot of stuff "stolen" by Joerg Reuter from slip.c, written =
by
  *
  *		Laurence Culhane, <loz@holmes.demon.co.uk>
  *		Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
- *
  */
=20
 #include <linux/config.h>
@@ -31,20 +29,23 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/rtnetlink.h>
+#include <linux/spinlock.h>
 #include <linux/if_arp.h>
 #include <linux/init.h>
 #include <linux/ip.h>
 #include <linux/tcp.h>
+#include <asm/semaphore.h>
+#include <asm/atomic.h>
=20
 #define SIXPACK_VERSION    "Revision: 0.3.0"
=20
 /* sixpack priority commands */
-#define SIXP_SEOF	0x40	/* start and end of a 6pack frame */
-#define SIXP_TX_URUN	0x48	/* transmit overrun */
-#define SIXP_RX_ORUN	0x50	/* receive overrun */
-#define SIXP_RX_BUF_OVL	0x58	/* receive buffer overflow */
+#define SIXP_SEOF		0x40	/* start and end of a 6pack frame */
+#define SIXP_TX_URUN		0x48	/* transmit overrun */
+#define SIXP_RX_ORUN		0x50	/* receive overrun */
+#define SIXP_RX_BUF_OVL		0x58	/* receive buffer overflow */
=20
-#define SIXP_CHKSUM	0xFF	/* valid checksum of a 6pack frame */
+#define SIXP_CHKSUM		0xFF	/* valid checksum of a 6pack frame */
=20
 /* masks to get certain bits out of the status bytes sent by the TNC *=
/
=20
@@ -78,23 +79,20 @@
 #define SIXP_MTU			256	/* Default MTU */
=20
 enum sixpack_flags {
-	SIXPF_INUSE,	/* Channel in use	*/
 	SIXPF_ERROR,	/* Parity, etc. error	*/
 };
=20
 struct sixpack {
-	int			magic;
-
 	/* Various fields. */
-	struct tty_struct	*tty;		/* ptr to TTY structure		*/
-	struct net_device	*dev;		/* easy for intr handling	*/
+	struct tty_struct	*tty;		/* ptr to TTY structure	*/
+	struct net_device	*dev;		/* easy for intr handling  */
=20
 	/* These are pointers to the malloc()ed frame buffers. */
-	unsigned char		*rbuff;		/* receiver buffer		*/
-	int			rcount;         /* received chars counter       */
-	unsigned char		*xbuff;		/* transmitter buffer		*/
-	unsigned char		*xhead;         /* pointer to next byte to XMIT */
-	int			xleft;          /* bytes left in XMIT queue     */
+	unsigned char		*rbuff;		/* receiver buffer	*/
+	int			rcount;         /* received chars counter  */
+	unsigned char		*xbuff;		/* transmitter buffer	*/
+	unsigned char		*xhead;         /* next byte to XMIT */
+	int			xleft;          /* bytes left in XMIT queue  */
=20
 	unsigned char		raw_buf[4];
 	unsigned char		cooked_buf[400];
@@ -105,11 +103,11 @@
 	/* 6pack interface statistics. */
 	struct net_device_stats stats;
=20
-	int			mtu;		/* Our mtu (to spot changes!)   */
-	int			buffsize;       /* Max buffers sizes            */
+	int			mtu;		/* Our mtu (to spot changes!) */
+	int			buffsize;       /* Max buffers sizes */
=20
-	unsigned long		flags;		/* Flag values/ mode etc	*/
-	unsigned char		mode;		/* 6pack mode			*/
+	unsigned long		flags;		/* Flag values/ mode etc */
+	unsigned char		mode;		/* 6pack mode */
=20
 	/* 6pack stuff */
 	unsigned char		tx_delay;
@@ -125,112 +123,293 @@
=20
 	struct timer_list	tx_t;
 	struct timer_list	resync_t;
+
+	atomic_t		refcnt;
+	struct semaphore	dead_sem;
+	spinlock_t		lock;
 };
=20
 #define AX25_6PACK_HEADER_LEN 0
-#define SIXPACK_MAGIC 0x5304
-
-typedef struct sixpack_ctrl {
-	struct sixpack	ctrl;			/* 6pack things			*/
-	struct net_device	dev;		/* the device			*/
-} sixpack_ctrl_t;
-static sixpack_ctrl_t **sixpack_ctrls;
-
-int sixpack_maxdev =3D SIXP_NRUNIT;	/* Can be overridden with insmod! =
*/
-MODULE_PARM(sixpack_maxdev, "i");
-MODULE_PARM_DESC(sixpack_maxdev, "number of 6PACK devices");
=20
 static void sp_start_tx_timer(struct sixpack *);
-static void sp_xmit_on_air(unsigned long);
-static void resync_tnc(unsigned long);
 static void sixpack_decode(struct sixpack *, unsigned char[], int);
 static int encode_sixpack(unsigned char *, unsigned char *, int, unsig=
ned char);
 static int sixpack_init(struct net_device *dev);
=20
-static void decode_prio_command(unsigned char, struct sixpack *);
-static void decode_std_command(unsigned char, struct sixpack *);
-static void decode_data(unsigned char, struct sixpack *);
+/*
+ * perform the persistence/slottime algorithm for CSMA access. If the
+ * persistence check was successful, write the data to the serial driv=
er.
+ * Note that in case of DAMA operation, the data is not sent here.
+ */
=20
-static int tnc_init(struct sixpack *);
+static void sp_xmit_on_air(unsigned long channel)
+{
+	struct sixpack *sp =3D (struct sixpack *) channel;
+	int actual;
+	static unsigned char random;
=20
-/* Find a free 6pack channel, and link in this `tty' line. */
-static inline struct sixpack *sp_alloc(void)
+	random =3D random * 17 + 41;
+
+	if (((sp->status1 & SIXP_DCD_MASK) =3D=3D 0) && (random < sp->persist=
ence)) {
+		sp->led_state =3D 0x70;
+		sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
+		sp->tx_enable =3D 1;
+		actual =3D sp->tty->driver->write(sp->tty, 0, sp->xbuff, sp->status2=
);
+		sp->xleft -=3D actual;
+		sp->xhead +=3D actual;
+		sp->led_state =3D 0x60;
+		sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
+		sp->status2 =3D 0;
+	} else
+		sp_start_tx_timer(sp);
+}
+
+/* ----> 6pack timer interrupt handler and friends. <---- */
+static void sp_start_tx_timer(struct sixpack *sp)
+{
+	int when =3D sp->slottime;
+
+	del_timer(&sp->tx_t);
+	sp->tx_t.data =3D (unsigned long) sp;
+	sp->tx_t.function =3D sp_xmit_on_air;
+	sp->tx_t.expires =3D jiffies + ((when + 1) * HZ) / 100;
+	add_timer(&sp->tx_t);
+}
+
+/* Encapsulate one AX.25 frame and stuff into a TTY queue. */
+static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
 {
-	sixpack_ctrl_t *spp =3D NULL;
-	int i;
+	unsigned char *msg, *p =3D icp;
+	int actual, count;
=20
-	for (i =3D 0; i < sixpack_maxdev; i++) {
-		spp =3D sixpack_ctrls[i];
+	if (len > sp->mtu) {	/* sp->mtu =3D AX25_MTU =3D max. PACLEN =3D 256 =
*/
+		msg =3D "oversized transmit packet!";
+		goto out_drop;
+	}
=20
-		if (spp =3D=3D NULL)
-			break;
+	if (p[0] > 5) {
+		msg =3D "invalid KISS command";
+		goto out_drop;
+	}
=20
-		if (!test_and_set_bit(SIXPF_INUSE, &spp->ctrl.flags))
-			break;
+	if ((p[0] !=3D 0) && (len > 2)) {
+		msg =3D "KISS control packet too long";
+		goto out_drop;
 	}
=20
-	/* Too many devices... */
-	if (i >=3D sixpack_maxdev)
-		return NULL;
+	if ((p[0] =3D=3D 0) && (len < 15)) {
+		msg =3D "bad AX.25 packet to transmit";
+		goto out_drop;
+	}
=20
-	/* If no channels are available, allocate one */
-	if (!spp &&
-	    (sixpack_ctrls[i] =3D (sixpack_ctrl_t *)kmalloc(sizeof(sixpack_ct=
rl_t),
-						    GFP_KERNEL)) !=3D NULL) {
-		spp =3D sixpack_ctrls[i];
+	count =3D encode_sixpack(p, sp->xbuff, len, sp->tx_delay);
+	set_bit(TTY_DO_WRITE_WAKEUP, &sp->tty->flags);
+
+	switch (p[0]) {
+	case 1:	sp->tx_delay =3D p[1];
+		return;
+	case 2:	sp->persistence =3D p[1];
+		return;
+	case 3:	sp->slottime =3D p[1];
+		return;
+	case 4:	/* ignored */
+		return;
+	case 5:	sp->duplex =3D p[1];
+		return;
 	}
-	memset(spp, 0, sizeof(sixpack_ctrl_t));
=20
-	/* Initialize channel control data */
-	set_bit(SIXPF_INUSE, &spp->ctrl.flags);
-	spp->ctrl.tty         =3D NULL;
-	sprintf(spp->dev.name, "sp%d", i);
-	spp->dev.base_addr    =3D i;
-	spp->dev.priv         =3D (void *) &spp->ctrl;
-	spp->dev.next         =3D NULL;
-	spp->dev.init         =3D sixpack_init;
-
-	if (spp !=3D NULL) {
-		/* register device so that it can be ifconfig'ed       */
-		/* sixpack_init() will be called as a side-effect         */
-		/* SIDE-EFFECT WARNING: sixpack_init() CLEARS spp->ctrl ! */
-
-		if (register_netdev(&spp->dev) =3D=3D 0) {
-			set_bit(SIXPF_INUSE, &spp->ctrl.flags);
-			spp->ctrl.dev =3D &spp->dev;
-			spp->dev.priv =3D (void *) &spp->ctrl;
-			SET_MODULE_OWNER(&spp->dev);
-			return &spp->ctrl;
-		} else {
-			clear_bit(SIXPF_INUSE, &spp->ctrl.flags);
-			printk(KERN_WARNING "sp_alloc() - register_netdev() failure.\n");
-		}
+	if (p[0] !=3D 0)
+		return;
+
+	/*
+	 * In case of fullduplex or DAMA operation, we don't take care about =
the
+	 * state of the DCD or of any timers, as the determination of the
+	 * correct time to send is the job of the AX.25 layer. We send
+	 * immediately after data has arrived.
+	 */
+	if (sp->duplex =3D=3D 1) {
+		sp->led_state =3D 0x70;
+		sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
+		sp->tx_enable =3D 1;
+		actual =3D sp->tty->driver->write(sp->tty, 0, sp->xbuff, count);
+		sp->xleft =3D count - actual;
+		sp->xhead =3D sp->xbuff + actual;
+		sp->led_state =3D 0x60;
+		sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
+	} else {
+		sp->xleft =3D count;
+		sp->xhead =3D sp->xbuff;
+		sp->status2 =3D count;
+		if (sp->duplex =3D=3D 0)
+			sp_start_tx_timer(sp);
 	}
=20
-	return NULL;
+	return;
+
+out_drop:
+	sp->stats.tx_dropped++;
+	netif_start_queue(sp->dev);
+	printk(KERN_DEBUG "%s: %s - dropped.\n", sp->dev->name, msg);
+	return;
+}
+
+/* Encapsulate an IP datagram and kick it into a TTY queue. */
+
+static int sp_xmit(struct sk_buff *skb, struct net_device *dev)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+
+	spin_lock_bh(&sp->lock);
+	/* We were not busy, so we are now... :-) */
+	netif_stop_queue(dev);
+	sp->stats.tx_bytes +=3D skb->len;
+	sp_encaps(sp, skb->data, skb->len);
+	spin_unlock_bh(&sp->lock);
+
+	dev_kfree_skb(skb);
+
+	return 0;
+}
+
+static int sp_open_dev(struct net_device *dev)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+
+	if (sp->tty =3D=3D NULL)
+		return -ENODEV;
+	return 0;
+}
+
+/* Close the low-level part of the 6pack channel. */
+static int sp_close(struct net_device *dev)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+
+	spin_lock_bh(&sp->lock);
+	if (sp->tty) {
+		/* TTY discipline is running. */
+		clear_bit(TTY_DO_WRITE_WAKEUP, &sp->tty->flags);
+	}
+	netif_stop_queue(dev);
+	spin_unlock_bh(&sp->lock);
+
+	return 0;
+}
+
+/* Return the frame type ID */
+static int sp_header(struct sk_buff *skb, struct net_device *dev,
+	unsigned short type, void *daddr, void *saddr, unsigned len)
+{
+#ifdef CONFIG_INET
+	if (type !=3D htons(ETH_P_AX25))
+		return ax25_encapsulate(skb, dev, type, daddr, saddr, len);
+#endif
+	return 0;
+}
+
+static struct net_device_stats *sp_get_stats(struct net_device *dev)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+	return &sp->stats;
+}
+
+static int sp_set_dev_mac_address(struct net_device *dev, void *addr)
+{
+	struct sockaddr *sa =3D addr;
+	memcpy(dev->dev_addr, sa->sa_data, AX25_ADDR_LEN);
+	return 0;
+}
+
+static int sp_rebuild_header(struct sk_buff *skb)
+{
+#ifdef CONFIG_INET
+	return ax25_rebuild_header(skb);
+#else
+	return 0;
+#endif
+}
+
+static void sp_setup(struct net_device *dev)
+{
+	static char ax25_bcast[AX25_ADDR_LEN] =3D
+		{'Q'<<1,'S'<<1,'T'<<1,' '<<1,' '<<1,' '<<1,'0'<<1};
+	static char ax25_test[AX25_ADDR_LEN] =3D
+		{'L'<<1,'I'<<1,'N'<<1,'U'<<1,'X'<<1,' '<<1,'1'<<1};
+
+	/* Finish setting up the DEVICE info. */
+	dev->init		=3D sixpack_init;
+	dev->mtu		=3D SIXP_MTU;
+	dev->hard_start_xmit	=3D sp_xmit;
+	dev->open		=3D sp_open_dev;
+	dev->destructor		=3D free_netdev;
+	dev->stop		=3D sp_close;
+	dev->hard_header	=3D sp_header;
+	dev->get_stats	        =3D sp_get_stats;
+	dev->set_mac_address    =3D sp_set_dev_mac_address;
+	dev->hard_header_len	=3D AX25_MAX_HEADER_LEN;
+	dev->addr_len		=3D AX25_ADDR_LEN;
+	dev->type		=3D ARPHRD_AX25;
+	dev->tx_queue_len	=3D 10;
+	dev->rebuild_header	=3D sp_rebuild_header;
+	dev->tx_timeout		=3D NULL;
+
+	/* Only activated in AX.25 mode */
+	memcpy(dev->broadcast, ax25_bcast, AX25_ADDR_LEN);
+	memcpy(dev->dev_addr, ax25_test, AX25_ADDR_LEN);
+
+	SET_MODULE_OWNER(dev);
+
+	/* New-style flags. */
+	dev->flags		=3D 0;
 }
=20
+/* Find a free 6pack channel, and link in this `tty' line. */
+static inline struct sixpack *sp_alloc(void)
+{
+	struct sixpack *sp =3D NULL;
+	struct net_device *dev =3D NULL;
+
+	dev =3D alloc_netdev(sizeof(struct sixpack), "sp%d", sp_setup);
+	if (!dev)
+		return NULL;
+
+	sp =3D netdev_priv(dev);
+	sp->dev =3D dev;
+
+	spin_lock_init(&sp->lock);
+
+	if (register_netdev(dev))
+		goto out_free;
+
+	return sp;
+
+out_free:
+	printk(KERN_WARNING "sp_alloc() - register_netdev() failure.\n");
+
+	free_netdev(dev);
+
+	return NULL;
+}
=20
 /* Free a 6pack channel. */
 static inline void sp_free(struct sixpack *sp)
 {
-	/* Free all 6pack frame buffers. */
-	if (sp->rbuff)
-		kfree(sp->rbuff);
-	sp->rbuff =3D NULL;
-	if (sp->xbuff)
-		kfree(sp->xbuff);
-	sp->xbuff =3D NULL;
+	void * tmp;
=20
-	if (!test_and_clear_bit(SIXPF_INUSE, &sp->flags))
-		printk(KERN_WARNING "%s: sp_free for already free unit.\n", sp->dev-=
>name);
+	/* Free all 6pack frame buffers. */
+	if ((tmp =3D xchg(&sp->rbuff, NULL)) !=3D NULL)
+		kfree(tmp);
+	if ((tmp =3D xchg(&sp->xbuff, NULL)) !=3D NULL)
+		kfree(tmp);
 }
=20
=20
 /* Send one completely decapsulated IP datagram to the IP layer. */
=20
-/* This is the routine that sends the received data to the kernel AX.2=
5.
-   'cmd' is the KISS command. For AX.25 data, it is zero. */
+/*
+ * This is the routine that sends the received data to the kernel AX.2=
5.
+ * 'cmd' is the KISS command. For AX.25 data, it is zero.
+ */
=20
 static void sp_bump(struct sixpack *sp, char cmd)
 {
@@ -238,98 +417,60 @@
 	int count;
 	unsigned char *ptr;
=20
-	count =3D sp->rcount+1;
+	count =3D sp->rcount + 1;
=20
 	sp->stats.rx_bytes +=3D count;
=20
-	if ((skb =3D dev_alloc_skb(count)) =3D=3D NULL) {
-		printk(KERN_DEBUG "%s: memory squeeze, dropping packet.\n", sp->dev-=
>name);
-		sp->stats.rx_dropped++;
-		return;
-	}
+	if ((skb =3D dev_alloc_skb(count)) =3D=3D NULL)
+		goto out_mem;
=20
 	skb->dev =3D sp->dev;
 	ptr =3D skb_put(skb, count);
 	*ptr++ =3D cmd;	/* KISS command */
=20
-	memcpy(ptr, (sp->cooked_buf)+1, count);
+	memcpy(ptr, sp->cooked_buf + 1, count);
 	skb->mac.raw =3D skb->data;
 	skb->protocol =3D htons(ETH_P_AX25);
 	netif_rx(skb);
 	sp->dev->last_rx =3D jiffies;
 	sp->stats.rx_packets++;
+
+	return;
+
+out_mem:
+	sp->stats.rx_dropped++;
 }
=20
=20
 /* -------------------------------------------------------------------=
---- */
=20
-/* Encapsulate one AX.25 frame and stuff into a TTY queue. */
-static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
+/*
+ * We have a potential race on dereferencing tty->disc_data, because t=
he tty
+ * layer provides no locking at all - thus one cpu could be running
+ * sixpack_receive_buf while another calls sixpack_close, which zeroes
+ * tty->disc_data and frees the memory that sixpack_receive_buf is usi=
ng.  The
+ * best way to fix this is to use a rwlock in the tty struct, but for =
now we
+ * use a single global rwlock for all ttys in ppp line discipline.
+ */
+static rwlock_t disc_data_lock =3D RW_LOCK_UNLOCKED;
+                                                                      =
         =20
+static struct sixpack *sp_get(struct tty_struct *tty)
 {
-	unsigned char *p;
-	int actual, count;
-
-	if (len > sp->mtu) {	/* sp->mtu =3D AX25_MTU =3D max. PACLEN =3D 256 =
*/
-		printk(KERN_DEBUG "%s: truncating oversized transmit packet!\n", sp-=
>dev->name);
-		sp->stats.tx_dropped++;
-		netif_start_queue(sp->dev);
-		return;
-	}
+	struct sixpack *sp;
=20
-	p =3D icp;
+	read_lock(&disc_data_lock);
+	sp =3D tty->disc_data;
+	if (sp)
+		atomic_inc(&sp->refcnt);
+	read_unlock(&disc_data_lock);
=20
-	if (p[0] > 5) {
-		printk(KERN_DEBUG "%s: invalid KISS command -- dropped\n", sp->dev->=
name);
-		netif_start_queue(sp->dev);
-		return;
-	}
-
-	if ((p[0] !=3D 0) && (len > 2)) {
-		printk(KERN_DEBUG "%s: KISS control packet too long -- dropped\n", s=
p->dev->name);
-		netif_start_queue(sp->dev);
-		return;
-	}
-
-	if ((p[0] =3D=3D 0) && (len < 15)) {
-		printk(KERN_DEBUG "%s: bad AX.25 packet to transmit -- dropped\n", s=
p->dev->name);
-		netif_start_queue(sp->dev);
-		sp->stats.tx_dropped++;
-		return;
-	}
-
-	count =3D encode_sixpack(p, (unsigned char *) sp->xbuff, len, sp->tx_=
delay);
-	sp->tty->flags |=3D (1 << TTY_DO_WRITE_WAKEUP);
-
-	switch (p[0]) {
-		case 1:	sp->tx_delay =3D p[1];		return;
-		case 2:	sp->persistence =3D p[1];		return;
-		case 3: sp->slottime =3D p[1];		return;
-		case 4: /* ignored */			return;
-		case 5: sp->duplex =3D p[1];		return;
-	}
+	return sp;
+}
=20
-	if (p[0] =3D=3D 0) {
-		/* in case of fullduplex or DAMA operation, we don't take care
-		   about the state of the DCD or of any timers, as the determination
-		   of the correct time to send is the job of the AX.25 layer. We sen=
d
-		   immediately after data has arrived. */
-		if (sp->duplex =3D=3D 1) {
-			sp->led_state =3D 0x70;
-			sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-			sp->tx_enable =3D 1;
-			actual =3D sp->tty->driver->write(sp->tty, 0, sp->xbuff, count);
-			sp->xleft =3D count - actual;
-			sp->xhead =3D sp->xbuff + actual;
-			sp->led_state =3D 0x60;
-			sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-		} else {
-			sp->xleft =3D count;
-			sp->xhead =3D sp->xbuff;
-			sp->status2 =3D count;
-			if (sp->duplex =3D=3D 0)
-				sp_start_tx_timer(sp);
-		}
-	}
+static void sp_put(struct sixpack *sp)
+{
+	if (atomic_dec_and_test(&sp->refcnt))
+		up(&sp->dead_sem);
 }
=20
 /*
@@ -338,22 +479,17 @@
  */
 static void sixpack_write_wakeup(struct tty_struct *tty)
 {
+	struct sixpack *sp =3D sp_get(tty);
 	int actual;
-	struct sixpack *sp =3D (struct sixpack *) tty->disc_data;
-
-	/* First make sure we're connected. */
-	if (!sp || sp->magic !=3D SIXPACK_MAGIC ||
-	    !netif_running(sp->dev))
-		return;
=20
 	if (sp->xleft <=3D 0)  {
 		/* Now serial buffer is almost free & we can start
 		 * transmission of another packet */
 		sp->stats.tx_packets++;
-		tty->flags &=3D ~(1 << TTY_DO_WRITE_WAKEUP);
+		clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 		sp->tx_enable =3D 0;
 		netif_wake_queue(sp->dev);
-		return;
+		goto out;
 	}
=20
 	if (sp->tx_enable =3D=3D 1) {
@@ -361,79 +497,34 @@
 		sp->xleft -=3D actual;
 		sp->xhead +=3D actual;
 	}
-}
-
-/* -------------------------------------------------------------------=
---- */
-
-/* Encapsulate an IP datagram and kick it into a TTY queue. */
-
-static int sp_xmit(struct sk_buff *skb, struct net_device *dev)
-{
-	struct sixpack *sp =3D (struct sixpack *) dev->priv;
=20
-	/* We were not busy, so we are now... :-) */
-	netif_stop_queue(dev);
-	sp->stats.tx_bytes +=3D skb->len;
-	sp_encaps(sp, skb->data, skb->len);
-	dev_kfree_skb(skb);
-	return 0;
+out:
+	sp_put(sp);
 }
=20
+/* -------------------------------------------------------------------=
---- */
=20
-/* perform the persistence/slottime algorithm for CSMA access. If the =
persistence
-   check was successful, write the data to the serial driver. Note tha=
t in case
-   of DAMA operation, the data is not sent here. */
-
-static void sp_xmit_on_air(unsigned long channel)
-{
-	struct sixpack *sp =3D (struct sixpack *) channel;
-	int actual;
-	static unsigned char random;
-
-	random =3D random * 17 + 41;
-
-	if (((sp->status1 & SIXP_DCD_MASK) =3D=3D 0) && (random < sp->persist=
ence)) {
-		sp->led_state =3D 0x70;
-		sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-		sp->tx_enable =3D 1;
-		actual =3D sp->tty->driver->write(sp->tty, 0, sp->xbuff, sp->status2=
);
-		sp->xleft -=3D actual;
-		sp->xhead +=3D actual;
-		sp->led_state =3D 0x60;
-		sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-		sp->status2 =3D 0;
-	} else
-		sp_start_tx_timer(sp);
-}
-
-
-/* Return the frame type ID */
-static int sp_header(struct sk_buff *skb, struct net_device *dev, unsi=
gned short type,
-	  void *daddr, void *saddr, unsigned len)
+/* Open the low-level part of the 6pack channel. */
+static int sp_open(struct net_device *dev)
 {
-#ifdef CONFIG_INET
-	if (type !=3D htons(ETH_P_AX25))
-		return ax25_encapsulate(skb, dev, type, daddr, saddr, len);
-#endif
-	return 0;
-}
+	struct sixpack *sp =3D netdev_priv(dev);
+	char *rbuff, *xbuff =3D NULL;
+	int err =3D -ENOBUFS;
+	unsigned long len;
=20
+	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
=20
-static int sp_rebuild_header(struct sk_buff *skb)
-{
-#ifdef CONFIG_INET
-	return ax25_rebuild_header(skb);
-#else
-	return 0;
-#endif
-}
+	len =3D dev->mtu * 2;
=20
+	rbuff =3D kmalloc(len + 4, GFP_KERNEL);
+	if (rbuff =3D=3D NULL)
+		goto err_exit;
+
+	xbuff =3D kmalloc(len + 4, GFP_KERNEL);
+	if (xbuff =3D=3D NULL)
+		goto err_exit;
=20
-/* Open the low-level part of the 6pack channel. */
-static int sp_open(struct net_device *dev)
-{
-	struct sixpack *sp =3D (struct sixpack *) dev->priv;
-	unsigned long len;
+	spin_lock_bh(&sp->lock);
=20
 	if (sp->tty =3D=3D NULL)
 		return -ENODEV;
@@ -445,18 +536,8 @@
 	 * xbuff	Transmit buffer.
 	 */
=20
-	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!
-	 */
-
-	len =3D dev->mtu * 2;
-
-	if ((sp->rbuff =3D kmalloc(len + 4, GFP_KERNEL)) =3D=3D NULL)
-		return -ENOMEM;
-
-	if ((sp->xbuff =3D kmalloc(len + 4, GFP_KERNEL)) =3D=3D NULL) {
-		kfree(sp->rbuff);
-		return -ENOMEM;
-	}
+	rbuff =3D xchg(&sp->rbuff, rbuff);
+	xbuff =3D xchg(&sp->xbuff, xbuff);
=20
 	sp->mtu	     =3D AX25_MTU + 73;
 	sp->buffsize =3D len;
@@ -465,7 +546,7 @@
 	sp->rx_count_cooked =3D 0;
 	sp->xleft    =3D 0;
=20
-	sp->flags   &=3D (1 << SIXPF_INUSE);      /* Clear ESCAPE & ERROR fla=
gs */
+	sp->flags	=3D 0;		/* Clear ESCAPE & ERROR flags */
=20
 	sp->duplex =3D 0;
 	sp->tx_delay    =3D SIXP_TXDELAY;
@@ -482,49 +563,47 @@
=20
 	init_timer(&sp->tx_t);
 	init_timer(&sp->resync_t);
-	return 0;
-}
-
=20
-/* Close the low-level part of the 6pack channel. */
-static int sp_close(struct net_device *dev)
-{
-	struct sixpack *sp =3D (struct sixpack *) dev->priv;
+	spin_unlock_bh(&sp->lock);
=20
-	if (sp->tty =3D=3D NULL)
-		return -EBUSY;
+	err =3D 0;
=20
-	sp->tty->flags &=3D ~(1 << TTY_DO_WRITE_WAKEUP);
+err_exit:
+	if (xbuff)
+		kfree(xbuff);
+	if (rbuff)
+		kfree(rbuff);
=20
-	netif_stop_queue(dev);
-	return 0;
+	return err;
 }
=20
+
 static int sixpack_receive_room(struct tty_struct *tty)
 {
 	return 65536;  /* We can handle an infinite amount of data. :-) */
 }
=20
-/* !!! receive state machine */
-
 /*
  * Handle the 'receiver data ready' interrupt.
  * This function is called by the 'tty_io' module in the kernel when
  * a block of 6pack data has been received, which can now be decapsula=
ted
  * and sent on to some IP layer for further processing.
  */
-static void sixpack_receive_buf(struct tty_struct *tty, const unsigned=
 char *cp, char *fp, int count)
+static void sixpack_receive_buf(struct tty_struct *tty,
+	const unsigned char *cp, char *fp, int count)
 {
+	struct sixpack *sp;
 	unsigned char buf[512];
 	int count1;
=20
-	struct sixpack *sp =3D (struct sixpack *) tty->disc_data;
+	if (!count)
+		return;
=20
-	if (!sp || sp->magic !=3D SIXPACK_MAGIC ||
-	    !netif_running(sp->dev) || !count)
+	sp =3D sp_get(tty);
+	if (!sp)
 		return;
=20
-	memcpy(buf, cp, count<sizeof(buf)? count:sizeof(buf));
+	memcpy(buf, cp, count < sizeof(buf) ? count : sizeof(buf));
=20
 	/* Read the characters out of the buffer */
=20
@@ -538,6 +617,67 @@
 		}
 	}
 	sixpack_decode(sp, buf, count1);
+
+	sp_put(sp);
+	if (test_and_clear_bit(TTY_THROTTLED, &tty->flags)
+	    && tty->driver->unthrottle)
+		tty->driver->unthrottle(tty);
+}
+
+/*
+ * Try to resync the TNC. Called by the resync timer defined in
+ * decode_prio_command
+ */
+
+static void resync_tnc(unsigned long channel)
+{
+	struct sixpack *sp =3D (struct sixpack *) channel;
+	struct net_device *dev =3D sp->dev;
+	static char resync_cmd =3D 0xe8;
+
+	printk(KERN_INFO "%s: resyncing TNC\n", dev->name);
+
+	/* clear any data that might have been received */
+
+	sp->rx_count =3D 0;
+	sp->rx_count_cooked =3D 0;
+
+	/* reset state machine */
+
+	sp->status =3D 1;
+	sp->status1 =3D 1;
+	sp->status2 =3D 0;
+	sp->tnc_ok =3D 0;
+
+	/* resync the TNC */
+
+	sp->led_state =3D 0x60;
+	sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
+	sp->tty->driver->write(sp->tty, 0, &resync_cmd, 1);
+
+
+	/* Start resync timer again -- the TNC might be still absent */
+
+	del_timer(&sp->resync_t);
+	sp->resync_t.data =3D (unsigned long) sp;
+	sp->resync_t.function =3D resync_tnc;
+	sp->resync_t.expires =3D jiffies + SIXP_RESYNC_TIMEOUT;
+	add_timer(&sp->resync_t);
+}
+
+static inline int tnc_init(struct sixpack *sp)
+{
+	unsigned char inbyte =3D 0xe8;
+
+	sp->tty->driver->write(sp->tty, 0, &inbyte, 1);
+
+	del_timer(&sp->resync_t);
+	sp->resync_t.data =3D (unsigned long) sp;
+	sp->resync_t.function =3D resync_tnc;
+	sp->resync_t.expires =3D jiffies + SIXP_RESYNC_TIMEOUT;
+	add_timer(&sp->resync_t);
+
+	return 0;
 }
=20
 /*
@@ -549,37 +689,33 @@
  */
 static int sixpack_open(struct tty_struct *tty)
 {
-	struct sixpack *sp =3D (struct sixpack *) tty->disc_data;
-	int err;
+	struct sixpack *sp;
+	int err =3D 0;
=20
-	/* First make sure we're not already connected. */
+	if (!capable(CAP_NET_ADMIN))
+		return -EPERM;
=20
-	if (sp && sp->magic =3D=3D SIXPACK_MAGIC)
-		return -EEXIST;
+	sp =3D sp_alloc();
+	if (!sp) {
+		err =3D -ENOMEM;
+		goto out;
+	}
=20
-	/* OK.  Find a free 6pack channel to use. */
-	if ((sp =3D sp_alloc()) =3D=3D NULL)
-		return -ENFILE;
 	sp->tty =3D tty;
-	tty->disc_data =3D sp;
-	if (tty->driver->flush_buffer)
-		tty->driver->flush_buffer(tty);
-
-	if (tty->ldisc.flush_buffer)
-		tty->ldisc.flush_buffer(tty);
-
-	/* Restore default settings */
-	sp->dev->type =3D ARPHRD_AX25;
+	atomic_set(&sp->refcnt, 1);
+	init_MUTEX_LOCKED(&sp->dead_sem);
=20
 	/* Perform the low-level 6pack initialization. */
 	if ((err =3D sp_open(sp->dev)))
-		return err;
+		goto out;
=20
 	/* Done.  We have linked the TTY line to a channel. */
+	tty->disc_data =3D sp;
=20
 	tnc_init(sp);
=20
-	return sp->dev->base_addr;
+out:
+	return err;
 }
=20
=20
@@ -593,102 +729,93 @@
 {
 	struct sixpack *sp =3D (struct sixpack *) tty->disc_data;
=20
-	/* First make sure we're connected. */
-	if (!sp || sp->magic !=3D SIXPACK_MAGIC)
+	write_lock(&disc_data_lock);
+	sp =3D tty->disc_data;
+	tty->disc_data =3D 0;
+	write_unlock(&disc_data_lock);
+	if (sp =3D=3D 0)
 		return;
=20
-	rtnl_lock();
-	dev_close(sp->dev);
+	/*
+	 * We have now ensured that nobody can start using ap from now on, bu=
t
+	 * we have to wait for all existing users to finish.
+	 */
+	if (!atomic_dec_and_test(&sp->refcnt))
+		down(&sp->dead_sem);
=20
 	del_timer(&sp->tx_t);
 	del_timer(&sp->resync_t);
=20
-	tty->disc_data =3D 0;
-	sp->tty =3D NULL;
-
 	sp_free(sp);
-	unregister_netdevice(sp->dev);
-	rtnl_unlock();
-}
-
-
-static struct net_device_stats *sp_get_stats(struct net_device *dev)
-{
-	struct sixpack *sp =3D (struct sixpack *) dev->priv;
-	return &sp->stats;
+	unregister_netdev(sp->dev);
 }
=20
-
 static int sp_set_mac_address(struct net_device *dev, void *addr)
 {
 	return copy_from_user(dev->dev_addr, addr, AX25_ADDR_LEN) ? -EFAULT :=
 0;
 }
=20
-static int sp_set_dev_mac_address(struct net_device *dev, void *addr)
-{
-	struct sockaddr *sa =3D addr;
-	memcpy(dev->dev_addr, sa->sa_data, AX25_ADDR_LEN);
-	return 0;
-}
-
-
 /* Perform I/O control on an active 6pack channel. */
-static int sixpack_ioctl(struct tty_struct *tty, void *file, int cmd, =
void *arg)
+static int sixpack_ioctl(struct tty_struct *tty, struct file *file,
+	unsigned int cmd, unsigned long arg)
 {
-	struct sixpack *sp =3D (struct sixpack *) tty->disc_data;
-	unsigned int tmp;
+	struct sixpack *sp =3D sp_get(tty);
+	unsigned int tmp, err;
=20
-	/* First make sure we're connected. */
-	if (!sp || sp->magic !=3D SIXPACK_MAGIC)
-		return -EINVAL;
+	if (!sp)
+		return -ENXIO;
=20
 	switch(cmd) {
 	case SIOCGIFNAME:
-		return copy_to_user(arg, sp->dev->name, strlen(sp->dev->name) + 1) ?=
 -EFAULT : 0;
+		err =3D copy_to_user((void *) arg, sp->dev->name,
+		                   strlen(sp->dev->name) + 1) ? -EFAULT : 0;
+		break;
=20
 	case SIOCGIFENCAP:
-		return put_user(0, (int *)arg);
+		err =3D put_user(0, (int *)arg);
+		break;
=20
 	case SIOCSIFENCAP:
-		if (get_user(tmp, (int *) arg))
-			return -EFAULT;
+		if (get_user(tmp, (int *) arg)) {
+			err =3D -EFAULT;
+			break;
+		}
=20
 		sp->mode =3D tmp;
 		sp->dev->addr_len        =3D AX25_ADDR_LEN;	  /* sizeof an AX.25 add=
r */
 		sp->dev->hard_header_len =3D AX25_KISS_HEADER_LEN + AX25_MAX_HEADER_=
LEN + 3;
 		sp->dev->type            =3D ARPHRD_AX25;
=20
-		return 0;
+		err =3D 0;
+		break;
=20
 	 case SIOCSIFHWADDR:
-		return sp_set_mac_address(sp->dev, arg);
+		err =3D sp_set_mac_address(sp->dev, (void *) arg);
+		break;
=20
 	/* Allow stty to read, but not set, the serial port */
 	case TCGETS:
 	case TCGETA:
-		return n_tty_ioctl(tty, (struct file *) file, cmd, (unsigned long) a=
rg);
+		err =3D n_tty_ioctl(tty, (struct file *) file, cmd, arg);
+		break;
=20
 	default:
 		return -ENOIOCTLCMD;
 	}
-}
=20
-static int sp_open_dev(struct net_device *dev)
-{
-	struct sixpack *sp =3D (struct sixpack *) dev->priv;
-	if (sp->tty =3D=3D NULL)
-		return -ENODEV;
-	return 0;
+	sp_put(sp);
+
+	return err;
 }
=20
 /* Fill in our line protocol discipline */
 static struct tty_ldisc sp_ldisc =3D {
-	.magic	=3D TTY_LDISC_MAGIC,
+	.owner		=3D THIS_MODULE,
+	.magic		=3D TTY_LDISC_MAGIC,
 	.name		=3D "6pack",
 	.open		=3D sixpack_open,
-	.close	=3D sixpack_close,
-	.ioctl	=3D (int (*)(struct tty_struct *, struct file *,
-			unsigned int, unsigned long)) sixpack_ioctl,
+	.close		=3D sixpack_close,
+	.ioctl		=3D sixpack_ioctl,
 	.receive_buf	=3D sixpack_receive_buf,
 	.receive_room	=3D sixpack_receive_room,
 	.write_wakeup	=3D sixpack_write_wakeup,
@@ -696,34 +823,18 @@
=20
 /* Initialize 6pack control device -- register 6pack line discipline *=
/
=20
-static char msg_banner[]  __initdata =3D KERN_INFO "AX.25: 6pack drive=
r, " SIXPACK_VERSION " (dynamic channels, max=3D%d)\n";
-static char msg_nomem[]   __initdata =3D KERN_ERR  "6pack: can't alloc=
ate sixpack_ctrls[] array! No 6pack available.\n";
+static char msg_banner[]  __initdata =3D KERN_INFO "AX.25: 6pack drive=
r, " SIXPACK_VERSION "\n";
 static char msg_regfail[] __initdata =3D KERN_ERR  "6pack: can't regis=
ter line discipline (err =3D %d)\n";
=20
 static int __init sixpack_init_driver(void)
 {
 	int status;
=20
-	/* Do sanity checks on maximum device parameter. */
-	if (sixpack_maxdev < 4)
-		sixpack_maxdev =3D 4;
-
-	printk(msg_banner, sixpack_maxdev);
-
-	sixpack_ctrls =3D (sixpack_ctrl_t **) kmalloc(sizeof(void*)*sixpack_m=
axdev, GFP_KERNEL);
-	if (sixpack_ctrls =3D=3D NULL) {
-		printk(msg_nomem);
-		return -ENOMEM;
-	}
-
-	/* Clear the pointer array, we allocate devices when we need them */
-	memset(sixpack_ctrls, 0, sizeof(void*)*sixpack_maxdev); /* Pointers *=
/
+	printk(msg_banner);
=20
 	/* Register the provided line protocol discipline */
-	if ((status =3D tty_register_ldisc(N_6PACK, &sp_ldisc)) !=3D 0) {
+	if ((status =3D tty_register_ldisc(N_6PACK, &sp_ldisc)) !=3D 0)
 		printk(msg_regfail, status);
-		kfree(sixpack_ctrls);
-	}
=20
 	return status;
 }
@@ -732,36 +843,16 @@
=20
 static void __exit sixpack_exit_driver(void)
 {
-	int i;
-
-	if ((i =3D tty_register_ldisc(N_6PACK, NULL)))
-		printk(msg_unregfail, i);
+	int ret;
=20
-	for (i =3D 0; i < sixpack_maxdev; i++) {
-		if (sixpack_ctrls[i]) {
-			/*
-			* VSV =3D if dev->start=3D=3D0, then device
-			* unregistered while close proc.
-			*/
-			if (netif_running(&sixpack_ctrls[i]->dev))
-				 unregister_netdev(&sixpack_ctrls[i]->dev);
-
-			kfree(sixpack_ctrls[i]);
-		}
-	}
-	kfree(sixpack_ctrls);
+	if ((ret =3D tty_register_ldisc(N_6PACK, NULL)))
+		printk(msg_unregfail, ret);
 }
=20
-
 /* Initialize the 6pack driver.  Called by DDI. */
 static int sixpack_init(struct net_device *dev)
 {
-	struct sixpack *sp =3D (struct sixpack *) dev->priv;
-
-	static char ax25_bcast[AX25_ADDR_LEN] =3D
-		{'Q'<<1,'S'<<1,'T'<<1,' '<<1,' '<<1,' '<<1,'0'<<1};
-	static char ax25_test[AX25_ADDR_LEN] =3D
-		{'L'<<1,'I'<<1,'N'<<1,'U'<<1,'X'<<1,' '<<1,'1'<<1};
+	struct sixpack *sp =3D netdev_priv(dev);
=20
 	if (sp =3D=3D NULL)		/* Allocation failed ?? */
 		return -ENODEV;
@@ -769,52 +860,15 @@
 	/* Set up the "6pack Control Block". (And clear statistics) */
=20
 	memset(sp, 0, sizeof (struct sixpack));
-	sp->magic  =3D SIXPACK_MAGIC;
 	sp->dev	   =3D dev;
=20
-	/* Finish setting up the DEVICE info. */
-	dev->mtu		=3D SIXP_MTU;
-	dev->hard_start_xmit	=3D sp_xmit;
-	dev->open		=3D sp_open_dev;
-	dev->stop		=3D sp_close;
-	dev->hard_header	=3D sp_header;
-	dev->get_stats	        =3D sp_get_stats;
-	dev->set_mac_address    =3D sp_set_dev_mac_address;
-	dev->hard_header_len	=3D AX25_MAX_HEADER_LEN;
-	dev->addr_len		=3D AX25_ADDR_LEN;
-	dev->type		=3D ARPHRD_AX25;
-	dev->tx_queue_len	=3D 10;
-	dev->rebuild_header	=3D sp_rebuild_header;
-	dev->tx_timeout		=3D NULL;
-
-	memcpy(dev->broadcast, ax25_bcast, AX25_ADDR_LEN);	/* Only activated =
in AX.25 mode */
-	memcpy(dev->dev_addr, ax25_test, AX25_ADDR_LEN);	/*    ""      ""    =
   ""    "" */
-
-	/* New-style flags. */
-	dev->flags		=3D 0;
-
 	return 0;
 }
=20
-
-
-
-/* ----> 6pack timer interrupt handler and friends. <---- */
-static void sp_start_tx_timer(struct sixpack *sp)
-{
-	int when =3D sp->slottime;
-
-	del_timer(&sp->tx_t);
-	sp->tx_t.data =3D (unsigned long) sp;
-	sp->tx_t.function =3D sp_xmit_on_air;
-	sp->tx_t.expires =3D jiffies + ((when+1)*HZ)/100;
-	add_timer(&sp->tx_t);
-}
-
-
 /* encode an AX.25 packet into 6pack */
=20
-static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf=
_raw, int length, unsigned char tx_delay)
+static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf=
_raw,
+	int length, unsigned char tx_delay)
 {
 	int count =3D 0;
 	unsigned char checksum =3D 0, buf[400];
@@ -849,47 +903,28 @@
 	return raw_count;
 }
=20
+/* decode 4 sixpack-encoded bytes into 3 data bytes */
=20
-/* decode a 6pack packet */
-
-static void
-sixpack_decode(struct sixpack *sp, unsigned char pre_rbuff[], int coun=
t)
-{
-	unsigned char inbyte;
-	int count1;
-
-	for (count1 =3D 0; count1 < count; count1++) {
-		inbyte =3D pre_rbuff[count1];
-		if (inbyte =3D=3D SIXP_FOUND_TNC) {
-			printk(KERN_INFO "6pack: TNC found.\n");
-			sp->tnc_ok =3D 1;
-			del_timer(&sp->resync_t);
-		}
-		if ((inbyte & SIXP_PRIO_CMD_MASK) !=3D 0)
-			decode_prio_command(inbyte, sp);
-		else if ((inbyte & SIXP_STD_CMD_MASK) !=3D 0)
-			decode_std_command(inbyte, sp);
-		else if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)
-			decode_data(inbyte, sp);
-	}
-}
-
-static int tnc_init(struct sixpack *sp)
+static void decode_data(unsigned char inbyte, struct sixpack *sp)
 {
-	unsigned char inbyte =3D 0xe8;
+	unsigned char *buf;
=20
-	sp->tty->driver->write(sp->tty, 0, &inbyte, 1);
+	if (sp->rx_count !=3D 3) {
+		sp->raw_buf[sp->rx_count++] =3D inbyte;
=20
-	del_timer(&sp->resync_t);
-	sp->resync_t.data =3D (unsigned long) sp;
-	sp->resync_t.function =3D resync_tnc;
-	sp->resync_t.expires =3D jiffies + SIXP_RESYNC_TIMEOUT;
-	add_timer(&sp->resync_t);
+		return;
+	}
=20
-	return 0;
+	buf =3D sp->raw_buf;
+	sp->cooked_buf[sp->rx_count_cooked++] =3D
+		buf[0] | ((buf[1] << 2) & 0xc0);
+	sp->cooked_buf[sp->rx_count_cooked++] =3D
+		(buf[1] & 0x0f) | ((buf[2] << 2) & 0xf0);
+	sp->cooked_buf[sp->rx_count_cooked++] =3D
+		(buf[2] & 0x03) | (inbyte << 2);
+	sp->rx_count =3D 0;
 }
=20
-
 /* identify and execute a 6pack priority command byte */
=20
 static void decode_prio_command(unsigned char cmd, struct sixpack *sp)
@@ -916,8 +951,7 @@
 				cmd &=3D !SIXP_RX_DCD_MASK;
 		}
 		sp->status =3D cmd & SIXP_PRIO_DATA_MASK;
-	}
-	else { /* output watchdog char if idle */
+	} else { /* output watchdog char if idle */
 		if ((sp->status2 !=3D 0) && (sp->duplex =3D=3D 1)) {
 			sp->led_state =3D 0x70;
 			sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
@@ -948,46 +982,6 @@
 	sp->status1 =3D cmd & SIXP_PRIO_DATA_MASK;
 }
=20
-/* try to resync the TNC. Called by the resync timer defined in
-  decode_prio_command */
-
-static void resync_tnc(unsigned long channel)
-{
-	static char resync_cmd =3D 0xe8;
-	struct sixpack *sp =3D (struct sixpack *) channel;
-
-	printk(KERN_INFO "6pack: resyncing TNC\n");
-
-	/* clear any data that might have been received */
-
-	sp->rx_count =3D 0;
-	sp->rx_count_cooked =3D 0;
-
-	/* reset state machine */
-
-	sp->status =3D 1;
-	sp->status1 =3D 1;
-	sp->status2 =3D 0;
-	sp->tnc_ok =3D 0;
-
-	/* resync the TNC */
-
-	sp->led_state =3D 0x60;
-	sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-	sp->tty->driver->write(sp->tty, 0, &resync_cmd, 1);
-
-
-	/* Start resync timer again -- the TNC might be still absent */
-
-	del_timer(&sp->resync_t);
-	sp->resync_t.data =3D (unsigned long) sp;
-	sp->resync_t.function =3D resync_tnc;
-	sp->resync_t.expires =3D jiffies + SIXP_RESYNC_TIMEOUT;
-	add_timer(&sp->resync_t);
-}
-
-
-
 /* identify and execute a standard 6pack command byte */
=20
 static void decode_std_command(unsigned char cmd, struct sixpack *sp)
@@ -997,67 +991,70 @@
=20
 	channel =3D cmd & SIXP_CHN_MASK;
 	switch (cmd & SIXP_CMD_MASK) {     /* normal command */
-		case SIXP_SEOF:
-			if ((sp->rx_count =3D=3D 0) && (sp->rx_count_cooked =3D=3D 0)) {
-				if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D
-					SIXP_RX_DCD_MASK) {
-					sp->led_state =3D 0x68;
-					sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-				}
-			} else {
-				sp->led_state =3D 0x60;
-				/* fill trailing bytes with zeroes */
+	case SIXP_SEOF:
+		if ((sp->rx_count =3D=3D 0) && (sp->rx_count_cooked =3D=3D 0)) {
+			if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D
+				SIXP_RX_DCD_MASK) {
+				sp->led_state =3D 0x68;
 				sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
-				rest =3D sp->rx_count;
-				if (rest !=3D 0)
-					 for (i =3D rest; i <=3D 3; i++)
-						decode_data(0, sp);
-				if (rest =3D=3D 2)
-					sp->rx_count_cooked -=3D 2;
-				else if (rest =3D=3D 3)
-					sp->rx_count_cooked -=3D 1;
-				for (i =3D 0; i < sp->rx_count_cooked; i++)
-					checksum +=3D sp->cooked_buf[i];
-				if (checksum !=3D SIXP_CHKSUM) {
-					printk(KERN_DEBUG "6pack: bad checksum %2.2x\n", checksum);
-				} else {
-					sp->rcount =3D sp->rx_count_cooked-2;
-					sp_bump(sp, 0);
-				}
-				sp->rx_count_cooked =3D 0;
 			}
-			break;
-		case SIXP_TX_URUN: printk(KERN_DEBUG "6pack: TX underrun\n");
-			break;
-		case SIXP_RX_ORUN: printk(KERN_DEBUG "6pack: RX overrun\n");
-			break;
-		case SIXP_RX_BUF_OVL:
-			printk(KERN_DEBUG "6pack: RX buffer overflow\n");
+		} else {
+			sp->led_state =3D 0x60;
+			/* fill trailing bytes with zeroes */
+			sp->tty->driver->write(sp->tty, 0, &sp->led_state, 1);
+			rest =3D sp->rx_count;
+			if (rest !=3D 0)
+				 for (i =3D rest; i <=3D 3; i++)
+					decode_data(0, sp);
+			if (rest =3D=3D 2)
+				sp->rx_count_cooked -=3D 2;
+			else if (rest =3D=3D 3)
+				sp->rx_count_cooked -=3D 1;
+			for (i =3D 0; i < sp->rx_count_cooked; i++)
+				checksum +=3D sp->cooked_buf[i];
+			if (checksum !=3D SIXP_CHKSUM) {
+				printk(KERN_DEBUG "6pack: bad checksum %2.2x\n", checksum);
+			} else {
+				sp->rcount =3D sp->rx_count_cooked-2;
+				sp_bump(sp, 0);
+			}
+			sp->rx_count_cooked =3D 0;
+		}
+		break;
+	case SIXP_TX_URUN: printk(KERN_DEBUG "6pack: TX underrun\n");
+		break;
+	case SIXP_RX_ORUN: printk(KERN_DEBUG "6pack: RX overrun\n");
+		break;
+	case SIXP_RX_BUF_OVL:
+		printk(KERN_DEBUG "6pack: RX buffer overflow\n");
 	}
 }
=20
-/* decode 4 sixpack-encoded bytes into 3 data bytes */
+/* decode a 6pack packet */
=20
-static void decode_data(unsigned char inbyte, struct sixpack *sp)
+static void
+sixpack_decode(struct sixpack *sp, unsigned char pre_rbuff[], int coun=
t)
 {
-	unsigned char *buf;
+	unsigned char inbyte;
+	int count1;
=20
-	if (sp->rx_count !=3D 3)
-		sp->raw_buf[sp->rx_count++] =3D inbyte;
-	else {
-		buf =3D sp->raw_buf;
-		sp->cooked_buf[sp->rx_count_cooked++] =3D
-			buf[0] | ((buf[1] << 2) & 0xc0);
-		sp->cooked_buf[sp->rx_count_cooked++] =3D
-			(buf[1] & 0x0f) | ((buf[2] << 2) & 0xf0);
-		sp->cooked_buf[sp->rx_count_cooked++] =3D
-			(buf[2] & 0x03) | (inbyte << 2);
-		sp->rx_count =3D 0;
+	for (count1 =3D 0; count1 < count; count1++) {
+		inbyte =3D pre_rbuff[count1];
+		if (inbyte =3D=3D SIXP_FOUND_TNC) {
+			printk(KERN_INFO "6pack: TNC found.\n");
+			sp->tnc_ok =3D 1;
+			del_timer(&sp->resync_t);
+		}
+		if ((inbyte & SIXP_PRIO_CMD_MASK) !=3D 0)
+			decode_prio_command(inbyte, sp);
+		else if ((inbyte & SIXP_STD_CMD_MASK) !=3D 0)
+			decode_std_command(inbyte, sp);
+		else if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)
+			decode_data(inbyte, sp);
 	}
 }
=20
-
-MODULE_AUTHOR("Andreas K=F6nsgen <ajk@ccac.rwth-aachen.de>");
+MODULE_AUTHOR("Ralf Baechle DO1GRB <ralf@linux-mips.org>");
 MODULE_DESCRIPTION("6pack driver for AX.25");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_LDISC(N_6PACK);
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
