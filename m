From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] ax25, netrom and rose fixes for 2.6.0
Date: Fri, 19 Dec 2003 23:44:35 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031219234435.C211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, davem@redhat.com


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

These are a few fixes for bugs I encountered over the last few weeks:

- Fix some socket locking in ax25
- Fix a waitqueue bug in ax25
- Use sock_orphan in ax25
- Fix a waitqueue bug in netrom
- Fix a waitqueue bug in rose
- Fix raw socket behaviour in ax25

Ralf, can you give your stamp of approval so Dave can apply them?

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="ax25.2.6.0.rxq.diff"

diff -ru linux-2.6.0/net/ax25/af_ax25.c linux-2.6.0.rxq/net/ax25/af_ax25.c
--- linux-2.6.0/net/ax25/af_ax25.c	Thu Dec 18 03:59:38 2003
+++ linux-2.6.0.rxq/net/ax25/af_ax25.c	Fri Dec 19 23:00:35 2003
@@ -228,45 +228,25 @@
 	return NULL;
 }
 
-/*
- *	Look for any matching address - RAW sockets can bind to arbitrary names
- */
-struct sock *ax25_addr_match(ax25_address *addr)
+void ax25_send_to_raw(ax25_address *addr, struct sk_buff *skb, int proto)
 {
-	struct sock *sk = NULL;
 	ax25_cb *s;
+	struct sk_buff *copy;
 	struct hlist_node *node;
 
 	spin_lock_bh(&ax25_list_lock);
 	ax25_for_each(s, node, &ax25_list) {
 		if (s->sk != NULL && ax25cmp(&s->source_addr, addr) == 0 &&
-		    s->sk->sk_type == SOCK_RAW) {
-			sk = s->sk;
-			lock_sock(sk);
-			break;
-		}
-	}
-
-	spin_unlock_bh(&ax25_list_lock);
-
-	return sk;
-}
-
-void ax25_send_to_raw(struct sock *sk, struct sk_buff *skb, int proto)
-{
-	struct sk_buff *copy;
-	struct hlist_node *node;
-
-	sk_for_each_from(sk, node)
-		if (sk->sk_type == SOCK_RAW &&
-		    sk->sk_protocol == proto &&
-		    atomic_read(&sk->sk_rmem_alloc) <= sk->sk_rcvbuf) {
+		    s->sk->sk_type == SOCK_RAW &&
+		    s->sk->sk_protocol == proto &&
+		    s->ax25_dev->dev == skb->dev &&
+		    atomic_read(&s->sk->sk_rmem_alloc) <= s->sk->sk_rcvbuf) {
 			if ((copy = skb_clone(skb, GFP_ATOMIC)) == NULL)
-				return;
-
-			if (sock_queue_rcv_skb(sk, copy) != 0)
+				continue;
+			if (sock_queue_rcv_skb(s->sk, copy) != 0)
 				kfree_skb(copy);
 		}
+	}
 }
 
 /*
@@ -318,7 +298,7 @@
 				ax25_cb *sax25 = ax25_sk(skb->sk);
 
 				/* Queue the unaccepted socket for death */
-				sock_set_flag(skb->sk, SOCK_DEAD);
+				sock_orphan(skb->sk);
 
 				ax25_start_heartbeat(sax25);
 				sax25->state = AX25_STATE_0;
@@ -913,6 +893,7 @@
 	if (oax25->digipeat != NULL) {
 		if ((ax25->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
 			sk_free(sk);
+			ax25_cb_put(ax25);
 			return NULL;
 		}
 
@@ -934,20 +915,25 @@
 		return 0;
 
 	sock_hold(sk);
+	sock_orphan(sk);
 	lock_sock(sk);
 	ax25 = ax25_sk(sk);
 
 	if (sk->sk_type == SOCK_SEQPACKET) {
 		switch (ax25->state) {
 		case AX25_STATE_0:
+			release_sock(sk);
 			ax25_disconnect(ax25, 0);
+			lock_sock(sk);
 			ax25_destroy_socket(ax25);
 			break;
 
 		case AX25_STATE_1:
 		case AX25_STATE_2:
 			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
+			release_sock(sk);
 			ax25_disconnect(ax25, 0);
+			lock_sock(sk);
 			ax25_destroy_socket(ax25);
 			break;
 
@@ -980,7 +966,6 @@
 			sk->sk_state                = TCP_CLOSE;
 			sk->sk_shutdown            |= SEND_SHUTDOWN;
 			sk->sk_state_change(sk);
-			sock_set_flag(sk, SOCK_DEAD);
 			sock_set_flag(sk, SOCK_DESTROY);
 			break;
 
@@ -991,12 +976,10 @@
 		sk->sk_state     = TCP_CLOSE;
 		sk->sk_shutdown |= SEND_SHUTDOWN;
 		sk->sk_state_change(sk);
-		sock_set_flag(sk, SOCK_DEAD);
 		ax25_destroy_socket(ax25);
 	}
 
 	sock->sk   = NULL;
-	sk->sk_socket = NULL;	/* Not used, but we should do this */
 	release_sock(sk);
 	sock_put(sk);
 
@@ -1334,11 +1317,13 @@
 
 		release_sock(sk);
 		current->state = TASK_INTERRUPTIBLE;
-		if (flags & O_NONBLOCK)
+		if (flags & O_NONBLOCK) {
+			current->state = TASK_RUNNING;
+			remove_wait_queue(sk->sk_sleep, &wait);
 			return -EWOULDBLOCK;
+		}
 		if (!signal_pending(tsk)) {
 			schedule();
-			current->state = TASK_RUNNING;
 			lock_sock(sk);
 			continue;
 		}
diff -ru linux-2.6.0/net/ax25/ax25_in.c linux-2.6.0.rxq/net/ax25/ax25_in.c
--- linux-2.6.0/net/ax25/ax25_in.c	Thu Dec 18 03:58:16 2003
+++ linux-2.6.0.rxq/net/ax25/ax25_in.c	Fri Dec 19 23:01:22 2003
@@ -147,7 +147,6 @@
 	}
 
 	if (ax25->sk != NULL && ax25->ax25_dev->values[AX25_VALUES_CONMODE] == 2) {
-		bh_lock_sock(ax25->sk);
 		if ((!ax25->pidincl && ax25->sk->sk_protocol == pid) ||
 		    ax25->pidincl) {
 			if (sock_queue_rcv_skb(ax25->sk, skb) == 0)
@@ -155,7 +154,6 @@
 			else
 				ax25->condition |= AX25_COND_OWN_RX_BUSY;
 		}
-		bh_unlock_sock(ax25->sk);
 	}
 
 	return queued;
@@ -195,7 +193,7 @@
 {
 	ax25_address src, dest, *next_digi = NULL;
 	int type = 0, mine = 0, dama;
-	struct sock *make, *sk, *raw;
+	struct sock *make, *sk;
 	ax25_digi dp, reverse_dp;
 	ax25_cb *ax25;
 	ax25_dev *ax25_dev;
@@ -243,10 +241,7 @@
 	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
 		skb->h.raw = skb->data + 2;		/* skip control and pid */
 
-		if ((raw = ax25_addr_match(&dest)) != NULL) {
-			ax25_send_to_raw(raw, skb, skb->data[1]);
-			release_sock(raw);
-		}
+		ax25_send_to_raw(&dest, skb, skb->data[1]);
 
 		if (!mine && ax25cmp(&dest, (ax25_address *)dev->broadcast) != 0) {
 			kfree_skb(skb);
@@ -381,7 +376,6 @@
 
 		sk->sk_ack_backlog++;
 		bh_unlock_sock(sk);
-		sock_put(sk);
 	} else {
 		if (!mine) {
 			kfree_skb(skb);
@@ -407,6 +401,8 @@
 	    (ax25->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
 		kfree_skb(skb);
 		ax25_destroy_socket(ax25);
+		if (sk)
+			sock_put(sk);
 		return 0;
 	}
 
@@ -446,6 +442,7 @@
 	if (sk) {
 		if (!sock_flag(sk, SOCK_DEAD))
 			sk->sk_data_ready(sk, skb->len);
+		sock_put(sk);
 	} else
 		kfree_skb(skb);
 
diff -ru linux-2.6.0/net/netrom/af_netrom.c linux-2.6.0.rxq/net/netrom/af_netrom.c
--- linux-2.6.0/net/netrom/af_netrom.c	Thu Dec 18 03:58:49 2003
+++ linux-2.6.0.rxq/net/netrom/af_netrom.c	Fri Dec 19 22:01:53 2003
@@ -532,7 +532,7 @@
 		sk->sk_state    = TCP_CLOSE;
 		sk->sk_shutdown |= SEND_SHUTDOWN;
 		sk->sk_state_change(sk);
-		sock_set_flag(sk, SOCK_DEAD);
+		sock_orphan(sk);
 		sock_set_flag(sk, SOCK_DESTROY);
 		sk->sk_socket   = NULL;
 		break;
@@ -727,6 +727,8 @@
 				lock_sock(sk);
 				continue;
 			}
+			current->state = TASK_RUNNING;
+			remove_wait_queue(sk->sk_sleep, &wait);
 			return -ERESTARTSYS;
 		}
 		current->state = TASK_RUNNING;
@@ -780,13 +782,18 @@
 
 		current->state = TASK_INTERRUPTIBLE;
 		release_sock(sk);
-		if (flags & O_NONBLOCK)
+		if (flags & O_NONBLOCK) {
+			current->state = TASK_RUNNING;
+			remove_wait_queue(sk->sk_sleep, &wait);
 			return -EWOULDBLOCK;
+		}
 		if (!signal_pending(tsk)) {
 			schedule();
 			lock_sock(sk);
 			continue;
 		}
+		current->state = TASK_RUNNING;
+		remove_wait_queue(sk->sk_sleep, &wait);
 		return -ERESTARTSYS;
 	}
 	current->state = TASK_RUNNING;
diff -ru linux-2.6.0/net/rose/af_rose.c linux-2.6.0.rxq/net/rose/af_rose.c
--- linux-2.6.0/net/rose/af_rose.c	Thu Dec 18 03:58:49 2003
+++ linux-2.6.0.rxq/net/rose/af_rose.c	Fri Dec 19 23:23:11 2003
@@ -813,6 +813,8 @@
 				schedule();
 				continue;
 			}
+			current->state = TASK_RUNNING;
+			remove_wait_queue(sk->sk_sleep, &wait);
 			return -ERESTARTSYS;
 		}
 		current->state = TASK_RUNNING;
@@ -864,8 +866,11 @@
 
 		current->state = TASK_INTERRUPTIBLE;
 		release_sock(sk);
-		if (flags & O_NONBLOCK)
+		if (flags & O_NONBLOCK) {
+			current->state = TASK_RUNNING;
+			remove_wait_queue(sk->sk_sleep, &wait);
 			return -EWOULDBLOCK;
+		}
 		if (!signal_pending(tsk)) {
 			schedule();
 			lock_sock(sk);

--AWniW0JNca5xppdA--

