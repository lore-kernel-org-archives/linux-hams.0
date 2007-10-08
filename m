From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 8 Oct 2007 11:45:41 +0100
Message-ID: <20071008104541.GA4924@linux-mips.org>
References: <47093A4E.5040409@hamradio.hr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47093A4E.5040409@hamradio.hr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tihomir Heidelberg - 9a4gl <9a4gl_MAKNI_OVO@hamradio.hr>, Stephen Hemminger <shemminger@osdl.org>
Cc: linux-hams@vger.kernel.org

On Sun, Oct 07, 2007 at 09:58:06PM +0200, Tihomir Heidelberg - 9a4gl wrote:

> Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
> MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
> [Message too long]).
> 
> This happend in net/ax25/af_ax25.c in function ax25_sendmsg at:
> 
>         if (len > ax25->ax25_dev->dev->mtu) {
>                 err = -EMSGSIZE;
>                 goto out;
>         }

This is a Linux 2.6.2 change, I append the patch which introduced the
change below.  I'm cc'ing Stephen Hemminger who hopefully recalls why his
patch did introduce this change.

(git users: commit id is 89aebaffff7545d7a2947e2f8f5fdee70f841c14 which is
only available in tglx's history tree on kernel.org)

> Old kernels, 2.2.x and 2.4.x accepted write with data length larger then
> MTU and for SOCK_SEQPACKET sockets the ax25_output function did the
> fragmentation job.
> 
> According to "man 2 write", write should return number of bytes written.
> I think that:
> 
> 1. ax25_sendmsg should accept data larger then mtu and pass the data to
> ax25_output.
> 2. ax25_output should do fragmentation and queue frames into device queue.
> 3. ax25_output should stop fragmenting when device queue is full
> 4. ax25_output should return number of bytes queued on device
> 5. ax25_sendmsg should return number of bytes accepted for xmiting

Agreed.

> Also, as I see, currently ax25 stack is not checking if dev_queue_xmit
> fails. Does this means that AX.25 kernel can loose some frames when
> device queue is full ?

Yes.  This isn't a bug - packet delivery is unreliable.  But what I'd
really like to see is the AX.25 stack to throttle itself instead of
continuing to stuff packets into an overflowing queue.

> By the way, this problem is having OpenBCM V1.07b3, very popular BBS
> software (http://dnx274.dyndns.org/baybox/) which writes as much data as
> it prepared.
> 
> 73 de Tihomir Heidelberg, 9a4gl(_a_t_)hamradio(d_o_t)hr
> 

73 de DL5RB op Ralf

--
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU

From 89aebaffff7545d7a2947e2f8f5fdee70f841c14 Mon Sep 17 00:00:00 2001
From: Stephen Hemminger <shemminger@osdl.org>
Date: Thu, 8 Jan 2004 09:53:15 -0800
Subject: [PATCH] [AX25]: Use size_t for size in {send,recv}msg.


diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 4fb1519..43472c6 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1401,7 +1401,7 @@ out:
 }
 
 static int ax25_sendmsg(struct kiocb *iocb, struct socket *sock,
-			struct msghdr *msg, int len)
+			struct msghdr *msg, size_t len)
 {
 	struct sockaddr_ax25 *usax = (struct sockaddr_ax25 *)msg->msg_name;
 	struct sock *sk = sock->sk;
@@ -1410,7 +1410,8 @@ static int ax25_sendmsg(struct kiocb *iocb, struct socket *sock,
 	ax25_digi dtmp, *dp;
 	unsigned char *asmptr;
 	ax25_cb *ax25;
-	int lv, size, err, addr_len = msg->msg_namelen;
+	size_t size;
+	int lv, err, addr_len = msg->msg_namelen;
 
 	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_EOR)) {
 		return -EINVAL;
@@ -1435,6 +1436,11 @@ static int ax25_sendmsg(struct kiocb *iocb, struct socket *sock,
 		goto out;
 	}
 
+	if (len > ax25->ax25_dev->dev->mtu) {
+		err = -EMSGSIZE;
+		goto out;
+	}
+		
 	if (usax != NULL) {
 		if (usax->sax25_family != AF_AX25) {
 			err = -EINVAL;
@@ -1580,7 +1586,7 @@ out:
 }
 
 static int ax25_recvmsg(struct kiocb *iocb, struct socket *sock,
-	struct msghdr *msg, int size, int flags)
+	struct msghdr *msg, size_t size, int flags)
 {
 	struct sock *sk = sock->sk;
 	struct sk_buff *skb;
