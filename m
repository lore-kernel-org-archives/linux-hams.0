From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Another 6pack patch
Date: Tue, 2 Nov 2004 21:31:07 +0100
Message-ID: <20041102203107.GA25455@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Below another 6pack patch which I've got sitting in my repository for a
while already.  I've got one positive report about it so far but would
like to give a little more testing before sending this upstream.  The
patch does:

 o Update my callsign
 o Cleanup the internal for synchronization with a 6pack TNC a little b=
it
   so it won't result in heaps and piles of messages in syslogs as it u=
sed
   to do.
 o Does paranoia checks for the maximum allowable packet size on transm=
it.
   There was a slight chance this might have resulted in a crash in jus=
t
   the right configuration.
 o Verifies the address family for the SIOCSIFHWADDR network interface
   ioctl.
 o Tries to do proper locking so nothing will access dev->dev_addr in
   midflight while changing the layer 2 address.
 o Uses an intermediate buffer for the SIOCSIFHWADDR ioctl so an error =
in
   copy_from_user can't result in a half-modified MAC address.
 o Swaps the arguments of decode_prio_command, decode_std_command and
   decode_data such that for consistency the struct sixpack pointer wil=
l be
   the first argument like everywhere else.


73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21


--- drivers/net/hamradio/6pack.c	2004-10-25 17:07:35.000000000 +0200
+++ drivers/net/hamradio/6pack.c	2004-11-02 19:51:04.738359534 +0100
@@ -4,7 +4,7 @@
  *		kernel's AX.25 protocol layers.
  *
  * Authors:	Andreas K=F6nsgen <ajk@iehk.rwth-aachen.de>
- *              Ralf Baechle DO1GRB <ralf@linux-mips.org>
+ *              Ralf Baechle DL5RB <ralf@linux-mips.org>
  *
  * Quite a lot of stuff "stolen" by Joerg Reuter from slip.c, written =
by
  *
@@ -119,11 +119,10 @@
 	unsigned char		status1;
 	unsigned char		status2;
 	unsigned char		tx_enable;
-	unsigned char		tnc_ok;
+	unsigned char		tnc_state;
=20
 	struct timer_list	tx_t;
 	struct timer_list	resync_t;
-
 	atomic_t		refcnt;
 	struct semaphore	dead_sem;
 	spinlock_t		lock;
@@ -134,7 +133,6 @@
 static void sp_start_tx_timer(struct sixpack *);
 static void sixpack_decode(struct sixpack *, unsigned char[], int);
 static int encode_sixpack(unsigned char *, unsigned char *, int, unsig=
ned char);
-static int sixpack_init(struct net_device *dev);
=20
 /*
  * perform the persistence/slottime algorithm for CSMA access. If the
@@ -187,6 +185,11 @@
 		goto out_drop;
 	}
=20
+	if (len > sp->mtu) {	/* sp->mtu =3D AX25_MTU =3D max. PACLEN =3D 256 =
*/
+		msg =3D "oversized transmit packet!";
+		goto out_drop;
+	}
+
 	if (p[0] > 5) {
 		msg =3D "invalid KISS command";
 		goto out_drop;
@@ -249,8 +252,8 @@
 out_drop:
 	sp->stats.tx_dropped++;
 	netif_start_queue(sp->dev);
-	printk(KERN_DEBUG "%s: %s - dropped.\n", sp->dev->name, msg);
-	return;
+	if (net_ratelimit())
+		printk(KERN_DEBUG "%s: %s - dropped.\n", sp->dev->name, msg);
 }
=20
 /* Encapsulate an IP datagram and kick it into a TTY queue. */
@@ -313,10 +316,20 @@
 	return &sp->stats;
 }
=20
-static int sp_set_dev_mac_address(struct net_device *dev, void *addr)
+static int sp_set_mac_address(struct net_device *dev, void *addr)
 {
-	struct sockaddr *sa =3D addr;
-	memcpy(dev->dev_addr, sa->sa_data, AX25_ADDR_LEN);
+	struct sockaddr_ax25 *sa =3D addr;
+
+	if (sa->sax25_family !=3D AF_AX25)
+		return -EINVAL;
+
+	if (!sa->sax25_ndigis)
+		return -EINVAL;
+
+	spin_lock_irq(&dev->xmit_lock);
+	memcpy(dev->dev_addr, &sa->sax25_call, AX25_ADDR_LEN);
+	spin_unlock_irq(&dev->xmit_lock);
+
 	return 0;
 }
=20
@@ -337,7 +350,6 @@
 		{'L'<<1,'I'<<1,'N'<<1,'U'<<1,'X'<<1,' '<<1,'1'<<1};
=20
 	/* Finish setting up the DEVICE info. */
-	dev->init		=3D sixpack_init;
 	dev->mtu		=3D SIXP_MTU;
 	dev->hard_start_xmit	=3D sp_xmit;
 	dev->open		=3D sp_open_dev;
@@ -345,7 +357,7 @@
 	dev->stop		=3D sp_close;
 	dev->hard_header	=3D sp_header;
 	dev->get_stats	        =3D sp_get_stats;
-	dev->set_mac_address    =3D sp_set_dev_mac_address;
+	dev->set_mac_address    =3D sp_set_mac_address;
 	dev->hard_header_len	=3D AX25_MAX_HEADER_LEN;
 	dev->addr_len		=3D AX25_ADDR_LEN;
 	dev->type		=3D ARPHRD_AX25;
@@ -359,51 +371,9 @@
=20
 	SET_MODULE_OWNER(dev);
=20
-	/* New-style flags. */
 	dev->flags		=3D 0;
 }
=20
-/* Find a free 6pack channel, and link in this `tty' line. */
-static inline struct sixpack *sp_alloc(void)
-{
-	struct sixpack *sp =3D NULL;
-	struct net_device *dev =3D NULL;
-
-	dev =3D alloc_netdev(sizeof(struct sixpack), "sp%d", sp_setup);
-	if (!dev)
-		return NULL;
-
-	sp =3D netdev_priv(dev);
-	sp->dev =3D dev;
-
-	spin_lock_init(&sp->lock);
-
-	if (register_netdev(dev))
-		goto out_free;
-
-	return sp;
-
-out_free:
-	printk(KERN_WARNING "sp_alloc() - register_netdev() failure.\n");
-
-	free_netdev(dev);
-
-	return NULL;
-}
-
-/* Free a 6pack channel. */
-static inline void sp_free(struct sixpack *sp)
-{
-	void * tmp;
-
-	/* Free all 6pack frame buffers. */
-	if ((tmp =3D xchg(&sp->rbuff, NULL)) !=3D NULL)
-		kfree(tmp);
-	if ((tmp =3D xchg(&sp->xbuff, NULL)) !=3D NULL)
-		kfree(tmp);
-}
-
-
 /* Send one completely decapsulated IP datagram to the IP layer. */
=20
 /*
@@ -482,6 +452,8 @@
 	struct sixpack *sp =3D sp_get(tty);
 	int actual;
=20
+	if (!sp)
+		return;
 	if (sp->xleft <=3D 0)  {
 		/* Now serial buffer is almost free & we can start
 		 * transmission of another packet */
@@ -492,7 +464,7 @@
 		goto out;
 	}
=20
-	if (sp->tx_enable =3D=3D 1) {
+	if (sp->tx_enable) {
 		actual =3D tty->driver->write(tty, sp->xhead, sp->xleft);
 		sp->xleft -=3D actual;
 		sp->xhead +=3D actual;
@@ -504,80 +476,6 @@
=20
 /* -------------------------------------------------------------------=
---- */
=20
-/* Open the low-level part of the 6pack channel. */
-static int sp_open(struct net_device *dev)
-{
-	struct sixpack *sp =3D netdev_priv(dev);
-	char *rbuff, *xbuff =3D NULL;
-	int err =3D -ENOBUFS;
-	unsigned long len;
-
-	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
-
-	len =3D dev->mtu * 2;
-
-	rbuff =3D kmalloc(len + 4, GFP_KERNEL);
-	if (rbuff =3D=3D NULL)
-		goto err_exit;
-
-	xbuff =3D kmalloc(len + 4, GFP_KERNEL);
-	if (xbuff =3D=3D NULL)
-		goto err_exit;
-
-	spin_lock_bh(&sp->lock);
-
-	if (sp->tty =3D=3D NULL)
-		return -ENODEV;
-
-	/*
-	 * Allocate the 6pack frame buffers:
-	 *
-	 * rbuff	Receive buffer.
-	 * xbuff	Transmit buffer.
-	 */
-
-	rbuff =3D xchg(&sp->rbuff, rbuff);
-	xbuff =3D xchg(&sp->xbuff, xbuff);
-
-	sp->mtu	     =3D AX25_MTU + 73;
-	sp->buffsize =3D len;
-	sp->rcount   =3D 0;
-	sp->rx_count =3D 0;
-	sp->rx_count_cooked =3D 0;
-	sp->xleft    =3D 0;
-
-	sp->flags	=3D 0;		/* Clear ESCAPE & ERROR flags */
-
-	sp->duplex =3D 0;
-	sp->tx_delay    =3D SIXP_TXDELAY;
-	sp->persistence =3D SIXP_PERSIST;
-	sp->slottime    =3D SIXP_SLOTTIME;
-	sp->led_state   =3D 0x60;
-	sp->status      =3D 1;
-	sp->status1     =3D 1;
-	sp->status2     =3D 0;
-	sp->tnc_ok      =3D 0;
-	sp->tx_enable   =3D 0;
-
-	netif_start_queue(dev);
-
-	init_timer(&sp->tx_t);
-	init_timer(&sp->resync_t);
-
-	spin_unlock_bh(&sp->lock);
-
-	err =3D 0;
-
-err_exit:
-	if (xbuff)
-		kfree(xbuff);
-	if (rbuff)
-		kfree(rbuff);
-
-	return err;
-}
-
-
 static int sixpack_receive_room(struct tty_struct *tty)
 {
 	return 65536;  /* We can handle an infinite amount of data. :-) */
@@ -629,14 +527,45 @@
  * decode_prio_command
  */
=20
+#define TNC_UNINITIALIZED	0
+#define TNC_UNSYNC_STARTUP	1
+#define TNC_UNSYNCED		2
+#define TNC_IN_SYNC		3
+
+static void __tnc_set_sync_state(struct sixpack *sp, int new_tnc_state=
)
+{
+	char *msg;
+
+	switch (new_tnc_state) {
+	default:			/* gcc oh piece-o-crap ... */
+	case TNC_UNSYNC_STARTUP:
+		msg =3D "Synchronizing with TNC";
+		break;
+	case TNC_UNSYNCED:
+		msg =3D "Lost synchronization with TNC\n";
+		break;
+	case TNC_IN_SYNC:
+		msg =3D "Found TNC";
+		break;
+	}
+
+	sp->tnc_state =3D new_tnc_state;
+	printk(KERN_INFO "%s: %s\n", sp->dev->name, msg);
+}
+
+static inline void tnc_set_sync_state(struct sixpack *sp, int new_tnc_=
state)
+{
+	int old_tnc_state =3D sp->tnc_state;
+
+	if (old_tnc_state !=3D new_tnc_state)
+		__tnc_set_sync_state(sp, new_tnc_state);
+}
+
 static void resync_tnc(unsigned long channel)
 {
 	struct sixpack *sp =3D (struct sixpack *) channel;
-	struct net_device *dev =3D sp->dev;
 	static char resync_cmd =3D 0xe8;
=20
-	printk(KERN_INFO "%s: resyncing TNC\n", dev->name);
-
 	/* clear any data that might have been received */
=20
 	sp->rx_count =3D 0;
@@ -647,7 +576,6 @@
 	sp->status =3D 1;
 	sp->status1 =3D 1;
 	sp->status2 =3D 0;
-	sp->tnc_ok =3D 0;
=20
 	/* resync the TNC */
=20
@@ -659,9 +587,9 @@
 	/* Start resync timer again -- the TNC might be still absent */
=20
 	del_timer(&sp->resync_t);
-	sp->resync_t.data =3D (unsigned long) sp;
-	sp->resync_t.function =3D resync_tnc;
-	sp->resync_t.expires =3D jiffies + SIXP_RESYNC_TIMEOUT;
+	sp->resync_t.data	=3D (unsigned long) sp;
+	sp->resync_t.function	=3D resync_tnc;
+	sp->resync_t.expires	=3D jiffies + SIXP_RESYNC_TIMEOUT;
 	add_timer(&sp->resync_t);
 }
=20
@@ -669,6 +597,8 @@
 {
 	unsigned char inbyte =3D 0xe8;
=20
+	tnc_set_sync_state(sp, TNC_UNSYNC_STARTUP);
+
 	sp->tty->driver->write(sp->tty, &inbyte, 1);
=20
 	del_timer(&sp->resync_t);
@@ -689,31 +619,91 @@
  */
 static int sixpack_open(struct tty_struct *tty)
 {
+	char *rbuff =3D NULL, *xbuff =3D NULL;
+	struct net_device *dev;
 	struct sixpack *sp;
+	unsigned long len;
 	int err =3D 0;
=20
 	if (!capable(CAP_NET_ADMIN))
 		return -EPERM;
=20
-	sp =3D sp_alloc();
-	if (!sp) {
+	dev =3D alloc_netdev(sizeof(struct sixpack), "sp%d", sp_setup);
+	if (!dev) {
 		err =3D -ENOMEM;
 		goto out;
 	}
=20
-	sp->tty =3D tty;
+	sp =3D netdev_priv(dev);
+	sp->dev =3D dev;
+
+	spin_lock_init(&sp->lock);
 	atomic_set(&sp->refcnt, 1);
 	init_MUTEX_LOCKED(&sp->dead_sem);
=20
-	/* Perform the low-level 6pack initialization. */
-	if ((err =3D sp_open(sp->dev)))
-		goto out;
+	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
+
+	len =3D dev->mtu * 2;
+
+	rbuff =3D kmalloc(len + 4, GFP_KERNEL);
+	xbuff =3D kmalloc(len + 4, GFP_KERNEL);
+
+	if (rbuff =3D=3D NULL || xbuff =3D=3D NULL) {
+		err =3D -ENOBUFS;
+		goto out_free;
+	}
+
+	spin_lock_bh(&sp->lock);
+
+	sp->tty =3D tty;
+
+	sp->rbuff	=3D rbuff;
+	sp->xbuff	=3D xbuff;
+
+	sp->mtu		=3D AX25_MTU + 73;
+	sp->buffsize	=3D len;
+	sp->rcount	=3D 0;
+	sp->rx_count	=3D 0;
+	sp->rx_count_cooked =3D 0;
+	sp->xleft	=3D 0;
+
+	sp->flags	=3D 0;		/* Clear ESCAPE & ERROR flags */
+
+	sp->duplex	=3D 0;
+	sp->tx_delay    =3D SIXP_TXDELAY;
+	sp->persistence =3D SIXP_PERSIST;
+	sp->slottime    =3D SIXP_SLOTTIME;
+	sp->led_state   =3D 0x60;
+	sp->status      =3D 1;
+	sp->status1     =3D 1;
+	sp->status2     =3D 0;
+	sp->tx_enable   =3D 0;
+
+	netif_start_queue(dev);
+
+	init_timer(&sp->tx_t);
+	init_timer(&sp->resync_t);
+
+	spin_unlock_bh(&sp->lock);
=20
 	/* Done.  We have linked the TTY line to a channel. */
 	tty->disc_data =3D sp;
=20
+	/* Now we're ready to register. */
+	if (register_netdev(dev))
+		goto out_free;
+
 	tnc_init(sp);
=20
+	return 0;
+
+out_free:
+	kfree(xbuff);
+	kfree(rbuff);
+
+	if (dev)
+		free_netdev(dev);
+
 out:
 	return err;
 }
@@ -727,7 +717,7 @@
  */
 static void sixpack_close(struct tty_struct *tty)
 {
-	struct sixpack *sp =3D (struct sixpack *) tty->disc_data;
+	struct sixpack *sp;
=20
 	write_lock(&disc_data_lock);
 	sp =3D tty->disc_data;
@@ -743,16 +733,14 @@
 	if (!atomic_dec_and_test(&sp->refcnt))
 		down(&sp->dead_sem);
=20
+	unregister_netdev(sp->dev);
+
 	del_timer(&sp->tx_t);
 	del_timer(&sp->resync_t);
=20
-	sp_free(sp);
-	unregister_netdev(sp->dev);
-}
-
-static int sp_set_mac_address(struct net_device *dev, void __user *add=
r)
-{
-	return copy_from_user(dev->dev_addr, addr, AX25_ADDR_LEN) ? -EFAULT :=
 0;
+	/* Free all 6pack frame buffers. */
+	kfree(sp->rbuff);
+	kfree(sp->xbuff);
 }
=20
 /* Perform I/O control on an active 6pack channel. */
@@ -760,6 +748,7 @@
 	unsigned int cmd, unsigned long arg)
 {
 	struct sixpack *sp =3D sp_get(tty);
+	struct net_device *dev =3D sp->dev;
 	unsigned int tmp, err;
=20
 	if (!sp)
@@ -767,8 +756,8 @@
=20
 	switch(cmd) {
 	case SIOCGIFNAME:
-		err =3D copy_to_user((void __user *) arg, sp->dev->name,
-		                   strlen(sp->dev->name) + 1) ? -EFAULT : 0;
+		err =3D copy_to_user((void *) arg, dev->name,
+		                   strlen(dev->name) + 1) ? -EFAULT : 0;
 		break;
=20
 	case SIOCGIFENCAP:
@@ -782,16 +771,30 @@
 		}
=20
 		sp->mode =3D tmp;
-		sp->dev->addr_len        =3D AX25_ADDR_LEN;	  /* sizeof an AX.25 add=
r */
-		sp->dev->hard_header_len =3D AX25_KISS_HEADER_LEN + AX25_MAX_HEADER_=
LEN + 3;
-		sp->dev->type            =3D ARPHRD_AX25;
+		dev->addr_len        =3D AX25_ADDR_LEN;
+		dev->hard_header_len =3D AX25_KISS_HEADER_LEN +
+		                       AX25_MAX_HEADER_LEN + 3;
+		dev->type            =3D ARPHRD_AX25;
=20
 		err =3D 0;
 		break;
=20
-	 case SIOCSIFHWADDR:
-		err =3D sp_set_mac_address(sp->dev, (void __user *) arg);
+	 case SIOCSIFHWADDR: {
+		char addr[AX25_ADDR_LEN];
+
+		if (copy_from_user(&addr,
+		                   (void __user *) arg, AX25_ADDR_LEN)) {
+			err =3D -EFAULT;
+			break;
+		}
+
+		spin_lock_irq(&dev->xmit_lock);
+		memcpy(dev->dev_addr, &addr, AX25_ADDR_LEN);
+		spin_unlock_irq(&dev->xmit_lock);
+
+		err =3D 0;
 		break;
+	}
=20
 	/* Allow stty to read, but not set, the serial port */
 	case TCGETS:
@@ -800,7 +803,7 @@
 		break;
=20
 	default:
-		return -ENOIOCTLCMD;
+		err =3D -ENOIOCTLCMD;
 	}
=20
 	sp_put(sp);
@@ -808,7 +811,6 @@
 	return err;
 }
=20
-/* Fill in our line protocol discipline */
 static struct tty_ldisc sp_ldisc =3D {
 	.owner		=3D THIS_MODULE,
 	.magic		=3D TTY_LDISC_MAGIC,
@@ -823,8 +825,10 @@
=20
 /* Initialize 6pack control device -- register 6pack line discipline *=
/
=20
-static char msg_banner[]  __initdata =3D KERN_INFO "AX.25: 6pack drive=
r, " SIXPACK_VERSION "\n";
-static char msg_regfail[] __initdata =3D KERN_ERR  "6pack: can't regis=
ter line discipline (err =3D %d)\n";
+static char msg_banner[]  __initdata =3D KERN_INFO \
+	"AX.25: 6pack driver, " SIXPACK_VERSION "\n";
+static char msg_regfail[] __initdata =3D KERN_ERR  \
+	"6pack: can't register line discipline (err =3D %d)\n";
=20
 static int __init sixpack_init_driver(void)
 {
@@ -839,7 +843,8 @@
 	return status;
 }
=20
-static const char msg_unregfail[] __exitdata =3D KERN_ERR "6pack: can'=
t unregister line discipline (err =3D %d)\n";
+static const char msg_unregfail[] __exitdata =3D KERN_ERR \
+	"6pack: can't unregister line discipline (err =3D %d)\n";
=20
 static void __exit sixpack_exit_driver(void)
 {
@@ -849,22 +854,6 @@
 		printk(msg_unregfail, ret);
 }
=20
-/* Initialize the 6pack driver.  Called by DDI. */
-static int sixpack_init(struct net_device *dev)
-{
-	struct sixpack *sp =3D netdev_priv(dev);
-
-	if (sp =3D=3D NULL)		/* Allocation failed ?? */
-		return -ENODEV;
-
-	/* Set up the "6pack Control Block". (And clear statistics) */
-
-	memset(sp, 0, sizeof (struct sixpack));
-	sp->dev	   =3D dev;
-
-	return 0;
-}
-
 /* encode an AX.25 packet into 6pack */
=20
 static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf=
_raw,
@@ -905,7 +894,7 @@
=20
 /* decode 4 sixpack-encoded bytes into 3 data bytes */
=20
-static void decode_data(unsigned char inbyte, struct sixpack *sp)
+static void decode_data(struct sixpack *sp, unsigned char inbyte)
 {
 	unsigned char *buf;
=20
@@ -927,7 +916,7 @@
=20
 /* identify and execute a 6pack priority command byte */
=20
-static void decode_prio_command(unsigned char cmd, struct sixpack *sp)
+static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
 {
 	unsigned char channel;
 	int actual;
@@ -971,11 +960,11 @@
         /* if the state byte has been received, the TNC is present,
            so the resync timer can be reset. */
=20
-	if (sp->tnc_ok =3D=3D 1) {
+	if (sp->tnc_state =3D=3D TNC_IN_SYNC) {
 		del_timer(&sp->resync_t);
-		sp->resync_t.data =3D (unsigned long) sp;
-		sp->resync_t.function =3D resync_tnc;
-		sp->resync_t.expires =3D jiffies + SIXP_INIT_RESYNC_TIMEOUT;
+		sp->resync_t.data	=3D (unsigned long) sp;
+		sp->resync_t.function	=3D resync_tnc;
+		sp->resync_t.expires	=3D jiffies + SIXP_INIT_RESYNC_TIMEOUT;
 		add_timer(&sp->resync_t);
 	}
=20
@@ -984,7 +973,7 @@
=20
 /* identify and execute a standard 6pack command byte */
=20
-static void decode_std_command(unsigned char cmd, struct sixpack *sp)
+static void decode_std_command(struct sixpack *sp, unsigned char cmd)
 {
 	unsigned char checksum =3D 0, rest =3D 0, channel;
 	short i;
@@ -1005,7 +994,7 @@
 			rest =3D sp->rx_count;
 			if (rest !=3D 0)
 				 for (i =3D rest; i <=3D 3; i++)
-					decode_data(0, sp);
+					decode_data(sp, 0);
 			if (rest =3D=3D 2)
 				sp->rx_count_cooked -=3D 2;
 			else if (rest =3D=3D 3)
@@ -1033,7 +1022,7 @@
 /* decode a 6pack packet */
=20
 static void
-sixpack_decode(struct sixpack *sp, unsigned char pre_rbuff[], int coun=
t)
+sixpack_decode(struct sixpack *sp, unsigned char *pre_rbuff, int count=
)
 {
 	unsigned char inbyte;
 	int count1;
@@ -1041,16 +1030,15 @@
 	for (count1 =3D 0; count1 < count; count1++) {
 		inbyte =3D pre_rbuff[count1];
 		if (inbyte =3D=3D SIXP_FOUND_TNC) {
-			printk(KERN_INFO "6pack: TNC found.\n");
-			sp->tnc_ok =3D 1;
+			tnc_set_sync_state(sp, TNC_IN_SYNC);
 			del_timer(&sp->resync_t);
 		}
 		if ((inbyte & SIXP_PRIO_CMD_MASK) !=3D 0)
-			decode_prio_command(inbyte, sp);
+			decode_prio_command(sp, inbyte);
 		else if ((inbyte & SIXP_STD_CMD_MASK) !=3D 0)
-			decode_std_command(inbyte, sp);
+			decode_std_command(sp, inbyte);
 		else if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)
-			decode_data(inbyte, sp);
+			decode_data(sp, inbyte);
 	}
 }
=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
