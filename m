From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] ax25_cb refcounting & waitqueue usage
Date: Sun, 6 Jul 2003 19:27:34 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030706192734.E4454@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

Second patch for this weekend...
This patch does two things, it adds reference counting to the ax25_cb
structure (until now only the ax25_cb list was protected, not the parts
using it) and it fixes an oops on interrupted socket syscalls. (e.g.
pressing Ctrl-C while in the connect function) The waitqueue was not
removed from the list and caused an oops in the socket release.

I have had only a quick look at Steven's patch but I don't think the two
will clash...

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="ax25-2.5.74.rxq.diff"

diff -ru linux-2.5.74/net/ax25/af_ax25.c linux-2.5.74.rxq/net/ax25/af_ax25.c
--- linux-2.5.74/net/ax25/af_ax25.c	2003-07-06 01:05:13.000000000 +0200
+++ linux-2.5.74.rxq/net/ax25/af_ax25.c	2003-07-06 18:43:45.000000000 +0200
@@ -54,13 +54,20 @@
 ax25_cb *ax25_list;
 spinlock_t ax25_list_lock = SPIN_LOCK_UNLOCKED;
 
+spinlock_t ax25_cb_lock = SPIN_LOCK_UNLOCKED;
+
 static struct proto_ops ax25_proto_ops;
 
 /*
  *	Free an allocated ax25 control block. This is done to centralise
  *	the MOD count code.
  */
-void ax25_free_cb(ax25_cb *ax25)
+/*
+ *	Changed name to include undescores. Nobody should call this without
+ *	going through the ref counter anymore 
+ *	- PE1RXQ
+ */
+void __ax25_free_cb(ax25_cb *ax25)
 {
 	if (ax25->digipeat != NULL) {
 		kfree(ax25->digipeat);
@@ -70,9 +77,25 @@
 	kfree(ax25);
 }
 
+void ax25_up_cb(ax25_cb *ax25)
+{
+	spin_lock_bh(&ax25_cb_lock);
+	ax25->refcount++;
+	spin_unlock_bh(&ax25_cb_lock);
+}
+
+void ax25_down_cb(ax25_cb *ax25)
+{
+	spin_lock_bh(&ax25_cb_lock);
+	ax25->refcount--;
+	if (!ax25->refcount)
+		__ax25_free_cb(ax25);
+	spin_unlock_bh(&ax25_cb_lock);
+}
+
 static void ax25_free_sock(struct sock *sk)
 {
-	ax25_free_cb(ax25_sk(sk));
+	ax25_down_cb(ax25_sk(sk));
 }
 
 /*
@@ -85,6 +108,7 @@
 	spin_lock_bh(&ax25_list_lock);
 	if ((s = ax25_list) == ax25) {
 		ax25_list = s->next;
+		ax25_down_cb(ax25);
 		spin_unlock_bh(&ax25_list_lock);
 		return;
 	}
@@ -92,6 +116,7 @@
 	while (s != NULL && s->next != NULL) {
 		if (s->next == ax25) {
 			s->next = ax25->next;
+			ax25_down_cb(ax25);
 			spin_unlock_bh(&ax25_list_lock);
 			return;
 		}
@@ -156,6 +181,7 @@
 void ax25_insert_socket(ax25_cb *ax25)
 {
 	spin_lock_bh(&ax25_list_lock);
+	ax25_up_cb(ax25);
 	ax25->next = ax25_list;
 	ax25_list  = ax25;
 	spin_unlock_bh(&ax25_list_lock);
@@ -240,6 +266,7 @@
 				if (s->digipeat != NULL && s->digipeat->ndigi != 0)
 					continue;
 			}
+			ax25_up_cb(s);
 			spin_unlock_bh(&ax25_list_lock);
 
 			return s;
@@ -352,7 +379,7 @@
 			sk_free(ax25->sk);
 		}
 	} else {
-		ax25_free_cb(ax25);
+		ax25_down_cb(ax25);
 	}
 }
 
@@ -507,6 +534,7 @@
 		return NULL;
 
 	memset(ax25, 0x00, sizeof(*ax25));
+	ax25_up_cb(ax25);
 
 	skb_queue_head_init(&ax25->write_queue);
 	skb_queue_head_init(&ax25->frag_queue);
@@ -877,7 +905,7 @@
 		break;
 	default:
 		sk_free(sk);
-		ax25_free_cb(ax25);
+		ax25_down_cb(ax25);
 		return NULL;
 	}
 
@@ -1092,7 +1120,7 @@
 	int addr_len, int flags)
 {
 	struct sock *sk = sock->sk;
-	ax25_cb *ax25 = ax25_sk(sk);
+	ax25_cb *ax25 = ax25_sk(sk), *ax25t;
 	struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)uaddr;
 	ax25_digi *digi = NULL;
 	int ct = 0, err = 0;
@@ -1207,11 +1235,12 @@
 	}
 
 	if (sk->sk_type == SOCK_SEQPACKET &&
-	    ax25_find_cb(&ax25->source_addr, &fsa->fsa_ax25.sax25_call, digi,
-		    	 ax25->ax25_dev->dev)) {
+	    (ax25t=ax25_find_cb(&ax25->source_addr, &fsa->fsa_ax25.sax25_call, digi,
+		    	 ax25->ax25_dev->dev))) {
 		if (digi != NULL)
 			kfree(digi);
 		err = -EADDRINUSE;		/* Already such a connection */
+		ax25_down_cb(ax25t);
 		goto out;
 	}
 
@@ -1272,6 +1301,8 @@
 				lock_sock(sk);
 				continue;
 			}
+			current->state = TASK_RUNNING;
+			remove_wait_queue(sk->sk_sleep, &wait);
 			return -ERESTARTSYS;
 		}
 		current->state = TASK_RUNNING;
@@ -1339,6 +1370,8 @@
 			lock_sock(sk);
 			continue;
 		}
+		current->state = TASK_RUNNING;
+		remove_wait_queue(sk->sk_sleep, &wait);
 		return -ERESTARTSYS;
 	}
 	current->state = TASK_RUNNING;
@@ -1955,6 +1988,8 @@
 EXPORT_SYMBOL(ax25_rebuild_header);
 EXPORT_SYMBOL(ax25_findbyuid);
 EXPORT_SYMBOL(ax25_find_cb);
+EXPORT_SYMBOL(ax25_up_cb);
+EXPORT_SYMBOL(ax25_down_cb);
 EXPORT_SYMBOL(ax25_linkfail_register);
 EXPORT_SYMBOL(ax25_linkfail_release);
 EXPORT_SYMBOL(ax25_listen_register);
diff -ru linux-2.5.74/net/ax25/ax25_in.c linux-2.5.74.rxq/net/ax25/ax25_in.c
--- linux-2.5.74/net/ax25/ax25_in.c	2003-07-06 01:05:12.000000000 +0200
+++ linux-2.5.74.rxq/net/ax25/ax25_in.c	2003-07-06 18:44:42.000000000 +0200
@@ -329,6 +329,7 @@
 		if (ax25_process_rx_frame(ax25, skb, type, dama) == 0)
 			kfree_skb(skb);
 
+		ax25_down_cb(ax25);
 		return 0;
 	}
 
diff -ru linux-2.5.74/net/ax25/ax25_ip.c linux-2.5.74.rxq/net/ax25/ax25_ip.c
--- linux-2.5.74/net/ax25/ax25_ip.c	2003-07-06 01:05:13.000000000 +0200
+++ linux-2.5.74.rxq/net/ax25/ax25_ip.c	2003-07-06 18:46:14.000000000 +0200
@@ -107,6 +107,7 @@
 	ax25_address *src, *dst;
 	ax25_dev *ax25_dev;
 	ax25_route _route, *route = &_route;
+	ax25_cb *ax25;
 
 	dst = (ax25_address *)(bp + 1);
 	src = (ax25_address *)(bp + 8);
@@ -167,9 +168,14 @@
 			skb_pull(ourskb, AX25_HEADER_LEN - 1);	/* Keep PID */
 			ourskb->nh.raw = ourskb->data;
 
-			ax25_send_frame(ourskb, ax25_dev->values[AX25_VALUES_PACLEN], &src_c,
-&dst_c, route->digipeat, dev);
-
+			ax25=ax25_send_frame(
+			    ourskb, 
+			    ax25_dev->values[AX25_VALUES_PACLEN], 
+			    &src_c,
+			    &dst_c, route->digipeat, dev);
+			if (ax25) {
+				ax25_down_cb(ax25);
+			}
 			goto put;
 		}
 	}
diff -ru linux-2.5.74/net/ax25/ax25_out.c linux-2.5.74.rxq/net/ax25/ax25_out.c
--- linux-2.5.74/net/ax25/ax25_out.c	2003-07-06 01:05:13.000000000 +0200
+++ linux-2.5.74.rxq/net/ax25/ax25_out.c	2003-07-06 18:46:53.000000000 +0200
@@ -71,7 +71,7 @@
 
 	if (digi != NULL) {
 		if ((ax25->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
-			ax25_free_cb(ax25);
+			ax25_down_cb(ax25);
 			return NULL;
 		}
 		memcpy(ax25->digipeat, digi, sizeof(ax25_digi));
diff -ru linux-2.5.74/include/net/ax25.h linux-2.5.74.rxq/include/net/ax25.h
--- linux-2.5.74/include/net/ax25.h	2003-07-06 01:12:50.000000000 +0200
+++ linux-2.5.74.rxq/include/net/ax25.h	2003-07-05 23:19:25.000000000 +0200
@@ -199,6 +199,7 @@
 	unsigned char		window;
 	struct timer_list	timer;
 	struct sock		*sk;		/* Backlink to socket */
+	int			refcount;
 } ax25_cb;
 
 #define ax25_sk(__sk) ((ax25_cb *)(__sk)->sk_protinfo)
@@ -206,7 +207,8 @@
 /* af_ax25.c */
 extern ax25_cb *ax25_list;
 extern spinlock_t ax25_list_lock;
-extern void ax25_free_cb(ax25_cb *);
+extern void ax25_up_cb(ax25_cb *);
+extern void ax25_down_cb(ax25_cb *);
 extern void ax25_insert_socket(ax25_cb *);
 struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
 struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);

--AWniW0JNca5xppdA--

