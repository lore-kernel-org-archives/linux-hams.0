From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] missing spin_unlock and recvmsg fix
Date: Wed, 31 Dec 2003 17:06:47 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031231170647.C3527@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+fexcqMh/evT6CrY"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: davem@redhat.com, ralf@linux-mips.org


--+fexcqMh/evT6CrY
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a small patch for two ax25 problems:
- A missing spin_unlock.
- recvmsg was reporting the destination address instead of the source
address.
 (and I really want recvfrom() and not recvto() :)

Jeroen

--+fexcqMh/evT6CrY
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="ax25.2.6.0.rxq2.diff"

diff -ru linux-2.6.0.rxq.applied/net/ax25/af_ax25.c linux-2.6.0.rxq/net/ax25/af_ax25.c
--- linux-2.6.0.rxq.applied/net/ax25/af_ax25.c	2003-12-31 16:37:07.000000000 +0100
+++ linux-2.6.0.rxq/net/ax25/af_ax25.c	2003-12-31 16:18:04.000000000 +0100
@@ -247,6 +247,7 @@
 				kfree_skb(copy);
 		}
 	}
+	spin_unlock_bh(&ax25_list_lock);
 }
 
 /*
@@ -1618,16 +1619,16 @@
 	if (msg->msg_namelen != 0) {
 		struct sockaddr_ax25 *sax = (struct sockaddr_ax25 *)msg->msg_name;
 		ax25_digi digi;
-		ax25_address dest;
+		ax25_address src;
 
-		ax25_addr_parse(skb->mac.raw+1, skb->data-skb->mac.raw-1, NULL, &dest, &digi, NULL, NULL);
+		ax25_addr_parse(skb->mac.raw+1, skb->data-skb->mac.raw-1, &src, NULL, &digi, NULL, NULL);
 
 		sax->sax25_family = AF_AX25;
 		/* We set this correctly, even though we may not let the
 		   application know the digi calls further down (because it
 		   did NOT ask to know them).  This could get political... **/
 		sax->sax25_ndigis = digi.ndigi;
-		sax->sax25_call   = dest;
+		sax->sax25_call   = src;
 
 		if (sax->sax25_ndigis != 0) {
 			int ct;

--+fexcqMh/evT6CrY--

