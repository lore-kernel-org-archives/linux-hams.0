From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Demise of AX.25 raw sockets
Date: Sun, 6 Jul 2003 16:05:14 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307061505.QAA09236@gw.chygwyn.com>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

As part of the work currently going on to improve the AX.25 code in
2.5 kernels I'm proposing that the support for AX.25 raw sockets
should be removed. So if you disagree, please say now :-)

There are a number of reasons why I don't think that we need support
for raw sockets in AX.25:

 - No application that I've seen actually uses them (of course someone on
   this list might prove me wrong on this point!)
 - They are broken and haven't worked for some time and I've not seen any
   bug reports posted recently (again leading me to think nothing uses them).
 - The PF_PACKET family would seem to be just as good an option for
   application writers.
 - Its unclear exactly what the rules were for which packets should
   be delivered to raw sockets.

So I think they are obsolete, but maybe someone knows better? If I don't
hear negative responses in the next few days I'll send the attached patch
to davem for inclusion in the next 2.5 kernel,

Steve.

------------------------------------------------------------------------------

diff -Nru linux-2.5.74/include/net/ax25.h linux/include/net/ax25.h
--- linux-2.5.74/include/net/ax25.h	Sun Jun 15 03:58:07 2003
+++ linux/include/net/ax25.h	Sun Jul  6 15:48:20 2003
@@ -211,8 +211,6 @@
 struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
 struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);
 extern ax25_cb *ax25_find_cb(ax25_address *, ax25_address *, ax25_digi *, struct net_device *);
-extern struct sock *ax25_addr_match(ax25_address *);
-extern void ax25_send_to_raw(struct sock *, struct sk_buff *, int);
 extern void ax25_destroy_socket(ax25_cb *);
 extern ax25_cb *ax25_create_cb(void);
 extern void ax25_fillin_cb(ax25_cb *, ax25_dev *);
diff -Nru linux-2.5.74/net/ax25/TODO linux/net/ax25/TODO
--- linux-2.5.74/net/ax25/TODO	Sat Apr 19 19:48:56 2003
+++ linux/net/ax25/TODO	Sun Jul  6 15:46:06 2003
@@ -18,7 +18,4 @@
 
 Implement proper socket locking in netrom and rose.
 
-Check socket locking when ax25_rcv is sending to raw sockets.  In particular
-ax25_send_to_raw() seems fishy.  Heck - ax25_rcv is fishy.
-
 Handle XID and TEST frames properly.
diff -Nru linux-2.5.74/net/ax25/af_ax25.c linux/net/ax25/af_ax25.c
--- linux-2.5.74/net/ax25/af_ax25.c	Sun Jul  6 15:30:49 2003
+++ linux/net/ax25/af_ax25.c	Sun Jul  6 15:47:08 2003
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
@@ -830,8 +791,6 @@
 		}
 		break;
 
-	case SOCK_RAW:
-		break;
 	default:
 		return -ESOCKTNOSUPPORT;
 	}
diff -Nru linux-2.5.74/net/ax25/ax25_in.c linux/net/ax25/ax25_in.c
--- linux-2.5.74/net/ax25/ax25_in.c	Sun Jun 15 03:58:07 2003
+++ linux/net/ax25/ax25_in.c	Sun Jul  6 15:47:59 2003
@@ -193,7 +193,7 @@
 {
 	ax25_address src, dest, *next_digi = NULL;
 	int type = 0, mine = 0, dama;
-	struct sock *make, *sk, *raw;
+	struct sock *make, *sk;
 	ax25_digi dp, reverse_dp;
 	ax25_cb *ax25;
 	ax25_dev *ax25_dev;
@@ -240,11 +240,6 @@
 	/* UI frame - bypass LAPB processing */
 	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
 		skb->h.raw = skb->data + 2;		/* skip control and pid */
-
-		if ((raw = ax25_addr_match(&dest)) != NULL) {
-			ax25_send_to_raw(raw, skb, skb->data[1]);
-			release_sock(raw);
-		}
 
 		if (!mine && ax25cmp(&dest, (ax25_address *)dev->broadcast) != 0) {
 			kfree_skb(skb);
