From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] ax25_cb refcounting & waitqueue usage
Date: Wed, 9 Jul 2003 19:06:36 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030709190636.E245@jeroen.pe1rxq.ampr.org>
References: <20030706192734.E4454@jeroen.pe1rxq.ampr.org> <20030707133710.GJ1820@conectiva.com.br> <20030707192340.A219@jeroen.pe1rxq.ampr.org> <20030707172503.GC5292@conectiva.com.br> <20030709005215.A219@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030709005215.A219@jeroen.pe1rxq.ampr.org>; from pe1rxq@amsat.org on Wed, Jul 09, 2003 at 00:52:15 +0200
List-Id: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org
Cc: Arnaldo Carvalho de Melo <acme@conectiva.com.br>, linux-hams@vger.kernel.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a new patch to replace my first one...
(Anybody on this list should know by now that I always send at least two
versions of each patch ;)

It does the following things:
-fixes waitqueue oops on interrupted socket call
-Adds refcounting to the ax25_cb struct with two new functions: 
 ax25_cb_hold() and ax25_cb_put()
-skb allocation uses dev->hard_header_len instead of some predicted worst
case.
-The ax25_cb list uses hlists

The biggest change is the hlist one combined with the refcounting.
This makes ax25 look somewhat like the other network stack as Arnaldo
sugested.

Jeroen
--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=ISO-8859-1
Content-Disposition: attachment; filename="ax25-2.5.74.rxq.diff"
Content-Transfer-Encoding: quoted-printable

diff -ru linux-2.5.74/net/ax25/af_ax25.c linux-2.5.74.rxq/net/ax25/af_ax25.=
c=0A--- linux-2.5.74/net/ax25/af_ax25.c	2003-07-06 01:05:13.000000000 +0200=
=0A+++ linux-2.5.74.rxq/net/ax25/af_ax25.c	2003-07-09 18:22:17.000000000 +0=
200=0A@@ -51,16 +51,23 @@=0A =0A =0A =0A-ax25_cb *ax25_list;=0A+HLIST_HEAD(=
ax25_list);=0A spinlock_t ax25_list_lock =3D SPIN_LOCK_UNLOCKED;=0A =0A+spi=
nlock_t ax25_cb_lock =3D SPIN_LOCK_UNLOCKED;=0A+=0A static struct proto_ops=
 ax25_proto_ops;=0A =0A /*=0A  *	Free an allocated ax25 control block. This=
 is done to centralise=0A  *	the MOD count code.=0A  */=0A-void ax25_free_c=
b(ax25_cb *ax25)=0A+/*=0A+ *	Changed name to include undescores. Nobody sho=
uld call this without=0A+ *	going through the ref counter anymore =0A+ *	- =
PE1RXQ=0A+ */=0A+void __ax25_free_cb(ax25_cb *ax25)=0A {=0A 	if (ax25->digi=
peat !=3D NULL) {=0A 		kfree(ax25->digipeat);=0A@@ -70,35 +77,36 @@=0A 	kfr=
ee(ax25);=0A }=0A =0A+void ax25_cb_hold(ax25_cb *ax25)=0A+{=0A+	spin_lock_b=
h(&ax25_cb_lock);=0A+	ax25->refcount++;=0A+	spin_unlock_bh(&ax25_cb_lock);=
=0A+}=0A+=0A+void ax25_cb_put(ax25_cb *ax25)=0A+{=0A+	spin_lock_bh(&ax25_cb=
_lock);=0A+	ax25->refcount--;=0A+	if (!ax25->refcount)=0A+		__ax25_free_cb(=
ax25);=0A+	spin_unlock_bh(&ax25_cb_lock);=0A+}=0A+=0A static void ax25_free=
_sock(struct sock *sk)=0A {=0A-	ax25_free_cb(ax25_sk(sk));=0A+	ax25_cb_put(=
ax25_sk(sk));=0A }=0A =0A /*=0A  *	Socket removal during an interrupt is no=
w safe.=0A  */=0A-static void ax25_remove_socket(ax25_cb *ax25)=0A+static v=
oid ax25_cb_del(ax25_cb *ax25)=0A {=0A-	ax25_cb *s;=0A-=0A 	spin_lock_bh(&a=
x25_list_lock);=0A-	if ((s =3D ax25_list) =3D=3D ax25) {=0A-		ax25_list =3D=
 s->next;=0A-		spin_unlock_bh(&ax25_list_lock);=0A-		return;=0A-	}=0A-=0A-	=
while (s !=3D NULL && s->next !=3D NULL) {=0A-		if (s->next =3D=3D ax25) {=
=0A-			s->next =3D ax25->next;=0A-			spin_unlock_bh(&ax25_list_lock);=0A-		=
	return;=0A-		}=0A-=0A-		s =3D s->next;=0A-	}=0A+	hlist_del_init(&ax25->ax2=
5_node);=0A 	spin_unlock_bh(&ax25_list_lock);=0A+	ax25_cb_put(ax25);=0A }=
=0A =0A /*=0A@@ -108,17 +116,17 @@=0A {=0A 	ax25_dev *ax25_dev;=0A 	ax25_cb=
 *s;=0A+	struct hlist_node *node;=0A =0A 	if ((ax25_dev =3D ax25_dev_ax25de=
v(dev)) =3D=3D NULL)=0A 		return;=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A=
-	for (s =3D ax25_list; s !=3D NULL; s =3D s->next) {=0A+	ax25_for_each(s, =
node, &ax25_list)=0A 		if (s->ax25_dev =3D=3D ax25_dev) {=0A 			s->ax25_dev=
 =3D NULL;=0A 			ax25_disconnect(s, ENETUNREACH);=0A 		}=0A-	}=0A 	spin_unl=
ock_bh(&ax25_list_lock);=0A }=0A =0A@@ -153,11 +161,11 @@=0A /*=0A  *	Add a=
 socket to the bound sockets list.=0A  */=0A-void ax25_insert_socket(ax25_c=
b *ax25)=0A+void ax25_cb_add(ax25_cb *ax25)=0A {=0A 	spin_lock_bh(&ax25_lis=
t_lock);=0A-	ax25->next =3D ax25_list;=0A-	ax25_list  =3D ax25;=0A+	ax25_cb=
_hold(ax25);=0A+	hlist_add_head(&ax25->ax25_node, &ax25_list);=0A 	spin_unl=
ock_bh(&ax25_list_lock);=0A }=0A =0A@@ -169,9 +177,10 @@=0A 	struct net_dev=
ice *dev, int type)=0A {=0A 	ax25_cb *s;=0A+	struct hlist_node *node;=0A =
=0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (s =3D ax25_list; s !=3D NULL; =
s =3D s->next) {=0A+	ax25_for_each(s, node, &ax25_list) {=0A 		if ((s->iamd=
igi && !digi) || (!s->iamdigi && digi))=0A 			continue;=0A 		if (s->sk && !=
ax25cmp(&s->source_addr, addr) &&=0A@@ -197,9 +206,10 @@=0A {=0A 	struct so=
ck *sk =3D NULL;=0A 	ax25_cb *s;=0A+	struct hlist_node *node;=0A =0A 	spin_=
lock_bh(&ax25_list_lock);=0A-	for (s =3D ax25_list; s !=3D NULL; s =3D s->n=
ext) {=0A+	ax25_for_each(s, node, &ax25_list) {=0A 		if (s->sk && !ax25cmp(=
&s->source_addr, my_addr) &&=0A 		    !ax25cmp(&s->dest_addr, dest_addr) &&=
=0A 		    s->sk->sk_type =3D=3D type) {=0A@@ -223,9 +233,10 @@=0A 	ax25_dig=
i *digi, struct net_device *dev)=0A {=0A 	ax25_cb *s;=0A+	struct hlist_node=
 *node;=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (s =3D ax25_list; s =
!=3D NULL; s =3D s->next) {=0A+	ax25_for_each(s, node, &ax25_list) {=0A 		i=
f (s->sk && s->sk->sk_type !=3D SOCK_SEQPACKET)=0A 			continue;=0A 		if (s-=
>ax25_dev =3D=3D NULL)=0A@@ -240,6 +251,7 @@=0A 				if (s->digipeat !=3D NU=
LL && s->digipeat->ndigi !=3D 0)=0A 					continue;=0A 			}=0A+			ax25_cb_ho=
ld(s);=0A 			spin_unlock_bh(&ax25_list_lock);=0A =0A 			return s;=0A@@ -257=
,16 +269,17 @@=0A {=0A 	struct sock *sk =3D NULL;=0A 	ax25_cb *s;=0A+	struc=
t hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (s =3D a=
x25_list; s !=3D NULL; s =3D s->next) {=0A+	ax25_for_each(s, node, &ax25_li=
st)=0A 		if (s->sk !=3D NULL && ax25cmp(&s->source_addr, addr) =3D=3D 0 &&=
=0A 		    s->sk->sk_type =3D=3D SOCK_RAW) {=0A 			sk =3D s->sk;=0A 			lock_=
sock(sk);=0A 			break;=0A 		}=0A-	}=0A+=0A 	spin_unlock_bh(&ax25_list_lock)=
;=0A =0A 	return sk;=0A@@ -312,7 +325,7 @@=0A {=0A 	struct sk_buff *skb;=0A=
 =0A-	ax25_remove_socket(ax25);=0A+	ax25_cb_del(ax25);=0A =0A 	ax25_stop_he=
artbeat(ax25);=0A 	ax25_stop_t1timer(ax25);=0A@@ -352,7 +365,7 @@=0A 			sk_=
free(ax25->sk);=0A 		}=0A 	} else {=0A-		ax25_free_cb(ax25);=0A+		ax25_cb_p=
ut(ax25);=0A 	}=0A }=0A =0A@@ -507,6 +520,7 @@=0A 		return NULL;=0A =0A 	me=
mset(ax25, 0x00, sizeof(*ax25));=0A+	ax25_cb_hold(ax25);=0A =0A 	skb_queue_=
head_init(&ax25->write_queue);=0A 	skb_queue_head_init(&ax25->frag_queue);=
=0A@@ -877,7 +891,7 @@=0A 		break;=0A 	default:=0A 		sk_free(sk);=0A-		ax25=
_free_cb(ax25);=0A+		ax25_cb_put(ax25);=0A 		return NULL;=0A 	}=0A =0A@@ -1=
076,7 +1090,7 @@=0A 		ax25_fillin_cb(ax25, ax25_dev);=0A =0A done:=0A-	ax25=
_insert_socket(ax25);=0A+	ax25_cb_add(ax25);=0A 	sk->sk_zapped =3D 0;=0A =
=0A out:=0A@@ -1092,7 +1106,7 @@=0A 	int addr_len, int flags)=0A {=0A 	stru=
ct sock *sk =3D sock->sk;=0A-	ax25_cb *ax25 =3D ax25_sk(sk);=0A+	ax25_cb *a=
x25 =3D ax25_sk(sk), *ax25t;=0A 	struct full_sockaddr_ax25 *fsa =3D (struct=
 full_sockaddr_ax25 *)uaddr;=0A 	ax25_digi *digi =3D NULL;=0A 	int ct =3D 0=
, err =3D 0;=0A@@ -1198,7 +1212,7 @@=0A 			goto out;=0A =0A 		ax25_fillin_c=
b(ax25, ax25->ax25_dev);=0A-		ax25_insert_socket(ax25);=0A+		ax25_cb_add(ax=
25);=0A 	} else {=0A 		if (ax25->ax25_dev =3D=3D NULL) {=0A 			err =3D -EHO=
STUNREACH;=0A@@ -1207,11 +1221,12 @@=0A 	}=0A =0A 	if (sk->sk_type =3D=3D S=
OCK_SEQPACKET &&=0A-	    ax25_find_cb(&ax25->source_addr, &fsa->fsa_ax25.sa=
x25_call, digi,=0A-		    	 ax25->ax25_dev->dev)) {=0A+	    (ax25t=3Dax25_fi=
nd_cb(&ax25->source_addr, &fsa->fsa_ax25.sax25_call, digi,=0A+		    	 ax25-=
>ax25_dev->dev))) {=0A 		if (digi !=3D NULL)=0A 			kfree(digi);=0A 		err =
=3D -EADDRINUSE;		/* Already such a connection */=0A+		ax25_cb_put(ax25t);=
=0A 		goto out;=0A 	}=0A =0A@@ -1272,6 +1287,8 @@=0A 				lock_sock(sk);=0A =
				continue;=0A 			}=0A+			current->state =3D TASK_RUNNING;=0A+			remove_w=
ait_queue(sk->sk_sleep, &wait);=0A 			return -ERESTARTSYS;=0A 		}=0A 		curr=
ent->state =3D TASK_RUNNING;=0A@@ -1339,6 +1356,8 @@=0A 			lock_sock(sk);=
=0A 			continue;=0A 		}=0A+		current->state =3D TASK_RUNNING;=0A+		remove_w=
ait_queue(sk->sk_sleep, &wait);=0A 		return -ERESTARTSYS;=0A 	}=0A 	current=
->state =3D TASK_RUNNING;=0A@@ -1518,7 +1537,7 @@=0A 	SOCK_DEBUG(sk, "AX.25=
: sendto: building packet.\n");=0A =0A 	/* Assume the worst case */=0A-	siz=
e =3D len + 3 + ax25_addr_size(dp) + AX25_BPQ_HEADER_LEN;=0A+	size =3D len =
+ ax25->ax25_dev->dev->hard_header_len;=0A =0A 	skb =3D sock_alloc_send_skb=
(sk, size, msg->msg_flags&MSG_DONTWAIT, &err);=0A 	if (skb =3D=3D NULL)=0A@=
@ -1844,6 +1863,7 @@=0A 	int len =3D 0;=0A 	off_t pos =3D 0;=0A 	off_t begi=
n =3D 0;=0A+	struct hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_list_lock)=
;=0A =0A@@ -1852,7 +1872,7 @@=0A 	 * magic dev src_addr dest_addr,digi1,dig=
i2,.. st vs vr va t1 t1 t2 t2 t3 t3 idle idle n2 n2 rtt window paclen Snd-Q=
 Rcv-Q inode=0A 	 */=0A =0A-	for (ax25 =3D ax25_list; ax25 !=3D NULL; ax25 =
=3D ax25->next) {=0A+	ax25_for_each(ax25, node, &ax25_list) {=0A 		len +=3D=
 sprintf(buffer+len, "%8.8lx %s %s%s ",=0A 				(long) ax25,=0A 				ax25->ax=
25_dev =3D=3D NULL? "???" : ax25->ax25_dev->dev->name,=0A@@ -1955,6 +1975,8=
 @@=0A EXPORT_SYMBOL(ax25_rebuild_header);=0A EXPORT_SYMBOL(ax25_findbyuid)=
;=0A EXPORT_SYMBOL(ax25_find_cb);=0A+EXPORT_SYMBOL(ax25_cb_hold);=0A+EXPORT=
_SYMBOL(ax25_cb_put);=0A EXPORT_SYMBOL(ax25_linkfail_register);=0A EXPORT_S=
YMBOL(ax25_linkfail_release);=0A EXPORT_SYMBOL(ax25_listen_register);=0Adif=
f -ru linux-2.5.74/net/ax25/ax25_ds_subr.c linux-2.5.74.rxq/net/ax25/ax25_d=
s_subr.c=0A--- linux-2.5.74/net/ax25/ax25_ds_subr.c	2003-07-06 01:05:13.000=
000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_ds_subr.c	2003-07-09 18:1=
8:00.000000000 +0200=0A@@ -40,6 +40,7 @@=0A void ax25_ds_enquiry_response(a=
x25_cb *ax25)=0A {=0A 	ax25_cb *ax25o;=0A+	struct hlist_node *node;=0A =0A =
	/* Please note that neither DK4EG=B4s nor DG2FEF=B4s=0A 	 * DAMA spec ment=
ion the following behaviour as seen=0A@@ -80,7 +81,7 @@=0A 	ax25_ds_set_tim=
er(ax25->ax25_dev);=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (ax25o =
=3D ax25_list; ax25o !=3D NULL; ax25o =3D ax25o->next) {=0A+	ax25_for_each(=
ax25o, node, &ax25_list) {=0A 		if (ax25o =3D=3D ax25)=0A 			continue;=0A =
=0A@@ -160,9 +161,10 @@=0A {=0A 	ax25_cb *ax25;=0A 	int res =3D 0;=0A+	stru=
ct hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (ax25 =
=3D ax25_list; ax25 !=3D NULL ; ax25 =3D ax25->next)=0A+	ax25_for_each(ax25=
, node, &ax25_list)=0A 		if (ax25->ax25_dev =3D=3D ax25_dev && (ax25->condi=
tion & AX25_COND_DAMA_MODE) && ax25->state > AX25_STATE_1) {=0A 			res =3D =
1;=0A 			break;=0Adiff -ru linux-2.5.74/net/ax25/ax25_ds_timer.c linux-2.5.=
74.rxq/net/ax25/ax25_ds_timer.c=0A--- linux-2.5.74/net/ax25/ax25_ds_timer.c=
	2003-07-06 01:05:13.000000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_d=
s_timer.c	2003-07-09 18:18:21.000000000 +0200=0A@@ -74,6 +74,7 @@=0A {=0A 	=
ax25_dev *ax25_dev =3D (struct ax25_dev *) arg;=0A 	ax25_cb *ax25;=0A+	stru=
ct hlist_node *node;=0A =0A 	if (ax25_dev =3D=3D NULL || !ax25_dev->dama.sl=
ave)=0A 		return;			/* Yikes! */=0A@@ -84,7 +85,7 @@=0A 	}=0A =0A 	spin_loc=
k_bh(&ax25_list_lock);=0A-	for (ax25=3Dax25_list; ax25 !=3D NULL; ax25 =3D =
ax25->next) {=0A+	ax25_for_each(ax25, node, &ax25_list) {=0A 		if (ax25->ax=
25_dev !=3D ax25_dev || !(ax25->condition & AX25_COND_DAMA_MODE))=0A 			con=
tinue;=0A =0Adiff -ru linux-2.5.74/net/ax25/ax25_in.c linux-2.5.74.rxq/net/=
ax25/ax25_in.c=0A--- linux-2.5.74/net/ax25/ax25_in.c	2003-07-06 01:05:12.00=
0000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_in.c	2003-07-09 18:15:47=
.000000000 +0200=0A@@ -329,6 +329,7 @@=0A 		if (ax25_process_rx_frame(ax25,=
 skb, type, dama) =3D=3D 0)=0A 			kfree_skb(skb);=0A =0A+		ax25_cb_put(ax25=
);=0A 		return 0;=0A 	}=0A =0A@@ -429,7 +430,7 @@=0A =0A 	ax25->state =3D A=
X25_STATE_3;=0A =0A-	ax25_insert_socket(ax25);=0A+	ax25_cb_add(ax25);=0A =
=0A 	ax25_start_heartbeat(ax25);=0A 	ax25_start_t3timer(ax25);=0Adiff -ru l=
inux-2.5.74/net/ax25/ax25_ip.c linux-2.5.74.rxq/net/ax25/ax25_ip.c=0A--- li=
nux-2.5.74/net/ax25/ax25_ip.c	2003-07-06 01:05:13.000000000 +0200=0A+++ lin=
ux-2.5.74.rxq/net/ax25/ax25_ip.c	2003-07-09 18:16:33.000000000 +0200=0A@@ -=
107,6 +107,7 @@=0A 	ax25_address *src, *dst;=0A 	ax25_dev *ax25_dev;=0A 	ax=
25_route _route, *route =3D &_route;=0A+	ax25_cb *ax25;=0A =0A 	dst =3D (ax=
25_address *)(bp + 1);=0A 	src =3D (ax25_address *)(bp + 8);=0A@@ -167,9 +1=
68,14 @@=0A 			skb_pull(ourskb, AX25_HEADER_LEN - 1);	/* Keep PID */=0A 			=
ourskb->nh.raw =3D ourskb->data;=0A =0A-			ax25_send_frame(ourskb, ax25_dev=
->values[AX25_VALUES_PACLEN], &src_c,=0A-&dst_c, route->digipeat, dev);=0A-=
=0A+			ax25=3Dax25_send_frame(=0A+			    ourskb, =0A+			    ax25_dev->value=
s[AX25_VALUES_PACLEN], =0A+			    &src_c,=0A+			    &dst_c, route->digipeat=
, dev);=0A+			if (ax25) {=0A+				ax25_cb_put(ax25);=0A+			}=0A 			goto put;=
=0A 		}=0A 	}=0Adiff -ru linux-2.5.74/net/ax25/ax25_out.c linux-2.5.74.rxq/=
net/ax25/ax25_out.c=0A--- linux-2.5.74/net/ax25/ax25_out.c	2003-07-06 01:05=
:13.000000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_out.c	2003-07-09 1=
8:17:26.000000000 +0200=0A@@ -71,7 +71,7 @@=0A =0A 	if (digi !=3D NULL) {=
=0A 		if ((ax25->digipeat =3D kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) =3D=
=3D NULL) {=0A-			ax25_free_cb(ax25);=0A+			ax25_cb_put(ax25);=0A 			return=
 NULL;=0A 		}=0A 		memcpy(ax25->digipeat, digi, sizeof(ax25_digi));=0A@@ -9=
3,7 +93,7 @@=0A #endif=0A 	}=0A =0A-	ax25_insert_socket(ax25);=0A+	ax25_cb_=
add(ax25);=0A =0A 	ax25->state =3D AX25_STATE_1;=0A =0Adiff -ru linux-2.5.7=
4/net/ax25/ax25_subr.c linux-2.5.74.rxq/net/ax25/ax25_subr.c=0A--- linux-2.=
5.74/net/ax25/ax25_subr.c	2003-07-06 01:05:13.000000000 +0200=0A+++ linux-2=
.5.74.rxq/net/ax25/ax25_subr.c	2003-07-07 22:30:04.000000000 +0200=0A@@ -15=
8,10 +158,10 @@=0A 	struct sk_buff *skb;=0A 	unsigned char  *dptr;=0A =0A-	=
if ((skb =3D alloc_skb(AX25_BPQ_HEADER_LEN + ax25_addr_size(ax25->digipeat)=
 + 2, GFP_ATOMIC)) =3D=3D NULL)=0A+	if ((skb =3D alloc_skb(ax25->ax25_dev->=
dev->hard_header_len + 2, GFP_ATOMIC)) =3D=3D NULL)=0A 		return;=0A =0A-	sk=
b_reserve(skb, AX25_BPQ_HEADER_LEN + ax25_addr_size(ax25->digipeat));=0A+	s=
kb_reserve(skb, ax25->ax25_dev->dev->hard_header_len);=0A =0A 	skb->nh.raw =
=3D skb->data;=0A =0A@@ -202,10 +202,10 @@=0A 	if (dev =3D=3D NULL)=0A 		re=
turn;=0A =0A-	if ((skb =3D alloc_skb(AX25_BPQ_HEADER_LEN + ax25_addr_size(d=
igi) + 1, GFP_ATOMIC)) =3D=3D NULL)=0A+	if ((skb =3D alloc_skb(dev->hard_he=
ader_len + 1, GFP_ATOMIC)) =3D=3D NULL)=0A 		return;	/* Next SABM will get =
DM'd */=0A =0A-	skb_reserve(skb, AX25_BPQ_HEADER_LEN + ax25_addr_size(digi)=
);=0A+	skb_reserve(skb, dev->hard_header_len);=0A 	skb->nh.raw =3D skb->dat=
a;=0A =0A 	ax25_digi_invert(digi, &retdigi);=0Adiff -ru linux-2.5.74/includ=
e/net/ax25.h linux-2.5.74.rxq/include/net/ax25.h=0A--- linux-2.5.74/include=
/net/ax25.h	2003-07-06 01:12:50.000000000 +0200=0A+++ linux-2.5.74.rxq/incl=
ude/net/ax25.h	2003-07-09 18:09:38.000000000 +0200=0A@@ -10,6 +10,7 @@=0A #=
include <linux/ax25.h>=0A #include <linux/spinlock.h>=0A #include <linux/ti=
mer.h>=0A+#include <linux/list.h>=0A #include <asm/atomic.h>=0A =0A #define=
	AX25_T1CLAMPLO  		1=0A@@ -180,7 +181,7 @@=0A } ax25_dev;=0A =0A typedef st=
ruct ax25_cb {=0A-	struct ax25_cb		*next;=0A+	struct hlist_node	ax25_node;=
=0A 	ax25_address		source_addr, dest_addr;=0A 	ax25_digi		*digipeat;=0A 	ax=
25_dev		*ax25_dev;=0A@@ -199,15 +200,20 @@=0A 	unsigned char		window;=0A 	s=
truct timer_list	timer;=0A 	struct sock		*sk;		/* Backlink to socket */=0A+=
	int			refcount;=0A } ax25_cb;=0A =0A #define ax25_sk(__sk) ((ax25_cb *)(__=
sk)->sk_protinfo)=0A =0A+#define ax25_for_each(__ax25, node, list) \=0A+	hl=
ist_for_each_entry(__ax25, node, list, ax25_node)=0A+=0A /* af_ax25.c */=0A=
-extern ax25_cb *ax25_list;=0A+extern struct hlist_head ax25_list;=0A exter=
n spinlock_t ax25_list_lock;=0A-extern void ax25_free_cb(ax25_cb *);=0A-ext=
ern void ax25_insert_socket(ax25_cb *);=0A+extern void ax25_cb_hold(ax25_cb=
 *);=0A+extern void ax25_cb_put(ax25_cb *);=0A+extern void ax25_cb_add(ax25=
_cb *);=0A struct sock *ax25_find_listener(ax25_address *, int, struct net_=
device *, int);=0A struct sock *ax25_get_socket(ax25_address *, ax25_addres=
s *, int);=0A extern ax25_cb *ax25_find_cb(ax25_address *, ax25_address *, =
ax25_digi *, struct net_device *);=0A
--AWniW0JNca5xppdA--

