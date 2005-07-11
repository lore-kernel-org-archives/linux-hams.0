From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH] First cut of PR430 / extended 6pack driver
Date: Mon, 11 Jul 2005 09:21:02 +0100
Message-ID: <20050711082102.GA5268@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Below there's a first cut of a extended 6pack driver featuring support
for the PR-430 driver.  It should work unchanged for non-PR430 6pack
hardware.  PR430 drivers frequency etc. can be configured through sysfs=
:

[ralf@dea linux-cvs]$ ssh -l root 172.20.1.2
root@172.20.1.2's password:
Last login: Sun Jul 10 20:52:26 2005
[root@kiste ~]# cd /sys/class/net/sp0
[root@kiste sp0]# ls -l tnc
total 0
-r--r--r--  1 root root 4096 Jul 10 20:52 author
-rw-r--r--  1 root root 4096 Jul 10 20:52 bitrate
-r--r--r--  1 root root 4096 Jul 10 20:52 hwtype
-r--r--r--  1 root root 4096 Jul 10 20:52 major
-r--r--r--  1 root root 4096 Jul 10 20:52 minor
-rw-r--r--  1 root root 4096 Jul 10 20:52 qrg
-rw-r--r--  1 root root 4096 Jul 10 20:52 shift
-rw-r--r--  1 root root 4096 Jul 10 20:52 txpower
[root@kiste sp0]#

The use of sysfs is the main difference to DL9SAU's PR430 driver which
was (ab-)using the 802.11 wireless tool for configuration; otherwise th=
is
driver is largely based on his work.  Patch is against 2.6.12.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

 6pack.c | 1385 ++++++++++++++++++++++++++++++++++++++++++++++++++-----=
---------
 1 files changed, 1083 insertions(+), 302 deletions(-)

Index: linux-cvs/drivers/net/hamradio/6pack.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-cvs.orig/drivers/net/hamradio/6pack.c	2005-07-05 20:24:56.000=
000000 +0100
+++ linux-cvs/drivers/net/hamradio/6pack.c	2005-07-10 22:10:03.00000000=
0 +0100
@@ -5,11 +5,6 @@
  *
  * Authors:	Andreas K=F6nsgen <ajk@iehk.rwth-aachen.de>
  *              Ralf Baechle DL5RB <ralf@linux-mips.org>
- *
- * Quite a lot of stuff "stolen" by Joerg Reuter from slip.c, written =
by
- *
- *		Laurence Culhane, <loz@holmes.demon.co.uk>
- *		Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
  */
=20
 #include <linux/config.h>
@@ -24,6 +19,7 @@
 #include <linux/tty.h>
 #include <linux/errno.h>
 #include <linux/netdevice.h>
+#include <linux/sysfs.h>
 #include <linux/timer.h>
 #include <net/ax25.h>
 #include <linux/etherdevice.h>
@@ -74,12 +70,61 @@
 #define SIXP_INIT_RESYNC_TIMEOUT	(3*HZ/2) /* in 1 s */
 #define SIXP_RESYNC_TIMEOUT		5*HZ	/* in 1 s */
=20
-/* 6pack configuration. */
-#define SIXP_NRUNIT			31      /* MAX number of 6pack channels */
 #define SIXP_MTU			256	/* Default MTU */
=20
+/*
+ * TNC430 specefic
+ */
+#define DO_AFSK		1		/* Achtung, TNC kodiert das um
+					   gegenueber seinem Mode */
+#define DO_FM           16
+#define DO_DELAY_TX	128		/* vielleicht ein Provisorium: ein paar
+					   ms txdelay */
+
 enum sixpack_flags {
-	SIXPF_ERROR,	/* Parity, etc. error	*/
+	SIXPF_ERROR,			/* Parity, etc. error	*/
+};
+
+struct hf_param_struct {
+	unsigned int	qrg;            /* Hz */
+	int		shift;          /* Shift */
+	unsigned char	mode;           /* 0:Unknown */
+					/* 1: FSK */
+					/* 2: AFSK */
+					/* 3: voice */
+	unsigned int	baud;           /* 12 =3D 1k2, 96 =3D 9k6, etc. */
+	unsigned char	txpower;	/* 0 reserved */
+					/*, 16, 64, 255 (low, mid, high) */
+	unsigned char	status254_cmd;  /* sent status 254 command /
+	                                   received info for status 254 cmd *=
/
+	unsigned long	status254_cmd_t;/* time of last tx/rx */
+};
+
+struct hw_type_struct {
+	unsigned char	type;           /* 0: default, 4: pr430 */
+	unsigned char	author;		/* 7: dk7wj */
+	unsigned char	major;
+	unsigned char	minor;
+	unsigned char	announced;      /* announce_hardware() */
+};
+
+struct hw_struct {
+					/* meassurements */
+	char		smeter;		/* SNR  caveat: signed */
+	char		center;		/* Middlefreq */
+	unsigned char	hub;		/* messured HUB */
+	unsigned char	txpower_auto;	/* automatical power tune */
+					/* based on SN/R */
+	struct hf_param_struct	hf_want;
+	struct hf_param_struct	hf_act;
+	struct hw_type_struct	hw_type;
+};
+
+enum tnc_state {
+	TNC_UNINITIALIZED,
+	TNC_UNSYNC_STARTUP,
+	TNC_UNSYNCED,
+	TNC_IN_SYNC
 };
=20
 struct sixpack {
@@ -103,7 +148,7 @@
 	/* 6pack interface statistics. */
 	struct net_device_stats stats;
=20
-	int			mtu;		/* Our mtu (to spot changes!) */
+	int			mtu;		/* Our MTU (to spot changes!) */
 	int			buffsize;       /* Max buffers sizes */
=20
 	unsigned long		flags;		/* Flag values/ mode etc */
@@ -119,20 +164,26 @@
 	unsigned char		status1;
 	unsigned char		status2;
 	unsigned char		tx_enable;
-	unsigned char		tnc_state;
+	enum tnc_state		tnc_state;
=20
 	struct timer_list	tx_t;
 	struct timer_list	resync_t;
+	struct timer_list	status_t;
 	atomic_t		refcnt;
 	struct semaphore	dead_sem;
 	spinlock_t		lock;
+
+	struct hw_struct	hw;
 };
=20
+static inline int is_hw_tnc430(const struct sixpack *sp)
+{
+	return (sp->hw.hw_type.type =3D=3D 4 && sp->hw.hw_type.author =3D=3D =
7);
+}
+
 #define AX25_6PACK_HEADER_LEN 0
=20
 static void sp_start_tx_timer(struct sixpack *);
-static void sixpack_decode(struct sixpack *, unsigned char[], int);
-static int encode_sixpack(unsigned char *, unsigned char *, int, unsig=
ned char);
=20
 /*
  * perform the persistence/slottime algorithm for CSMA access. If the
@@ -167,11 +218,45 @@
 {
 	int when =3D sp->slottime;
=20
-	del_timer(&sp->tx_t);
-	sp->tx_t.data =3D (unsigned long) sp;
-	sp->tx_t.function =3D sp_xmit_on_air;
-	sp->tx_t.expires =3D jiffies + ((when + 1) * HZ) / 100;
-	add_timer(&sp->tx_t);
+	mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);
+}
+
+/* encode an AX.25 packet into 6pack */
+
+static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf=
_raw,
+	int length, unsigned char tx_delay)
+{
+	int count =3D 0;
+	unsigned char checksum =3D 0, buf[400];
+	int raw_count =3D 0;
+
+	tx_buf_raw[raw_count++] =3D SIXP_PRIO_CMD_MASK | SIXP_TX_MASK;
+	tx_buf_raw[raw_count++] =3D SIXP_SEOF;
+
+	buf[0] =3D tx_delay;
+	for (count =3D 1; count < length; count++)
+		buf[count] =3D tx_buf[count];
+
+	for (count =3D 0; count < length; count++)
+		checksum +=3D buf[count];
+	buf[length] =3D (unsigned char) 0xff - checksum;
+
+	for (count =3D 0; count <=3D length; count++) {
+		if ((count % 3) =3D=3D 0) {
+			tx_buf_raw[raw_count++] =3D (buf[count] & 0x3f);
+			tx_buf_raw[raw_count] =3D ((buf[count] >> 2) & 0x30);
+		} else if ((count % 3) =3D=3D 1) {
+			tx_buf_raw[raw_count++] |=3D (buf[count] & 0x0f);
+			tx_buf_raw[raw_count] =3D	((buf[count] >> 2) & 0x3c);
+		} else {
+			tx_buf_raw[raw_count++] |=3D (buf[count] & 0x03);
+			tx_buf_raw[raw_count++] =3D (buf[count] >> 2);
+		}
+	}
+	if ((length % 3) !=3D 2)
+		raw_count++;
+	tx_buf_raw[raw_count++] =3D SIXP_SEOF;
+	return raw_count;
 }
=20
 /* Encapsulate one AX.25 frame and stuff into a TTY queue. */
@@ -369,12 +454,391 @@
 	memcpy(dev->broadcast, ax25_bcast, AX25_ADDR_LEN);
 	memcpy(dev->dev_addr, ax25_test, AX25_ADDR_LEN);
=20
-	SET_MODULE_OWNER(dev);
-
 	dev->flags		=3D 0;
 }
=20
-/* Send one completely decapsulated IP datagram to the IP layer. */
+static void trace_frame(struct sixpack *sp, char *s)
+{
+	unsigned int i;
+
+	if (s)
+		printk(KERN_DEBUG "6pack: %s - ", s);
+	for (i =3D 0/*+1*/; i < sp->rx_count_cooked; i++) {
+		printk(KERN_DEBUG "0x%02x%s", sp->cooked_buf[i], ((i < sp->rx_count_=
cooked-1) ? " " : ""));
+	}
+	printk(KERN_DEBUG "\n");
+	sp->stats.rx_dropped++;
+}
+
+/* xmit status requests to tnc */
+
+static int sp_xmit_status_request(struct sixpack *sp, unsigned char *d=
ata, int len)
+{
+	unsigned char xbuff[SIXP_MTU * 2 + 4]; // needed by encode_sixpack()*=
2
+
+	if (len * 2 + 4 > sizeof(xbuff)) {
+		printk("6pack: status request too long: %d", len);
+		return -1;
+	}
+
+	len =3D encode_sixpack(data, xbuff, len, data[0]);
+
+	// still running?
+	if (!sp)
+		return -1;
+
+	if (sp->xleft <=3D 0) {
+		// don't interrupt me
+		//netif_stop_queue(sp->dev);
+		//sp->tty->flags &=3D ~(1 << TTY_DO_WRITE_WAKEUP);
+		//sp->tty->flags |=3D (1 << TTY_DO_WRITE_WAKEUP);
+		sp->led_state =3D 0x60;
+		if (sp->tty->driver->write(sp->tty, &sp->led_state, 1) < 1 ||=20
+				(sp->tty->driver->write(sp->tty, xbuff, len) < len)) {
+			//sp->tty->flags |=3D (1 << TTY_DO_WRITE_WAKEUP);
+printk(KERN_DEBUG "tty busy\n");
+			return -1;
+		}
+		//if (sp->xleft > 0)
+			//sp->tty->flags |=3D (1 << TTY_DO_WRITE_WAKEUP);
+		// hmm, the tty driver counts these status requests, so we have to c=
orrect :(
+		// but only when already > 0..
+		//if (sp->stats.tx_packets)
+			//sp->stats.tx_packets--;
+		return 0;
+	}
+	return -1;
+	// re-enable queue only if the normal xbuff is empty
+	//if (sp->xleft <=3D 0) {
+		//sp->tx_enable =3D 0;
+		//netif_wake_queue(sp->dev);
+	//}
+}
+
+/* some TNCs have status reports - polled by timer */
+
+static void status_request(unsigned long data)
+{
+	struct sixpack *sp =3D (struct sixpack *) data;
+
+	if (!sp->hw.hw_type.type) {
+		del_timer(&sp->status_t); /* stop timer for unknown hardware */
+		return;
+	}
+
+	/*
+	 * Provisorisch (?) hier angeordnet: TNC-Parameter abfragen
+	 * spaeter auch zyklisch, aber nicht so oft, ansonsten bei Aenderung
+	 * soll/ist=20
+	 * status request is encoded as param txdelay:
+	 * txd >251 is reserved for those kinds of hack
+	 */
+	if (sp->xleft <=3D 0) {
+		unsigned char data[3*2];
+
+		if (!is_hw_tnc430(sp)) {
+			/* Don't start timer for unsupported hardware */
+			return;
+		}
+
+		if (sp->hw.hf_want.status254_cmd_t + HZ < jiffies) {
+
+			// every second
+
+			sp->hw.hf_want.status254_cmd_t =3D jiffies;
+			//if (sp->hw.hf_want.status254_cmd && sp->hw.hf_act.status254_cmd_t=
 && sp->hw.hf_act.status254_cmd !=3D sp->hw.hf_want.status254_cmd) {
+				//if (sp->hw.hf_act.status254_cmd_t + 10*HZ > jiffies) {
+					//goto give_some_more_time;
+				//}
+				//printk(KERN_INFO "6pack: status254 cmd %d not acked for 10s. las=
t received was %d. got lost?\n", sp->hw.hf_want.status254_cmd, sp->hw.h=
f_act.status254_cmd);
+			//}
+
+			data[0] =3D 254;	/* Kennung TNC430-Special */
+			switch (sp->hw.hf_want.status254_cmd) {
+			case 1:
+				data[1] =3D 2;	/* Mode */
+				break;
+			default:
+				data[1] =3D 1;	/* Frequenz */
+			}
+			//printk(KERN_DEBUG "requesting %ld data[0] %d data[1] =3D %d, last=
 was %d\n", jiffies, data[0], data[1], sp->hw.hf_want.status254_cmd);
+			if (sp_xmit_status_request(sp, data, 2) >=3D 0) {
+				// success
+				sp->hw.hf_want.status254_cmd =3D data[1];
+			}
+		} else {
+//give_some_more_time:
+
+			/*
+			 * nothing important to do
+			 * data[len++] =3D 16;	// S-Meter
+			 * sp_xmit_status_request(sp, data, len);
+			 */
+
+			/*
+			 * we send prio command 0xe8 (1110 1000): channel 0
+			 * this will put the tnc in mode 0xe8
+			 * and automaticaly leads to an s-meter response,
+			 */
+
+			/*
+			 * dummy - not actually sent.  Triggers 0xe8 via
+			 * sp_xmit_status_request() / * encode_sixpack()
+			 */
+			data[0] =3D 254;
+			sp_xmit_status_request(sp, data, 0);
+		}
+	}
+
+	/*
+	 * Cyclic 100ms timer
+	 */
+	mod_timer(&sp->status_t, jiffies + (HZ/10));
+}
+
+/* TNC has hardware information */
+
+static void initialize_hardware(struct sixpack *sp)
+{
+	char *type, *author;
+	int i;
+
+	sp->hw.hw_type.announced =3D 1;
+
+	switch (sp->hw.hw_type.type) {
+	case 4:
+		type =3D "PR430";
+		break;
+	case 0:
+		return;					/* do not announce */
+	default:
+		type =3D "[unknown]";
+	}
+
+	printk(KERN_INFO "6pack: TNC is extended-6pack capable.\n");
+
+	switch (sp->hw.hw_type.author) {
+	case 7:
+		author =3D "DK7WJ";
+		break;
+	default:
+		author =3D "[unknown]";
+	}
+	printk(KERN_INFO "6pack: TNC type %d: %s. author %d: %s. extra: %d, %=
d.\n",
+	       sp->hw.hw_type.type, type,
+	       sp->hw.hw_type.author, author,
+	       sp->hw.hw_type.major, sp->hw.hw_type.minor);
+
+	/*
+	 * Poll config - supported TNC types only
+	 */
+
+	if (is_hw_tnc430(sp)) {
+		unsigned char data[2];
+
+		data[0] =3D 254;
+		for (i =3D 1; i < /* 3 */ 4; i++) {
+			data[1] =3D i;
+			if (sp_xmit_status_request(sp, data, 2) < 0)
+				break;
+		}
+	}
+
+	/*
+	 * New request thread for known hardware
+	 */
+	if (sp->hw.hw_type.type)
+		__mod_timer(&sp->status_t, jiffies + (HZ/10));
+}
+
+/* several status reports for privilliged commands encoded as "txd's" =
> 251 */
+
+static void trace_unknown_status_report(struct sixpack *sp)
+{
+	//sp->led_state =3D 0x68;
+	//sp->tty->driver->write(sp->tty, &sp->led_state, 1);
+	//#ifdef DEBUG
+	trace_frame(sp, "status info");
+	//#endif
+}
+
+/* pr430 hardware status */
+
+static void decode_status254_tnc430(struct sixpack *sp)
+{
+	int len;
+	unsigned char *args;
+
+	/*
+	 * len: sp->rxcount is already without checksum
+	 * and without pos0 (txdelay) and refers pure data
+	 */
+	len =3D sp->rcount;
+	/* cooked_buf[0] is still txdelay =3D=3D 254 */
+	args =3D &sp->cooked_buf[1];
+
+	if (len =3D=3D 1 && args[0] =3D=3D 0 && args[1] =3D=3D 1 /* checksum =
*/) {
+		// answer was 0xfe + 0x00 + 0x01 =3D=3D 0xff (checksum ok, as verifi=
ed before)
+		printk(KERN_INFO "6pack: tnc is alive (response: 0xfe 0x00 0x01)\n")=
;
+		return;
+	}
+	// remember last status we received from tnc. is it the status we ask=
ed for?
+	// note that for s-meter (16) we poll regulary
+	if (args[0] !=3D 16) {
+		// hack: sometimes there's the answer in the rx buffer. give
+		//   time for 2 pending status commands (more never seen)
+		static int complain =3D 0;
+		if (sp->hw.hf_want.status254_cmd && args[0] !=3D sp->hw.hf_want.stat=
us254_cmd) {
+			if (complain > 1) {
+				printk(KERN_INFO "6pack: decode_status254_tnc430: asked for %d, go=
t %d\n", sp->hw.hf_want.status254_cmd, args[0]);
+				complain =3D 0;
+			} else
+				complain++;
+		} else
+			complain =3D 0;
+		//sp->hw.hf_act.status254_cmd =3D args[0];
+		//sp->hw.hf_act.status254_cmd_t =3D jiffies;
+	}
+	//printk(KERN_DEBUG "6pack: decode_status254_tnc430() called, cmd %d,=
 len %d %ld\n", args[0], len, jiffies);
+
+	switch (args[0]) {
+	case 1:	// QRG and Shift
+		if (len =3D=3D 4) {
+			unsigned int freq;
+			int shift;
+
+			freq  =3D (args[1] * 256 + args[2]) * 12500 + 400000000;
+			shift =3D args[3] * 100000;
+			if (sp->hw.hf_act.qrg !=3D freq) {
+				if (sp->hw.hf_want.qrg)
+					printk(KERN_INFO "6pack: qrg change: %d to %d\n", sp->hw.hf_act.q=
rg, freq);
+				sp->hw.hf_act.qrg =3D freq;
+			}
+			if (sp->hw.hf_act.shift !=3D shift) {
+				if (sp->hw.hf_want.shift)
+					printk(KERN_INFO "6pack: shift change: %d to %d\n", sp->hw.hf_act=
=2Eshift, shift);
+				sp->hw.hf_act.shift =3D shift;
+			}
+			if (sp->hw.hf_act.qrg !=3D sp->hw.hf_want.qrg) {
+				printk(KERN_INFO "6pack: qrg change: %d\n", freq);
+			}
+			if (sp->hw.hf_act.shift !=3D sp->hw.hf_want.shift) {
+				printk(KERN_INFO "6pack: shift change: %d\n", shift);
+			}
+			// never initialized?
+			if (!sp->hw.hf_want.qrg) {
+				sp->hw.hf_want.qrg =3D sp->hw.hf_act.qrg;
+				sp->hw.hf_want.shift =3D sp->hw.hf_act.shift;
+			}
+		}
+		break;
+	case 2:	// Mode
+		if (len =3D=3D 2) {
+			char new_mode;
+			if (args[1] & DO_FM) {
+				new_mode =3D 3;
+				sp->hw.hf_act.baud =3D 0;	// wg. Signalisierung in Parms
+			}
+			else if ((args[1] & ~DO_DELAY_TX) =3D=3D DO_AFSK) {
+				new_mode =3D 2;	// AFSK
+				sp->hw.hf_act.baud =3D 12;
+			}
+			else {
+				new_mode =3D 1;	// FSK
+				sp->hw.hf_act.baud =3D 96;
+			}
+			if (sp->hw.hf_act.mode !=3D new_mode) {
+				if (sp->hw.hf_want.mode) {
+					printk(KERN_INFO "6pack: mode change: %d %d\n", new_mode, sp->hw.=
hf_act.baud);
+				}
+				sp->hw.hf_act.mode =3D new_mode;
+				// never initialized?
+				if (!sp->hw.hf_want.mode) {
+					sp->hw.hf_want.mode =3D sp->hw.hf_act.mode;
+					sp->hw.hf_want.baud =3D sp->hw.hf_act.baud;
+				}
+			}
+		}
+		break;
+	case 3: /* current tx-power */
+		//printk(KERN_DEBUG "txpower act %d want %d got %d\n",
+		//       sp->hw.hf_act.txpower, sp->hw.hf_want.txpower, args[1]);
+		if (len =3D=3D 2) {
+			if (sp->hw.hf_act.txpower !=3D args[1]) {
+				//if (sp->hw.hf_want.txpower)
+					printk(KERN_INFO "6pack: tx power change %d\n", args[1]);
+				sp->hw.hf_act.txpower =3D args[1];
+			}
+			if (!sp->hw.hf_want.txpower)
+				sp->hw.hf_want.txpower =3D sp->hw.hf_act.txpower;
+		}
+		break;
+	case 16:
+		/*
+		 * S-Meter, Hub etc..
+		 * sometimes it's 79*4 316 196dbm - what does that mean???
+		 * args[1] =3D args[1] & 0xf;
+		 * sometimes on tx pr430 reports arg1=3D14 arg2=3D255 arg3=3D57.
+		 * perhaps not a center information in arg2,3. currently
+		 * ignore values >=3D 192
+		 */
+		if (args[2] >=3D 192)
+			break;
+		if (/* no, off */ 0 && sp->hw.smeter !=3D args[1]*4) {
+			char tmpbuf[16];
+			if (args[1] < 16)
+				sprintf(tmpbuf, "%d", (args[1] - 1) * 4 / 6);
+			else
+				sprintf(tmpbuf, "9+%d", (args[1]-15) * 10);
+			printk(KERN_DEBUG "6pack: s-meter change: %d*4 %d %ddbm -> S%s\n", =
args[1], args[1]*4, args[1]*4-120, tmpbuf);
+		}
+		sp->hw.smeter =3D args[1] * 4;
+		if (len > 2) {
+			//if (sp->hw.center !=3D (args[2] ^ 0x80))
+				//printk(KERN_DEBUG "6pack: center change: %dHz (%d)\n", ((1000/5)=
 * (char ) (args[2] ^ 0x80)), (char ) (args[2] ^ 0x80));
+			// inform if signal is >7kHz out ouf center
+			if (abs((char) (args[2] ^ 0x80)) > 7*5/1)
+				printk(KERN_DEBUG "6pack: info: center out of range: %dHz (%d)\n",=
 ((1000/5) * (char ) (args[2] ^ 0x80)), (char ) args[2] ^ 0x80);
+			sp->hw.center =3D (char ) (args[2] ^ 0x80);	// 128->0
+		}
+		if (len > 3) {
+			//if (sp->hw.hub !=3D args[3])
+				//printk(KERN_DEBUG "6pack: hub change: %dHz (%d)\n", ((3000/25) *=
 args[3]), args[3]);
+			//if (args[3] > 4*25/3)
+				//printk(KERN_DEBUG "6pack: info: great hub: %dHz (%d)\n", 3000/25=
 * args[3], args[3]);
+			sp->hw.hub =3D args[3];
+		}
+		break;
+	default:
+		printk("6pack: unknown status from tnc430: %d cmd %d len %d\n", sp->=
cooked_buf[0], args[0], len);
+		trace_unknown_status_report(sp);
+	}
+
+	//printk(KERN_DEBUG "6pack: debug: cmd %d %d qrg %d shift %d mode %d =
baud %d smeter %d center %d hub %d\n",
+	//		                     args[0], args[1], (int ) sp->hw.hf_act.qrg, =
(int ) sp->hw.hf_act.shift, (int ) sp->hw.hf_act.mode, (int ) sp->hw.hf=
_act.baud, (int ) sp->hw.smeter, (int ) sp->hw.center, (int ) sp->hw.hu=
b);
+}
+
+static void decode_status254(struct sixpack *sp)
+{
+	if (is_hw_tnc430(sp))
+		decode_status254_tnc430(sp);
+	else
+		trace_unknown_status_report(sp);
+}
+
+static void decode_status255(struct sixpack *sp)
+{
+	if (sp->rcount >=3D 4) {
+		sp->hw.hw_type.type	=3D sp->cooked_buf[1];
+		sp->hw.hw_type.author	=3D sp->cooked_buf[2];
+		sp->hw.hw_type.major	=3D sp->cooked_buf[3];
+		sp->hw.hw_type.minor	=3D sp->cooked_buf[4];
+
+		if (!sp->hw.hw_type.announced)
+			initialize_hardware(sp);
+	} else
+		trace_unknown_status_report(sp);
+}
=20
 /*
  * This is the routine that sends the received data to the kernel AX.2=
5.
@@ -409,6 +873,28 @@
 	sp->stats.rx_dropped++;
 }
=20
+/* interprete 6pack extension or rx data */
+
+static void sp_rxhandler(struct sixpack *sp)
+{
+	// tx_delay > 251 have special means
+	switch (sp->cooked_buf[0]) {
+	case 255:
+		decode_status255(sp);
+		break;
+	case 254:
+		decode_status254(sp);
+		break;
+	default:
+		if (sp->rcount >=3D 5) {
+			sp_bump(sp, 0);
+			break;
+		}
+
+		sp->stats.rx_length_errors++;
+	}
+}
+
=20
 /* -------------------------------------------------------------------=
---- */
=20
@@ -480,62 +966,17 @@
 }
=20
 /*
- * Handle the 'receiver data ready' interrupt.
- * This function is called by the 'tty_io' module in the kernel when
- * a block of 6pack data has been received, which can now be decapsula=
ted
- * and sent on to some IP layer for further processing.
- */
-static void sixpack_receive_buf(struct tty_struct *tty,
-	const unsigned char *cp, char *fp, int count)
-{
-	struct sixpack *sp;
-	unsigned char buf[512];
-	int count1;
-
-	if (!count)
-		return;
-
-	sp =3D sp_get(tty);
-	if (!sp)
-		return;
-
-	memcpy(buf, cp, count < sizeof(buf) ? count : sizeof(buf));
-
-	/* Read the characters out of the buffer */
-
-	count1 =3D count;
-	while (count) {
-		count--;
-		if (fp && *fp++) {
-			if (!test_and_set_bit(SIXPF_ERROR, &sp->flags))
-				sp->stats.rx_errors++;
-			continue;
-		}
-	}
-	sixpack_decode(sp, buf, count1);
-
-	sp_put(sp);
-	if (test_and_clear_bit(TTY_THROTTLED, &tty->flags)
-	    && tty->driver->unthrottle)
-		tty->driver->unthrottle(tty);
-}
-
-/*
  * Try to resync the TNC. Called by the resync timer defined in
  * decode_prio_command
  */
=20
-#define TNC_UNINITIALIZED	0
-#define TNC_UNSYNC_STARTUP	1
-#define TNC_UNSYNCED		2
-#define TNC_IN_SYNC		3
-
-static void __tnc_set_sync_state(struct sixpack *sp, int new_tnc_state=
)
+static void __tnc_set_sync_state(struct sixpack *sp,
+	enum tnc_state new_tnc_state)
 {
 	char *msg;
=20
 	switch (new_tnc_state) {
-	default:			/* gcc oh piece-o-crap ... */
+	default:
 	case TNC_UNSYNC_STARTUP:
 		msg =3D "Synchronizing with TNC";
 		break;
@@ -551,7 +992,8 @@
 	printk(KERN_INFO "%s: %s\n", sp->dev->name, msg);
 }
=20
-static inline void tnc_set_sync_state(struct sixpack *sp, int new_tnc_=
state)
+static inline void tnc_set_sync_state(struct sixpack *sp,
+	enum tnc_state new_tnc_state)
 {
 	int old_tnc_state =3D sp->tnc_state;
=20
@@ -575,70 +1017,582 @@
 	sp->status1 =3D 1;
 	sp->status2 =3D 0;
=20
-	/* resync the TNC */
+	/* Resync the TNC */
=20
 	sp->led_state =3D 0x60;
 	sp->tty->driver->write(sp->tty, &sp->led_state, 1);
 	sp->tty->driver->write(sp->tty, &resync_cmd, 1);
=20
-
 	/* Start resync timer again -- the TNC might be still absent */
-
-	del_timer(&sp->resync_t);
-	sp->resync_t.data	=3D (unsigned long) sp;
-	sp->resync_t.function	=3D resync_tnc;
-	sp->resync_t.expires	=3D jiffies + SIXP_RESYNC_TIMEOUT;
-	add_timer(&sp->resync_t);
+	mod_timer(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
 }
=20
-static inline int tnc_init(struct sixpack *sp)
+static inline void tnc_init(struct sixpack *sp)
 {
-	unsigned char inbyte =3D 0xe8;
+	static const unsigned char inbyte =3D 0xe8;
=20
 	tnc_set_sync_state(sp, TNC_UNSYNC_STARTUP);
=20
 	sp->tty->driver->write(sp->tty, &inbyte, 1);
=20
-	del_timer(&sp->resync_t);
+	init_timer(&sp->resync_t);
 	sp->resync_t.data =3D (unsigned long) sp;
 	sp->resync_t.function =3D resync_tnc;
-	sp->resync_t.expires =3D jiffies + SIXP_RESYNC_TIMEOUT;
-	add_timer(&sp->resync_t);
-
-	return 0;
+	__mod_timer(&sp->resync_t, jiffies + SIXP_RESYNC_TIMEOUT);
 }
=20
-/*
- * Open the high-level part of the 6pack channel.
- * This function is called by the TTY module when the
- * 6pack line discipline is called for.  Because we are
- * sure the tty line exists, we only have to link it to
- * a free 6pcack channel...
- */
-static int sixpack_open(struct tty_struct *tty)
+/* decode 4 sixpack-encoded bytes into 3 data bytes */
+
+static void decode_data(struct sixpack *sp, unsigned char inbyte)
 {
-	char *rbuff =3D NULL, *xbuff =3D NULL;
-	struct net_device *dev;
-	struct sixpack *sp;
-	unsigned long len;
-	int err =3D 0;
+	unsigned char *buf;
=20
-	if (!capable(CAP_NET_ADMIN))
-		return -EPERM;
+	if (sp->rx_count !=3D 3) {
+		sp->raw_buf[sp->rx_count++] =3D inbyte;
=20
-	dev =3D alloc_netdev(sizeof(struct sixpack), "sp%d", sp_setup);
-	if (!dev) {
-		err =3D -ENOMEM;
-		goto out;
+		return;
 	}
=20
-	sp =3D netdev_priv(dev);
-	sp->dev =3D dev;
-
-	spin_lock_init(&sp->lock);
-	atomic_set(&sp->refcnt, 1);
-	init_MUTEX_LOCKED(&sp->dead_sem);
-
+	buf =3D sp->raw_buf;
+	sp->cooked_buf[sp->rx_count_cooked++] =3D
+		buf[0] | ((buf[1] << 2) & 0xc0);
+	sp->cooked_buf[sp->rx_count_cooked++] =3D
+		(buf[1] & 0x0f) | ((buf[2] << 2) & 0xf0);
+	sp->cooked_buf[sp->rx_count_cooked++] =3D
+		(buf[2] & 0x03) | (inbyte << 2);
+	sp->rx_count =3D 0;
+}
+
+/* identify and execute a 6pack priority command byte */
+
+static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
+{
+	unsigned char channel;
+	int actual;
+
+	channel =3D cmd & SIXP_CHN_MASK;
+	if ((cmd & SIXP_PRIO_DATA_MASK) !=3D 0) {     /* idle ? */
+
+	/* RX and DCD flags can only be set in the same prio command,
+	   if the DCD flag has been set without the RX flag in the previous
+	   prio command. If DCD has not been set before, something in the
+	   transmission has gone wrong. In this case, RX and DCD are
+	   cleared in order to prevent the decode_data routine from
+	   reading further data that might be corrupt. */
+
+		if (((sp->status & SIXP_DCD_MASK) =3D=3D 0) &&
+			((cmd & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)) {
+				if (sp->status !=3D 1)
+					printk(KERN_DEBUG "6pack: protocol violation\n");
+				else
+					sp->status =3D 0;
+				cmd &=3D !SIXP_RX_DCD_MASK;
+		}
+		sp->status =3D cmd & SIXP_PRIO_DATA_MASK;
+	} else { /* output watchdog char if idle */
+		if ((sp->status2 !=3D 0) && (sp->duplex =3D=3D 1)) {
+			sp->led_state =3D 0x70;
+			sp->tty->driver->write(sp->tty, &sp->led_state, 1);
+			sp->tx_enable =3D 1;
+			actual =3D sp->tty->driver->write(sp->tty, sp->xbuff, sp->status2);
+			sp->xleft -=3D actual;
+			sp->xhead +=3D actual;
+			sp->led_state =3D 0x60;
+			sp->status2 =3D 0;
+
+		}
+	}
+
+	/* needed to trigger the TNC watchdog */
+	sp->tty->driver->write(sp->tty, &sp->led_state, 1);
+
+	/*
+	 * If the state byte has been received, the TNC is present,
+         * so the resync timer can be reset.
+	 */
+	if (sp->tnc_state =3D=3D TNC_IN_SYNC)
+		mod_timer(&sp->resync_t, jiffies + SIXP_INIT_RESYNC_TIMEOUT);
+
+	sp->status1 =3D cmd & SIXP_PRIO_DATA_MASK;
+}
+
+/* identify and execute a standard 6pack command byte */
+
+static void decode_std_command(struct sixpack *sp, unsigned char cmd)
+{
+	unsigned char checksum =3D 0, rest =3D 0, channel;
+	short i;
+
+	channel =3D cmd & SIXP_CHN_MASK;
+	switch (cmd & SIXP_CMD_MASK) {     /* normal command */
+	case SIXP_SEOF:
+		if ((sp->rx_count =3D=3D 0) && (sp->rx_count_cooked =3D=3D 0)) {
+			if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D
+				SIXP_RX_DCD_MASK) {
+				sp->led_state =3D 0x68;
+				sp->tty->driver->write(sp->tty, &sp->led_state, 1);
+			}
+		} else {
+			sp->led_state =3D 0x60;
+			/* fill trailing bytes with zeroes */
+			sp->tty->driver->write(sp->tty, &sp->led_state, 1);
+			rest =3D sp->rx_count;
+			if (rest !=3D 0)
+				 for (i =3D rest; i <=3D 3; i++)
+					decode_data(sp, 0);
+			if (rest =3D=3D 2)
+				sp->rx_count_cooked -=3D 2;
+			else if (rest =3D=3D 3)
+				sp->rx_count_cooked -=3D 1;
+			for (i =3D 0; i < sp->rx_count_cooked; i++)
+				checksum +=3D sp->cooked_buf[i];
+			if (checksum !=3D SIXP_CHKSUM) {
+				sp->stats.rx_crc_errors++;
+				printk(KERN_DEBUG "6pack: bad checksum %2.2x\n", checksum);
+			} else {
+				sp->rcount =3D sp->rx_count_cooked - 2;
+				sp_rxhandler(sp);
+			}
+			sp->rx_count_cooked =3D 0;
+		}
+		break;
+	case SIXP_TX_URUN:
+		sp->stats.tx_fifo_errors++;
+		printk(KERN_DEBUG "6pack: TX underrun\n");
+		break;
+	case SIXP_RX_ORUN:
+		sp->stats.rx_fifo_errors++;
+		printk(KERN_DEBUG "6pack: RX overrun\n");
+		break;
+	case SIXP_RX_BUF_OVL:
+		sp->stats.rx_length_errors++;
+		printk(KERN_DEBUG "6pack: RX buffer overflow\n");
+	default:
+		printk(KERN_DEBUG "6pack: unknown std command: %d (%2.2x)\n", cmd, c=
md);
+	}
+}
+
+/* decode a 6pack packet */
+
+static inline void
+sixpack_decode(struct sixpack *sp, unsigned char *pre_rbuff, int count=
)
+{
+	unsigned char inbyte;
+	int count1;
+
+	for (count1 =3D 0; count1 < count; count1++) {
+		inbyte =3D pre_rbuff[count1];
+		if (inbyte =3D=3D SIXP_FOUND_TNC) {
+			tnc_set_sync_state(sp, TNC_IN_SYNC);
+			mod_timer(&sp->resync_t,
+			          jiffies + SIXP_INIT_RESYNC_TIMEOUT);
+		}
+		if ((inbyte & SIXP_PRIO_CMD_MASK) !=3D 0)
+			decode_prio_command(sp, inbyte);
+		else if ((inbyte & SIXP_STD_CMD_MASK) !=3D 0)
+			decode_std_command(sp, inbyte);
+		else if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)
+			decode_data(sp, inbyte);
+	}
+}
+
+/*
+ * Handle the 'receiver data ready' interrupt.
+ * This function is called by the 'tty_io' module in the kernel when
+ * a block of 6pack data has been received, which can now be decapsula=
ted
+ * and sent on to some IP layer for further processing.
+ */
+static void sixpack_receive_buf(struct tty_struct *tty,
+	const unsigned char *cp, char *fp, int count)
+{
+	struct sixpack *sp;
+	unsigned char buf[512];
+	int count1;
+
+	if (!count)
+		return;
+
+	sp =3D sp_get(tty);
+	if (!sp)
+		return;
+
+	memcpy(buf, cp, count < sizeof(buf) ? count : sizeof(buf));
+
+	/* Read the characters out of the buffer */
+
+	count1 =3D count;
+	while (count) {
+		count--;
+		if (fp && *fp++) {
+			if (!test_and_set_bit(SIXPF_ERROR, &sp->flags))
+				sp->stats.rx_errors++;
+			continue;
+		}
+	}
+	sixpack_decode(sp, buf, count1);
+
+	sp_put(sp);
+	if (test_and_clear_bit(TTY_THROTTLED, &tty->flags)
+	    && tty->driver->unthrottle)
+		tty->driver->unthrottle(tty);
+}
+
+/*
+ * PR-430 specific configuration
+ */
+
+/*
+ * Shift is a byte, so there's a design limit.
+ */
+#define	SHIFT_MAX	256*100000
+
+/*
+ * 12.5 kHz steps from 400Mhz up
+ */
+#define	QRG2CHANNEL(x)	(((x - 400000000) * 2 + 1) / 25000)
+
+static int change_qrg_shift(struct sixpack *sp, unsigned long freq, lo=
ng shift)
+{
+	unsigned int qrg, txqrg;
+	unsigned char data[5];
+
+	if (freq < (long ) -1 * SHIFT_MAX)
+		return -EINVAL;
+
+	qrg =3D sp->hw.hf_act.qrg;
+
+	printk(KERN_DEBUG "qrg %d act.qrg %d\n", qrg, sp->hw.hf_act.qrg);
+
+	if ((long ) freq < (long ) SHIFT_MAX) {
+		// new shift
+		shift =3D (freq / 100000) * 100000 /* rounded */;
+		if (shift)
+			printk(KERN_DEBUG "switching to shift %ld\n", shift);
+		else
+			printk(KERN_DEBUG "switching to simplex\n");
+	} else {
+		//printk(KERN_DEBUG "test2: %ld > %d\n",
+		//       (long ) freq /1000, SHIFT_MAX / 1000);
+		/*
+		 * New QRG
+		 */
+		qrg =3D freq;
+	}
+	txqrg =3D qrg + shift;
+#ifdef US_QRG
+	if (qrg > 420000000 && qrg < 450000000
+		&& txqrg > 420000000 && txqrg < 450000000)
+#else
+	if (qrg > 430000000 && qrg < 440000000
+		&& txqrg > 430000000 && txqrg < 440000000)
+#endif
+	{
+		sp->hw.hf_want.qrg =3D qrg;
+		sp->hw.hf_want.shift =3D shift;
+		data[0] =3D 254;	// Kennung TNC430-Special
+		data[1] =3D 1;
+		data[2] =3D QRG2CHANNEL(qrg) / 256;
+		data[3] =3D QRG2CHANNEL(qrg);
+		data[4] =3D shift / 100000;
+		sp->hw.hf_want.status254_cmd =3D data[1];
+		{
+			printk(KERN_DEBUG "New qrg/shift: "
+			       "%d %d, sending %d %d %d %d %d\n",
+			       sp->hw.hf_want.qrg, sp->hw.hf_want.shift,
+			       data[0], data[1], data[2], data[3], data[4]);
+
+			if (sp_xmit_status_request(sp, data, 5) < 0)
+				return -EADDRNOTAVAIL;
+		}
+		/*
+		 * And poll
+		 */
+		//sp_xmit_status_request(sp, data, 2);
+
+		return 0;
+	}
+
+	printk(KERN_INFO "6pack: refusing qsy: out of band range: "
+	       "qrg %d shift %ld -> tx-qrg %ld.\n", qrg, shift, qrg + shift);
+
+	return -EINVAL;
+}
+
+static int change_qrg(struct net_device *dev, unsigned long freq)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+
+	return change_qrg_shift(sp, freq, sp->hw.hf_act.shift);
+}
+
+static int change_shift(struct net_device *dev, unsigned long txshift)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+	long shift =3D txshift;
+
+	return change_qrg_shift(sp, sp->hw.hf_act.qrg, shift);
+}
+
+static int change_txpower(struct net_device *dev, unsigned long txpowe=
r)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+	unsigned char data[3];
+
+	data[0] =3D 254;
+	data[1] =3D 3;
+	switch (txpower) {
+	case 0:
+		sp->hw.hf_want.txpower =3D 0;
+		break;
+
+	case 1: // ord
+	case 16: // cmd
+	case 25: // dBm
+		sp->hw.hf_want.txpower =3D 16;
+		break;
+
+	case 2: // ord
+	case 64: // cmd
+	case 30: // dBm
+		sp->hw.hf_want.txpower =3D 64;
+		break;
+
+	case 3: // ord
+	case 255: // cmd
+	case 38: // dBm
+		sp->hw.hf_want.txpower =3D 255;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	data[2] =3D sp->hw.hf_want.txpower;
+
+	sp->hw.hf_want.status254_cmd =3D data[1];
+	printk(KERN_DEBUG "New txpower: %d (%ld), sending %d %d %d\n",
+	       sp->hw.hf_want.txpower, txpower, data[0], data[1], data[2]);
+
+	if (sp_xmit_status_request(sp, data, 3) < 0)
+		return -EADDRNOTAVAIL;
+
+	/*
+	 * and poll
+	 */
+	// sp_xmit_status_request(sp, data, 2);
+
+	return 0;
+}
+
+/*
+ * For now changing the bitrate implies changing to AFSK for 1200bps
+ * and to FSK for 9600bps.  This may eventually change, you've been
+ * warned.
+ */
+static int change_bitrate(struct net_device *dev, unsigned long bitrat=
e)
+{
+	struct sixpack *sp =3D netdev_priv(dev);
+	unsigned char data [3];
+
+	data[0] =3D 254;
+	data[1] =3D 2;
+
+	switch (bitrate) {
+	case 2:
+	case 1200:
+		sp->hw.hf_want.baud =3D 12;
+		data[2] =3D DO_AFSK | DO_DELAY_TX;
+		sp->hw.hf_want.mode =3D 2;
+		break;
+	case 1:
+	case 9600:
+		sp->hw.hf_want.baud =3D 96;
+		data[2] =3D DO_DELAY_TX;
+		sp->hw.hf_want.mode =3D 1;
+		break;
+#if 0
+	case 3:
+		/*
+		 * Voice - currently not supported
+		 */
+		sp->hw.hf_want.baud =3D 0;
+		data[2] =3D DO_FM;
+		sp->hw.hf_want.mode =3D 3;
+		break;
+#endif
+	default:
+		return -EINVAL;
+	}
+
+	sp->hw.hf_want.status254_cmd =3D data[1];
+	printk(KERN_DEBUG "New mode: %d (%ld, %d), sending %d %d %d\n",
+	       sp->hw.hf_want.mode, bitrate, sp->hw.hf_want.baud * 100,
+	       data[0], data[1], data[2]);
+
+	if (sp_xmit_status_request(sp, data, 3) < 0)
+		return -EADDRNOTAVAIL;
+	/*
+	 * and poll
+	 */
+	//sp_xmit_status_request(sp, data, 2);
+
+	return 0;
+}
+
+#define to_net_dev(class) container_of(class, struct net_device, class=
_dev)
+
+static const char fmt_hex[] =3D "%#x\n";
+static const char fmt_dec[] =3D "%d\n";
+static const char fmt_ulong[] =3D "%lu\n";
+
+static inline int dev_isalive(const struct net_device *dev)
+{
+	return dev->reg_state =3D=3D NETREG_REGISTERED;
+}
+
+/* helper function that does all the locking etc for wireless stats */
+static ssize_t tnc_show(struct class_device *cd, char *buf,
+                        ssize_t (*format)(const struct sixpack *, char=
 *))
+{
+	struct net_device *dev =3D to_net_dev(cd);
+	const struct sixpack *sp =3D netdev_priv(dev);
+	ssize_t ret =3D -EINVAL;
+
+	read_lock(&dev_base_lock);
+	if (dev_isalive(dev) && is_hw_tnc430(sp))
+		ret =3D format(sp, buf);
+	read_unlock(&dev_base_lock);
+
+	return ret;
+}
+
+/*
+ * Common code for r/w and r/o variables
+ */
+#define TNC_SHOW_VAR(name, field, format_string)			\
+									\
+static ssize_t format_sp_##name(const struct sixpack *sp, char *buf)	\
+{									\
+	return sprintf(buf, format_string, sp->field);			\
+}									\
+									\
+static ssize_t show_sp_##name(struct class_device *cd, char *buf)	\
+{									\
+	return tnc_show(cd, buf, format_sp_##name);			\
+}
+
+/*
+ * Macro to define a read-only variable
+ */
+#define TNC_RO_VAR(name, field, format_string)				\
+									\
+TNC_SHOW_VAR(name, field, format_string)				\
+									\
+static CLASS_DEVICE_ATTR(name, S_IRUGO, show_sp_##name, NULL)
+
+/*
+ * Macro to define a read-write variable
+ */
+#define TNC_RW_VAR(name, field, format_string)				\
+									\
+TNC_SHOW_VAR(name, field, format_string)				\
+									\
+static ssize_t store_sp_##name(struct class_device *dev,		\
+                               const char *buf, size_t len)		\
+{									\
+	return netdev_store(dev, buf, len, change_##name);		\
+}									\
+									\
+static CLASS_DEVICE_ATTR(name, S_IRUGO | S_IWUSR,			\
+                         show_sp_##name, store_sp_##name)
+
+/*
+ * Use same locking and permission rules as SIF* ioctl's
+ */
+static ssize_t netdev_store(struct class_device *dev,
+			    const char *buf, size_t len,
+			    int (*set)(struct net_device *, unsigned long))
+{
+	struct net_device *net =3D to_net_dev(dev);
+	char *endp;
+	unsigned long new;
+	int ret =3D -EINVAL;
+
+	if (!capable(CAP_NET_ADMIN))
+		return -EPERM;
+
+	new =3D simple_strtoul(buf, &endp, 0);
+	if (endp =3D=3D buf)
+		goto err;
+
+	rtnl_lock();
+	if (dev_isalive(net)) {
+		if ((ret =3D (*set)(net, new)) =3D=3D 0)
+			ret =3D len;
+	}
+	rtnl_unlock();
+ err:
+	return ret;
+}
+
+TNC_RO_VAR(hwtype, hw.hw_type.type, fmt_dec);
+TNC_RO_VAR(author, hw.hw_type.author, fmt_dec);
+TNC_RO_VAR(major, hw.hw_type.major, fmt_dec);
+TNC_RO_VAR(minor, hw.hw_type.minor, fmt_dec);
+
+TNC_RW_VAR(qrg, hw.hf_act.qrg, fmt_dec);
+TNC_RW_VAR(shift, hw.hf_act.shift, fmt_dec);
+//TNC_RW_VAR(mode, hw.hf_act.mode, fmt_dec);
+TNC_RW_VAR(bitrate, hw.hf_act.baud, fmt_dec);
+TNC_RW_VAR(txpower, hw.hf_act.txpower, fmt_dec);
+
+static struct attribute *tnc_attrs[] =3D {
+	&class_device_attr_hwtype.attr,
+	&class_device_attr_author.attr,
+	&class_device_attr_major.attr,
+	&class_device_attr_minor.attr,
+
+	&class_device_attr_qrg.attr,
+	&class_device_attr_shift.attr,
+	//&class_device_attr_mode.attr,
+	&class_device_attr_bitrate.attr,
+	&class_device_attr_txpower.attr,
+	NULL
+};
+
+static struct attribute_group tnc_group =3D {
+	.name	=3D "tnc",
+	.attrs	=3D tnc_attrs,
+};
+
+/*
+ * Open the high-level part of the 6pack channel.  This function is ca=
lled by
+ * the TTY module when the 6pack line discipline is called for.  Becau=
se we are
+ * sure the tty line exists, we only have to link it to a free 6pack c=
hannel ...
+ */
+static int sixpack_open(struct tty_struct *tty)
+{
+	char *rbuff =3D NULL, *xbuff =3D NULL;
+	struct net_device *dev;
+	struct sixpack *sp;
+	unsigned long len;
+	int err =3D 0;
+
+	if (!capable(CAP_NET_ADMIN))
+		return -EPERM;
+
+	dev =3D alloc_netdev(sizeof(struct sixpack), "sp%d", sp_setup);
+	if (!dev) {
+		err =3D -ENOMEM;
+		goto out;
+	}
+
+	sp =3D netdev_priv(dev);
+	sp->dev =3D dev;
+
+	spin_lock_init(&sp->lock);
+	atomic_set(&sp->refcnt, 1);
+	init_MUTEX_LOCKED(&sp->dead_sem);
+
 	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
=20
 	len =3D dev->mtu * 2;
@@ -680,7 +1634,12 @@
 	netif_start_queue(dev);
=20
 	init_timer(&sp->tx_t);
-	init_timer(&sp->resync_t);
+	sp->tx_t.function =3D sp_xmit_on_air;
+	sp->tx_t.data =3D (unsigned long) sp;
+
+	init_timer(&sp->status_t);
+	sp->status_t.function =3D status_request;
+	sp->status_t.data =3D (unsigned long) sp;
=20
 	spin_unlock_bh(&sp->lock);
=20
@@ -691,10 +1650,17 @@
 	if (register_netdev(dev))
 		goto out_free;
=20
+	err =3D sysfs_create_group(&dev->class_dev.kobj, &tnc_group);
+	if (err)
+		goto out_unregister;
+
 	tnc_init(sp);
=20
 	return 0;
=20
+out_unregister:
+	unregister_netdev(dev);
+
 out_free:
 	kfree(xbuff);
 	kfree(rbuff);
@@ -721,20 +1687,23 @@
 	sp =3D tty->disc_data;
 	tty->disc_data =3D NULL;
 	write_unlock(&disc_data_lock);
+
 	if (sp =3D=3D 0)
 		return;
=20
 	/*
-	 * We have now ensured that nobody can start using ap from now on, bu=
t
+	 * We have now ensured that nobody can start using sp from now on, bu=
t
 	 * we have to wait for all existing users to finish.
 	 */
 	if (!atomic_dec_and_test(&sp->refcnt))
 		down(&sp->dead_sem);
=20
+	sysfs_remove_group(&sp->dev->class_dev.kobj, &tnc_group);
 	unregister_netdev(sp->dev);
=20
 	del_timer(&sp->tx_t);
-	del_timer(&sp->resync_t);
+	del_timer_sync(&sp->resync_t);
+	del_timer_sync(&sp->status_t);
=20
 	/* Free all 6pack frame buffers. */
 	kfree(sp->rbuff);
@@ -852,195 +1821,7 @@
 		printk(msg_unregfail, ret);
 }
=20
-/* encode an AX.25 packet into 6pack */
-
-static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf=
_raw,
-	int length, unsigned char tx_delay)
-{
-	int count =3D 0;
-	unsigned char checksum =3D 0, buf[400];
-	int raw_count =3D 0;
-
-	tx_buf_raw[raw_count++] =3D SIXP_PRIO_CMD_MASK | SIXP_TX_MASK;
-	tx_buf_raw[raw_count++] =3D SIXP_SEOF;
-
-	buf[0] =3D tx_delay;
-	for (count =3D 1; count < length; count++)
-		buf[count] =3D tx_buf[count];
-
-	for (count =3D 0; count < length; count++)
-		checksum +=3D buf[count];
-	buf[length] =3D (unsigned char) 0xff - checksum;
-
-	for (count =3D 0; count <=3D length; count++) {
-		if ((count % 3) =3D=3D 0) {
-			tx_buf_raw[raw_count++] =3D (buf[count] & 0x3f);
-			tx_buf_raw[raw_count] =3D ((buf[count] >> 2) & 0x30);
-		} else if ((count % 3) =3D=3D 1) {
-			tx_buf_raw[raw_count++] |=3D (buf[count] & 0x0f);
-			tx_buf_raw[raw_count] =3D	((buf[count] >> 2) & 0x3c);
-		} else {
-			tx_buf_raw[raw_count++] |=3D (buf[count] & 0x03);
-			tx_buf_raw[raw_count++] =3D (buf[count] >> 2);
-		}
-	}
-	if ((length % 3) !=3D 2)
-		raw_count++;
-	tx_buf_raw[raw_count++] =3D SIXP_SEOF;
-	return raw_count;
-}
-
-/* decode 4 sixpack-encoded bytes into 3 data bytes */
-
-static void decode_data(struct sixpack *sp, unsigned char inbyte)
-{
-	unsigned char *buf;
-
-	if (sp->rx_count !=3D 3) {
-		sp->raw_buf[sp->rx_count++] =3D inbyte;
-
-		return;
-	}
-
-	buf =3D sp->raw_buf;
-	sp->cooked_buf[sp->rx_count_cooked++] =3D
-		buf[0] | ((buf[1] << 2) & 0xc0);
-	sp->cooked_buf[sp->rx_count_cooked++] =3D
-		(buf[1] & 0x0f) | ((buf[2] << 2) & 0xf0);
-	sp->cooked_buf[sp->rx_count_cooked++] =3D
-		(buf[2] & 0x03) | (inbyte << 2);
-	sp->rx_count =3D 0;
-}
-
-/* identify and execute a 6pack priority command byte */
-
-static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
-{
-	unsigned char channel;
-	int actual;
-
-	channel =3D cmd & SIXP_CHN_MASK;
-	if ((cmd & SIXP_PRIO_DATA_MASK) !=3D 0) {     /* idle ? */
-
-	/* RX and DCD flags can only be set in the same prio command,
-	   if the DCD flag has been set without the RX flag in the previous
-	   prio command. If DCD has not been set before, something in the
-	   transmission has gone wrong. In this case, RX and DCD are
-	   cleared in order to prevent the decode_data routine from
-	   reading further data that might be corrupt. */
-
-		if (((sp->status & SIXP_DCD_MASK) =3D=3D 0) &&
-			((cmd & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)) {
-				if (sp->status !=3D 1)
-					printk(KERN_DEBUG "6pack: protocol violation\n");
-				else
-					sp->status =3D 0;
-				cmd &=3D !SIXP_RX_DCD_MASK;
-		}
-		sp->status =3D cmd & SIXP_PRIO_DATA_MASK;
-	} else { /* output watchdog char if idle */
-		if ((sp->status2 !=3D 0) && (sp->duplex =3D=3D 1)) {
-			sp->led_state =3D 0x70;
-			sp->tty->driver->write(sp->tty, &sp->led_state, 1);
-			sp->tx_enable =3D 1;
-			actual =3D sp->tty->driver->write(sp->tty, sp->xbuff, sp->status2);
-			sp->xleft -=3D actual;
-			sp->xhead +=3D actual;
-			sp->led_state =3D 0x60;
-			sp->status2 =3D 0;
-
-		}
-	}
-
-	/* needed to trigger the TNC watchdog */
-	sp->tty->driver->write(sp->tty, &sp->led_state, 1);
-
-        /* if the state byte has been received, the TNC is present,
-           so the resync timer can be reset. */
-
-	if (sp->tnc_state =3D=3D TNC_IN_SYNC) {
-		del_timer(&sp->resync_t);
-		sp->resync_t.data	=3D (unsigned long) sp;
-		sp->resync_t.function	=3D resync_tnc;
-		sp->resync_t.expires	=3D jiffies + SIXP_INIT_RESYNC_TIMEOUT;
-		add_timer(&sp->resync_t);
-	}
-
-	sp->status1 =3D cmd & SIXP_PRIO_DATA_MASK;
-}
-
-/* identify and execute a standard 6pack command byte */
-
-static void decode_std_command(struct sixpack *sp, unsigned char cmd)
-{
-	unsigned char checksum =3D 0, rest =3D 0, channel;
-	short i;
-
-	channel =3D cmd & SIXP_CHN_MASK;
-	switch (cmd & SIXP_CMD_MASK) {     /* normal command */
-	case SIXP_SEOF:
-		if ((sp->rx_count =3D=3D 0) && (sp->rx_count_cooked =3D=3D 0)) {
-			if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D
-				SIXP_RX_DCD_MASK) {
-				sp->led_state =3D 0x68;
-				sp->tty->driver->write(sp->tty, &sp->led_state, 1);
-			}
-		} else {
-			sp->led_state =3D 0x60;
-			/* fill trailing bytes with zeroes */
-			sp->tty->driver->write(sp->tty, &sp->led_state, 1);
-			rest =3D sp->rx_count;
-			if (rest !=3D 0)
-				 for (i =3D rest; i <=3D 3; i++)
-					decode_data(sp, 0);
-			if (rest =3D=3D 2)
-				sp->rx_count_cooked -=3D 2;
-			else if (rest =3D=3D 3)
-				sp->rx_count_cooked -=3D 1;
-			for (i =3D 0; i < sp->rx_count_cooked; i++)
-				checksum +=3D sp->cooked_buf[i];
-			if (checksum !=3D SIXP_CHKSUM) {
-				printk(KERN_DEBUG "6pack: bad checksum %2.2x\n", checksum);
-			} else {
-				sp->rcount =3D sp->rx_count_cooked-2;
-				sp_bump(sp, 0);
-			}
-			sp->rx_count_cooked =3D 0;
-		}
-		break;
-	case SIXP_TX_URUN: printk(KERN_DEBUG "6pack: TX underrun\n");
-		break;
-	case SIXP_RX_ORUN: printk(KERN_DEBUG "6pack: RX overrun\n");
-		break;
-	case SIXP_RX_BUF_OVL:
-		printk(KERN_DEBUG "6pack: RX buffer overflow\n");
-	}
-}
-
-/* decode a 6pack packet */
-
-static void
-sixpack_decode(struct sixpack *sp, unsigned char *pre_rbuff, int count=
)
-{
-	unsigned char inbyte;
-	int count1;
-
-	for (count1 =3D 0; count1 < count; count1++) {
-		inbyte =3D pre_rbuff[count1];
-		if (inbyte =3D=3D SIXP_FOUND_TNC) {
-			tnc_set_sync_state(sp, TNC_IN_SYNC);
-			del_timer(&sp->resync_t);
-		}
-		if ((inbyte & SIXP_PRIO_CMD_MASK) !=3D 0)
-			decode_prio_command(sp, inbyte);
-		else if ((inbyte & SIXP_STD_CMD_MASK) !=3D 0)
-			decode_std_command(sp, inbyte);
-		else if ((sp->status & SIXP_RX_DCD_MASK) =3D=3D SIXP_RX_DCD_MASK)
-			decode_data(sp, inbyte);
-	}
-}
-
-MODULE_AUTHOR("Ralf Baechle DO1GRB <ralf@linux-mips.org>");
+MODULE_AUTHOR("Ralf Baechle DL5RB <ralf@linux-mips.org>");
 MODULE_DESCRIPTION("6pack driver for AX.25");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_LDISC(N_6PACK);
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
