From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] second set for 2.6.0-test1
Date: Thu, 24 Jul 2003 21:27:11 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030724212711.I281@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Py3IqQ4lEK4AGa5A"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, 9a4gl@9a0tcp.ampr.org


--Py3IqQ4lEK4AGa5A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is my second set of patches against 2.6.0-test1 to go addition to the
first set.
(some of the first changes are slightly modified i.e. the refcounting is
moved to the header file).
The biggest change is in netrom, it adds a lot of locking and refcounting
to nr_node and nr_neigh handling.

Changes:

	-Add ax25_cb_put() calls to netrom
	-Initialize ax25_iface lists to NULL
	-unlock linkfail_lock in ax25_linkfail_release()
	-unlock listen_lock in ax25_listen_release()
	-unlock_listen_lock in ax25_listen_mine()
	-remove module_owner from nr_init()
	-Only release/register listener in nr_set_mac_address() if
	 interface is up.
	-Call nr_destroy_socket() with socket locked
	-Free write queue in nr_destroy_socket()
	-Add missing sock_[unlock/release] calls in netrom code
	-nr_destroy_tmer set from 10*HZ to 2*HZ
	-Fixed net_device refcounting to nr_dev_first() and nr_dev_get()
	-Added nr_node & nr_neigh refcounting
	-Use hlists for nr_node_list and nr_neigh_list
	-Added nr_node locking
	-Prevent race between freeing dev.priv and freeing dev
	-Don't free dev.name on module exit
	-Fix error return value from ax25_connect()
	-Missing unlock in ax25_register_sysctl()
	-nr_route_frame() makes a private copy of skb's instead of using
	 the one given, it also reserves head room using hard_header_len
	 from the device the packet goes out removing the need for
	 AX25_BPQ_HEADER_LEN
	-Make ax25_cb refcounting inlined or macro.
	-Additional locking in ax25

Jeroen

--Py3IqQ4lEK4AGa5A
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="linux-2.6.0-test1.rxq2.diff"

diff -ru linux-2.6.0-test1.rxq/net/ax25/af_ax25.c linux-2.6.0-test1.rxq2/net/ax25/af_ax25.c
--- linux-2.6.0-test1.rxq/net/ax25/af_ax25.c	2003-07-24 20:22:47.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/af_ax25.c	2003-07-24 20:30:30.000000000 +0200
@@ -54,44 +54,8 @@
 HLIST_HEAD(ax25_list);
 spinlock_t ax25_list_lock = SPIN_LOCK_UNLOCKED;
 
-spinlock_t ax25_cb_lock = SPIN_LOCK_UNLOCKED;
-
 static struct proto_ops ax25_proto_ops;
 
-/*
- *	Free an allocated ax25 control block. This is done to centralise
- *	the MOD count code.
- */
-/*
- *	Changed name to include undescores. Nobody should call this without
- *	going through the ref counter anymore 
- *	- PE1RXQ
- */
-void __ax25_free_cb(ax25_cb *ax25)
-{
-	if (ax25->digipeat != NULL) {
-		kfree(ax25->digipeat);
-		ax25->digipeat = NULL;
-	}
-	kfree(ax25);
-}
-
-void ax25_cb_hold(ax25_cb *ax25)
-{
-	spin_lock_bh(&ax25_cb_lock);
-	ax25->refcount++;
-	spin_unlock_bh(&ax25_cb_lock);
-}
-
-void ax25_cb_put(ax25_cb *ax25)
-{
-	spin_lock_bh(&ax25_cb_lock);
-	ax25->refcount--;
-	if (!ax25->refcount)
-		__ax25_free_cb(ax25);
-	spin_unlock_bh(&ax25_cb_lock);
-}
-
 static void ax25_free_sock(struct sock *sk)
 {
 	ax25_cb_put(ax25_sk(sk));
@@ -121,11 +85,12 @@
 		return;
 
 	spin_lock_bh(&ax25_list_lock);
-	ax25_for_each(s, node, &ax25_list)
+	ax25_for_each(s, node, &ax25_list) {
 		if (s->ax25_dev == ax25_dev) {
 			s->ax25_dev = NULL;
 			ax25_disconnect(s, ENETUNREACH);
 		}
+	}
 	spin_unlock_bh(&ax25_list_lock);
 }
 
@@ -188,7 +153,6 @@
 			if (s->ax25_dev == NULL || s->ax25_dev->dev == dev) {
 				sock_hold(s->sk);
 				spin_unlock_bh(&ax25_list_lock);
-				
 				return s->sk;
 			}
 		}
@@ -272,13 +236,14 @@
 	struct hlist_node *node;
 
 	spin_lock_bh(&ax25_list_lock);
-	ax25_for_each(s, node, &ax25_list)
+	ax25_for_each(s, node, &ax25_list) {
 		if (s->sk != NULL && ax25cmp(&s->source_addr, addr) == 0 &&
 		    s->sk->sk_type == SOCK_RAW) {
 			sk = s->sk;
 			lock_sock(sk);
 			break;
 		}
+	}
 
 	spin_unlock_bh(&ax25_list_lock);
 
@@ -313,7 +278,9 @@
 static void ax25_destroy_timer(unsigned long data)
 {
 	ax25_cb *ax25=(ax25_cb *)data;
-	struct sock *sk=ax25->sk;
+	struct sock *sk;
+	
+	sk=ax25->sk;
 	
 	bh_lock_sock(sk);
 	sock_hold(sk);
@@ -446,7 +413,7 @@
 
   	case AX25_N2:
   		if (ax25_ctl.arg < 1 || ax25_ctl.arg > 31)
-  			return -EINVAL;
+			return -EINVAL;
   		ax25->n2count = 0;
   		ax25->n2 = ax25_ctl.arg;
   		break;
@@ -473,7 +440,7 @@
   		return -EINVAL;
 	  }
 
-	  return 0;
+	return 0;
 }
 
 /*
@@ -532,7 +499,7 @@
 		return NULL;
 
 	memset(ax25, 0x00, sizeof(*ax25));
-	ax25_cb_hold(ax25);
+	atomic_set(&ax25->refcount, 1);
 
 	skb_queue_head_init(&ax25->write_queue);
 	skb_queue_head_init(&ax25->frag_queue);
@@ -681,6 +648,7 @@
 		   (sock->state != SS_UNCONNECTED ||
 		    sk->sk_state == TCP_LISTEN)) {
 			res = -EADDRNOTAVAIL;
+			dev_put(dev);
 			break;
 		}
 
@@ -963,6 +931,7 @@
 	if (sk == NULL)
 		return 0;
 
+	sock_hold(sk);
 	lock_sock(sk);
 	ax25 = ax25_sk(sk);
 
@@ -1027,6 +996,7 @@
 	sock->sk   = NULL;
 	sk->sk_socket = NULL;	/* Not used, but we should do this */
 	release_sock(sk);
+	sock_put(sk);
 
 	return 0;
 }
@@ -1316,10 +1286,11 @@
 
 	sock->state = SS_CONNECTED;
 
+	err=0;
 out:
 	release_sock(sk);
 
-	return 0;
+	return err;
 }
 
 
@@ -1359,12 +1330,13 @@
 		if (skb)
 			break;
 
-		current->state = TASK_INTERRUPTIBLE;
 		release_sock(sk);
+		current->state = TASK_INTERRUPTIBLE;
 		if (flags & O_NONBLOCK)
 			return -EWOULDBLOCK;
 		if (!signal_pending(tsk)) {
 			schedule();
+			current->state = TASK_RUNNING;
 			lock_sock(sk);
 			continue;
 		}
@@ -1913,10 +1885,12 @@
 			ax25->paclen);
 
 		if (ax25->sk != NULL) {
+			bh_lock_sock(ax25->sk);
 			len += sprintf(buffer + len, " %d %d %ld\n",
 				atomic_read(&ax25->sk->sk_wmem_alloc),
 				atomic_read(&ax25->sk->sk_rmem_alloc),
 				ax25->sk->sk_socket != NULL ? SOCK_INODE(ax25->sk->sk_socket)->i_ino : 0L);
+			bh_unlock_sock(ax25->sk);
 		} else {
 			len += sprintf(buffer + len, " * * *\n");
 		}
@@ -1987,8 +1961,6 @@
 EXPORT_SYMBOL(ax25_rebuild_header);
 EXPORT_SYMBOL(ax25_findbyuid);
 EXPORT_SYMBOL(ax25_find_cb);
-EXPORT_SYMBOL(ax25_cb_hold);
-EXPORT_SYMBOL(ax25_cb_put);
 EXPORT_SYMBOL(ax25_linkfail_register);
 EXPORT_SYMBOL(ax25_linkfail_release);
 EXPORT_SYMBOL(ax25_listen_register);
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_ds_in.c linux-2.6.0-test1.rxq2/net/ax25/ax25_ds_in.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_ds_in.c	2003-07-24 20:22:47.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_ds_in.c	2003-07-24 16:05:20.000000000 +0200
@@ -65,6 +65,7 @@
 		ax25->state   = AX25_STATE_3;
 		ax25->n2count = 0;
 		if (ax25->sk != NULL) {
+			bh_lock_sock(ax25->sk);
 			ax25->sk->sk_state = TCP_ESTABLISHED;
 			/*
 			 * For WAIT_SABM connections we will produce an accept
@@ -72,6 +73,7 @@
 			 */
 			if (!sock_flag(ax25->sk, SOCK_DEAD))
 				ax25->sk->sk_state_change(ax25->sk);
+			bh_unlock_sock(ax25->sk);
 		}
 		ax25_dama_on(ax25);
 
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_ds_timer.c linux-2.6.0-test1.rxq2/net/ax25/ax25_ds_timer.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_ds_timer.c	2003-07-24 20:22:47.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_ds_timer.c	2003-07-24 16:06:16.000000000 +0200
@@ -172,6 +172,7 @@
 	ax25_stop_t3timer(ax25);
 
 	if (ax25->sk != NULL) {
+		bh_lock_sock(ax25->sk);
 		ax25->sk->sk_state     = TCP_CLOSE;
 		ax25->sk->sk_err       = 0;
 		ax25->sk->sk_shutdown |= SEND_SHUTDOWN;
@@ -179,6 +180,7 @@
 			ax25->sk->sk_state_change(ax25->sk);
 			sock_set_flag(ax25->sk, SOCK_DEAD);
 		}
+		bh_lock_sock(ax25->sk);
 	}
 }
 
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_in.c linux-2.6.0-test1.rxq2/net/ax25/ax25_in.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_in.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_in.c	2003-07-24 16:07:29.000000000 +0200
@@ -147,6 +147,7 @@
 	}
 
 	if (ax25->sk != NULL && ax25->ax25_dev->values[AX25_VALUES_CONMODE] == 2) {
+		bh_lock_sock(ax25->sk);
 		if ((!ax25->pidincl && ax25->sk->sk_protocol == pid) ||
 		    ax25->pidincl) {
 			if (sock_queue_rcv_skb(ax25->sk, skb) == 0)
@@ -154,6 +155,7 @@
 			else
 				ax25->condition |= AX25_COND_OWN_RX_BUSY;
 		}
+		bh_unlock_sock(ax25->sk);
 	}
 
 	return queued;
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_route.c linux-2.6.0-test1.rxq2/net/ax25/ax25_route.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_route.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_route.c	2003-07-24 16:08:30.000000000 +0200
@@ -435,8 +435,11 @@
 		ax25_adjust_path(addr, ax25->digipeat);
 	}
 
-	if (ax25->sk != NULL)
+	if (ax25->sk != NULL) {
+		bh_lock_sock(ax25->sk);
 		ax25->sk->sk_zapped = 0;
+		bh_unlock_sock(ax25->sk);
+	}
 
 put:
 	ax25_put_route(ax25_rt);
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_std_in.c linux-2.6.0-test1.rxq2/net/ax25/ax25_std_in.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_std_in.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_std_in.c	2003-07-24 16:58:42.000000000 +0200
@@ -73,10 +73,12 @@
 			ax25->state   = AX25_STATE_3;
 			ax25->n2count = 0;
 			if (ax25->sk != NULL) {
+				bh_lock_sock(ax25->sk);
 				ax25->sk->sk_state = TCP_ESTABLISHED;
 				/* For WAIT_SABM connections we will produce an accept ready socket here */
 				if (!sock_flag(ax25->sk, SOCK_DEAD))
 					ax25->sk->sk_state_change(ax25->sk);
+				bh_unlock_sock(ax25->sk);
 			}
 		}
 		break;
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_std_timer.c linux-2.6.0-test1.rxq2/net/ax25/ax25_std_timer.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_std_timer.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_std_timer.c	2003-07-24 16:53:18.000000000 +0200
@@ -108,6 +108,7 @@
 	ax25_stop_t3timer(ax25);
 
 	if (ax25->sk != NULL) {
+		bh_lock_sock(ax25->sk);
 		ax25->sk->sk_state     = TCP_CLOSE;
 		ax25->sk->sk_err       = 0;
 		ax25->sk->sk_shutdown |= SEND_SHUTDOWN;
@@ -115,6 +116,7 @@
 			ax25->sk->sk_state_change(ax25->sk);
 			sock_set_flag(ax25->sk, SOCK_DEAD);
 		}
+		bh_unlock_sock(ax25->sk);
 	}
 }
 
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_subr.c linux-2.6.0-test1.rxq2/net/ax25/ax25_subr.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_subr.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_subr.c	2003-07-24 16:11:08.000000000 +0200
@@ -282,6 +282,7 @@
 	ax25_link_failed(ax25, reason);
 
 	if (ax25->sk != NULL) {
+		bh_lock_sock(ax25->sk);
 		ax25->sk->sk_state     = TCP_CLOSE;
 		ax25->sk->sk_err       = reason;
 		ax25->sk->sk_shutdown |= SEND_SHUTDOWN;
@@ -289,5 +290,6 @@
 			ax25->sk->sk_state_change(ax25->sk);
 			sock_set_flag(ax25->sk, SOCK_DEAD);
 		}
+		bh_unlock_sock(ax25->sk);
 	}
 }
diff -ru linux-2.6.0-test1.rxq/net/ax25/ax25_timer.c linux-2.6.0-test1.rxq2/net/ax25/ax25_timer.c
--- linux-2.6.0-test1.rxq/net/ax25/ax25_timer.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/ax25_timer.c	2003-07-24 16:14:21.000000000 +0200
@@ -141,13 +141,10 @@
 {
 	int proto = AX25_PROTO_STD_SIMPLEX;
 	ax25_cb *ax25 = (ax25_cb *)param;
-	struct sock *sk = ax25->sk;
 
 	if (ax25->ax25_dev)
 		proto = ax25->ax25_dev->values[AX25_VALUES_PROTOCOL];
 
-	bh_lock_sock(sk);
-
 	switch (proto) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -163,15 +160,12 @@
 		break;
 #endif
 	}
-	bh_unlock_sock(sk);
 }
 
 static void ax25_t1timer_expiry(unsigned long param)
 {
 	ax25_cb *ax25 = (ax25_cb *)param;
-	struct sock *sk = ax25->sk;
 
-	bh_lock_sock(sk);
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -185,15 +179,12 @@
 		break;
 #endif
 	}
-	bh_unlock_sock(sk);
 }
 
 static void ax25_t2timer_expiry(unsigned long param)
 {
 	ax25_cb *ax25 = (ax25_cb *)param;
-	struct sock *sk = ax25->sk;
 
-	bh_lock_sock(sk);
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -207,15 +198,12 @@
 		break;
 #endif
 	}
-	bh_unlock_sock(sk);
 }
 
 static void ax25_t3timer_expiry(unsigned long param)
 {
 	ax25_cb *ax25 = (ax25_cb *)param;
-	struct sock *sk = ax25->sk;
 
-	bh_lock_sock(sk);
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -231,15 +219,12 @@
 		break;
 #endif
 	}
-	bh_unlock_sock(sk);
 }
 
 static void ax25_idletimer_expiry(unsigned long param)
 {
 	ax25_cb *ax25 = (ax25_cb *)param;
-	struct sock *sk = ax25->sk;
 
-	bh_lock_sock(sk);
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -255,5 +240,4 @@
 		break;
 #endif
 	}
-	bh_unlock_sock(sk);
 }
diff -ru linux-2.6.0-test1.rxq/net/ax25/sysctl_net_ax25.c linux-2.6.0-test1.rxq2/net/ax25/sysctl_net_ax25.c
--- linux-2.6.0-test1.rxq/net/ax25/sysctl_net_ax25.c	2003-07-24 20:22:48.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/ax25/sysctl_net_ax25.c	2003-07-23 20:45:27.000000000 +0200
@@ -204,8 +204,10 @@
 	for (ax25_table_size = sizeof(ctl_table), ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
 		ax25_table_size += sizeof(ctl_table);
 
-	if ((ax25_table = kmalloc(ax25_table_size, GFP_ATOMIC)) == NULL)
+	if ((ax25_table = kmalloc(ax25_table_size, GFP_ATOMIC)) == NULL) {
+		spin_unlock_bh(&ax25_dev_lock);
 		return;
+	}
 
 	memset(ax25_table, 0x00, ax25_table_size);
 
diff -ru linux-2.6.0-test1.rxq/net/netrom/af_netrom.c linux-2.6.0-test1.rxq2/net/netrom/af_netrom.c
--- linux-2.6.0-test1.rxq/net/netrom/af_netrom.c	2003-07-24 20:26:16.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/netrom/af_netrom.c	2003-07-24 00:30:49.000000000 +0200
@@ -147,8 +147,10 @@
 	spin_lock_bh(&nr_list_lock);
 	sk_for_each(s, node, &nr_list)
 		if (!ax25cmp(&nr_sk(s)->source_addr, addr) &&
-		    s->sk_state == TCP_LISTEN)
+		    s->sk_state == TCP_LISTEN) {
+		    	bh_lock_sock(s);
 			goto found;
+		}
 	s = NULL;
 found:
 	spin_unlock_bh(&nr_list_lock);
@@ -167,8 +169,10 @@
 	sk_for_each(s, node, &nr_list) {
 		nr_cb *nr = nr_sk(s);
 		
-		if (nr->my_index == index && nr->my_id == id)
+		if (nr->my_index == index && nr->my_id == id) {
+			bh_lock_sock(s);
 			goto found;
+		}
 	}
 	s = NULL;
 found:
@@ -190,8 +194,10 @@
 		nr_cb *nr = nr_sk(s);
 		
 		if (nr->your_index == index && nr->your_id == id &&
-		    !ax25cmp(&nr->dest_addr, dest))
+		    !ax25cmp(&nr->dest_addr, dest)) {
+		    	bh_lock_sock(s);
 			goto found;
+		}
 	}
 	s = NULL;
 found:
@@ -206,14 +212,17 @@
 {
 	unsigned short id = circuit;
 	unsigned char i, j;
+	struct sock *sk;
 
 	for (;;) {
 		i = id / 256;
 		j = id % 256;
 
-		if (i != 0 && j != 0)
-			if (nr_find_socket(i, j) == NULL)
+		if (i != 0 && j != 0) {
+			if ((sk=nr_find_socket(i, j)) == NULL)
 				break;
+			bh_unlock_sock(sk);
+		}
 
 		id++;
 	}
@@ -231,7 +240,12 @@
  */
 static void nr_destroy_timer(unsigned long data)
 {
-	nr_destroy_socket((struct sock *)data);
+	struct sock *sk=(struct sock *)data;
+	bh_lock_sock(sk);
+	sock_hold(sk);
+	nr_destroy_socket(sk);
+	bh_unlock_sock(sk);
+	sock_put(sk);
 }
 
 /*
@@ -264,17 +278,20 @@
 
 		kfree_skb(skb);
 	}
+	while ((skb = skb_dequeue(&sk->sk_write_queue)) != NULL) {
+		kfree_skb(skb);
+	}
 
 	if (atomic_read(&sk->sk_wmem_alloc) ||
 	    atomic_read(&sk->sk_rmem_alloc)) {
 		/* Defer: outstanding buffers */
 		init_timer(&sk->sk_timer);
-		sk->sk_timer.expires  = jiffies + 10 * HZ;
+		sk->sk_timer.expires  = jiffies + 2 * HZ;
 		sk->sk_timer.function = nr_destroy_timer;
 		sk->sk_timer.data     = (unsigned long)sk;
 		add_timer(&sk->sk_timer);
 	} else
-		sk_free(sk);
+		sock_put(sk);
 }
 
 /*
@@ -388,12 +405,15 @@
 {
 	struct sock *sk = sock->sk;
 
+	lock_sock(sk);
 	if (sk->sk_state != TCP_LISTEN) {
 		memset(&nr_sk(sk)->user_addr, 0, AX25_ADDR_LEN);
 		sk->sk_max_ack_backlog = backlog;
 		sk->sk_state           = TCP_LISTEN;
+		release_sock(sk);
 		return 0;
 	}
+	release_sock(sk);
 
 	return -EOPNOTSUPP;
 }
@@ -495,6 +515,7 @@
 
 	if (sk == NULL) return 0;
 
+	lock_sock(sk);
 	nr = nr_sk(sk);
 
 	switch (nr->state) {
@@ -528,6 +549,7 @@
 	}
 
 	sock->sk   = NULL;	
+	release_sock(sk);
 
 	return 0;
 }
@@ -540,21 +562,26 @@
 	struct net_device *dev;
 	ax25_address *user, *source;
 
-	if (!sk->sk_zapped)
+	lock_sock(sk);
+	if (!sk->sk_zapped) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr_len < sizeof(struct sockaddr_ax25) || addr_len > sizeof(struct
-full_sockaddr_ax25))
+	}
+	if (addr_len < sizeof(struct sockaddr_ax25) || addr_len > sizeof(struct full_sockaddr_ax25)) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr_len < (addr->fsa_ax25.sax25_ndigis * sizeof(ax25_address) + sizeof(struct sockaddr_ax25)))
+	}
+	if (addr_len < (addr->fsa_ax25.sax25_ndigis * sizeof(ax25_address) + sizeof(struct sockaddr_ax25))) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr->fsa_ax25.sax25_family != AF_NETROM)
+	}
+	if (addr->fsa_ax25.sax25_family != AF_NETROM) {
+		release_sock(sk);
 		return -EINVAL;
-
+	}
 	if ((dev = nr_dev_get(&addr->fsa_ax25.sax25_call)) == NULL) {
 		SOCK_DEBUG(sk, "NET/ROM: bind failed: invalid node callsign\n");
+		release_sock(sk);
 		return -EADDRNOTAVAIL;
 	}
 
@@ -562,16 +589,22 @@
 	 * Only the super user can set an arbitrary user callsign.
 	 */
 	if (addr->fsa_ax25.sax25_ndigis == 1) {
-		if (!capable(CAP_NET_BIND_SERVICE))
+		if (!capable(CAP_NET_BIND_SERVICE)) {
+			dev_put(dev);
+			release_sock(sk);
 			return -EACCES;
+		}
 		nr->user_addr   = addr->fsa_digipeater[0];
 		nr->source_addr = addr->fsa_ax25.sax25_call;
 	} else {
 		source = &addr->fsa_ax25.sax25_call;
 
 		if ((user = ax25_findbyuid(current->euid)) == NULL) {
-			if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE))
+			if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
+				release_sock(sk);
+				dev_put(dev);
 				return -EPERM;
+			}
 			user = source;
 		}
 
@@ -583,6 +616,8 @@
 	nr_insert_socket(sk);
 
 	sk->sk_zapped = 0;
+	dev_put(dev);
+	release_sock(sk);
 	SOCK_DEBUG(sk, "NET/ROM: socket is bound\n");
 	return 0;
 }
@@ -596,39 +631,50 @@
 	ax25_address *user, *source = NULL;
 	struct net_device *dev;
 
+	lock_sock(sk);
 	if (sk->sk_state == TCP_ESTABLISHED && sock->state == SS_CONNECTING) {
 		sock->state = SS_CONNECTED;
+		release_sock(sk);
 		return 0;	/* Connect completed during a ERESTARTSYS event */
 	}
 
 	if (sk->sk_state == TCP_CLOSE && sock->state == SS_CONNECTING) {
 		sock->state = SS_UNCONNECTED;
+		release_sock(sk);
 		return -ECONNREFUSED;
 	}
 
-	if (sk->sk_state == TCP_ESTABLISHED)
+	if (sk->sk_state == TCP_ESTABLISHED) {
+		release_sock(sk);
 		return -EISCONN;	/* No reconnect on a seqpacket socket */
+	}
 
 	sk->sk_state   = TCP_CLOSE;	
 	sock->state = SS_UNCONNECTED;
 
-	if (addr_len != sizeof(struct sockaddr_ax25) && addr_len != sizeof(struct full_sockaddr_ax25))
+	if (addr_len != sizeof(struct sockaddr_ax25) && addr_len != sizeof(struct full_sockaddr_ax25)) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr->sax25_family != AF_NETROM)
+	}
+	if (addr->sax25_family != AF_NETROM) {
+		release_sock(sk);
 		return -EINVAL;
-
+	}
 	if (sk->sk_zapped) {	/* Must bind first - autobinding in this may or may not work */
 		sk->sk_zapped = 0;
 
-		if ((dev = nr_dev_first()) == NULL)
+		if ((dev = nr_dev_first()) == NULL) {
+			release_sock(sk);
 			return -ENETUNREACH;
-
+		}
 		source = (ax25_address *)dev->dev_addr;
 
 		if ((user = ax25_findbyuid(current->euid)) == NULL) {
-			if (ax25_uid_policy && !capable(CAP_NET_ADMIN))
+			if (ax25_uid_policy && !capable(CAP_NET_ADMIN)) {
+				dev_put(dev);
+				release_sock(sk);
 				return -EPERM;
+			}
 			user = source;
 		}
 
@@ -636,12 +682,15 @@
 		nr->source_addr = *source;
 		nr->device      = dev;
 
+		dev_put(dev);
 		nr_insert_socket(sk);		/* Finish the bind */
 	}
 
 	nr->dest_addr = addr->sax25_call;
 
+	release_sock(sk);
 	circuit = nr_find_next_circuit();
+	lock_sock(sk);
 
 	nr->my_index = circuit / 256;
 	nr->my_id    = circuit % 256;
@@ -659,8 +708,10 @@
 	nr_start_heartbeat(sk);
 
 	/* Now the loop */
-	if (sk->sk_state != TCP_ESTABLISHED && (flags & O_NONBLOCK))
+	if (sk->sk_state != TCP_ESTABLISHED && (flags & O_NONBLOCK)) {
+		release_sock(sk);
 		return -EINPROGRESS;
+	}
 		
 	/*
 	 * A Connect Ack with Choke or timeout or failed routing will go to
@@ -675,8 +726,10 @@
 			set_current_state(TASK_INTERRUPTIBLE);
 			if (sk->sk_state != TCP_SYN_SENT)
 				break;
+			release_sock(sk);
 			if (!signal_pending(tsk)) {
 				schedule();
+				lock_sock(sk);
 				continue;
 			}
 			return -ERESTARTSYS;
@@ -687,10 +740,12 @@
 
 	if (sk->sk_state != TCP_ESTABLISHED) {
 		sock->state = SS_UNCONNECTED;
+		release_sock(sk);
 		return sock_error(sk);	/* Always set at this point */
 	}
 
 	sock->state = SS_CONNECTED;
+	release_sock(sk);
 
 	return 0;
 }
@@ -753,6 +808,7 @@
 	newsock->sk = newsk;
 
 out:
+	release_sock(sk);
 	return err;
 }
 
@@ -763,9 +819,12 @@
 	struct sock *sk = sock->sk;
 	nr_cb *nr = nr_sk(sk);
 
+	lock_sock(sk);
 	if (peer != 0) {
-		if (sk->sk_state != TCP_ESTABLISHED)
+		if (sk->sk_state != TCP_ESTABLISHED) {
+			release_sock(sk);
 			return -ENOTCONN;
+		}
 		sax->fsa_ax25.sax25_family = AF_NETROM;
 		sax->fsa_ax25.sax25_ndigis = 1;
 		sax->fsa_ax25.sax25_call   = nr->user_addr;
@@ -777,6 +836,7 @@
 		sax->fsa_ax25.sax25_call   = nr->source_addr;
 		*uaddr_len = sizeof(struct sockaddr_ax25);
 	}
+	release_sock(sk);
 
 	return 0;
 }
@@ -790,6 +850,7 @@
 	unsigned short circuit_index, circuit_id;
 	unsigned short peer_circuit_index, peer_circuit_id;
 	unsigned short frametype, flags, window, timeout;
+	int ret;
 
 	skb->sk = NULL;		/* Initially we don't know who it's for */
 
@@ -847,7 +908,9 @@
 		else
 			nr_sk(sk)->bpqext = 0;
 
-		return nr_process_rx_frame(sk, skb);
+		ret = nr_process_rx_frame(sk, skb);
+		bh_unlock_sock(sk);
+		return ret;
 	}
 
 	/*
@@ -877,6 +940,8 @@
 	if (!sk || sk->sk_ack_backlog == sk->sk_max_ack_backlog ||
 	    (make = nr_make_new(sk)) == NULL) {
 		nr_transmit_refusal(skb, 0);
+		if (sk)
+			bh_unlock_sock(sk);
 		return 0;
 	}
 
@@ -894,7 +959,9 @@
 	nr_make->your_index  = circuit_index;
 	nr_make->your_id     = circuit_id;
 
+	bh_unlock_sock(sk);
 	circuit = nr_find_next_circuit();
+	bh_lock_sock(sk);
 
 	nr_make->my_index    = circuit / 256;
 	nr_make->my_id       = circuit % 256;
@@ -936,6 +1003,7 @@
 	if (!sock_flag(sk, SOCK_DEAD))
 		sk->sk_data_ready(sk, skb->len);
 
+	bh_unlock_sock(sk);
 	return 1;
 }
 
@@ -954,28 +1022,42 @@
 	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_EOR))
 		return -EINVAL;
 
-	if (sk->sk_zapped)
-		return -EADDRNOTAVAIL;
+	lock_sock(sk);
+	if (sk->sk_zapped) {
+		err = -EADDRNOTAVAIL;
+		goto out;
+	}
 
 	if (sk->sk_shutdown & SEND_SHUTDOWN) {
 		send_sig(SIGPIPE, current, 0);
-		return -EPIPE;
+		err = -EPIPE;
+		goto out;
 	}
 
-	if (nr->device == NULL)
-		return -ENETUNREACH;
+	if (nr->device == NULL) {
+		err = -ENETUNREACH;
+		goto out;
+	}
 
 	if (usax) {
-		if (msg->msg_namelen < sizeof(sax))
-			return -EINVAL;
+		if (msg->msg_namelen < sizeof(sax)) {
+			err = -EINVAL;
+			goto out;
+		}
 		sax = *usax;
-		if (ax25cmp(&nr->dest_addr, &sax.sax25_call) != 0)
-			return -EISCONN;
-		if (sax.sax25_family != AF_NETROM)
-			return -EINVAL;
+		if (ax25cmp(&nr->dest_addr, &sax.sax25_call) != 0) {
+			err = -EISCONN;
+			goto out;
+		}
+		if (sax.sax25_family != AF_NETROM) {
+			err = -EINVAL;
+			goto out;
+		}
 	} else {
-		if (sk->sk_state != TCP_ESTABLISHED)
-			return -ENOTCONN;
+		if (sk->sk_state != TCP_ESTABLISHED) {
+			err = -ENOTCONN;
+			goto out;
+		}
 		sax.sax25_family = AF_NETROM;
 		sax.sax25_call   = nr->dest_addr;
 	}
@@ -984,10 +1066,10 @@
 
 	/* Build a packet */
 	SOCK_DEBUG(sk, "NET/ROM: sendto: building packet.\n");
-	size = len + AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
+	size = len + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
 
 	if ((skb = sock_alloc_send_skb(sk, size, msg->msg_flags & MSG_DONTWAIT, &err)) == NULL)
-		return err;
+		goto out;
 
 	skb_reserve(skb, size - len);
 
@@ -1022,12 +1104,16 @@
 
 	if (sk->sk_state != TCP_ESTABLISHED) {
 		kfree_skb(skb);
-		return -ENOTCONN;
+		err = -ENOTCONN;
+		goto out;
 	}
 
 	nr_output(sk, skb);	/* Shove it onto the queue */
 
-	return len;
+	err = len;
+out:
+	release_sock(sk);
+	return err;
 }
 
 static int nr_recvmsg(struct kiocb *iocb, struct socket *sock,
@@ -1044,12 +1130,17 @@
 	 * us! We do one quick check first though
 	 */
 
-	if (sk->sk_state != TCP_ESTABLISHED)
+	lock_sock(sk);
+	if (sk->sk_state != TCP_ESTABLISHED) {
+		release_sock(sk);
 		return -ENOTCONN;
+	}
 
 	/* Now we can treat all alike */
-	if ((skb = skb_recv_datagram(sk, flags & ~MSG_DONTWAIT, flags & MSG_DONTWAIT, &er)) == NULL)
+	if ((skb = skb_recv_datagram(sk, flags & ~MSG_DONTWAIT, flags & MSG_DONTWAIT, &er)) == NULL) {
+		release_sock(sk);
 		return er;
+	}
 
 	skb->h.raw = skb->data;
 	copied     = skb->len;
@@ -1070,6 +1161,7 @@
 
 	skb_free_datagram(sk, skb);
 
+	release_sock(sk);
 	return copied;
 }
 
@@ -1077,13 +1169,16 @@
 static int nr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 {
 	struct sock *sk = sock->sk;
+	int ret;
 
+	lock_sock(sk);
 	switch (cmd) {
 	case TIOCOUTQ: {
 		long amount;
 		amount = sk->sk_sndbuf - atomic_read(&sk->sk_wmem_alloc);
 		if (amount < 0)
 			amount = 0;
+		release_sock(sk);
 		return put_user(amount, (int *)arg);
 	}
 
@@ -1093,15 +1188,21 @@
 		/* These two are safe on a single CPU system as only user tasks fiddle here */
 		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
 			amount = skb->len;
+		release_sock(sk);
 		return put_user(amount, (int *)arg);
 	}
 
 	case SIOCGSTAMP:
 		if (sk != NULL) {
-			if (!sk->sk_stamp.tv_sec)
+			if (!sk->sk_stamp.tv_sec) {
+				release_sock(sk);
 				return -ENOENT;
-			return copy_to_user((void *)arg, &sk->sk_stamp, sizeof(struct timeval)) ? -EFAULT : 0;
+			}
+			ret = copy_to_user((void *)arg, &sk->sk_stamp, sizeof(struct timeval)) ? -EFAULT : 0;
+			release_sock(sk);
+			return ret;
 		}
+		release_sock(sk);
 		return -EINVAL;
 
 	case SIOCGIFADDR:
@@ -1114,17 +1215,21 @@
 	case SIOCSIFNETMASK:
 	case SIOCGIFMETRIC:
 	case SIOCSIFMETRIC:
+		release_sock(sk);
 		return -EINVAL;
 
 	case SIOCADDRT:
 	case SIOCDELRT:
 	case SIOCNRDECOBS:
+		release_sock(sk);
 		if (!capable(CAP_NET_ADMIN)) return -EPERM;
 		return nr_rt_ioctl(cmd, (void *)arg);
 
 	default:
+		release_sock(sk);
 		return dev_ioctl(cmd, (void *)arg);
 	}
+	release_sock(sk);
 
 	return 0;
 }
@@ -1144,7 +1249,9 @@
 	len += sprintf(buffer, "user_addr dest_node src_node  dev    my  your  st  vs  vr  va    t1     t2     t4      idle   n2  wnd Snd-Q Rcv-Q inode\n");
 
 	sk_for_each(s, node, &nr_list) {
-		nr_cb *nr = nr_sk(s);
+		nr_cb *nr;
+		bh_lock_sock(s);
+		nr = nr_sk(s);
 
 		if ((dev = nr->device) == NULL)
 			devname = "???";
@@ -1187,7 +1294,7 @@
 			len   = 0;
 			begin = pos;
 		}
-
+		bh_unlock_sock(s);
 		if (pos > offset + length)
 			break;
 	}
@@ -1256,6 +1363,7 @@
 
 	for (i = 0; i < nr_ndevs; i++) {
 		sprintf(dev_nr[i].name, "nr%d", i);
+		dev_nr[i].base_addr = i;
 		dev_nr[i].init = nr_init;
 		register_netdev(&dev_nr[i]);
 	}
@@ -1300,23 +1408,23 @@
 
 	nr_rt_free();
 
-	ax25_protocol_release(AX25_P_NETROM);
+#ifdef CONFIG_SYSCTL
+	nr_unregister_sysctl();
+#endif
+
 	ax25_linkfail_release(nr_link_failed);
+	ax25_protocol_release(AX25_P_NETROM);
 
 	unregister_netdevice_notifier(&nr_dev_notifier);
 
-#ifdef CONFIG_SYSCTL
-	nr_unregister_sysctl();
-#endif
 	sock_unregister(PF_NETROM);
 
 	for (i = 0; i < nr_ndevs; i++) {
 		if (dev_nr[i].priv != NULL) {
+			unregister_netdev(&dev_nr[i]);
 			kfree(dev_nr[i].priv);
 			dev_nr[i].priv = NULL;
-			unregister_netdev(&dev_nr[i]);
 		}
-		kfree(dev_nr[i].name);
 	}
 
 	kfree(dev_nr);
diff -ru linux-2.6.0-test1.rxq/net/netrom/nr_dev.c linux-2.6.0-test1.rxq2/net/netrom/nr_dev.c
--- linux-2.6.0-test1.rxq/net/netrom/nr_dev.c	2003-07-24 20:26:16.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/netrom/nr_dev.c	2003-07-24 00:32:09.000000000 +0200
@@ -159,11 +159,13 @@
 {
 	struct sockaddr *sa = addr;
 
-	ax25_listen_release((ax25_address *)dev->dev_addr, NULL);
+	if (dev->flags & IFF_UP)
+		ax25_listen_release((ax25_address *)dev->dev_addr, NULL);
 
 	memcpy(dev->dev_addr, sa->sa_data, dev->addr_len);
 
-	ax25_listen_register((ax25_address *)dev->dev_addr, NULL);
+	if (dev->flags & IFF_UP)
+		ax25_listen_register((ax25_address *)dev->dev_addr, NULL);
 
 	return 0;
 }
@@ -177,8 +179,8 @@
 
 static int nr_close(struct net_device *dev)
 {
-	netif_stop_queue(dev);
 	ax25_listen_release((ax25_address *)dev->dev_addr, NULL);
+	netif_stop_queue(dev);
 	return 0;
 }
 
@@ -197,16 +199,16 @@
 
 int nr_init(struct net_device *dev)
 {
-	SET_MODULE_OWNER(dev);
 	dev->mtu		= NR_MAX_PACKET_SIZE;
 	dev->hard_start_xmit	= nr_xmit;
 	dev->open		= nr_open;
 	dev->stop		= nr_close;
 
 	dev->hard_header	= nr_header;
-	dev->hard_header_len	= AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
+	dev->hard_header_len	= NR_NETWORK_LEN + NR_TRANSPORT_LEN;
 	dev->addr_len		= AX25_ADDR_LEN;
 	dev->type		= ARPHRD_NETROM;
+	dev->tx_queue_len	= 40;
 	dev->rebuild_header	= nr_rebuild_header;
 	dev->set_mac_address    = nr_set_mac_address;
 
diff -ru linux-2.6.0-test1.rxq/net/netrom/nr_in.c linux-2.6.0-test1.rxq2/net/netrom/nr_in.c
--- linux-2.6.0-test1.rxq/net/netrom/nr_in.c	2003-07-24 20:26:16.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/netrom/nr_in.c	2003-07-22 12:38:24.000000000 +0200
@@ -74,6 +74,7 @@
 static int nr_state1_machine(struct sock *sk, struct sk_buff *skb,
 	int frametype)
 {
+	bh_lock_sock(sk);
 	switch (frametype) {
 	case NR_CONNACK: {
 		nr_cb *nr = nr_sk(sk);
@@ -102,6 +103,7 @@
 	default:
 		break;
 	}
+	bh_unlock_sock(sk);
 
 	return 0;
 }
@@ -114,6 +116,7 @@
 static int nr_state2_machine(struct sock *sk, struct sk_buff *skb,
 	int frametype)
 {
+	bh_lock_sock(sk);
 	switch (frametype) {
 	case NR_CONNACK | NR_CHOKE_FLAG:
 		nr_disconnect(sk, ECONNRESET);
@@ -129,6 +132,7 @@
 	default:
 		break;
 	}
+	bh_unlock_sock(sk);
 
 	return 0;
 }
@@ -150,6 +154,7 @@
 	nr = skb->data[18];
 	ns = skb->data[17];
 
+	bh_lock_sock(sk);
 	switch (frametype) {
 	case NR_CONNREQ:
 		nr_write_internal(sk, NR_CONNACK);
@@ -260,6 +265,7 @@
 	default:
 		break;
 	}
+	bh_unlock_sock(sk);
 
 	return queued;
 }
diff -ru linux-2.6.0-test1.rxq/net/netrom/nr_route.c linux-2.6.0-test1.rxq2/net/netrom/nr_route.c
--- linux-2.6.0-test1.rxq/net/netrom/nr_route.c	2003-07-24 20:26:16.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/netrom/nr_route.c	2003-07-24 19:32:30.000000000 +0200
@@ -39,10 +39,45 @@
 
 static unsigned int nr_neigh_no = 1;
 
-static struct nr_node  *nr_node_list;
-static spinlock_t nr_node_lock;
-static struct nr_neigh *nr_neigh_list;
-static spinlock_t nr_neigh_lock;
+HLIST_HEAD(nr_node_list);
+spinlock_t nr_node_list_lock = SPIN_LOCK_UNLOCKED;
+HLIST_HEAD(nr_neigh_list);
+spinlock_t nr_neigh_list_lock = SPIN_LOCK_UNLOCKED;
+
+struct nr_node *nr_node_get(ax25_address *callsign)
+{
+	struct nr_node *found = NULL;
+	struct nr_node *nr_node;
+	struct hlist_node *node;
+
+	spin_lock_bh(&nr_node_list_lock);
+	nr_node_for_each(nr_node, node, &nr_node_list)
+		if (ax25cmp(callsign, &nr_node->callsign) == 0) {
+			nr_node_hold(nr_node);
+			found = nr_node;
+			break;
+		}
+	spin_unlock_bh(&nr_node_list_lock);
+	return found;
+}
+
+struct nr_neigh *nr_neigh_get_dev(ax25_address *callsign, struct net_device *dev)
+{
+	struct nr_neigh *found = NULL;
+	struct nr_neigh *nr_neigh;
+	struct hlist_node *node;
+
+	spin_lock_bh(&nr_neigh_list_lock);
+	nr_neigh_for_each(nr_neigh, node, &nr_neigh_list)
+		if (ax25cmp(callsign, &nr_neigh->callsign) == 0 &&
+		    nr_neigh->dev == dev) {
+			nr_neigh_hold(nr_neigh);
+			found = nr_neigh;
+			break;
+		}
+	spin_unlock_bh(&nr_neigh_list_lock);
+	return found;
+}
 
 static void nr_remove_neigh(struct nr_neigh *);
 
@@ -57,17 +92,16 @@
 	struct nr_neigh *nr_neigh;
 	struct nr_route nr_route;
 	int i, found;
+	struct net_device *odev;
 
-	if (nr_dev_get(nr) != NULL)	/* Can't add routes to ourself */
+	if ((odev=nr_dev_get(nr)) != NULL) {	/* Can't add routes to ourself */
+		dev_put(odev);
 		return -EINVAL;
+	}
 
-	for (nr_node = nr_node_list; nr_node != NULL; nr_node = nr_node->next)
-		if (ax25cmp(nr, &nr_node->callsign) == 0)
-			break;
+	nr_node = nr_node_get(nr);
 
-	for (nr_neigh = nr_neigh_list; nr_neigh != NULL; nr_neigh = nr_neigh->next)
-		if (ax25cmp(ax25, &nr_neigh->callsign) == 0 && nr_neigh->dev == dev)
-			break;
+	nr_neigh = nr_neigh_get_dev(ax25, dev);
 
 	/*
 	 * The L2 link to a neighbour has failed in the past
@@ -76,24 +110,36 @@
 	 * routes now (and not wait for a node broadcast).
 	 */
 	if (nr_neigh != NULL && nr_neigh->failed != 0 && quality == 0) {
-		struct nr_node *node;
+		struct nr_node *nr_nodet;
+		struct hlist_node *node;
 
-		for (node = nr_node_list; node != NULL; node = node->next)
-			for (i = 0; i < node->count; i++)
-				if (node->routes[i].neighbour == nr_neigh)
-					if (i < node->which)
-						node->which = i;
+		spin_lock_bh(&nr_node_list_lock);
+		nr_node_for_each(nr_nodet, node, &nr_node_list) {
+			nr_node_lock(nr_nodet);
+			for (i = 0; i < nr_nodet->count; i++)
+				if (nr_nodet->routes[i].neighbour == nr_neigh)
+					if (i < nr_nodet->which)
+						nr_nodet->which = i;
+			nr_node_unlock(nr_nodet);
+		}
+		spin_unlock_bh(&nr_node_list_lock);
 	}
 
 	if (nr_neigh != NULL)
 		nr_neigh->failed = 0;
 
-	if (quality == 0 && nr_neigh != NULL && nr_node != NULL)
+	if (quality == 0 && nr_neigh != NULL && nr_node != NULL) {
+		nr_neigh_put(nr_neigh);
+		nr_node_put(nr_node);
 		return 0;
+	}
 
 	if (nr_neigh == NULL) {
-		if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL)
+		if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL) {
+			if (nr_node)
+				nr_node_put(nr_node);
 			return -ENOMEM;
+		}
 
 		nr_neigh->callsign = *ax25;
 		nr_neigh->digipeat = NULL;
@@ -104,48 +150,58 @@
 		nr_neigh->count    = 0;
 		nr_neigh->number   = nr_neigh_no++;
 		nr_neigh->failed   = 0;
+		atomic_set(&nr_neigh->refcount, 1);
 
 		if (ax25_digi != NULL && ax25_digi->ndigi > 0) {
 			if ((nr_neigh->digipeat = kmalloc(sizeof(*ax25_digi), GFP_KERNEL)) == NULL) {
 				kfree(nr_neigh);
+				if (nr_node)
+					nr_node_put(nr_node);
 				return -ENOMEM;
 			}
 			memcpy(nr_neigh->digipeat, ax25_digi,
 					sizeof(*ax25_digi));
 		}
 
-		spin_lock_bh(&nr_neigh_lock);
-		nr_neigh->next = nr_neigh_list;
-		nr_neigh_list  = nr_neigh;
-		spin_unlock_bh(&nr_neigh_lock);
+		spin_lock_bh(&nr_neigh_list_lock);
+		hlist_add_head(&nr_neigh->neigh_node, &nr_neigh_list);
+		nr_neigh_hold(nr_neigh);
+		spin_unlock_bh(&nr_neigh_list_lock);
 	}
 
 	if (quality != 0 && ax25cmp(nr, ax25) == 0 && !nr_neigh->locked)
 		nr_neigh->quality = quality;
 
 	if (nr_node == NULL) {
-		if ((nr_node = kmalloc(sizeof(*nr_node), GFP_ATOMIC)) == NULL)
+		if ((nr_node = kmalloc(sizeof(*nr_node), GFP_ATOMIC)) == NULL) {
+			if (nr_neigh)
+				nr_neigh_put(nr_neigh);
 			return -ENOMEM;
+		}
 
 		nr_node->callsign = *nr;
 		strcpy(nr_node->mnemonic, mnemonic);
 
 		nr_node->which = 0;
 		nr_node->count = 1;
+		atomic_set(&nr_node->refcount, 1);
+		nr_node->node_lock = SPIN_LOCK_UNLOCKED;
 
 		nr_node->routes[0].quality   = quality;
 		nr_node->routes[0].obs_count = obs_count;
 		nr_node->routes[0].neighbour = nr_neigh;
 
-		spin_lock_bh(&nr_node_lock);
-		nr_node->next = nr_node_list;
-		nr_node_list  = nr_node;
-		spin_unlock_bh(&nr_node_lock);
-
+		nr_neigh_hold(nr_neigh);
 		nr_neigh->count++;
 
+		spin_lock_bh(&nr_node_list_lock);
+		hlist_add_head(&nr_node->node_node, &nr_node_list);
+		/* refcount initialized at 1 */
+		spin_unlock_bh(&nr_node_list_lock);
+
 		return 0;
 	}
+	nr_node_lock(nr_node);
 
 	if (quality != 0)
 		strcpy(nr_node->mnemonic, mnemonic);
@@ -171,11 +227,13 @@
 
 			nr_node->which++;
 			nr_node->count++;
+			nr_neigh_hold(nr_neigh);
 			nr_neigh->count++;
 		} else {
 			/* It must be better than the worst */
 			if (quality > nr_node->routes[2].quality) {
 				nr_node->routes[2].neighbour->count--;
+				nr_neigh_put(nr_node->routes[2].neighbour);
 
 				if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
 					nr_remove_neigh(nr_node->routes[2].neighbour);
@@ -184,6 +242,7 @@
 				nr_node->routes[2].obs_count = obs_count;
 				nr_node->routes[2].neighbour = nr_neigh;
 
+				nr_neigh_hold(nr_neigh);
 				nr_neigh->count++;
 			}
 		}
@@ -244,62 +303,42 @@
 		}
 	}
 
+	nr_neigh_put(nr_neigh);
+	nr_node_unlock(nr_node);
+	nr_node_put(nr_node);
 	return 0;
 }
 
-static void nr_remove_node(struct nr_node *nr_node)
+static inline void __nr_remove_node(struct nr_node *nr_node)
 {
-	struct nr_node *s;
-
-	spin_lock_bh(&nr_node_lock);
-	if ((s = nr_node_list) == nr_node) {
-		nr_node_list = nr_node->next;
-		spin_unlock_bh(&nr_node_lock);
-		kfree(nr_node);
-		return;
-	}
-
-	while (s != NULL && s->next != NULL) {
-		if (s->next == nr_node) {
-			s->next = nr_node->next;
-			spin_unlock_bh(&nr_node_lock);
-			kfree(nr_node);
-			return;
-		}
+	hlist_del_init(&nr_node->node_node);
+	nr_node_put(nr_node);
+}
 
-		s = s->next;
-	}
+#define nr_remove_node_locked(__node) \
+	__nr_remove_node(__node)
 
-	spin_unlock_bh(&nr_node_lock);
+static void nr_remove_node(struct nr_node *nr_node)
+{
+	spin_lock_bh(&nr_node_list_lock);
+	__nr_remove_node(nr_node);
+	spin_unlock_bh(&nr_node_list_lock);
 }
 
-static void nr_remove_neigh(struct nr_neigh *nr_neigh)
+static inline void __nr_remove_neigh(struct nr_neigh *nr_neigh)
 {
-	struct nr_neigh *s;
+	hlist_del_init(&nr_neigh->neigh_node);
+	nr_neigh_put(nr_neigh);
+}
 
-	spin_lock_bh(&nr_neigh_lock);
-	if ((s = nr_neigh_list) == nr_neigh) {
-		nr_neigh_list = nr_neigh->next;
-		spin_unlock_bh(&nr_neigh_lock);
-		if (nr_neigh->digipeat != NULL)
-			kfree(nr_neigh->digipeat);
-		kfree(nr_neigh);
-		return;
-	}
+#define nr_remove_neigh_locked(__neigh) \
+	__nr_remove_neigh(__neigh)
 
-	while (s != NULL && s->next != NULL) {
-		if (s->next == nr_neigh) {
-			s->next = nr_neigh->next;
-			spin_unlock_bh(&nr_neigh_lock);
-			if (nr_neigh->digipeat != NULL)
-				kfree(nr_neigh->digipeat);
-			kfree(nr_neigh);
-			return;
-		}
-
-		s = s->next;
-	}
-	spin_unlock_bh(&nr_neigh_lock);
+static void nr_remove_neigh(struct nr_neigh *nr_neigh)
+{
+	spin_lock_bh(&nr_neigh_list_lock);
+	__nr_remove_neigh(nr_neigh);
+	spin_unlock_bh(&nr_neigh_list_lock);
 }
 
 /*
@@ -312,26 +351,27 @@
 	struct nr_neigh *nr_neigh;
 	int i;
 
-	for (nr_node = nr_node_list; nr_node != NULL; nr_node = nr_node->next)
-		if (ax25cmp(callsign, &nr_node->callsign) == 0)
-			break;
+	nr_node = nr_node_get(callsign);
 
 	if (nr_node == NULL)
 		return -EINVAL;
 
-	for (nr_neigh = nr_neigh_list; nr_neigh != NULL; nr_neigh = nr_neigh->next)
-		if (ax25cmp(neighbour, &nr_neigh->callsign) == 0 && nr_neigh->dev == dev)
-			break;
+	nr_neigh = nr_neigh_get_dev(neighbour, dev);
 
-	if (nr_neigh == NULL)
+	if (nr_neigh == NULL) {
+		nr_node_put(nr_node);
 		return -EINVAL;
+	}
 
+	nr_node_lock(nr_node);
 	for (i = 0; i < nr_node->count; i++) {
 		if (nr_node->routes[i].neighbour == nr_neigh) {
 			nr_neigh->count--;
+			nr_neigh_put(nr_neigh);
 
 			if (nr_neigh->count == 0 && !nr_neigh->locked)
 				nr_remove_neigh(nr_neigh);
+			nr_neigh_put(nr_neigh);
 
 			nr_node->count--;
 
@@ -346,11 +386,16 @@
 				case 2:
 					break;
 				}
+				nr_node_put(nr_node);
 			}
+			nr_node_unlock(nr_node);
 
 			return 0;
 		}
 	}
+	nr_neigh_put(nr_neigh);
+	nr_node_unlock(nr_node);
+	nr_node_put(nr_node);
 
 	return -EINVAL;
 }
@@ -362,12 +407,12 @@
 {
 	struct nr_neigh *nr_neigh;
 
-	for (nr_neigh = nr_neigh_list; nr_neigh != NULL; nr_neigh = nr_neigh->next) {
-		if (ax25cmp(callsign, &nr_neigh->callsign) == 0 && nr_neigh->dev == dev) {
-			nr_neigh->quality = quality;
-			nr_neigh->locked  = 1;
-			return 0;
-		}
+	nr_neigh = nr_neigh_get_dev(callsign, dev);
+	if (nr_neigh) {
+		nr_neigh->quality = quality;
+		nr_neigh->locked  = 1;
+		nr_neigh_put(nr_neigh);
+		return 0;
 	}
 
 	if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL)
@@ -382,6 +427,7 @@
 	nr_neigh->count    = 0;
 	nr_neigh->number   = nr_neigh_no++;
 	nr_neigh->failed   = 0;
+	atomic_set(&nr_neigh->refcount, 1);
 
 	if (ax25_digi != NULL && ax25_digi->ndigi > 0) {
 		if ((nr_neigh->digipeat = kmalloc(sizeof(*ax25_digi), GFP_KERNEL)) == NULL) {
@@ -391,10 +437,10 @@
 		memcpy(nr_neigh->digipeat, ax25_digi, sizeof(*ax25_digi));
 	}
 
-	spin_lock_bh(&nr_neigh_lock);
-	nr_neigh->next = nr_neigh_list;
-	nr_neigh_list  = nr_neigh;
-	spin_unlock_bh(&nr_neigh_lock);
+	spin_lock_bh(&nr_neigh_list_lock);
+	hlist_add_head(&nr_neigh->neigh_node, &nr_neigh_list);
+	/* refcount is initialized at 1 */
+	spin_unlock_bh(&nr_neigh_list_lock);
 
 	return 0;
 }
@@ -407,9 +453,7 @@
 {
 	struct nr_neigh *nr_neigh;
 
-	for (nr_neigh = nr_neigh_list; nr_neigh != NULL; nr_neigh = nr_neigh->next)
-		if (ax25cmp(callsign, &nr_neigh->callsign) == 0 && nr_neigh->dev == dev)
-			break;
+	nr_neigh = nr_neigh_get_dev(callsign, dev);
 
 	if (nr_neigh == NULL) return -EINVAL;
 
@@ -418,6 +462,7 @@
 
 	if (nr_neigh->count == 0)
 		nr_remove_neigh(nr_neigh);
+	nr_neigh_put(nr_neigh);
 
 	return 0;
 }
@@ -430,15 +475,13 @@
 static int nr_dec_obs(void)
 {
 	struct nr_neigh *nr_neigh;
-	struct nr_node  *s, *nr_node;
+	struct nr_node  *s;
+	struct hlist_node *node, *nodet;
 	int i;
 
-	nr_node = nr_node_list;
-
-	while (nr_node != NULL) {
-		s       = nr_node;
-		nr_node = nr_node->next;
-
+	spin_lock_bh(&nr_node_list_lock);
+	nr_node_for_each_safe(s, node, nodet, &nr_node_list) {
+		nr_node_lock(s);
 		for (i = 0; i < s->count; i++) {
 			switch (s->routes[i].obs_count) {
 			case 0:		/* A locked entry */
@@ -448,6 +491,7 @@
 				nr_neigh = s->routes[i].neighbour;
 
 				nr_neigh->count--;
+				nr_neigh_put(nr_neigh);
 
 				if (nr_neigh->count == 0 && !nr_neigh->locked)
 					nr_remove_neigh(nr_neigh);
@@ -472,8 +516,10 @@
 		}
 
 		if (s->count <= 0)
-			nr_remove_node(s);
+			nr_remove_node_locked(s);
+		nr_node_unlock(s);
 	}
+	spin_unlock_bh(&nr_node_list_lock);
 
 	return 0;
 }
@@ -483,21 +529,17 @@
  */
 void nr_rt_device_down(struct net_device *dev)
 {
-	struct nr_neigh *s, *nr_neigh = nr_neigh_list;
-	struct nr_node  *t, *nr_node;
+	struct nr_neigh *s;
+	struct hlist_node *node, *nodet, *node2, *node2t;
+	struct nr_node  *t;
 	int i;
 
-	while (nr_neigh != NULL) {
-		s        = nr_neigh;
-		nr_neigh = nr_neigh->next;
-
+	spin_lock_bh(&nr_neigh_list_lock);
+	nr_neigh_for_each_safe(s, node, nodet, &nr_neigh_list) {
 		if (s->dev == dev) {
-			nr_node = nr_node_list;
-
-			while (nr_node != NULL) {
-				t       = nr_node;
-				nr_node = nr_node->next;
-
+			spin_lock_bh(&nr_node_list_lock);
+			nr_node_for_each_safe(t, node2, node2t, &nr_node_list) {
+				nr_node_lock(t);
 				for (i = 0; i < t->count; i++) {
 					if (t->routes[i].neighbour == s) {
 						t->count--;
@@ -514,12 +556,15 @@
 				}
 
 				if (t->count <= 0)
-					nr_remove_node(t);
+					nr_remove_node_locked(t);
+				nr_node_unlock(t);
 			}
+			spin_unlock_bh(&nr_node_list_lock);
 
-			nr_remove_neigh(s);
+			nr_remove_neigh_locked(s);
 		}
 	}
+	spin_unlock_bh(&nr_neigh_list_lock);
 }
 
 /*
@@ -553,6 +598,8 @@
 			if (first == NULL || strncmp(dev->name, first->name, 3) < 0)
 				first = dev;
 	}
+	if (first)
+		dev_hold(first);
 	read_unlock(&dev_base_lock);
 
 	return first;
@@ -603,6 +650,7 @@
 {
 	struct nr_route_struct nr_route;
 	struct net_device *dev;
+	int ret;
 
 	switch (cmd) {
 	case SIOCADDRT:
@@ -610,23 +658,29 @@
 			return -EFAULT;
 		if ((dev = nr_ax25_dev_get(nr_route.device)) == NULL)
 			return -EINVAL;
-		if (nr_route.ndigis < 0 || nr_route.ndigis > AX25_MAX_DIGIS)
+		if (nr_route.ndigis < 0 || nr_route.ndigis > AX25_MAX_DIGIS) {
+			dev_put(dev);
 			return -EINVAL;
+		}
 		switch (nr_route.type) {
 		case NETROM_NODE:
-			return nr_add_node(&nr_route.callsign,
+			ret = nr_add_node(&nr_route.callsign,
 				nr_route.mnemonic,
 				&nr_route.neighbour,
 				nr_call_to_digi(nr_route.ndigis, nr_route.digipeaters),
 				dev, nr_route.quality,
 				nr_route.obs_count);
+			break;
 		case NETROM_NEIGH:
-			return nr_add_neigh(&nr_route.callsign,
+			ret = nr_add_neigh(&nr_route.callsign,
 				nr_call_to_digi(nr_route.ndigis, nr_route.digipeaters),
 				dev, nr_route.quality);
+			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
 		}
+		dev_put(dev);
+		return ret;
 
 	case SIOCDELRT:
 		if (copy_from_user(&nr_route, arg, sizeof(struct nr_route_struct)))
@@ -635,14 +689,18 @@
 			return -EINVAL;
 		switch (nr_route.type) {
 		case NETROM_NODE:
-			return nr_del_node(&nr_route.callsign,
+			ret = nr_del_node(&nr_route.callsign,
 				&nr_route.neighbour, dev);
+			break;
 		case NETROM_NEIGH:
-			return nr_del_neigh(&nr_route.callsign,
+			ret = nr_del_neigh(&nr_route.callsign,
 				dev, nr_route.quality);
+			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
 		}
+		dev_put(dev);
+		return ret;
 
 	case SIOCNRDECOBS:
 		return nr_dec_obs();
@@ -660,22 +718,36 @@
  */
 void nr_link_failed(ax25_cb *ax25, int reason)
 {
-	struct nr_neigh *nr_neigh;
-	struct nr_node  *nr_node;
-
-	for (nr_neigh = nr_neigh_list; nr_neigh != NULL; nr_neigh = nr_neigh->next)
-		if (nr_neigh->ax25 == ax25)
+	struct nr_neigh *s, *nr_neigh = NULL;
+	struct hlist_node *node;
+	struct nr_node  *nr_node = NULL;
+
+	spin_lock_bh(&nr_neigh_list_lock);
+	nr_neigh_for_each(s, node, &nr_neigh_list)
+		if (s->ax25 == ax25) {
+			nr_neigh_hold(s);
+			nr_neigh = s;
 			break;
+		}
+	spin_unlock_bh(&nr_neigh_list_lock);
 
 	if (nr_neigh == NULL) return;
 
 	nr_neigh->ax25 = NULL;
+	ax25_cb_put(ax25);
 
-	if (++nr_neigh->failed < sysctl_netrom_link_fails_count) return;
-
-	for (nr_node = nr_node_list; nr_node != NULL; nr_node = nr_node->next)
+	if (++nr_neigh->failed < sysctl_netrom_link_fails_count) {
+		nr_neigh_put(nr_neigh);
+		return;
+	}
+	spin_lock_bh(&nr_node_list_lock);
+	nr_node_for_each(nr_node, node, &nr_node_list)
+		nr_node_lock(nr_node);
 		if (nr_node->which < nr_node->count && nr_node->routes[nr_node->which].neighbour == nr_neigh)
 			nr_node->which++;
+		nr_node_unlock(nr_node);
+	spin_unlock_bh(&nr_node_list_lock);
+	nr_neigh_put(nr_neigh);
 }
 
 /*
@@ -689,6 +761,9 @@
 	struct nr_node  *nr_node;
 	struct net_device *dev;
 	unsigned char *dptr;
+	ax25_cb *ax25s;
+	int ret;
+	struct sk_buff *skbn;
 
 
 	nr_src  = (ax25_address *)(skb->data + 0);
@@ -700,50 +775,84 @@
 
 	if ((dev = nr_dev_get(nr_dest)) != NULL) {	/* Its for me */
 		if (ax25 == NULL)			/* Its from me */
-			return nr_loopback_queue(skb);
+			ret = nr_loopback_queue(skb);
 		else
-			return nr_rx_frame(skb, dev);
+			ret = nr_rx_frame(skb, dev);
+		dev_put(dev);
+		return ret;
 	}
 
 	if (!sysctl_netrom_routing_control && ax25 != NULL)
 		return 0;
 
 	/* Its Time-To-Live has expired */
-	if (--skb->data[14] == 0)
+	if (skb->data[14] == 1) {
 		return 0;
+	}
 
-	for (nr_node = nr_node_list; nr_node != NULL; nr_node = nr_node->next)
-		if (ax25cmp(nr_dest, &nr_node->callsign) == 0)
-			break;
+	nr_node = nr_node_get(nr_dest);
+	if (nr_node == NULL)
+		return 0;
+	nr_node_lock(nr_node);
 
-	if (nr_node == NULL || nr_node->which >= nr_node->count)
+	if (nr_node->which >= nr_node->count) {
+		nr_node_unlock(nr_node);
+		nr_node_put(nr_node);
 		return 0;
+	}
 
 	nr_neigh = nr_node->routes[nr_node->which].neighbour;
 
-	if ((dev = nr_dev_first()) == NULL)
+	if ((dev = nr_dev_first()) == NULL) {
+		nr_node_unlock(nr_node);
+		nr_node_put(nr_node);
+		return 0;
+	}
+
+	/* We are going to change the netrom headers so we should get our
+	   own skb, we also did not know until now how much header space
+	   we had to reserve... - RXQ */
+	if ((skbn=skb_copy_expand(skb, dev->hard_header_len, 0, GFP_ATOMIC)) == NULL) {
+		nr_node_unlock(nr_node);
+		nr_node_put(nr_node);
+		dev_put(dev);
 		return 0;
+	}
+	kfree_skb(skb);
+	skb=skbn;
+	skb->data[14]--;
 
 	dptr  = skb_push(skb, 1);
 	*dptr = AX25_P_NETROM;
 
-	nr_neigh->ax25 = ax25_send_frame(skb, 256, (ax25_address *)dev->dev_addr, &nr_neigh->callsign, nr_neigh->digipeat, nr_neigh->dev);
+	ax25s = ax25_send_frame(skb, 256, (ax25_address *)dev->dev_addr, &nr_neigh->callsign, nr_neigh->digipeat, nr_neigh->dev);
+	if (nr_neigh->ax25 && ax25s) {
+		/* We were already holding this ax25_cb */
+		ax25_cb_put(ax25s);
+	}
+	nr_neigh->ax25 = ax25s;
 
-	return (nr_neigh->ax25 != NULL);
+	dev_put(dev);
+	ret = (nr_neigh->ax25 != NULL);
+	nr_node_unlock(nr_node);
+	nr_node_put(nr_node);
+	return ret;
 }
 
 int nr_nodes_get_info(char *buffer, char **start, off_t offset, int length)
 {
 	struct nr_node *nr_node;
+	struct hlist_node *node;
 	int len     = 0;
 	off_t pos   = 0;
 	off_t begin = 0;
 	int i;
 
-	spin_lock_bh(&nr_node_lock);
+	spin_lock_bh(&nr_node_list_lock);
 	len += sprintf(buffer, "callsign  mnemonic w n qual obs neigh qual obs neigh qual obs neigh\n");
 
-	for (nr_node = nr_node_list; nr_node != NULL; nr_node = nr_node->next) {
+	nr_node_for_each(nr_node, node, &nr_node_list) {
+		nr_node_lock(nr_node);
 		len += sprintf(buffer + len, "%-9s %-7s  %d %d",
 			ax2asc(&nr_node->callsign),
 			(nr_node->mnemonic[0] == '\0') ? "*" : nr_node->mnemonic,
@@ -756,6 +865,7 @@
 				nr_node->routes[i].obs_count,
 				nr_node->routes[i].neighbour->number);
 		}
+		nr_node_unlock(nr_node);
 
 		len += sprintf(buffer + len, "\n");
 
@@ -769,7 +879,7 @@
 		if (pos > offset + length)
 			break;
 	}
-	spin_unlock_bh(&nr_node_lock);
+	spin_unlock_bh(&nr_node_list_lock);
 
 	*start = buffer + (offset - begin);
 	len   -= (offset - begin);
@@ -782,15 +892,16 @@
 int nr_neigh_get_info(char *buffer, char **start, off_t offset, int length)
 {
 	struct nr_neigh *nr_neigh;
+	struct hlist_node *node;
 	int len     = 0;
 	off_t pos   = 0;
 	off_t begin = 0;
 	int i;
 
-	spin_lock_bh(&nr_neigh_lock);
+	spin_lock_bh(&nr_neigh_list_lock);
 	len += sprintf(buffer, "addr  callsign  dev  qual lock count failed digipeaters\n");
 
-	for (nr_neigh = nr_neigh_list; nr_neigh != NULL; nr_neigh = nr_neigh->next) {
+	nr_neigh_for_each(nr_neigh, node, &nr_neigh_list) {
 		len += sprintf(buffer + len, "%05d %-9s %-4s  %3d    %d   %3d    %3d",
 			nr_neigh->number,
 			ax2asc(&nr_neigh->callsign),
@@ -818,7 +929,7 @@
 			break;
 	}
 
-	spin_unlock_bh(&nr_neigh_lock);
+	spin_unlock_bh(&nr_neigh_list_lock);
 
 	*start = buffer + (offset - begin);
 	len   -= (offset - begin);
@@ -833,20 +944,24 @@
  */
 void __exit nr_rt_free(void)
 {
-	struct nr_neigh *s, *nr_neigh = nr_neigh_list;
-	struct nr_node  *t, *nr_node  = nr_node_list;
-
-	while (nr_node != NULL) {
-		t       = nr_node;
-		nr_node = nr_node->next;
-
-		nr_remove_node(t);
-	}
-
-	while (nr_neigh != NULL) {
-		s        = nr_neigh;
-		nr_neigh = nr_neigh->next;
-
-		nr_remove_neigh(s);
+	struct nr_neigh *s = NULL;
+	struct nr_node  *t = NULL;
+	struct hlist_node *node, *nodet;
+
+	spin_lock_bh(&nr_neigh_list_lock);
+	spin_lock_bh(&nr_node_list_lock);
+	nr_node_for_each_safe(t, node, nodet, &nr_node_list) {
+		nr_node_lock(t);
+		nr_remove_node_locked(t);
+		nr_node_unlock(t);
+	}
+	nr_neigh_for_each_safe(s, node, nodet, &nr_neigh_list) {
+		while(s->count) {
+			s->count--;
+			nr_neigh_put(s);
+		}
+		nr_remove_neigh_locked(s);
 	}
+	spin_unlock_bh(&nr_node_list_lock);
+	spin_unlock_bh(&nr_neigh_list_lock);
 }
diff -ru linux-2.6.0-test1.rxq/net/netrom/nr_subr.c linux-2.6.0-test1.rxq2/net/netrom/nr_subr.c
--- linux-2.6.0-test1.rxq/net/netrom/nr_subr.c	2003-07-24 20:26:16.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/netrom/nr_subr.c	2003-07-24 00:29:53.000000000 +0200
@@ -127,7 +127,7 @@
 	unsigned char  *dptr;
 	int len, timeout;
 
-	len = AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
+	len = NR_NETWORK_LEN + NR_TRANSPORT_LEN;
 
 	switch (frametype & 0x0F) {
 	case NR_CONNREQ:
@@ -151,7 +151,7 @@
 	/*
 	 *	Space for AX.25 and NET/ROM network header
 	 */
-	skb_reserve(skb, AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + NR_NETWORK_LEN);
+	skb_reserve(skb, NR_NETWORK_LEN);
 
 	dptr = skb_put(skb, skb_tailroom(skb));
 
@@ -219,12 +219,12 @@
 	unsigned char *dptr;
 	int len;
 
-	len = AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN + NR_NETWORK_LEN + NR_TRANSPORT_LEN + 1;
+	len = NR_NETWORK_LEN + NR_TRANSPORT_LEN + 1;
 
 	if ((skbn = alloc_skb(len, GFP_ATOMIC)) == NULL)
 		return;
 
-	skb_reserve(skbn, AX25_BPQ_HEADER_LEN + AX25_MAX_HEADER_LEN);
+	skb_reserve(skbn, 0);
 
 	dptr = skb_put(skbn, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
 
diff -ru linux-2.6.0-test1.rxq/net/netrom/nr_timer.c linux-2.6.0-test1.rxq2/net/netrom/nr_timer.c
--- linux-2.6.0-test1.rxq/net/netrom/nr_timer.c	2003-07-24 20:26:16.000000000 +0200
+++ linux-2.6.0-test1.rxq2/net/netrom/nr_timer.c	2003-07-22 21:54:16.000000000 +0200
@@ -143,7 +143,10 @@
 		   is accepted() it isn't 'dead' so doesn't get removed. */
 		if (sock_flag(sk, SOCK_DESTROY) ||
 		    (sk->sk_state == TCP_LISTEN && sock_flag(sk, SOCK_DEAD))) {
+			sock_hold(sk);
 			nr_destroy_socket(sk);
+			bh_unlock_sock(sk);
+			sock_put(sk);
 			return;
 		}
 		break;
@@ -227,6 +230,7 @@
 	case NR_STATE_1:
 		if (nr->n2count == nr->n2) {
 			nr_disconnect(sk, ETIMEDOUT);
+			bh_unlock_sock(sk);
 			return;
 		} else {
 			nr->n2count++;
@@ -237,6 +241,7 @@
 	case NR_STATE_2:
 		if (nr->n2count == nr->n2) {
 			nr_disconnect(sk, ETIMEDOUT);
+			bh_unlock_sock(sk);
 			return;
 		} else {
 			nr->n2count++;
@@ -247,6 +252,7 @@
 	case NR_STATE_3:
 		if (nr->n2count == nr->n2) {
 			nr_disconnect(sk, ETIMEDOUT);
+			bh_unlock_sock(sk);
 			return;
 		} else {
 			nr->n2count++;
--- linux-2.6.0-test1.rxq/include/net/ax25.h	2003-07-24 20:40:40.000000000 +0200
+++ linux-2.6.0-test1.rxq2/include/net/ax25.h	2003-07-24 20:45:49.000000000 +0200
@@ -200,7 +200,7 @@
 	unsigned char		window;
 	struct timer_list	timer, dtimer;
 	struct sock		*sk;		/* Backlink to socket */
-	int			refcount;
+	atomic_t		refcount;
 } ax25_cb;
 
 #define ax25_sk(__sk) ((ax25_cb *)(__sk)->sk_protinfo)
@@ -208,11 +208,21 @@
 #define ax25_for_each(__ax25, node, list) \
 	hlist_for_each_entry(__ax25, node, list, ax25_node)
 
+#define ax25_cb_hold(__ax25) \
+	atomic_inc(&((__ax25)->refcount))
+
+static __inline__ void ax25_cb_put(ax25_cb *ax25)
+{
+	if (atomic_dec_and_test(&ax25->refcount)) {
+		if (ax25->digipeat)
+			kfree(ax25->digipeat);
+		kfree(ax25);
+	}
+}
+
 /* af_ax25.c */
 extern struct hlist_head ax25_list;
 extern spinlock_t ax25_list_lock;
-extern void ax25_cb_hold(ax25_cb *);
-extern void ax25_cb_put(ax25_cb *);
 extern void ax25_cb_add(ax25_cb *);
 struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
 struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);
--- linux-2.6.0-test1.rxq/include/net/netrom.h	2003-07-22 12:06:11.000000000 +0200
+++ linux-2.6.0-test1.rxq2/include/net/netrom.h	2003-07-22 21:21:48.000000000 +0200
@@ -7,6 +7,7 @@
 #ifndef _NETROM_H
 #define _NETROM_H 
 #include <linux/netrom.h>
+#include <linux/list.h>
 
 #define	NR_NETWORK_LEN			15
 #define	NR_TRANSPORT_LEN		5
@@ -77,16 +78,17 @@
 #define nr_sk(__sk) ((nr_cb *)(__sk)->sk_protinfo)
 
 struct nr_neigh {
-	struct nr_neigh *next;
-	ax25_address    callsign;
-	ax25_digi       *digipeat;
-	ax25_cb		*ax25;
-	struct net_device   *dev;
-	unsigned char   quality;
-	unsigned char   locked;
-	unsigned short  count;
-	unsigned int    number;
-	unsigned char	failed;
+	struct hlist_node	neigh_node;
+	ax25_address		callsign;
+	ax25_digi		*digipeat;
+	ax25_cb			*ax25;
+	struct net_device	*dev;
+	unsigned char		quality;
+	unsigned char		locked;
+	unsigned short		count;
+	unsigned int		number;
+	unsigned char		failed;
+	atomic_t		refcount;
 };
 
 struct nr_route {
@@ -96,14 +98,74 @@
 };
 
 struct nr_node {
-	struct nr_node  *next;
-	ax25_address    callsign;
-	char		mnemonic[7];
-	unsigned char   which;
-	unsigned char   count;
-	struct nr_route routes[3];
+	struct hlist_node	node_node;
+	ax25_address		callsign;
+	char			mnemonic[7];
+	unsigned char		which;
+	unsigned char		count;
+	struct nr_route		routes[3];
+	atomic_t		refcount;
+	spinlock_t		node_lock;
 };
 
+/*********************************************************************
+ *	nr_node & nr_neigh lists, refcounting and locking
+ *********************************************************************/
+
+extern struct hlist_head nr_node_list;
+extern struct hlist_head nr_neigh_list;
+
+#define nr_node_hold(__nr_node) \
+	atomic_inc(&((__nr_node)->refcount))
+
+static __inline__ void nr_node_put(struct nr_node *nr_node)
+{
+	if (atomic_dec_and_test(&nr_node->refcount)) {
+		kfree(nr_node);
+	}
+}
+
+#define nr_neigh_hold(__nr_neigh) \
+	atomic_inc(&((__nr_neigh)->refcount))
+
+static __inline__ void nr_neigh_put(struct nr_neigh *nr_neigh)
+{
+	if (atomic_dec_and_test(&nr_neigh->refcount)) {
+		if (nr_neigh->digipeat != NULL)
+			kfree(nr_neigh->digipeat);
+		kfree(nr_neigh);
+	}
+}
+
+/* nr_node_lock and nr_node_unlock also hold/put the node's refcounter.
+ */
+static __inline__ void nr_node_lock(struct nr_node *nr_node)
+{
+	nr_node_hold(nr_node);
+	spin_lock_bh(&nr_node->node_lock);
+}
+
+static __inline__ void nr_node_unlock(struct nr_node *nr_node)
+{
+	spin_unlock_bh(&nr_node->node_lock);
+	nr_node_put(nr_node);
+}
+
+#define nr_neigh_for_each(__nr_neigh, node, list) \
+	hlist_for_each_entry(__nr_neigh, node, list, neigh_node)
+
+#define nr_neigh_for_each_safe(__nr_neigh, node, node2, list) \
+	hlist_for_each_entry_safe(__nr_neigh, node, node2, list, neigh_node)
+
+#define nr_node_for_each(__nr_node, node, list) \
+	hlist_for_each_entry(__nr_node, node, list, node_node)
+
+#define nr_node_for_each_safe(__nr_node, node, node2, list) \
+	hlist_for_each_entry_safe(__nr_node, node, node2, list, node_node)
+
+
+/*********************************************************************/
+
 /* af_netrom.c */
 extern int  sysctl_netrom_default_path_quality;
 extern int  sysctl_netrom_obsolescence_count_initialiser;

--Py3IqQ4lEK4AGa5A--

