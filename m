From: Domen Puncer <domen@coderock.org>
Subject: [patch] hamradio: remove casts
Date: Wed, 29 Dec 2004 23:25:33 +0100
Message-ID: <20041229222533.GG26245@nd47.coderock.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org
Cc: linux-hams@vger.kernel.org

Remove (void *) casts.
If split patches are prefered just mail me, and i'll send them.


 drivers/net/hamradio/baycom_epp.c     |    4 ++--
 drivers/net/hamradio/baycom_par.c     |    4 ++--
 drivers/net/hamradio/baycom_ser_fdx.c |    2 +-
 drivers/net/hamradio/baycom_ser_hdx.c |    2 +-
 drivers/net/hamradio/bpqether.c       |   12 ++++++------
 drivers/net/hamradio/hdlcdrv.c        |   12 ++++++------
 drivers/net/hamradio/mkiss.c          |   22 +++++++++++-----------
 drivers/net/hamradio/scc.c            |   12 ++++++------
 drivers/net/hamradio/yam.c            |   12 ++++++------
 9 files changed, 41 insertions(+), 41 deletions(-)


Signed-off-by: Domen Puncer <domen@coderock.org>

diff -pruNX dontdiff c/drivers/net/hamradio/baycom_epp.c a/drivers/net/hamradio/baycom_epp.c
--- c/drivers/net/hamradio/baycom_epp.c	2004-08-17 11:45:07.000000000 +0200
+++ a/drivers/net/hamradio/baycom_epp.c	2004-12-29 23:20:02.000000000 +0100
@@ -888,7 +888,7 @@ static int baycom_send_packet(struct sk_
 
 static int baycom_set_mac_address(struct net_device *dev, void *addr)
 {
-	struct sockaddr *sa = (struct sockaddr *)addr;
+	struct sockaddr *sa = addr;
 
 	/* addr is an AX.25 shifted ASCII mac address */
 	memcpy(dev->dev_addr, sa->sa_data, dev->addr_len); 
@@ -914,7 +914,7 @@ static struct net_device_stats *baycom_g
 
 static void epp_wakeup(void *handle)
 {
-        struct net_device *dev = (struct net_device *)handle;
+        struct net_device *dev = handle;
         struct baycom_state *bc;
 
 	baycom_paranoia_check_void(dev, "epp_wakeup");
diff -pruNX dontdiff c/drivers/net/hamradio/baycom_par.c a/drivers/net/hamradio/baycom_par.c
--- c/drivers/net/hamradio/baycom_par.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/net/hamradio/baycom_par.c	2004-12-29 23:20:02.000000000 +0100
@@ -271,7 +271,7 @@ static __inline__ void par96_rx(struct n
 
 static void par96_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
-	struct net_device *dev = (struct net_device *)dev_id;
+	struct net_device *dev = dev_id;
 	struct baycom_state *bc = netdev_priv(dev);
 
 	baycom_int_freq(bc);
@@ -298,7 +298,7 @@ static void par96_interrupt(int irq, voi
 
 static void par96_wakeup(void *handle)
 {
-        struct net_device *dev = (struct net_device *)handle;
+        struct net_device *dev = handle;
 	struct baycom_state *bc = netdev_priv(dev);
 
 	printk(KERN_DEBUG "baycom_par: %s: why am I being woken up?\n", dev->name);
diff -pruNX dontdiff c/drivers/net/hamradio/baycom_ser_fdx.c a/drivers/net/hamradio/baycom_ser_fdx.c
--- c/drivers/net/hamradio/baycom_ser_fdx.c	2004-06-11 12:53:53.000000000 +0200
+++ a/drivers/net/hamradio/baycom_ser_fdx.c	2004-12-29 23:20:02.000000000 +0100
@@ -280,7 +280,7 @@ static __inline__ void ser12_rx(struct n
 
 static irqreturn_t ser12_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
-	struct net_device *dev = (struct net_device *)dev_id;
+	struct net_device *dev = dev_id;
 	struct baycom_state *bc = netdev_priv(dev);
 	struct timeval tv;
 	unsigned char iir, msr;
diff -pruNX dontdiff c/drivers/net/hamradio/baycom_ser_hdx.c a/drivers/net/hamradio/baycom_ser_hdx.c
--- c/drivers/net/hamradio/baycom_ser_hdx.c	2004-06-11 12:53:53.000000000 +0200
+++ a/drivers/net/hamradio/baycom_ser_hdx.c	2004-12-29 23:20:02.000000000 +0100
@@ -374,7 +374,7 @@ static inline void ser12_rx(struct net_d
 
 static irqreturn_t ser12_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
-	struct net_device *dev = (struct net_device *)dev_id;
+	struct net_device *dev = dev_id;
 	struct baycom_state *bc = netdev_priv(dev);
 	unsigned char iir;
 
diff -pruNX dontdiff c/drivers/net/hamradio/bpqether.c a/drivers/net/hamradio/bpqether.c
--- c/drivers/net/hamradio/bpqether.c	2004-10-19 13:52:58.000000000 +0200
+++ a/drivers/net/hamradio/bpqether.c	2004-12-29 23:20:02.000000000 +0100
@@ -134,7 +134,7 @@ static LIST_HEAD(bpq_devices);
  */
 static inline struct net_device *bpq_get_ether_dev(struct net_device *dev)
 {
-	struct bpqdev *bpq = (struct bpqdev *) dev->priv;
+	struct bpqdev *bpq = dev->priv;
 
 	return bpq ? bpq->ethdev : NULL;
 }
@@ -191,7 +191,7 @@ static int bpq_rcv(struct sk_buff *skb, 
 	 * we check the source address of the sender.
 	 */
 
-	bpq = (struct bpqdev *)dev->priv;
+	bpq = dev->priv;
 
 	eth = eth_hdr(skb);
 
@@ -281,7 +281,7 @@ static int bpq_xmit(struct sk_buff *skb,
 	*ptr++ = (size + 5) % 256;
 	*ptr++ = (size + 5) / 256;
 
-	bpq = (struct bpqdev *)dev->priv;
+	bpq = dev->priv;
 
 	if ((dev = bpq_get_ether_dev(dev)) == NULL) {
 		bpq->stats.tx_dropped++;
@@ -305,7 +305,7 @@ static int bpq_xmit(struct sk_buff *skb,
  */
 static struct net_device_stats *bpq_get_stats(struct net_device *dev)
 {
-	struct bpqdev *bpq = (struct bpqdev *) dev->priv;
+	struct bpqdev *bpq = dev->priv;
 
 	return &bpq->stats;
 }
@@ -315,7 +315,7 @@ static struct net_device_stats *bpq_get_
  */
 static int bpq_set_mac_address(struct net_device *dev, void *addr)
 {
-    struct sockaddr *sa = (struct sockaddr *)addr;
+    struct sockaddr *sa = addr;
 
     memcpy(dev->dev_addr, sa->sa_data, dev->addr_len);
 
@@ -567,7 +567,7 @@ static void bpq_free_device(struct net_d
  */
 static int bpq_device_event(struct notifier_block *this,unsigned long event, void *ptr)
 {
-	struct net_device *dev = (struct net_device *)ptr;
+	struct net_device *dev = ptr;
 
 	if (!dev_is_ethdev(dev))
 		return NOTIFY_DONE;
diff -pruNX dontdiff c/drivers/net/hamradio/hdlcdrv.c a/drivers/net/hamradio/hdlcdrv.c
--- c/drivers/net/hamradio/hdlcdrv.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/net/hamradio/hdlcdrv.c	2004-12-29 23:20:02.000000000 +0100
@@ -447,7 +447,7 @@ static int hdlcdrv_send_packet(struct sk
 
 	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_send_packet"))
 		return 0;
-	sm = (struct hdlcdrv_state *)dev->priv;
+	sm = dev->priv;
 	if (skb->data[0] != 0) {
 		do_kiss_params(sm, skb->data, skb->len);
 		dev_kfree_skb(skb);
@@ -464,7 +464,7 @@ static int hdlcdrv_send_packet(struct sk
 
 static int hdlcdrv_set_mac_address(struct net_device *dev, void *addr)
 {
-	struct sockaddr *sa = (struct sockaddr *)addr;
+	struct sockaddr *sa = addr;
 
 	/* addr is an AX.25 shifted ASCII mac address */
 	memcpy(dev->dev_addr, sa->sa_data, dev->addr_len); 
@@ -479,7 +479,7 @@ static struct net_device_stats *hdlcdrv_
 
 	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_get_stats"))
 		return NULL;
-	sm = (struct hdlcdrv_state *)dev->priv;
+	sm = dev->priv;
 	/* 
 	 * Get the current statistics.  This may be called with the
 	 * card open or closed. 
@@ -504,7 +504,7 @@ static int hdlcdrv_open(struct net_devic
 
 	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_open"))
 		return -EINVAL;
-	s = (struct hdlcdrv_state *)dev->priv;
+	s = dev->priv;
 
 	if (!s->ops || !s->ops->open)
 		return -ENODEV;
@@ -545,7 +545,7 @@ static int hdlcdrv_close(struct net_devi
 
 	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_close"))
 		return -EINVAL;
-	s = (struct hdlcdrv_state *)dev->priv;
+	s = dev->priv;
 
 	netif_stop_queue(dev);
 
@@ -567,7 +567,7 @@ static int hdlcdrv_ioctl(struct net_devi
 		
 	if (hdlcdrv_paranoia_check(dev, "hdlcdrv_ioctl"))
 		return -EINVAL;
-	s = (struct hdlcdrv_state *)dev->priv;
+	s = dev->priv;
 
 	if (cmd != SIOCDEVPRIVATE) {
 		if (s->ops && s->ops->ioctl)
diff -pruNX dontdiff c/drivers/net/hamradio/mkiss.c a/drivers/net/hamradio/mkiss.c
--- c/drivers/net/hamradio/mkiss.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/net/hamradio/mkiss.c	2004-12-29 23:20:02.000000000 +0100
@@ -396,7 +396,7 @@ static void ax_encaps(struct ax_disp *ax
 static void ax25_write_wakeup(struct tty_struct *tty)
 {
 	int actual;
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+	struct ax_disp *ax = tty->disc_data;
 
 	/* First make sure we're connected. */
 	if (ax == NULL || ax->magic != AX25_MAGIC || !netif_running(ax->dev))
@@ -419,7 +419,7 @@ static void ax25_write_wakeup(struct tty
 /* Encapsulate an AX.25 packet and kick it into a TTY queue. */
 static int ax_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = dev->priv;
 
 	if (!netif_running(dev))  {
 		printk(KERN_ERR "mkiss: %s: xmit call when iface is down\n", dev->name);
@@ -483,7 +483,7 @@ static int ax_rebuild_header(struct sk_b
 /* Open the low-level part of the AX25 channel. Easy! */
 static int ax_open(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = dev->priv;
 	unsigned long len;
 
 	if (ax->tty == NULL)
@@ -534,7 +534,7 @@ norbuff:
 /* Close the low-level part of the AX25 channel. Easy! */
 static int ax_close(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = dev->priv;
 
 	if (ax->tty == NULL)
 		return -EBUSY;
@@ -559,7 +559,7 @@ static int ax25_receive_room(struct tty_
  */
 static void ax25_receive_buf(struct tty_struct *tty, const unsigned char *cp, char *fp, int count)
 {
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+	struct ax_disp *ax = tty->disc_data;
 
 	if (ax == NULL || ax->magic != AX25_MAGIC || !netif_running(ax->dev))
 		return;
@@ -586,7 +586,7 @@ static void ax25_receive_buf(struct tty_
 
 static int ax25_open(struct tty_struct *tty)
 {
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+	struct ax_disp *ax = tty->disc_data;
 	int err;
 
 	/* First make sure we're not already connected. */
@@ -616,7 +616,7 @@ static int ax25_open(struct tty_struct *
 
 static void ax25_close(struct tty_struct *tty)
 {
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+	struct ax_disp *ax = tty->disc_data;
 
 	/* First make sure we're connected. */
 	if (ax == NULL || ax->magic != AX25_MAGIC)
@@ -634,7 +634,7 @@ static void ax25_close(struct tty_struct
 static struct net_device_stats *ax_get_stats(struct net_device *dev)
 {
 	static struct net_device_stats stats;
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = dev->priv;
 
 	memset(&stats, 0, sizeof(struct net_device_stats));
 
@@ -792,7 +792,7 @@ static int ax_set_dev_mac_address(struct
 /* Perform I/O control on an active ax25 channel. */
 static int ax25_disp_ioctl(struct tty_struct *tty, void *file, int cmd, void __user *arg)
 {
-	struct ax_disp *ax = (struct ax_disp *) tty->disc_data;
+	struct ax_disp *ax = tty->disc_data;
 	unsigned int tmp;
 
 	/* First make sure we're connected. */
@@ -827,7 +827,7 @@ static int ax25_disp_ioctl(struct tty_st
 
 static int ax_open_dev(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = dev->priv;
 
 	if (ax->tty == NULL)
 		return -ENODEV;
@@ -839,7 +839,7 @@ static int ax_open_dev(struct net_device
 /* Initialize the driver.  Called by network startup. */
 static int ax25_init(struct net_device *dev)
 {
-	struct ax_disp *ax = (struct ax_disp *) dev->priv;
+	struct ax_disp *ax = dev->priv;
 
 	static char ax25_bcast[AX25_ADDR_LEN] =
 		{'Q'<<1,'S'<<1,'T'<<1,' '<<1,' '<<1,' '<<1,'0'<<1};
diff -pruNX dontdiff c/drivers/net/hamradio/scc.c a/drivers/net/hamradio/scc.c
--- c/drivers/net/hamradio/scc.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/net/hamradio/scc.c	2004-12-29 23:20:02.000000000 +0100
@@ -1581,7 +1581,7 @@ static void scc_net_setup(struct net_dev
 
 static int scc_net_open(struct net_device *dev)
 {
-	struct scc_channel *scc = (struct scc_channel *) dev->priv;
+	struct scc_channel *scc = dev->priv;
 
  	if (!scc->init)
 		return -EINVAL;
@@ -1599,7 +1599,7 @@ static int scc_net_open(struct net_devic
 
 static int scc_net_close(struct net_device *dev)
 {
-	struct scc_channel *scc = (struct scc_channel *) dev->priv;
+	struct scc_channel *scc = dev->priv;
 	unsigned long flags;
 
 	netif_stop_queue(dev);
@@ -1644,7 +1644,7 @@ static void scc_net_rx(struct scc_channe
 
 static int scc_net_tx(struct sk_buff *skb, struct net_device *dev)
 {
-	struct scc_channel *scc = (struct scc_channel *) dev->priv;
+	struct scc_channel *scc = dev->priv;
 	unsigned long flags;
 	char kisscmd;
 
@@ -1714,7 +1714,7 @@ static int scc_net_ioctl(struct net_devi
 	struct scc_mem_config memcfg;
 	struct scc_hw_config hwcfg;
 	struct scc_calibrate cal;
-	struct scc_channel *scc = (struct scc_channel *) dev->priv;
+	struct scc_channel *scc = dev->priv;
 	int chan;
 	unsigned char device_name[IFNAMSIZ];
 	void __user *arg = ifr->ifr_data;
@@ -1950,7 +1950,7 @@ static int scc_net_ioctl(struct net_devi
 
 static int scc_net_set_mac_address(struct net_device *dev, void *addr)
 {
-	struct sockaddr *sa = (struct sockaddr *) addr;
+	struct sockaddr *sa = addr;
 	memcpy(dev->dev_addr, sa->sa_data, dev->addr_len);
 	return 0;
 }
@@ -1959,7 +1959,7 @@ static int scc_net_set_mac_address(struc
 
 static struct net_device_stats *scc_net_get_stats(struct net_device *dev)
 {
-	struct scc_channel *scc = (struct scc_channel *) dev->priv;
+	struct scc_channel *scc = dev->priv;
 	
 	scc->dev_stat.rx_errors = scc->stat.rxerrs + scc->stat.rx_over;
 	scc->dev_stat.tx_errors = scc->stat.txerrs + scc->stat.tx_under;
diff -pruNX dontdiff c/drivers/net/hamradio/yam.c a/drivers/net/hamradio/yam.c
--- c/drivers/net/hamradio/yam.c	2004-12-25 15:50:18.000000000 +0100
+++ a/drivers/net/hamradio/yam.c	2004-12-29 23:20:02.000000000 +0100
@@ -442,7 +442,7 @@ static int fpga_download(int iobase, int
 
 static void yam_set_uart(struct net_device *dev)
 {
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = dev->priv;
 	int divisor = 115200 / yp->baudrate;
 
 	outb(0, IER(dev->base_addr));
@@ -841,7 +841,7 @@ static struct net_device_stats *yam_get_
 	if (!dev || !dev->priv)
 		return NULL;
 
-	yp = (struct yam_port *) dev->priv;
+	yp = dev->priv;
 	if (yp->magic != YAM_MAGIC)
 		return NULL;
 
@@ -856,7 +856,7 @@ static struct net_device_stats *yam_get_
 
 static int yam_open(struct net_device *dev)
 {
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = dev->priv;
 	enum uart u;
 	int i;
 	int ret=0;
@@ -919,7 +919,7 @@ out_release_base:
 static int yam_close(struct net_device *dev)
 {
 	struct sk_buff *skb;
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = dev->priv;
 
 	if (!dev || !yp)
 		return -EINVAL;
@@ -944,7 +944,7 @@ static int yam_close(struct net_device *
 
 static int yam_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
-	struct yam_port *yp = (struct yam_port *) dev->priv;
+	struct yam_port *yp = dev->priv;
 	struct yamdrv_ioctl_cfg yi;
 	struct yamdrv_ioctl_mcs *ym;
 	int ioctl_cmd;
@@ -1080,7 +1080,7 @@ static int yam_ioctl(struct net_device *
 
 static int yam_set_mac_address(struct net_device *dev, void *addr)
 {
-	struct sockaddr *sa = (struct sockaddr *) addr;
+	struct sockaddr *sa = addr;
 
 	/* addr is an AX.25 shifted ASCII mac address */
 	memcpy(dev->dev_addr, sa->sa_data, dev->addr_len);
