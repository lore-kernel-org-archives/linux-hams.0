From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH] NET: ROSE: Fix neighbour reference counting issues. signoff
Date: Tue, 16 Jun 2015 17:04:36 +0200
Message-ID: <55803B04.4060304@free.fr>
References: <20150615191644.GB11279@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150615191644.GB11279@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

Hello Ralf,

Patch downloaded and applied.
Rose is working ok.

Thanks,

Bernard
f6bvp.org

Le 15/06/2015 21:16, Ralf Baechle DL5RB a =E9crit :
> Richard,
>
> I think there's another reference counting issues involving the
> rose_neighbour structures' use member which was only a 16 bit integer=
=2E
> The increment/decrement operations on this element will compile into
> single instructions on x86 so will be atomic on uniprocessor systems
> but bad things might happen on multiprocessor systems or load/store
> architectures or just because GCC feels like it.
>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>
> diff --git a/include/net/rose.h b/include/net/rose.h
> index 50811fe..ad163c1 100644
> --- a/include/net/rose.h
> +++ b/include/net/rose.h
> @@ -7,6 +7,7 @@
>   #ifndef _ROSE_H
>   #define _ROSE_H
>  =20
> +#include <linux/atomic.h>
>   #include <linux/rose.h>
>   #include <net/sock.h>
>  =20
> @@ -94,7 +95,7 @@ struct rose_neigh {
>   	ax25_cb			*ax25;
>   	struct net_device		*dev;
>   	unsigned short		count;
> -	unsigned short		use;
> +	atomic_t		use;
>   	unsigned int		number;
>   	char			restarted;
>   	char			dce_mode;
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index 327f40e..8b8d0b0 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -10,6 +10,7 @@
>    * Copyright (C) Tomi Manninen OH2BNS (oh2bns@sral.fi)
>    */
>  =20
> +#include <linux/atomic.h>
>   #include <linux/capability.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
> @@ -172,7 +173,7 @@ void rose_kill_by_neigh(struct rose_neigh *neigh)
>  =20
>   		if (rose->neighbour =3D=3D neigh) {
>   			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
> -			rose->neighbour->use--;
> +			atomic_dec(&rose->neighbour->use);
>   			rose->neighbour =3D NULL;
>   		}
>   	}
> @@ -193,7 +194,7 @@ static void rose_kill_by_device(struct net_device=
 *dev)
>   		if (rose->device =3D=3D dev) {
>   			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
>   			if (rose->neighbour)
> -				rose->neighbour->use--;
> +				atomic_dec(&rose->neighbour->use);
>   			rose->device =3D NULL;
>   		}
>   	}
> @@ -619,7 +620,7 @@ static int rose_release(struct socket *sock)
>   		break;
>  =20
>   	case ROSE_STATE_2:
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		release_sock(sk);
>   		rose_disconnect(sk, 0, -1, -1);
>   		lock_sock(sk);
> @@ -833,7 +834,7 @@ static int rose_connect(struct socket *sock, stru=
ct sockaddr *uaddr, int addr_le
>  =20
>   	rose->state =3D ROSE_STATE_1;
>  =20
> -	rose->neighbour->use++;
> +	atomic_inc(&rose->neighbour->use);
>  =20
>   	rose_write_internal(sk, ROSE_CALL_REQUEST);
>   	rose_start_heartbeat(sk);
> @@ -1033,7 +1034,7 @@ int rose_rx_call_request(struct sk_buff *skb, s=
truct net_device *dev, struct ros
>   	make_rose->device        =3D dev;
>   	make_rose->facilities    =3D facilities;
>  =20
> -	make_rose->neighbour->use++;
> +	atomic_inc(&make_rose->neighbour->use);
>  =20
>   	if (rose_sk(sk)->defer) {
>   		make_rose->state =3D ROSE_STATE_5;
> diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
> index 79c4abc..58c6882 100644
> --- a/net/rose/rose_in.c
> +++ b/net/rose/rose_in.c
> @@ -11,6 +11,7 @@
>    * but are mostly correct. Before you modify the code could you rea=
d the SDL
>    * diagrams as the code is not obvious and probably very easy to br=
eak.
>    */
> +#include <linux/atomic.h>
>   #include <linux/errno.h>
>   #include <linux/types.h>
>   #include <linux/socket.h>
> @@ -58,7 +59,7 @@ static int rose_state1_machine(struct sock *sk, str=
uct sk_buff *skb, int framety
>   	case ROSE_CLEAR_REQUEST:
>   		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
>   		rose_disconnect(sk, ECONNREFUSED, skb->data[3], skb->data[4]);
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		break;
>  =20
>   	default:
> @@ -81,12 +82,12 @@ static int rose_state2_machine(struct sock *sk, s=
truct sk_buff *skb, int framety
>   	case ROSE_CLEAR_REQUEST:
>   		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
>   		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		break;
>  =20
>   	case ROSE_CLEAR_CONFIRMATION:
>   		rose_disconnect(sk, 0, -1, -1);
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		break;
>  =20
>   	default:
> @@ -122,7 +123,7 @@ static int rose_state3_machine(struct sock *sk, s=
truct sk_buff *skb, int framety
>   	case ROSE_CLEAR_REQUEST:
>   		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
>   		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		break;
>  =20
>   	case ROSE_RR:
> @@ -233,7 +234,7 @@ static int rose_state4_machine(struct sock *sk, s=
truct sk_buff *skb, int framety
>   	case ROSE_CLEAR_REQUEST:
>   		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
>   		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		break;
>  =20
>   	default:
> @@ -253,7 +254,7 @@ static int rose_state5_machine(struct sock *sk, s=
truct sk_buff *skb, int framety
>   	if (frametype =3D=3D ROSE_CLEAR_REQUEST) {
>   		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
>   		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
> -		rose_sk(sk)->neighbour->use--;
> +		atomic_dec(&rose_sk(sk)->neighbour->use);
>   	}
>  =20
>   	return 0;
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index 46505317..869e201 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -7,6 +7,7 @@
>    * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
>    * Copyright (C) Terry Dawson VK2KTJ (terry@animats.net)
>    */
> +#include <linux/atomic.h>
>   #include <linux/errno.h>
>   #include <linux/types.h>
>   #include <linux/socket.h>
> @@ -97,7 +98,7 @@ static int __must_check rose_add_node(struct rose_r=
oute_struct *rose_route,
>   		rose_neigh->ax25      =3D NULL;
>   		rose_neigh->dev       =3D dev;
>   		rose_neigh->count     =3D 0;
> -		rose_neigh->use       =3D 0;
> +		atomic_set(&rose_neigh->use, 0);
>   		rose_neigh->dce_mode  =3D 0;
>   		rose_neigh->loopback  =3D 0;
>   		rose_neigh->number    =3D rose_neigh_no++;
> @@ -267,10 +268,10 @@ static void rose_remove_route(struct rose_route=
 *rose_route)
>   	struct rose_route *s;
>  =20
>   	if (rose_route->neigh1 !=3D NULL)
> -		rose_route->neigh1->use--;
> +		atomic_dec(&rose_route->neigh1->use);
>  =20
>   	if (rose_route->neigh2 !=3D NULL)
> -		rose_route->neigh2->use--;
> +		atomic_dec(&rose_route->neigh2->use);
>  =20
>   	if ((s =3D rose_route_list) =3D=3D rose_route) {
>   		rose_route_list =3D rose_route->next;
> @@ -335,7 +336,7 @@ static int rose_del_node(struct rose_route_struct=
 *rose_route,
>   		if (rose_node->neighbour[i] =3D=3D rose_neigh) {
>   			rose_neigh->count--;
>  =20
> -			if (rose_neigh->count =3D=3D 0 && rose_neigh->use =3D=3D 0)
> +			if (rose_neigh->count =3D=3D 0 && atomic_read(&rose_neigh->use) =3D=
=3D 0)
>   				rose_remove_neigh(rose_neigh);
>  =20
>   			rose_node->count--;
> @@ -383,7 +384,7 @@ void rose_add_loopback_neigh(void)
>   	sn->ax25      =3D NULL;
>   	sn->dev       =3D NULL;
>   	sn->count     =3D 0;
> -	sn->use       =3D 0;
> +	atomic_set(&sn->use, 0);
>   	sn->dce_mode  =3D 1;
>   	sn->loopback  =3D 1;
>   	sn->number    =3D rose_neigh_no++;
> @@ -573,7 +574,7 @@ static int rose_clear_routes(void)
>   		s          =3D rose_neigh;
>   		rose_neigh =3D rose_neigh->next;
>  =20
> -		if (s->use =3D=3D 0 && !s->loopback) {
> +		if (atomic_read(&s->use) && !s->loopback) {
>   			s->count =3D 0;
>   			rose_remove_neigh(s);
>   		}
> @@ -793,13 +794,13 @@ static void rose_del_route_by_neigh(struct rose=
_neigh *rose_neigh)
>   		}
>  =20
>   		if (rose_route->neigh1 =3D=3D rose_neigh) {
> -			rose_route->neigh1->use--;
> +			atomic_dec(&rose_route->neigh1->use);
>   			rose_route->neigh1 =3D NULL;
>   			rose_transmit_clear_request(rose_route->neigh2, rose_route->lci2=
, ROSE_OUT_OF_ORDER, 0);
>   		}
>  =20
>   		if (rose_route->neigh2 =3D=3D rose_neigh) {
> -			rose_route->neigh2->use--;
> +			atomic_dec(&rose_route->neigh2->use);
>   			rose_route->neigh2 =3D NULL;
>   			rose_transmit_clear_request(rose_route->neigh1, rose_route->lci1=
, ROSE_OUT_OF_ORDER, 0);
>   		}
> @@ -923,7 +924,7 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb=
 *ax25)
>   			rose_clear_queues(sk);
>   			rose->cause	 =3D ROSE_NETWORK_CONGESTION;
>   			rose->diagnostic =3D 0;
> -			rose->neighbour->use--;
> +			atomic_dec(&rose->neighbour->use);
>   			rose->neighbour	 =3D NULL;
>   			rose->lci	 =3D 0;
>   			rose->state	 =3D ROSE_STATE_0;
> @@ -1066,8 +1067,8 @@ int rose_route_frame(struct sk_buff *skb, ax25_=
cb *ax25)
>   	rose_route->lci2      =3D new_lci;
>   	rose_route->neigh2    =3D new_neigh;
>  =20
> -	rose_route->neigh1->use++;
> -	rose_route->neigh2->use++;
> +	atomic_inc(&rose_route->neigh1->use);
> +	atomic_inc(&rose_route->neigh2->use);
>  =20
>   	rose_route->next =3D rose_route_list;
>   	rose_route_list  =3D rose_route;
> @@ -1214,7 +1215,7 @@ static int rose_neigh_show(struct seq_file *seq=
, void *v)
>   			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh=
->callsign),
>   			   rose_neigh->dev ? rose_neigh->dev->name : "???",
>   			   rose_neigh->count,
> -			   rose_neigh->use,
> +			   atomic_read(&rose_neigh->use),
>   			   (rose_neigh->dce_mode) ? "DCE" : "DTE",
>   			   (rose_neigh->restarted) ? "yes" : "no",
>   			   ax25_display_timer(&rose_neigh->t0timer) / HZ,
> diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
> index bc5469d..f508102 100644
> --- a/net/rose/rose_timer.c
> +++ b/net/rose/rose_timer.c
> @@ -7,6 +7,7 @@
>    * Copyright (C) Jonathan Naylor G4KLX (g4klx@g4klx.demon.co.uk)
>    * Copyright (C) 2002 Ralf Baechle DO1GRB (ralf@gnu.org)
>    */
> +#include <linux/atomic.h>
>   #include <linux/errno.h>
>   #include <linux/types.h>
>   #include <linux/socket.h>
> @@ -178,7 +179,7 @@ static void rose_timer_expiry(unsigned long param=
)
>   		break;
>  =20
>   	case ROSE_STATE_2:	/* T3 */
> -		rose->neighbour->use--;
> +		atomic_dec(&rose->neighbour->use);
>   		rose_disconnect(sk, ETIMEDOUT, -1, -1);
>   		break;
>  =20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
