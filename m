From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH] Proper reference counting for AX.25 routes.
Date: Sat, 29 Apr 2006 21:05:24 +0100
Message-ID: <20060429200524.GA20270@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Below patch fixes the reference counting for AX.25 routes.  It also gets
rid of the timer madness which currently is being used for routing table
entries that are still busy at the time of their removal from the routing
table.

Please test this,

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21


Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 include/net/ax25.h    |   24 +++++++++++++++---------
 net/ax25/ax25_ip.c    |   23 +++++++++++++++--------
 net/ax25/ax25_route.c |   49 ++++++++-----------------------------------------
 3 files changed, 38 insertions(+), 58 deletions(-)

Index: linux-net.git/include/net/ax25.h
===================================================================
--- linux-net.git.orig/include/net/ax25.h	2006-04-29 15:27:57.000000000 +0100
+++ linux-net.git/include/net/ax25.h	2006-04-29 15:28:15.000000000 +0100
@@ -183,14 +183,26 @@ typedef struct {
 
 typedef struct ax25_route {
 	struct ax25_route	*next;
-	atomic_t		ref;
+	atomic_t		refcount;
 	ax25_address		callsign;
 	struct net_device	*dev;
 	ax25_digi		*digipeat;
 	char			ip_mode;
-	struct timer_list	timer;
 } ax25_route;
 
+static inline void ax25_hold_route(ax25_route *ax25_rt)
+{
+	atomic_inc(&ax25_rt->refcount);
+}
+
+extern void __ax25_put_route(ax25_route *ax25_rt);
+
+static inline void ax25_put_route(ax25_route *ax25_rt)
+{
+	if (atomic_dec_and_test(&ax25_rt->refcount))
+		__ax25_put_route(ax25_rt);
+}
+
 typedef struct {
 	char			slave;			/* slave_mode?   */
 	struct timer_list	slave_timer;		/* timeout timer */
@@ -349,17 +361,11 @@ extern int  ax25_check_iframes_acked(ax2
 extern void ax25_rt_device_down(struct net_device *);
 extern int  ax25_rt_ioctl(unsigned int, void __user *);
 extern struct file_operations ax25_route_fops;
+extern ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev);
 extern int  ax25_rt_autobind(ax25_cb *, ax25_address *);
-extern ax25_route *ax25_rt_find_route(ax25_route *, ax25_address *,
-	struct net_device *);
 extern struct sk_buff *ax25_rt_build_path(struct sk_buff *, ax25_address *, ax25_address *, ax25_digi *);
 extern void ax25_rt_free(void);
 
-static inline void ax25_put_route(ax25_route *ax25_rt)
-{
-	atomic_dec(&ax25_rt->ref);
-}
-
 /* ax25_std_in.c */
 extern int  ax25_std_frame_in(ax25_cb *, struct sk_buff *, int);
 
Index: linux-net.git/net/ax25/ax25_ip.c
===================================================================
--- linux-net.git.orig/net/ax25/ax25_ip.c	2006-04-29 14:40:33.000000000 +0100
+++ linux-net.git/net/ax25/ax25_ip.c	2006-04-29 15:28:15.000000000 +0100
@@ -104,11 +104,13 @@ int ax25_rebuild_header(struct sk_buff *
 {
 	struct sk_buff *ourskb;
 	unsigned char *bp  = skb->data;
-	struct net_device *dev;
+	ax25_route *route;
+	struct net_device *dev = NULL;
 	ax25_address *src, *dst;
+	ax25_digi *digipeat = NULL;
 	ax25_dev *ax25_dev;
-	ax25_route _route, *route = &_route;
 	ax25_cb *ax25;
+	char ip_mode = ' ';
 
 	dst = (ax25_address *)(bp + 1);
 	src = (ax25_address *)(bp + 8);
@@ -116,8 +118,12 @@ int ax25_rebuild_header(struct sk_buff *
   	if (arp_find(bp + 1, skb))
   		return 1;
 
-	route = ax25_rt_find_route(route, dst, NULL);
-	dev      = route->dev;
+	route = ax25_get_route(dst, NULL);
+	if (route) {
+		digipeat = route->digipeat;
+		dev = route->dev;
+		ip_mode = route->ip_mode;
+	};
 
 	if (dev == NULL)
 		dev = skb->dev;
@@ -127,7 +133,7 @@ int ax25_rebuild_header(struct sk_buff *
 	}
 
 	if (bp[16] == AX25_P_IP) {
-		if (route->ip_mode == 'V' || (route->ip_mode == ' ' && ax25_dev->values[AX25_VALUES_IPDEFMODE])) {
+		if (ip_mode == 'V' || (ip_mode == ' ' && ax25_dev->values[AX25_VALUES_IPDEFMODE])) {
 			/*
 			 *	We copy the buffer and release the original thereby
 			 *	keeping it straight
@@ -173,7 +179,7 @@ int ax25_rebuild_header(struct sk_buff *
 			    ourskb, 
 			    ax25_dev->values[AX25_VALUES_PACLEN], 
 			    &src_c,
-			    &dst_c, route->digipeat, dev);
+			    &dst_c, digipeat, dev);
 			if (ax25) {
 				ax25_cb_put(ax25);
 			}
@@ -191,7 +197,7 @@ int ax25_rebuild_header(struct sk_buff *
 
 	skb_pull(skb, AX25_KISS_HEADER_LEN);
 
-	if (route->digipeat != NULL) {
+	if (digipeat != NULL) {
 		if ((ourskb = ax25_rt_build_path(skb, src, dst, route->digipeat)) == NULL) {
 			kfree_skb(skb);
 			goto put;
@@ -203,7 +209,8 @@ int ax25_rebuild_header(struct sk_buff *
 	ax25_queue_xmit(skb, dev);
 
 put:
-	ax25_put_route(route);
+	if (route)
+		ax25_put_route(route);
 
   	return 1;
 }
Index: linux-net.git/net/ax25/ax25_route.c
===================================================================
--- linux-net.git.orig/net/ax25/ax25_route.c	2006-04-29 15:23:13.000000000 +0100
+++ linux-net.git/net/ax25/ax25_route.c	2006-04-29 15:28:15.000000000 +0100
@@ -41,8 +41,6 @@
 static ax25_route *ax25_route_list;
 static DEFINE_RWLOCK(ax25_route_lock);
 
-static ax25_route *ax25_get_route(ax25_address *, struct net_device *);
-
 void ax25_rt_device_down(struct net_device *dev)
 {
 	ax25_route *s, *t, *ax25_rt;
@@ -115,7 +113,7 @@ static int ax25_rt_add(struct ax25_route
 		return -ENOMEM;
 	}
 
-	atomic_set(&ax25_rt->ref, 0);
+	atomic_set(&ax25_rt->refcount, 1);
 	ax25_rt->callsign     = route->dest_addr;
 	ax25_rt->dev          = ax25_dev->dev;
 	ax25_rt->digipeat     = NULL;
@@ -140,23 +138,10 @@ static int ax25_rt_add(struct ax25_route
 	return 0;
 }
 
-static void ax25_rt_destroy(ax25_route *ax25_rt)
+void __ax25_put_route(ax25_route *ax25_rt)
 {
-	if (atomic_read(&ax25_rt->ref) == 0) {
-		kfree(ax25_rt->digipeat);
-		kfree(ax25_rt);
-		return;
-	}
-
-	/*
-	 * Uh...  Route is still in use; we can't yet destroy it.  Retry later.
-	 */
-	init_timer(&ax25_rt->timer);
-	ax25_rt->timer.data	= (unsigned long) ax25_rt;
-	ax25_rt->timer.function	= (void *) ax25_rt_destroy;
-	ax25_rt->timer.expires	= jiffies + 5 * HZ;
-
-	add_timer(&ax25_rt->timer);
+	kfree(ax25_rt->digipeat);
+	kfree(ax25_rt);
 }
 
 static int ax25_rt_del(struct ax25_routes_struct *route)
@@ -177,12 +162,12 @@ static int ax25_rt_del(struct ax25_route
 		    ax25cmp(&route->dest_addr, &s->callsign) == 0) {
 			if (ax25_route_list == s) {
 				ax25_route_list = s->next;
-				ax25_rt_destroy(s);
+				ax25_put_route(s);
 			} else {
 				for (t = ax25_route_list; t != NULL; t = t->next) {
 					if (t->next == s) {
 						t->next = s->next;
-						ax25_rt_destroy(s);
+						ax25_put_route(s);
 						break;
 					}
 				}
@@ -362,7 +347,7 @@ struct file_operations ax25_route_fops =
  *
  *	Only routes with a reference count of zero can be destroyed.
  */
-static ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
+ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 {
 	ax25_route *ax25_spe_rt = NULL;
 	ax25_route *ax25_def_rt = NULL;
@@ -392,7 +377,7 @@ static ax25_route *ax25_get_route(ax25_a
 		ax25_rt = ax25_spe_rt;
 
 	if (ax25_rt != NULL)
-		atomic_inc(&ax25_rt->ref);
+		ax25_hold_route(ax25_rt);
 
 	read_unlock(&ax25_route_lock);
 
@@ -467,24 +452,6 @@ put:
 	return 0;
 }
 
-ax25_route *ax25_rt_find_route(ax25_route * route, ax25_address *addr,
-	struct net_device *dev)
-{
-	ax25_route *ax25_rt;
-
-	if ((ax25_rt = ax25_get_route(addr, dev)))
-		return ax25_rt;
-
-	route->next     = NULL;
-	atomic_set(&route->ref, 1);
-	route->callsign = *addr;
-	route->dev      = dev;
-	route->digipeat = NULL;
-	route->ip_mode  = ' ';
-
-	return route;
-}
-
 struct sk_buff *ax25_rt_build_path(struct sk_buff *skb, ax25_address *src,
 	ax25_address *dest, ax25_digi *digi)
 {
