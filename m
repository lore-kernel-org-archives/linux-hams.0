From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Updated version of patch for raw sockets
Date: Tue, 22 Jul 2003 14:12:42 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307221312.OAA22170@gw.chygwyn.com>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

Below is my updated patch for AX.25 raw sockets. I've added in some extra
code so that it will be backwards compatible. Currently there is one
exception to that, which is in the receive path but that will change
shortly. I think it ought to be done as a separate patch since the
receive patch has to change anyway to fix the locking and its easier
to do the two togeather. So far I've not been able to find any examples
of currently working applications which use the raw sockets receive
path so I don't expect anyone will miss them for a few days.

If I don't hear any objections, I'll send this in shortly (for 2.6.0-test
only of course, not 2.4).

Sorry for the slow progress, things have been rather busy recently. I hope
to make faster progress in the next few days or so,

Steve.

-----------------------------------------------------------------------------

diff -Nru linux-2.6.0-test1/include/net/ax25.h linux/include/net/ax25.h
--- linux-2.6.0-test1/include/net/ax25.h	Sun Jun 15 03:58:07 2003
+++ linux/include/net/ax25.h	Tue Jul 22 13:17:01 2003
@@ -211,8 +211,6 @@
 struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
 struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);
 extern ax25_cb *ax25_find_cb(ax25_address *, ax25_address *, ax25_digi *, struct net_device *);
-extern struct sock *ax25_addr_match(ax25_address *);
-extern void ax25_send_to_raw(struct sock *, struct sk_buff *, int);
 extern void ax25_destroy_socket(ax25_cb *);
 extern ax25_cb *ax25_create_cb(void);
 extern void ax25_fillin_cb(ax25_cb *, ax25_dev *);
diff -Nru linux-2.6.0-test1/net/ax25/TODO linux/net/ax25/TODO
--- linux-2.6.0-test1/net/ax25/TODO	Sat Apr 19 19:48:56 2003
+++ linux/net/ax25/TODO	Tue Jul 22 13:34:35 2003
@@ -18,7 +18,11 @@
 
 Implement proper socket locking in netrom and rose.
 
-Check socket locking when ax25_rcv is sending to raw sockets.  In particular
-ax25_send_to_raw() seems fishy.  Heck - ax25_rcv is fishy.
-
 Handle XID and TEST frames properly.
+
+Notes on raw sockets: The original code has gone as it was full of holes and
+it was not obvious what it was supposed to do on the receive side. The
+transmit side is identical to SOCK_DGRAM so if you ask for a SOCK_RAW you
+get a SOCK_DGRAM and a warning message. A further patch needs to ensure that
+all the headers are preserved for SOCK_RAW receives.
+
diff -Nru linux-2.6.0-test1/net/ax25/af_ax25.c linux/net/ax25/af_ax25.c
--- linux-2.6.0-test1/net/ax25/af_ax25.c	Sun Jul  6 15:30:49 2003
+++ linux/net/ax25/af_ax25.c	Tue Jul 22 13:31:21 2003
@@ -251,45 +251,6 @@
 }
 
 /*
- *	Look for any matching address - RAW sockets can bind to arbitrary names
- */
-struct sock *ax25_addr_match(ax25_address *addr)
-{
-	struct sock *sk = NULL;
-	ax25_cb *s;
-
-	spin_lock_bh(&ax25_list_lock);
-	for (s = ax25_list; s != NULL; s = s->next) {
-		if (s->sk != NULL && ax25cmp(&s->source_addr, addr) == 0 &&
-		    s->sk->sk_type == SOCK_RAW) {
-			sk = s->sk;
-			lock_sock(sk);
-			break;
-		}
-	}
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
-			if ((copy = skb_clone(skb, GFP_ATOMIC)) == NULL)
-				return;
-
-			if (sock_queue_rcv_skb(sk, copy) != 0)
-				kfree_skb(copy);
-		}
-}
-
-/*
  *	Deferred destroy.
  */
 void ax25_destroy_socket(ax25_cb *);
@@ -786,12 +747,28 @@
 	return res;
 }
 
+static void ax25_raw_warn(void)
+{
+static int counter;
+	if (counter < 5) {
+		printk(KERN_INFO
+                       "ax25: Application %s (PID:%d) uses old SOCK_RAW and "
+		       "should be updated to use SOCK_DGRAM\n",
+		       current->comm, (int)current->pid);
+		counter++;
+	}
+}
+
 int ax25_create(struct socket *sock, int protocol)
 {
 	struct sock *sk;
 	ax25_cb *ax25;
 
 	switch (sock->type) {
+	case SOCK_RAW:
+		sock->type = SOCK_DGRAM;
+		ax25_raw_warn();
+		/* Fall through */
 	case SOCK_DGRAM:
 		if (protocol == 0 || protocol == PF_AX25)
 			protocol = AX25_P_TEXT;
@@ -830,8 +807,6 @@
 		}
 		break;
 
-	case SOCK_RAW:
-		break;
 	default:
 		return -ESOCKTNOSUPPORT;
 	}
diff -Nru linux-2.6.0-test1/net/ax25/ax25_in.c linux/net/ax25/ax25_in.c
--- linux-2.6.0-test1/net/ax25/ax25_in.c	Sun Jun 15 03:58:07 2003
+++ linux/net/ax25/ax25_in.c	Tue Jul 22 13:23:44 2003
@@ -193,7 +193,7 @@
 {
 	ax25_address src, dest, *next_digi = NULL;
 	int type = 0, mine = 0, dama;
-	struct sock *make, *sk, *raw;
+	struct sock *make, *sk;
 	ax25_digi dp, reverse_dp;
 	ax25_cb *ax25;
 	ax25_dev *ax25_dev;
@@ -239,12 +239,7 @@
 
 	/* UI frame - bypass LAPB processing */
 	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
-		skb->h.raw = skb->data + 2;		/* skip control and pid */
-
-		if ((raw = ax25_addr_match(&dest)) != NULL) {
-			ax25_send_to_raw(raw, skb, skb->data[1]);
-			release_sock(raw);
-		}
+		skb->h.raw = skb->data + 2;	/* skip control and pid */
 
 		if (!mine && ax25cmp(&dest, (ax25_address *)dev->broadcast) != 0) {
 			kfree_skb(skb);
