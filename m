From: f6bvp <f6bvp@free.fr>
Subject: Re: Can AX25 socket debug message be removed ?
Date: Tue, 15 Feb 2011 15:25:13 +0100
Message-ID: <4D5A8CC9.3090304@free.fr>
References: <4CF78B70.4060907@free.fr> <4D1083A1.209@free.fr> <20101221173334.GB15612@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20101221173334.GB15612@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org, Bernard Pidoux <bernard.pidoux@upmc.fr>

Hello Ralf,

I approve your more radical patch and I am sorry for the late response.
af_rose patch could display a small offset as I re-sent a patch to
Linux-netdev that has been just applied by David Miller to net-next-2.6=
=2E
I had put you on Cc for the patch I sent.

73 de Bernard, f6bvp



Le 21/12/2010 18:33, Ralf Baechle DL5RB a =E9crit :
> On Tue, Dec 21, 2010 at 11:38:25AM +0100, f6bvp wrote:
>
>   =20
>> I would like to know your thinking about removing the following
>> kernel debug messages that fills /var/log/kernel/info and does not
>> seem to be actually usefull.
>>
>> I build a patch project included here.
>> In case you approve I will submit it.
>> Should the SOCK_DEBUG lines be commented or removed ?
>>     =20
> The messages are only printed for sockets that have the SOCK_DBG flag=
 set
> so you may want to audit the application code for use of this flag.
>
> Either way - the messages were there when I took maintainership over =
the
> code and I don't know of anybody using them since so I don't mind rem=
oving
> them.  Imho they stopped making sense ages ago.
>
> Remove rubbish, don't comment it out unless it's meant to disactivate
> code for a short time only.  For other code that needs to be restored=
 there
> is the git repository.
>
> So how about below more radical patch that also deals with NET\ROM?
>
>    Ralf
>
> Signed-off-by: Ralf Baechle<ralf@linux-mips.org>
>
>   net/ax25/af_ax25.c     |   16 +---------------
>   net/netrom/af_netrom.c |   12 +-----------
>   net/rose/af_rose.c     |   16 ++--------------
>   3 files changed, 4 insertions(+), 40 deletions(-)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index bb86d29..64d2832 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1538,8 +1538,6 @@ static int ax25_sendmsg(struct kiocb *iocb, str=
uct socket *sock,
>   	}
>
>   	/* Build a packet */
> -	SOCK_DEBUG(sk, "AX.25: sendto: Addresses built. Building packet.\n"=
);
> -
>   	/* Assume the worst case */
>   	size =3D len + ax25->ax25_dev->dev->hard_header_len;
>
> @@ -1549,8 +1547,6 @@ static int ax25_sendmsg(struct kiocb *iocb, str=
uct socket *sock,
>
>   	skb_reserve(skb, size - len);
>
> -	SOCK_DEBUG(sk, "AX.25: Appending user data\n");
> -
>   	/* User data follows immediately after the AX.25 data */
>   	if (memcpy_fromiovec(skb_put(skb, len), msg->msg_iov, len)) {
>   		err =3D -EFAULT;
> @@ -1564,8 +1560,6 @@ static int ax25_sendmsg(struct kiocb *iocb, str=
uct socket *sock,
>   	if (!ax25->pidincl)
>   		*skb_push(skb, 1) =3D sk->sk_protocol;
>
> -	SOCK_DEBUG(sk, "AX.25: Transmitting buffer\n");
> -
>   	if (sk->sk_type =3D=3D SOCK_SEQPACKET) {
>   		/* Connected mode sockets go via the LAPB machine */
>   		if (sk->sk_state !=3D TCP_ESTABLISHED) {
> @@ -1583,22 +1577,14 @@ static int ax25_sendmsg(struct kiocb *iocb, s=
truct socket *sock,
>
>   	skb_push(skb, 1 + ax25_addr_size(dp));
>
> -	SOCK_DEBUG(sk, "Building AX.25 Header (dp=3D%p).\n", dp);
> -
> -	if (dp !=3D NULL)
> -		SOCK_DEBUG(sk, "Num digipeaters=3D%d\n", dp->ndigi);
> +	/* Building AX.25 Header */
>
>   	/* Build an AX.25 header */
>   	lv =3D ax25_addr_build(skb->data,&ax25->source_addr,&sax.sax25_cal=
l,
>   			     dp, AX25_COMMAND, AX25_MODULUS);
>
> -	SOCK_DEBUG(sk, "Built header (%d bytes)\n",lv);
> -
>   	skb_set_transport_header(skb, lv);
>
> -	SOCK_DEBUG(sk, "base=3D%p pos=3D%p\n",
> -		   skb->data, skb_transport_header(skb));
> -
>   	*skb_transport_header(skb) =3D AX25_UI;
>
>   	/* Datagram frames go straight out of the door as UI */
> diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
> index 06cb027..732152f 100644
> --- a/net/netrom/af_netrom.c
> +++ b/net/netrom/af_netrom.c
> @@ -591,7 +591,6 @@ static int nr_bind(struct socket *sock, struct so=
ckaddr *uaddr, int addr_len)
>   		return -EINVAL;
>   	}
>   	if ((dev =3D nr_dev_get(&addr->fsa_ax25.sax25_call)) =3D=3D NULL) =
{
> -		SOCK_DEBUG(sk, "NET/ROM: bind failed: invalid node callsign\n");
>   		release_sock(sk);
>   		return -EADDRNOTAVAIL;
>   	}
> @@ -632,7 +631,7 @@ static int nr_bind(struct socket *sock, struct so=
ckaddr *uaddr, int addr_len)
>   	sock_reset_flag(sk, SOCK_ZAPPED);
>   	dev_put(dev);
>   	release_sock(sk);
> -	SOCK_DEBUG(sk, "NET/ROM: socket is bound\n");
> +
>   	return 0;
>   }
>
> @@ -1082,8 +1081,6 @@ static int nr_sendmsg(struct kiocb *iocb, struc=
t socket *sock,
>   		sax.sax25_call   =3D nr->dest_addr;
>   	}
>
> -	SOCK_DEBUG(sk, "NET/ROM: sendto: Addresses built.\n");
> -
>   	/* Build a packet - the conventional user limit is 236 bytes. We c=
an
>   	   do ludicrously large NetROM frames but must not overflow */
>   	if (len>  65536) {
> @@ -1091,7 +1088,6 @@ static int nr_sendmsg(struct kiocb *iocb, struc=
t socket *sock,
>   		goto out;
>   	}
>
> -	SOCK_DEBUG(sk, "NET/ROM: sendto: building packet.\n");
>   	size =3D len + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
>
>   	if ((skb =3D sock_alloc_send_skb(sk, size, msg->msg_flags&  MSG_DO=
NTWAIT,&err)) =3D=3D NULL)
> @@ -1105,7 +1101,6 @@ static int nr_sendmsg(struct kiocb *iocb, struc=
t socket *sock,
>   	 */
>
>   	asmptr =3D skb_push(skb, NR_TRANSPORT_LEN);
> -	SOCK_DEBUG(sk, "Building NET/ROM Header.\n");
>
>   	/* Build a NET/ROM Transport header */
>
> @@ -1114,15 +1109,12 @@ static int nr_sendmsg(struct kiocb *iocb, str=
uct socket *sock,
>   	*asmptr++ =3D 0;		/* To be filled in later */
>   	*asmptr++ =3D 0;		/*      Ditto            */
>   	*asmptr++ =3D NR_INFO;
> -	SOCK_DEBUG(sk, "Built header.\n");
>
>   	/*
>   	 *	Put the data on the end
>   	 */
>   	skb_put(skb, len);
>
> -	SOCK_DEBUG(sk, "NET/ROM: Appending user data\n");
> -
>   	/* User data follows immediately after the NET/ROM transport heade=
r */
>   	if (memcpy_fromiovec(skb_transport_header(skb), msg->msg_iov, len)=
) {
>   		kfree_skb(skb);
> @@ -1130,8 +1122,6 @@ static int nr_sendmsg(struct kiocb *iocb, struc=
t socket *sock,
>   		goto out;
>   	}
>
> -	SOCK_DEBUG(sk, "NET/ROM: Transmitting buffer\n");
> -
>   	if (sk->sk_state !=3D TCP_ESTABLISHED) {
>   		kfree_skb(skb);
>   		err =3D -ENOTCONN;
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index d952e7e..29f4a38 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -682,10 +682,8 @@ static int rose_bind(struct socket *sock, struct=
 sockaddr *uaddr, int addr_len)
>   	if ((unsigned int) addr->srose_ndigis>  ROSE_MAX_DIGIS)
>   		return -EINVAL;
>
> -	if ((dev =3D rose_dev_get(&addr->srose_addr)) =3D=3D NULL) {
> -		SOCK_DEBUG(sk, "ROSE: bind failed: invalid address\n");
> +	if ((dev =3D rose_dev_get(&addr->srose_addr)) =3D=3D NULL)
>   		return -EADDRNOTAVAIL;
> -	}
>
>   	source =3D&addr->srose_call;
>
> @@ -716,7 +714,7 @@ static int rose_bind(struct socket *sock, struct =
sockaddr *uaddr, int addr_len)
>   	rose_insert_socket(sk);
>
>   	sock_reset_flag(sk, SOCK_ZAPPED);
> -	SOCK_DEBUG(sk, "ROSE: socket is bound\n");
> +
>   	return 0;
>   }
>
> @@ -1116,10 +1114,7 @@ static int rose_sendmsg(struct kiocb *iocb, st=
ruct socket *sock,
>   			srose.srose_digis[n] =3D rose->dest_digis[n];
>   	}
>
> -	SOCK_DEBUG(sk, "ROSE: sendto: Addresses built.\n");
> -
>   	/* Build a packet */
> -	SOCK_DEBUG(sk, "ROSE: sendto: building packet.\n");
>   	/* Sanity check the packet size */
>   	if (len>  65535)
>   		return -EMSGSIZE;
> @@ -1134,7 +1129,6 @@ static int rose_sendmsg(struct kiocb *iocb, str=
uct socket *sock,
>   	/*
>   	 *	Put the data on the end
>   	 */
> -	SOCK_DEBUG(sk, "ROSE: Appending user data\n");
>
>   	skb_reset_transport_header(skb);
>   	skb_put(skb, len);
> @@ -1159,8 +1153,6 @@ static int rose_sendmsg(struct kiocb *iocb, str=
uct socket *sock,
>   	 */
>   	asmptr =3D skb_push(skb, ROSE_MIN_LEN);
>
> -	SOCK_DEBUG(sk, "ROSE: Building Network Header.\n");
> -
>   	/* Build a ROSE Network header */
>   	asmptr[0] =3D ((rose->lci>>  8)&  0x0F) | ROSE_GFI;
>   	asmptr[1] =3D (rose->lci>>  0)&  0xFF;
> @@ -1169,10 +1161,6 @@ static int rose_sendmsg(struct kiocb *iocb, st=
ruct socket *sock,
>   	if (qbit)
>   		asmptr[0] |=3D ROSE_Q_BIT;
>
> -	SOCK_DEBUG(sk, "ROSE: Built header.\n");
> -
> -	SOCK_DEBUG(sk, "ROSE: Transmitting buffer\n");
> -
>   	if (sk->sk_state !=3D TCP_ESTABLISHED) {
>   		kfree_skb(skb);
>   		return -ENOTCONN;
>   =20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
