From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] ax25 patches for 2.6.0-test1
Date: Thu, 17 Jul 2003 20:36:02 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030717203602.A17605@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, 9a4gl@9a0tcp.ampr.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a set of patches against 2.6.0-test1.
It includes a number of patches I send earlier (but not yet in the main
kernel tree) some new patches, some patches from Tihomir Heidelberg and
some by Ralf Baechle.

This is the complete changelog:

	-fix waitqueue oops on interrupted socket call
	-add refcounting like struct sock for ax25_cb
	-skb allocation uses dev->hard_header_len instead off 
	 predicted worst case.
	-ax25_cb list uses hlists like struct sock
	-lock sk in ax25_find_listener
	-ax25_destroy_timer set from 10*HZ to 2*HZ (Tihomir Heidelberg)
	-lock sock when calling ax25_destroy_socket() (Tihomir Heidelberg)
	-Set ax25->sk to NULL when destroying sk (Tihomir Heidelberg)
	-Empty write_queue in ax25_destroy_socket() (Tihomir Heidelberg)
	-ax25_destroy_timer() doesn't share its timer with the heartbeat
timer
	-lock sock in ax25_destroy_timer()
	-return when destroying ax25 route (Ralf Baechle)

73,
Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=ISO-8859-1
Content-Disposition: attachment; filename="linux-2.6.0-test1.rxq.diff"
Content-Transfer-Encoding: quoted-printable

diff -ru linux-2.6.0-test1/net/ax25/af_ax25.c linux-2.5.74.rxq/net/ax25/af_=
ax25.c=0A--- linux-2.6.0-test1/net/ax25/af_ax25.c	2003-07-14 05:38:01.00000=
0000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/af_ax25.c	2003-07-17 19:47:32.00=
0000000 +0200=0A@@ -51,54 +51,61 @@=0A =0A =0A =0A-ax25_cb *ax25_list;=0A+H=
LIST_HEAD(ax25_list);=0A spinlock_t ax25_list_lock =3D SPIN_LOCK_UNLOCKED;=
=0A =0A+spinlock_t ax25_cb_lock =3D SPIN_LOCK_UNLOCKED;=0A+=0A static struc=
t proto_ops ax25_proto_ops;=0A =0A /*=0A  *	Free an allocated ax25 control =
block. This is done to centralise=0A  *	the MOD count code.=0A  */=0A-void =
ax25_free_cb(ax25_cb *ax25)=0A+/*=0A+ *	Changed name to include undescores.=
 Nobody should call this without=0A+ *	going through the ref counter anymor=
e =0A+ *	- PE1RXQ=0A+ */=0A+void __ax25_free_cb(ax25_cb *ax25)=0A {=0A 	if =
(ax25->digipeat !=3D NULL) {=0A 		kfree(ax25->digipeat);=0A 		ax25->digipea=
t =3D NULL;=0A 	}=0A-=0A 	kfree(ax25);=0A }=0A =0A+void ax25_cb_hold(ax25_c=
b *ax25)=0A+{=0A+	spin_lock_bh(&ax25_cb_lock);=0A+	ax25->refcount++;=0A+	sp=
in_unlock_bh(&ax25_cb_lock);=0A+}=0A+=0A+void ax25_cb_put(ax25_cb *ax25)=0A=
+{=0A+	spin_lock_bh(&ax25_cb_lock);=0A+	ax25->refcount--;=0A+	if (!ax25->re=
fcount)=0A+		__ax25_free_cb(ax25);=0A+	spin_unlock_bh(&ax25_cb_lock);=0A+}=
=0A+=0A static void ax25_free_sock(struct sock *sk)=0A {=0A-	ax25_free_cb(a=
x25_sk(sk));=0A+	ax25_cb_put(ax25_sk(sk));=0A }=0A =0A /*=0A  *	Socket remo=
val during an interrupt is now safe.=0A  */=0A-static void ax25_remove_sock=
et(ax25_cb *ax25)=0A+static void ax25_cb_del(ax25_cb *ax25)=0A {=0A-	ax25_c=
b *s;=0A-=0A 	spin_lock_bh(&ax25_list_lock);=0A-	if ((s =3D ax25_list) =3D=
=3D ax25) {=0A-		ax25_list =3D s->next;=0A-		spin_unlock_bh(&ax25_list_lock=
);=0A-		return;=0A-	}=0A-=0A-	while (s !=3D NULL && s->next !=3D NULL) {=0A=
-		if (s->next =3D=3D ax25) {=0A-			s->next =3D ax25->next;=0A-			spin_unlo=
ck_bh(&ax25_list_lock);=0A-			return;=0A-		}=0A-=0A-		s =3D s->next;=0A-	}=
=0A+	hlist_del_init(&ax25->ax25_node);=0A 	spin_unlock_bh(&ax25_list_lock);=
=0A+	ax25_cb_put(ax25);=0A }=0A =0A /*=0A@@ -108,17 +115,17 @@=0A {=0A 	ax2=
5_dev *ax25_dev;=0A 	ax25_cb *s;=0A+	struct hlist_node *node;=0A =0A 	if ((=
ax25_dev =3D ax25_dev_ax25dev(dev)) =3D=3D NULL)=0A 		return;=0A =0A 	spin_=
lock_bh(&ax25_list_lock);=0A-	for (s =3D ax25_list; s !=3D NULL; s =3D s->n=
ext) {=0A+	ax25_for_each(s, node, &ax25_list)=0A 		if (s->ax25_dev =3D=3D a=
x25_dev) {=0A 			s->ax25_dev =3D NULL;=0A 			ax25_disconnect(s, ENETUNREACH=
);=0A 		}=0A-	}=0A 	spin_unlock_bh(&ax25_list_lock);=0A }=0A =0A@@ -153,11 =
+160,11 @@=0A /*=0A  *	Add a socket to the bound sockets list.=0A  */=0A-vo=
id ax25_insert_socket(ax25_cb *ax25)=0A+void ax25_cb_add(ax25_cb *ax25)=0A =
{=0A 	spin_lock_bh(&ax25_list_lock);=0A-	ax25->next =3D ax25_list;=0A-	ax25=
_list  =3D ax25;=0A+	ax25_cb_hold(ax25);=0A+	hlist_add_head(&ax25->ax25_nod=
e, &ax25_list);=0A 	spin_unlock_bh(&ax25_list_lock);=0A }=0A =0A@@ -169,17 =
+176,19 @@=0A 	struct net_device *dev, int type)=0A {=0A 	ax25_cb *s;=0A+	s=
truct hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (s =
=3D ax25_list; s !=3D NULL; s =3D s->next) {=0A+	ax25_for_each(s, node, &ax=
25_list) {=0A 		if ((s->iamdigi && !digi) || (!s->iamdigi && digi))=0A 			c=
ontinue;=0A 		if (s->sk && !ax25cmp(&s->source_addr, addr) &&=0A 		    s->s=
k->sk_type =3D=3D type && s->sk->sk_state =3D=3D TCP_LISTEN) {=0A 			/* If =
device is null we match any device */=0A 			if (s->ax25_dev =3D=3D NULL || =
s->ax25_dev->dev =3D=3D dev) {=0A+				sock_hold(s->sk);=0A 				spin_unlock_=
bh(&ax25_list_lock);=0A-=0A+				=0A 				return s->sk;=0A 			}=0A 		}=0A@@ -=
197,9 +206,10 @@=0A {=0A 	struct sock *sk =3D NULL;=0A 	ax25_cb *s;=0A+	str=
uct hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (s =3D=
 ax25_list; s !=3D NULL; s =3D s->next) {=0A+	ax25_for_each(s, node, &ax25_=
list) {=0A 		if (s->sk && !ax25cmp(&s->source_addr, my_addr) &&=0A 		    !a=
x25cmp(&s->dest_addr, dest_addr) &&=0A 		    s->sk->sk_type =3D=3D type) {=
=0A@@ -223,9 +233,10 @@=0A 	ax25_digi *digi, struct net_device *dev)=0A {=
=0A 	ax25_cb *s;=0A+	struct hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_li=
st_lock);=0A-	for (s =3D ax25_list; s !=3D NULL; s =3D s->next) {=0A+	ax25_=
for_each(s, node, &ax25_list) {=0A 		if (s->sk && s->sk->sk_type !=3D SOCK_=
SEQPACKET)=0A 			continue;=0A 		if (s->ax25_dev =3D=3D NULL)=0A@@ -240,6 +2=
51,7 @@=0A 				if (s->digipeat !=3D NULL && s->digipeat->ndigi !=3D 0)=0A 	=
				continue;=0A 			}=0A+			ax25_cb_hold(s);=0A 			spin_unlock_bh(&ax25_lis=
t_lock);=0A =0A 			return s;=0A@@ -257,16 +269,17 @@=0A {=0A 	struct sock *=
sk =3D NULL;=0A 	ax25_cb *s;=0A+	struct hlist_node *node;=0A =0A 	spin_lock=
_bh(&ax25_list_lock);=0A-	for (s =3D ax25_list; s !=3D NULL; s =3D s->next)=
 {=0A+	ax25_for_each(s, node, &ax25_list)=0A 		if (s->sk !=3D NULL && ax25c=
mp(&s->source_addr, addr) =3D=3D 0 &&=0A 		    s->sk->sk_type =3D=3D SOCK_R=
AW) {=0A 			sk =3D s->sk;=0A 			lock_sock(sk);=0A 			break;=0A 		}=0A-	}=0A=
+=0A 	spin_unlock_bh(&ax25_list_lock);=0A =0A 	return sk;=0A@@ -299,7 +312,=
14 @@=0A  */=0A static void ax25_destroy_timer(unsigned long data)=0A {=0A-=
	ax25_destroy_socket((ax25_cb *)data);=0A+	ax25_cb *ax25=3D(ax25_cb *)data;=
=0A+	struct sock *sk=3Dax25->sk;=0A+	=0A+	bh_lock_sock(sk);=0A+	sock_hold(s=
k);=0A+	ax25_destroy_socket(ax25);=0A+	bh_unlock_sock(sk);=0A+	sock_put(sk)=
;=0A }=0A =0A /*=0A@@ -312,7 +332,7 @@=0A {=0A 	struct sk_buff *skb;=0A =0A=
-	ax25_remove_socket(ax25);=0A+	ax25_cb_del(ax25);=0A =0A 	ax25_stop_heartb=
eat(ax25);=0A 	ax25_stop_t1timer(ax25);=0A@@ -337,22 +357,27 @@=0A =0A 			k=
free_skb(skb);=0A 		}=0A+		while ((skb =3D skb_dequeue(&ax25->sk->sk_write_=
queue)) !=3D NULL) {=0A+			kfree_skb(skb);=0A+		}=0A 	}=0A =0A 	if (ax25->s=
k !=3D NULL) {=0A 		if (atomic_read(&ax25->sk->sk_wmem_alloc) ||=0A 		    a=
tomic_read(&ax25->sk->sk_rmem_alloc)) {=0A 			/* Defer: outstanding buffers=
 */=0A-			init_timer(&ax25->timer);=0A-			ax25->timer.expires  =3D jiffies =
+ 10 * HZ;=0A-			ax25->timer.function =3D ax25_destroy_timer;=0A-			ax25->t=
imer.data     =3D (unsigned long)ax25;=0A-			add_timer(&ax25->timer);=0A+		=
	init_timer(&ax25->dtimer);=0A+			ax25->dtimer.expires  =3D jiffies + 2 * H=
Z;=0A+			ax25->dtimer.function =3D ax25_destroy_timer;=0A+			ax25->dtimer.d=
ata     =3D (unsigned long)ax25;=0A+			add_timer(&ax25->dtimer);=0A 		} els=
e {=0A-			sk_free(ax25->sk);=0A+			struct sock *sk=3Dax25->sk;=0A+			ax25->=
sk=3DNULL;=0A+			sock_put(sk);=0A 		}=0A 	} else {=0A-		ax25_free_cb(ax25);=
=0A+		ax25_cb_put(ax25);=0A 	}=0A }=0A =0A@@ -507,6 +532,7 @@=0A 		return N=
ULL;=0A =0A 	memset(ax25, 0x00, sizeof(*ax25));=0A+	ax25_cb_hold(ax25);=0A =
=0A 	skb_queue_head_init(&ax25->write_queue);=0A 	skb_queue_head_init(&ax25=
->frag_queue);=0A@@ -877,7 +903,7 @@=0A 		break;=0A 	default:=0A 		sk_free(=
sk);=0A-		ax25_free_cb(ax25);=0A+		ax25_cb_put(ax25);=0A 		return NULL;=0A =
	}=0A =0A@@ -1076,7 +1102,7 @@=0A 		ax25_fillin_cb(ax25, ax25_dev);=0A =0A =
done:=0A-	ax25_insert_socket(ax25);=0A+	ax25_cb_add(ax25);=0A 	sk->sk_zappe=
d =3D 0;=0A =0A out:=0A@@ -1092,7 +1118,7 @@=0A 	int addr_len, int flags)=
=0A {=0A 	struct sock *sk =3D sock->sk;=0A-	ax25_cb *ax25 =3D ax25_sk(sk);=
=0A+	ax25_cb *ax25 =3D ax25_sk(sk), *ax25t;=0A 	struct full_sockaddr_ax25 *=
fsa =3D (struct full_sockaddr_ax25 *)uaddr;=0A 	ax25_digi *digi =3D NULL;=
=0A 	int ct =3D 0, err =3D 0;=0A@@ -1198,7 +1224,7 @@=0A 			goto out;=0A =
=0A 		ax25_fillin_cb(ax25, ax25->ax25_dev);=0A-		ax25_insert_socket(ax25);=
=0A+		ax25_cb_add(ax25);=0A 	} else {=0A 		if (ax25->ax25_dev =3D=3D NULL) =
{=0A 			err =3D -EHOSTUNREACH;=0A@@ -1207,11 +1233,12 @@=0A 	}=0A =0A 	if (=
sk->sk_type =3D=3D SOCK_SEQPACKET &&=0A-	    ax25_find_cb(&ax25->source_add=
r, &fsa->fsa_ax25.sax25_call, digi,=0A-		    	 ax25->ax25_dev->dev)) {=0A+	=
    (ax25t=3Dax25_find_cb(&ax25->source_addr, &fsa->fsa_ax25.sax25_call, di=
gi,=0A+		    	 ax25->ax25_dev->dev))) {=0A 		if (digi !=3D NULL)=0A 			kfre=
e(digi);=0A 		err =3D -EADDRINUSE;		/* Already such a connection */=0A+		ax=
25_cb_put(ax25t);=0A 		goto out;=0A 	}=0A =0A@@ -1272,6 +1299,8 @@=0A 				l=
ock_sock(sk);=0A 				continue;=0A 			}=0A+			current->state =3D TASK_RUNNIN=
G;=0A+			remove_wait_queue(sk->sk_sleep, &wait);=0A 			return -ERESTARTSYS;=
=0A 		}=0A 		current->state =3D TASK_RUNNING;=0A@@ -1339,6 +1368,8 @@=0A 		=
	lock_sock(sk);=0A 			continue;=0A 		}=0A+		current->state =3D TASK_RUNNING=
;=0A+		remove_wait_queue(sk->sk_sleep, &wait);=0A 		return -ERESTARTSYS;=0A=
 	}=0A 	current->state =3D TASK_RUNNING;=0A@@ -1518,7 +1549,7 @@=0A 	SOCK_D=
EBUG(sk, "AX.25: sendto: building packet.\n");=0A =0A 	/* Assume the worst =
case */=0A-	size =3D len + 3 + ax25_addr_size(dp) + AX25_BPQ_HEADER_LEN;=0A=
+	size =3D len + ax25->ax25_dev->dev->hard_header_len;=0A =0A 	skb =3D sock=
_alloc_send_skb(sk, size, msg->msg_flags&MSG_DONTWAIT, &err);=0A 	if (skb =
=3D=3D NULL)=0A@@ -1844,6 +1875,7 @@=0A 	int len =3D 0;=0A 	off_t pos =3D 0=
;=0A 	off_t begin =3D 0;=0A+	struct hlist_node *node;=0A =0A 	spin_lock_bh(=
&ax25_list_lock);=0A =0A@@ -1852,7 +1884,7 @@=0A 	 * magic dev src_addr des=
t_addr,digi1,digi2,.. st vs vr va t1 t1 t2 t2 t3 t3 idle idle n2 n2 rtt win=
dow paclen Snd-Q Rcv-Q inode=0A 	 */=0A =0A-	for (ax25 =3D ax25_list; ax25 =
!=3D NULL; ax25 =3D ax25->next) {=0A+	ax25_for_each(ax25, node, &ax25_list)=
 {=0A 		len +=3D sprintf(buffer+len, "%8.8lx %s %s%s ",=0A 				(long) ax25,=
=0A 				ax25->ax25_dev =3D=3D NULL? "???" : ax25->ax25_dev->dev->name,=0A@@=
 -1955,6 +1987,8 @@=0A EXPORT_SYMBOL(ax25_rebuild_header);=0A EXPORT_SYMBOL=
(ax25_findbyuid);=0A EXPORT_SYMBOL(ax25_find_cb);=0A+EXPORT_SYMBOL(ax25_cb_=
hold);=0A+EXPORT_SYMBOL(ax25_cb_put);=0A EXPORT_SYMBOL(ax25_linkfail_regist=
er);=0A EXPORT_SYMBOL(ax25_linkfail_release);=0A EXPORT_SYMBOL(ax25_listen_=
register);=0Adiff -ru linux-2.6.0-test1/net/ax25/ax25_ds_subr.c linux-2.5.7=
4.rxq/net/ax25/ax25_ds_subr.c=0A--- linux-2.6.0-test1/net/ax25/ax25_ds_subr=
.c	2003-07-14 05:38:05.000000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25=
_ds_subr.c	2003-07-17 19:47:34.000000000 +0200=0A@@ -40,6 +40,7 @@=0A void =
ax25_ds_enquiry_response(ax25_cb *ax25)=0A {=0A 	ax25_cb *ax25o;=0A+	struct=
 hlist_node *node;=0A =0A 	/* Please note that neither DK4EG=B4s nor DG2FEF=
=B4s=0A 	 * DAMA spec mention the following behaviour as seen=0A@@ -80,7 +8=
1,7 @@=0A 	ax25_ds_set_timer(ax25->ax25_dev);=0A =0A 	spin_lock_bh(&ax25_li=
st_lock);=0A-	for (ax25o =3D ax25_list; ax25o !=3D NULL; ax25o =3D ax25o->n=
ext) {=0A+	ax25_for_each(ax25o, node, &ax25_list) {=0A 		if (ax25o =3D=3D a=
x25)=0A 			continue;=0A =0A@@ -160,9 +161,10 @@=0A {=0A 	ax25_cb *ax25;=0A =
	int res =3D 0;=0A+	struct hlist_node *node;=0A =0A 	spin_lock_bh(&ax25_lis=
t_lock);=0A-	for (ax25 =3D ax25_list; ax25 !=3D NULL ; ax25 =3D ax25->next)=
=0A+	ax25_for_each(ax25, node, &ax25_list)=0A 		if (ax25->ax25_dev =3D=3D a=
x25_dev && (ax25->condition & AX25_COND_DAMA_MODE) && ax25->state > AX25_ST=
ATE_1) {=0A 			res =3D 1;=0A 			break;=0Adiff -ru linux-2.6.0-test1/net/ax2=
5/ax25_ds_timer.c linux-2.5.74.rxq/net/ax25/ax25_ds_timer.c=0A--- linux-2.6=
.0-test1/net/ax25/ax25_ds_timer.c	2003-07-14 05:38:01.000000000 +0200=0A+++=
 linux-2.5.74.rxq/net/ax25/ax25_ds_timer.c	2003-07-17 19:47:32.000000000 +0=
200=0A@@ -74,6 +74,7 @@=0A {=0A 	ax25_dev *ax25_dev =3D (struct ax25_dev *)=
 arg;=0A 	ax25_cb *ax25;=0A+	struct hlist_node *node;=0A =0A 	if (ax25_dev =
=3D=3D NULL || !ax25_dev->dama.slave)=0A 		return;			/* Yikes! */=0A@@ -84,=
7 +85,7 @@=0A 	}=0A =0A 	spin_lock_bh(&ax25_list_lock);=0A-	for (ax25=3Dax2=
5_list; ax25 !=3D NULL; ax25 =3D ax25->next) {=0A+	ax25_for_each(ax25, node=
, &ax25_list) {=0A 		if (ax25->ax25_dev !=3D ax25_dev || !(ax25->condition =
& AX25_COND_DAMA_MODE))=0A 			continue;=0A =0A@@ -98,15 +99,26 @@=0A =0A vo=
id ax25_ds_heartbeat_expiry(ax25_cb *ax25)=0A {=0A+	struct sock *sk=3Dax25-=
>sk;=0A+=0A+	if (sk)=0A+		bh_lock_sock(sk);=0A+=0A 	switch (ax25->state) {=
=0A =0A 	case AX25_STATE_0:=0A 		/* Magic here: If we listen() and a new li=
nk dies before it=0A 		   is accepted() it isn't 'dead' so doesn't get remo=
ved. */=0A-		if (!ax25->sk || sock_flag(ax25->sk, SOCK_DESTROY) ||=0A-		   =
 (ax25->sk->sk_state =3D=3D TCP_LISTEN &&=0A-		     sock_flag(ax25->sk, SOC=
K_DEAD))) {=0A-			ax25_destroy_socket(ax25);=0A+		if (!sk || sock_flag(sk, =
SOCK_DESTROY) ||=0A+		    (sk->sk_state =3D=3D TCP_LISTEN &&=0A+		     sock=
_flag(sk, SOCK_DEAD))) {=0A+			if (sk) {=0A+				sock_hold(sk);=0A+				ax25_=
destroy_socket(ax25);=0A+				sock_put(sk);=0A+				bh_unlock_sock(sk);=0A+		=
	} else=0A+				ax25_destroy_socket(ax25);=0A 			return;=0A 		}=0A 		break;=
=0A@@ -115,9 +127,9 @@=0A 		/*=0A 		 * Check the state of the receive buffe=
r.=0A 		 */=0A-		if (ax25->sk !=3D NULL) {=0A-			if (atomic_read(&ax25->sk-=
>sk_rmem_alloc) <=0A-			    (ax25->sk->sk_rcvbuf / 2) &&=0A+		if (sk !=3D N=
ULL) {=0A+			if (atomic_read(&sk->sk_rmem_alloc) <=0A+			    (sk->sk_rcvbuf=
 / 2) &&=0A 			    (ax25->condition & AX25_COND_OWN_RX_BUSY)) {=0A 				ax25=
->condition &=3D ~AX25_COND_OWN_RX_BUSY;=0A 				ax25->condition &=3D ~AX25_=
COND_ACK_PENDING;=0A@@ -127,6 +139,9 @@=0A 		break;=0A 	}=0A =0A+	if (sk)=
=0A+		bh_unlock_sock(sk);=0A+=0A 	ax25_start_heartbeat(ax25);=0A }=0A =0Adi=
ff -ru linux-2.6.0-test1/net/ax25/ax25_in.c linux-2.5.74.rxq/net/ax25/ax25_=
in.c=0A--- linux-2.6.0-test1/net/ax25/ax25_in.c	2003-07-14 05:30:48.0000000=
00 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_in.c	2003-07-17 19:47:31.0000=
00000 +0200=0A@@ -329,6 +329,7 @@=0A 		if (ax25_process_rx_frame(ax25, skb,=
 type, dama) =3D=3D 0)=0A 			kfree_skb(skb);=0A =0A+		ax25_cb_put(ax25);=0A=
 		return 0;=0A 	}=0A =0A@@ -357,11 +358,14 @@=0A 		sk =3D ax25_find_listen=
er(next_digi, 1, dev, SOCK_SEQPACKET);=0A =0A 	if (sk !=3D NULL) {=0A+		bh_=
lock_sock(sk);=0A 		if (sk->sk_ack_backlog =3D=3D sk->sk_max_ack_backlog ||=
=0A 		    (make =3D ax25_make_new(sk, ax25_dev)) =3D=3D NULL) {=0A 			if (m=
ine)=0A 				ax25_return_dm(dev, &src, &dest, &dp);=0A 			kfree_skb(skb);=0A=
+			bh_unlock_sock(sk);=0A+			sock_put(sk);=0A =0A 			return 0;=0A 		}=0A@@=
 -374,6 +378,8 @@=0A 		make->sk_pair  =3D sk;=0A =0A 		sk->sk_ack_backlog++=
;=0A+		bh_unlock_sock(sk);=0A+		sock_put(sk);=0A 	} else {=0A 		if (!mine) =
{=0A 			kfree_skb(skb);=0A@@ -429,7 +435,7 @@=0A =0A 	ax25->state =3D AX25_=
STATE_3;=0A =0A-	ax25_insert_socket(ax25);=0A+	ax25_cb_add(ax25);=0A =0A 	a=
x25_start_heartbeat(ax25);=0A 	ax25_start_t3timer(ax25);=0Adiff -ru linux-2=
.6.0-test1/net/ax25/ax25_ip.c linux-2.5.74.rxq/net/ax25/ax25_ip.c=0A--- lin=
ux-2.6.0-test1/net/ax25/ax25_ip.c	2003-07-14 05:32:42.000000000 +0200=0A+++=
 linux-2.5.74.rxq/net/ax25/ax25_ip.c	2003-07-17 19:47:31.000000000 +0200=0A=
@@ -107,6 +107,7 @@=0A 	ax25_address *src, *dst;=0A 	ax25_dev *ax25_dev;=0A=
 	ax25_route _route, *route =3D &_route;=0A+	ax25_cb *ax25;=0A =0A 	dst =3D=
 (ax25_address *)(bp + 1);=0A 	src =3D (ax25_address *)(bp + 8);=0A@@ -167,=
9 +168,14 @@=0A 			skb_pull(ourskb, AX25_HEADER_LEN - 1);	/* Keep PID */=0A=
 			ourskb->nh.raw =3D ourskb->data;=0A =0A-			ax25_send_frame(ourskb, ax25=
_dev->values[AX25_VALUES_PACLEN], &src_c,=0A-&dst_c, route->digipeat, dev);=
=0A-=0A+			ax25=3Dax25_send_frame(=0A+			    ourskb, =0A+			    ax25_dev->v=
alues[AX25_VALUES_PACLEN], =0A+			    &src_c,=0A+			    &dst_c, route->digi=
peat, dev);=0A+			if (ax25) {=0A+				ax25_cb_put(ax25);=0A+			}=0A 			goto =
put;=0A 		}=0A 	}=0Adiff -ru linux-2.6.0-test1/net/ax25/ax25_out.c linux-2.=
5.74.rxq/net/ax25/ax25_out.c=0A--- linux-2.6.0-test1/net/ax25/ax25_out.c	20=
03-07-14 05:37:22.000000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_out.=
c	2003-07-17 19:47:34.000000000 +0200=0A@@ -71,7 +71,7 @@=0A =0A 	if (digi =
!=3D NULL) {=0A 		if ((ax25->digipeat =3D kmalloc(sizeof(ax25_digi), GFP_AT=
OMIC)) =3D=3D NULL) {=0A-			ax25_free_cb(ax25);=0A+			ax25_cb_put(ax25);=0A=
 			return NULL;=0A 		}=0A 		memcpy(ax25->digipeat, digi, sizeof(ax25_digi)=
);=0A@@ -93,7 +93,7 @@=0A #endif=0A 	}=0A =0A-	ax25_insert_socket(ax25);=0A=
+	ax25_cb_add(ax25);=0A =0A 	ax25->state =3D AX25_STATE_1;=0A =0Adiff -ru l=
inux-2.6.0-test1/net/ax25/ax25_route.c linux-2.5.74.rxq/net/ax25/ax25_route=
.c=0A--- linux-2.6.0-test1/net/ax25/ax25_route.c	2003-07-14 05:36:31.000000=
000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_route.c	2003-07-17 19:47:34.=
000000000 +0200=0A@@ -162,6 +162,7 @@=0A 		if (ax25_rt->digipeat !=3D NULL)=
=0A 			kfree(ax25_rt->digipeat);=0A 		kfree(ax25_rt);=0A+		return;=0A 	}=0A=
 =0A 	/*=0Adiff -ru linux-2.6.0-test1/net/ax25/ax25_std_timer.c linux-2.5.7=
4.rxq/net/ax25/ax25_std_timer.c=0A--- linux-2.6.0-test1/net/ax25/ax25_std_t=
imer.c	2003-07-14 05:32:29.000000000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/=
ax25_std_timer.c	2003-07-17 19:47:33.000000000 +0200=0A@@ -33,14 +33,25 @@=
=0A =0A void ax25_std_heartbeat_expiry(ax25_cb *ax25)=0A {=0A+	struct sock =
*sk=3Dax25->sk;=0A+	=0A+	if (sk)=0A+		bh_lock_sock(sk);=0A+=0A 	switch (ax2=
5->state) {=0A 	case AX25_STATE_0:=0A 		/* Magic here: If we listen() and a=
 new link dies before it=0A 		   is accepted() it isn't 'dead' so doesn't g=
et removed. */=0A-		if (!ax25->sk || sock_flag(ax25->sk, SOCK_DESTROY) ||=
=0A-		    (ax25->sk->sk_state =3D=3D TCP_LISTEN &&=0A-		     sock_flag(ax25=
->sk, SOCK_DEAD))) {=0A-			ax25_destroy_socket(ax25);=0A+		if (!sk || sock_=
flag(sk, SOCK_DESTROY) ||=0A+		    (sk->sk_state =3D=3D TCP_LISTEN &&=0A+		=
     sock_flag(sk, SOCK_DEAD))) {=0A+			if (sk) {=0A+				sock_hold(sk);=0A+=
				ax25_destroy_socket(ax25);=0A+				bh_unlock_sock(sk);=0A+				sock_put(s=
k);=0A+			} else=0A+				ax25_destroy_socket(ax25);=0A 			return;=0A 		}=0A =
		break;=0A@@ -50,9 +61,9 @@=0A 		/*=0A 		 * Check the state of the receive=
 buffer.=0A 		 */=0A-		if (ax25->sk !=3D NULL) {=0A-			if (atomic_read(&ax2=
5->sk->sk_rmem_alloc) <=0A-			    (ax25->sk->sk_rcvbuf / 2) &&=0A+		if (sk =
!=3D NULL) {=0A+			if (atomic_read(&sk->sk_rmem_alloc) <=0A+			    (sk->sk_=
rcvbuf / 2) &&=0A 			    (ax25->condition & AX25_COND_OWN_RX_BUSY)) {=0A 		=
		ax25->condition &=3D ~AX25_COND_OWN_RX_BUSY;=0A 				ax25->condition &=3D =
~AX25_COND_ACK_PENDING;=0A@@ -62,6 +73,9 @@=0A 		}=0A 	}=0A =0A+	if (sk)=0A=
+		bh_unlock_sock(sk);=0A+=0A 	ax25_start_heartbeat(ax25);=0A }=0A =0Adiff =
-ru linux-2.6.0-test1/net/ax25/ax25_subr.c linux-2.5.74.rxq/net/ax25/ax25_s=
ubr.c=0A--- linux-2.6.0-test1/net/ax25/ax25_subr.c	2003-07-14 05:38:06.0000=
00000 +0200=0A+++ linux-2.5.74.rxq/net/ax25/ax25_subr.c	2003-07-17 19:47:31=
.000000000 +0200=0A@@ -158,10 +158,10 @@=0A 	struct sk_buff *skb;=0A 	unsig=
ned char  *dptr;=0A =0A-	if ((skb =3D alloc_skb(AX25_BPQ_HEADER_LEN + ax25_=
addr_size(ax25->digipeat) + 2, GFP_ATOMIC)) =3D=3D NULL)=0A+	if ((skb =3D a=
lloc_skb(ax25->ax25_dev->dev->hard_header_len + 2, GFP_ATOMIC)) =3D=3D NULL=
)=0A 		return;=0A =0A-	skb_reserve(skb, AX25_BPQ_HEADER_LEN + ax25_addr_siz=
e(ax25->digipeat));=0A+	skb_reserve(skb, ax25->ax25_dev->dev->hard_header_l=
en);=0A =0A 	skb->nh.raw =3D skb->data;=0A =0A@@ -202,10 +202,10 @@=0A 	if =
(dev =3D=3D NULL)=0A 		return;=0A =0A-	if ((skb =3D alloc_skb(AX25_BPQ_HEAD=
ER_LEN + ax25_addr_size(digi) + 1, GFP_ATOMIC)) =3D=3D NULL)=0A+	if ((skb =
=3D alloc_skb(dev->hard_header_len + 1, GFP_ATOMIC)) =3D=3D NULL)=0A 		retu=
rn;	/* Next SABM will get DM'd */=0A =0A-	skb_reserve(skb, AX25_BPQ_HEADER_=
LEN + ax25_addr_size(digi));=0A+	skb_reserve(skb, dev->hard_header_len);=0A=
 	skb->nh.raw =3D skb->data;=0A =0A 	ax25_digi_invert(digi, &retdigi);=0A--=
- linux-2.6.0-test1/include/net/ax25.h	2003-07-14 05:35:55.000000000 +0200=
=0A+++ linux-2.5.74.rxq/include/net/ax25.h	2003-07-17 20:02:28.000000000 +0=
200=0A@@ -10,6 +10,7 @@=0A #include <linux/ax25.h>=0A #include <linux/spinl=
ock.h>=0A #include <linux/timer.h>=0A+#include <linux/list.h>=0A #include <=
asm/atomic.h>=0A =0A #define	AX25_T1CLAMPLO  		1=0A@@ -180,7 +181,7 @@=0A }=
 ax25_dev;=0A =0A typedef struct ax25_cb {=0A-	struct ax25_cb		*next;=0A+	s=
truct hlist_node	ax25_node;=0A 	ax25_address		source_addr, dest_addr;=0A 	a=
x25_digi		*digipeat;=0A 	ax25_dev		*ax25_dev;=0A@@ -197,17 +198,22 @@=0A 	s=
truct sk_buff_head	ack_queue;=0A 	struct sk_buff_head	frag_queue;=0A 	unsig=
ned char		window;=0A-	struct timer_list	timer;=0A+	struct timer_list	timer,=
 dtimer;=0A 	struct sock		*sk;		/* Backlink to socket */=0A+	int			refcount=
;=0A } ax25_cb;=0A =0A #define ax25_sk(__sk) ((ax25_cb *)(__sk)->sk_protinf=
o)=0A =0A+#define ax25_for_each(__ax25, node, list) \=0A+	hlist_for_each_en=
try(__ax25, node, list, ax25_node)=0A+=0A /* af_ax25.c */=0A-extern ax25_cb=
 *ax25_list;=0A+extern struct hlist_head ax25_list;=0A extern spinlock_t ax=
25_list_lock;=0A-extern void ax25_free_cb(ax25_cb *);=0A-extern void ax25_i=
nsert_socket(ax25_cb *);=0A+extern void ax25_cb_hold(ax25_cb *);=0A+extern =
void ax25_cb_put(ax25_cb *);=0A+extern void ax25_cb_add(ax25_cb *);=0A stru=
ct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);=
=0A struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);=0A e=
xtern ax25_cb *ax25_find_cb(ax25_address *, ax25_address *, ax25_digi *, st=
ruct net_device *);=0Adiff -ru linux-2.6.0-test1/drivers/net/hamradio/mkiss=
.c linux-2.5.74.rxq/drivers/net/hamradio/mkiss.c=0A--- linux-2.6.0-test1/dr=
ivers/net/hamradio/mkiss.c	2003-07-14 05:38:46.000000000 +0200=0A+++ linux-=
2.5.74.rxq/drivers/net/hamradio/mkiss.c	2003-07-17 19:55:27.000000000 +0200=
=0A@@ -165,19 +165,20 @@=0A 		return NULL;=0A =0A 	/* If no channels are av=
ailable, allocate one */=0A-	if (axp =3D=3D NULL && (ax25_ctrls[i] =3D kmal=
loc(sizeof(ax25_ctrl_t), GFP_KERNEL)) !=3D NULL) {=0A+	if (axp =3D=3D NULL =
&& (ax25_ctrls[i] =3D kmalloc(sizeof(ax25_ctrl_t), GFP_KERNEL)) !=3D NULL)=
=0A 		axp =3D ax25_ctrls[i];=0A-		memset(axp, 0, sizeof(ax25_ctrl_t));=0A-=
=0A-		/* Initialize channel control data */=0A-		set_bit(AXF_INUSE, &axp->c=
trl.flags);=0A-		sprintf(axp->dev.name, "ax%d", i++);=0A-		axp->ctrl.tty   =
   =3D NULL;=0A-		axp->dev.base_addr =3D i;=0A-		axp->dev.priv      =3D (vo=
id *)&axp->ctrl;=0A-		axp->dev.next      =3D NULL;=0A-		axp->dev.init      =
=3D ax25_init;=0A-	}=0A+	/* Also initialize an existing channel as register=
_netdevice doesn't=0A+	   like already initialized devices... (PE1RXQ) */=
=0A+	memset(axp, 0, sizeof(ax25_ctrl_t));=0A+=0A+	/* Initialize channel con=
trol data */=0A+	set_bit(AXF_INUSE, &axp->ctrl.flags);=0A+	sprintf(axp->dev=
.name, "ax%d", i++);=0A+	axp->ctrl.tty      =3D NULL;=0A+	axp->dev.base_add=
r =3D i;=0A+	axp->dev.priv      =3D (void *)&axp->ctrl;=0A+	axp->dev.next  =
    =3D NULL;=0A+	axp->dev.init      =3D ax25_init;=0A =0A 	if (axp !=3D NU=
LL) {=0A 		/*=0A
--AWniW0JNca5xppdA--

