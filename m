From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: Can AX25 socket debug message be removed ?
Date: Sun, 17 Jul 2011 15:51:57 +0200
Message-ID: <4E22E8FD.9000805@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Ralf,

This is a reminder for I do not see any trace of your following patches 
being committed
since I approved it.

73 de Bernard, f6bvp

-----------------


   Hi Ralf,

I agree that your patch including NetRom socket debug messages suppression
is fine as AX25, NetRom and ROSE modules are nowadays much more stable in
kernel 2.6.

This will simplify the output of kernel log messages allowing further debuging
work.

I am actually concerned by two remaining bugs in ROSE module :
First, is the occurence of negative values for neighbour->use parameter
from time to time.
Second, is the impossibility to remove rose module after an application such
as FPAC has initialized rose nodes and routes.

Then I approve and sustain you proposed patch.

Bernard


Selon Ralf Baechle DL5RB<ralf@linux-mips.org>:

>  On Tue, Dec 21, 2010 at 11:38:25AM +0100, f6bvp wrote:
>
>  >  I would like to know your thinking about removing the following
>  >  kernel debug messages that fills /var/log/kernel/info and does not
>  >  seem to be actually usefull.
>  >
>  >  I build a patch project included here.
>  >  In case you approve I will submit it.
>  >  Should the SOCK_DEBUG lines be commented or removed ?
>
>  The messages are only printed for sockets that have the SOCK_DBG flag set
>  so you may want to audit the application code for use of this flag.
>
>  Either way - the messages were there when I took maintainership over the
>  code and I don't know of anybody using them since so I don't mind removing
>  them.  Imho they stopped making sense ages ago.
>
>  Remove rubbish, don't comment it out unless it's meant to disactivate
>  code for a short time only.  For other code that needs to be restored there
>  is the git repository.
>
>  So how about below more radical patch that also deals with NET\ROM?
>
>    Ralf
>
>  Signed-off-by: Ralf Baechle<ralf@linux-mips.org>
>
>   net/ax25/af_ax25.c     |   16 +---------------
>   net/netrom/af_netrom.c |   12 +-----------
>   net/rose/af_rose.c     |   16 ++--------------
>   3 files changed, 4 insertions(+), 40 deletions(-)
>
>  diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>  index bb86d29..64d2832 100644
>  --- a/net/ax25/af_ax25.c
>  +++ b/net/ax25/af_ax25.c
>  @@ -1538,8 +1538,6 @@ static int ax25_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   	}
>
>   	/* Build a packet */
>  -	SOCK_DEBUG(sk, "AX.25: sendto: Addresses built. Building packet.\n");
>  -
>   	/* Assume the worst case */
>   	size = len + ax25->ax25_dev->dev->hard_header_len;
>
>  @@ -1549,8 +1547,6 @@ static int ax25_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>
>   	skb_reserve(skb, size - len);
>
>  -	SOCK_DEBUG(sk, "AX.25: Appending user data\n");
>  -
>   	/* User data follows immediately after the AX.25 data */
>   	if (memcpy_fromiovec(skb_put(skb, len), msg->msg_iov, len)) {
>   		err = -EFAULT;
>  @@ -1564,8 +1560,6 @@ static int ax25_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   	if (!ax25->pidincl)
>   		*skb_push(skb, 1) = sk->sk_protocol;
>
>  -	SOCK_DEBUG(sk, "AX.25: Transmitting buffer\n");
>  -
>   	if (sk->sk_type == SOCK_SEQPACKET) {
>   		/* Connected mode sockets go via the LAPB machine */
>   		if (sk->sk_state != TCP_ESTABLISHED) {
>  @@ -1583,22 +1577,14 @@ static int ax25_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>
>   	skb_push(skb, 1 + ax25_addr_size(dp));
>
>  -	SOCK_DEBUG(sk, "Building AX.25 Header (dp=%p).\n", dp);
>  -
>  -	if (dp != NULL)
>  -		SOCK_DEBUG(sk, "Num digipeaters=%d\n", dp->ndigi);
>  +	/* Building AX.25 Header */
>
>   	/* Build an AX.25 header */
>   	lv = ax25_addr_build(skb->data,&ax25->source_addr,&sax.sax25_call,
>   			dp, AX25_COMMAND, AX25_MODULUS);
>
>  -	SOCK_DEBUG(sk, "Built header (%d bytes)\n",lv);
>  -
>   	skb_set_transport_header(skb, lv);
>
>  -	SOCK_DEBUG(sk, "base=%p pos=%p\n",
>  -		   skb->data, skb_transport_header(skb));
>  -
>   	*skb_transport_header(skb) = AX25_UI;
>
>   	/* Datagram frames go straight out of the door as UI */
>  diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
>  index 06cb027..732152f 100644
>  --- a/net/netrom/af_netrom.c
>  +++ b/net/netrom/af_netrom.c
>  @@ -591,7 +591,6 @@ static int nr_bind(struct socket *sock, struct sockaddr
>  *uaddr, int addr_len)
>   		return -EINVAL;
>   	}
>   	if ((dev = nr_dev_get(&addr->fsa_ax25.sax25_call)) == NULL) {
>  -		SOCK_DEBUG(sk, "NET/ROM: bind failed: invalid node callsign\n");
>   		release_sock(sk);
>   		return -EADDRNOTAVAIL;
>   	}
>  @@ -632,7 +631,7 @@ static int nr_bind(struct socket *sock, struct sockaddr
>  *uaddr, int addr_len)
>   	sock_reset_flag(sk, SOCK_ZAPPED);
>   	dev_put(dev);
>   	release_sock(sk);
>  -	SOCK_DEBUG(sk, "NET/ROM: socket is bound\n");
>  +
>   	return 0;
>   }
>
>  @@ -1082,8 +1081,6 @@ static int nr_sendmsg(struct kiocb *iocb, struct socket
>  *sock,
>   		sax.sax25_call   = nr->dest_addr;
>   	}
>
>  -	SOCK_DEBUG(sk, "NET/ROM: sendto: Addresses built.\n");
>  -
>   	/* Build a packet - the conventional user limit is 236 bytes. We can
>   	do ludicrously large NetROM frames but must not overflow */
>   	if (len>  65536) {
>  @@ -1091,7 +1088,6 @@ static int nr_sendmsg(struct kiocb *iocb, struct socket
>  *sock,
>   		goto out;
>   	}
>
>  -	SOCK_DEBUG(sk, "NET/ROM: sendto: building packet.\n");
>   	size = len + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
>
>   	if ((skb = sock_alloc_send_skb(sk, size, msg->msg_flags&  MSG_DONTWAIT,
>  &err)) == NULL)
>  @@ -1105,7 +1101,6 @@ static int nr_sendmsg(struct kiocb *iocb, struct socket
>  *sock,
>   	*/
>
>   	asmptr = skb_push(skb, NR_TRANSPORT_LEN);
>  -	SOCK_DEBUG(sk, "Building NET/ROM Header.\n");
>
>   	/* Build a NET/ROM Transport header */
>
>  @@ -1114,15 +1109,12 @@ static int nr_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   	*asmptr++ = 0;		/* To be filled in later */
>   	*asmptr++ = 0;		/*      Ditto            */
>   	*asmptr++ = NR_INFO;
>  -	SOCK_DEBUG(sk, "Built header.\n");
>
>   	/*
>   	*	Put the data on the end
>   	*/
>   	skb_put(skb, len);
>
>  -	SOCK_DEBUG(sk, "NET/ROM: Appending user data\n");
>  -
>   	/* User data follows immediately after the NET/ROM transport header */
>   	if (memcpy_fromiovec(skb_transport_header(skb), msg->msg_iov, len)) {
>   		kfree_skb(skb);
>  @@ -1130,8 +1122,6 @@ static int nr_sendmsg(struct kiocb *iocb, struct socket
>  *sock,
>   		goto out;
>   	}
>
>  -	SOCK_DEBUG(sk, "NET/ROM: Transmitting buffer\n");
>  -
>   	if (sk->sk_state != TCP_ESTABLISHED) {
>   		kfree_skb(skb);
>   		err = -ENOTCONN;
>  diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
>  index d952e7e..29f4a38 100644
>  --- a/net/rose/af_rose.c
>  +++ b/net/rose/af_rose.c
>  @@ -682,10 +682,8 @@ static int rose_bind(struct socket *sock, struct
>  sockaddr *uaddr, int addr_len)
>   	if ((unsigned int) addr->srose_ndigis>  ROSE_MAX_DIGIS)
>   		return -EINVAL;
>
>  -	if ((dev = rose_dev_get(&addr->srose_addr)) == NULL) {
>  -		SOCK_DEBUG(sk, "ROSE: bind failed: invalid address\n");
>  +	if ((dev = rose_dev_get(&addr->srose_addr)) == NULL)
>   		return -EADDRNOTAVAIL;
>  -	}
>
>   	source =&addr->srose_call;
>
>  @@ -716,7 +714,7 @@ static int rose_bind(struct socket *sock, struct sockaddr
>  *uaddr, int addr_len)
>   	rose_insert_socket(sk);
>
>   	sock_reset_flag(sk, SOCK_ZAPPED);
>  -	SOCK_DEBUG(sk, "ROSE: socket is bound\n");
>  +
>   	return 0;
>   }
>
>  @@ -1116,10 +1114,7 @@ static int rose_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   			srose.srose_digis[n] = rose->dest_digis[n];
>   	}
>
>  -	SOCK_DEBUG(sk, "ROSE: sendto: Addresses built.\n");
>  -
>   	/* Build a packet */
>  -	SOCK_DEBUG(sk, "ROSE: sendto: building packet.\n");
>   	/* Sanity check the packet size */
>   	if (len>  65535)
>   		return -EMSGSIZE;
>  @@ -1134,7 +1129,6 @@ static int rose_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   	/*
>   	*	Put the data on the end
>   	*/
>  -	SOCK_DEBUG(sk, "ROSE: Appending user data\n");
>
>   	skb_reset_transport_header(skb);
>   	skb_put(skb, len);
>  @@ -1159,8 +1153,6 @@ static int rose_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   	*/
>   	asmptr = skb_push(skb, ROSE_MIN_LEN);
>
>  -	SOCK_DEBUG(sk, "ROSE: Building Network Header.\n");
>  -
>   	/* Build a ROSE Network header */
>   	asmptr[0] = ((rose->lci>>  8)&  0x0F) | ROSE_GFI;
>   	asmptr[1] = (rose->lci>>  0)&  0xFF;
>  @@ -1169,10 +1161,6 @@ static int rose_sendmsg(struct kiocb *iocb, struct
>  socket *sock,
>   	if (qbit)
>   		asmptr[0] |= ROSE_Q_BIT;
>
>  -	SOCK_DEBUG(sk, "ROSE: Built header.\n");
>  -
>  -	SOCK_DEBUG(sk, "ROSE: Transmitting buffer\n");
>  -
>   	if (sk->sk_state != TCP_ESTABLISHED) {
>   		kfree_skb(skb);
>   		return -ENOTCONN;
>

