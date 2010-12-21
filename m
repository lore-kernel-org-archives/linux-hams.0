From: f6bvp <f6bvp@free.fr>
Subject: Can AX25 socket debug message be removed ?
Date: Tue, 21 Dec 2010 11:38:25 +0100
Message-ID: <4D1083A1.209@free.fr>
References: <4CF78B70.4060907@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080403010003040900020302"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF78B70.4060907@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org
Cc: linux-hams@vger.kernel.org, Bernard Pidoux <bernard.pidoux@upmc.fr>

This is a multi-part message in MIME format.
--------------080403010003040900020302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ralf,

I would like to know your thinking about removing the following
kernel debug messages that fills /var/log/kernel/info and does not
seem to be actually usefull.

I build a patch project included here.
In case you approve I will submit it.
Should the SOCK_DEBUG lines be commented or removed ?

Bernard Pidoux <f6bvp@free.fr>

--------------080403010003040900020302
Content-Type: text/x-patch;
 name="af_ax25_sock_debug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="af_ax25_sock_debug.patch"

--- a/net/ax25/af_ax25.c	2010-12-09 23:17:27.000000000 +0100
+++ b/net/ax25/af_ax25.c	2010-11-17 17:49:41.414197280 +0100
@@ -1538,7 +1538,7 @@
 	}
 
 	/* Build a packet */
-	SOCK_DEBUG(sk, "AX.25: sendto: Addresses built. Building packet.\n");
+/*	SOCK_DEBUG(sk, "AX.25: sendto: Addresses built. Building packet.\n");*/
 
 	/* Assume the worst case */
 	size = len + ax25->ax25_dev->dev->hard_header_len;
@@ -1549,7 +1549,7 @@
 
 	skb_reserve(skb, size - len);
 
-	SOCK_DEBUG(sk, "AX.25: Appending user data\n");
+/*	SOCK_DEBUG(sk, "AX.25: Appending user data\n");*/
 
 	/* User data follows immediately after the AX.25 data */
 	if (memcpy_fromiovec(skb_put(skb, len), msg->msg_iov, len)) {
@@ -1564,7 +1564,7 @@
 	if (!ax25->pidincl)
 		*skb_push(skb, 1) = sk->sk_protocol;
 
-	SOCK_DEBUG(sk, "AX.25: Transmitting buffer\n");
+/*	SOCK_DEBUG(sk, "AX.25: Transmitting buffer\n");*/
 
 	if (sk->sk_type == SOCK_SEQPACKET) {
 		/* Connected mode sockets go via the LAPB machine */
@@ -1583,7 +1583,7 @@
 
 	skb_push(skb, 1 + ax25_addr_size(dp));
 
-	SOCK_DEBUG(sk, "Building AX.25 Header (dp=%p).\n", dp);
+/*	SOCK_DEBUG(sk, "Building AX.25 Header (dp=%p).\n", dp);*/
 
 	if (dp != NULL)
 		SOCK_DEBUG(sk, "Num digipeaters=%d\n", dp->ndigi);
@@ -1592,7 +1592,7 @@
 	lv = ax25_addr_build(skb->data, &ax25->source_addr, &sax.sax25_call,
 			     dp, AX25_COMMAND, AX25_MODULUS);
 
-	SOCK_DEBUG(sk, "Built header (%d bytes)\n",lv);
+/*	SOCK_DEBUG(sk, "Built header (%d bytes)\n",lv);*/
 
 	skb_set_transport_header(skb, lv);
 

--------------080403010003040900020302--
