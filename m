From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Can ROSE socket debug message be removed ?
Date: Tue, 21 Dec 2010 11:41:59 +0100
Message-ID: <4D108477.4060108@upmc.fr>
References: <4CF78B70.4060907@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060704040600030201010906"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF78B70.4060907@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org
Cc: linux-hams@vger.kernel.org, Bernard Pidoux <bernard.pidoux@upmc.fr>

This is a multi-part message in MIME format.
--------------060704040600030201010906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ralf,

The same question about removing the following ROSE
kernel debug messages that fills /var/log/kernel/info and does not
seem to be actually usefull.

Should the SOCK_DEBUG lines be commented or removed ?

Bernard Pidoux <f6bvp@free.fr>


--------------060704040600030201010906
Content-Type: text/x-patch;
 name="af_rose_sock_debug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="af_rose_sock_debug.patch"

--- a/net/rose/af_rose.c	2010-12-19 12:12:57.712847187 +0100
+++ b/net/rose/af_rose.c	2010-12-09 20:03:57.557563800 +0100
@@ -716,7 +739,7 @@
 	rose_insert_socket(sk);
 
 	sock_reset_flag(sk, SOCK_ZAPPED);
-	SOCK_DEBUG(sk, "ROSE: socket is bound\n");
+/*	SOCK_DEBUG(sk, "ROSE: socket is bound\n");*/
 	return 0;
 }
 
@@ -1113,10 +1138,10 @@
 			srose.srose_digis[n] = rose->dest_digis[n];
 	}
 
-	SOCK_DEBUG(sk, "ROSE: sendto: Addresses built.\n");
+/*	SOCK_DEBUG(sk, "ROSE: sendto: Addresses built.\n");*/
 
 	/* Build a packet */
-	SOCK_DEBUG(sk, "ROSE: sendto: building packet.\n");
+/*	SOCK_DEBUG(sk, "ROSE: sendto: building packet.\n");*/
 	/* Sanity check the packet size */
 	if (len > 65535)
 		return -EMSGSIZE;
@@ -1131,7 +1156,7 @@
 	/*
 	 *	Put the data on the end
 	 */
-	SOCK_DEBUG(sk, "ROSE: Appending user data\n");
+/*	SOCK_DEBUG(sk, "ROSE: Appending user data\n");*/
 
 	skb_reset_transport_header(skb);
 	skb_put(skb, len);
@@ -1156,7 +1181,7 @@
 	 */
 	asmptr = skb_push(skb, ROSE_MIN_LEN);
 
-	SOCK_DEBUG(sk, "ROSE: Building Network Header.\n");
+/*	SOCK_DEBUG(sk, "ROSE: Building Network Header.\n");*/
 
 	/* Build a ROSE Network header */
 	asmptr[0] = ((rose->lci >> 8) & 0x0F) | ROSE_GFI;
@@ -1166,9 +1191,9 @@
 	if (qbit)
 		asmptr[0] |= ROSE_Q_BIT;
 
-	SOCK_DEBUG(sk, "ROSE: Built header.\n");
+/*	SOCK_DEBUG(sk, "ROSE: Built header.\n");*/
 
-	SOCK_DEBUG(sk, "ROSE: Transmitting buffer\n");
+/*	SOCK_DEBUG(sk, "ROSE: Transmitting buffer\n");*/
 
 	if (sk->sk_state != TCP_ESTABLISHED) {
 		kfree_skb(skb);

--------------060704040600030201010906--
