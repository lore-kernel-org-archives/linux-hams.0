From: "Lars E. Pettersson" <sm6rpz@home.se>
Subject: Re: [PATCH] hamradio driver fixes
Date: Tue, 20 Jan 2004 20:11:17 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1074625877.1105.30.camel@tux.home.rpz>
References: <20040119223235.E211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-M6V+oEppzngEGt3t5RHj"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040119223235.E211@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org


--=-M6V+oEppzngEGt3t5RHj
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi!

On Mon, 2004-01-19 at 22:32, Jeroen Vreeken wrote:
> This is a patch that fixes some problems in the hamradio drivers in 2.6.1

A patch for scc.c to count the number of bytes sent and received was
sent to this mailing list a while ago (do not remember from who.) I can
not find this patch in the 2.6.1-kernel.

Attached is a quick diff I did for the 2.6.1 kernel.

73 de Lars, sm6rpz
-- 
Lars E. Pettersson, SM6RPZ | Gothenburg, SWEDEN
sm6rpz@home.se | http://www.sm6rpz.se/


--=-M6V+oEppzngEGt3t5RHj
Content-Description: 
Content-Disposition: inline; filename=scc.diff
Content-Type: text/x-patch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

--- linux-2.6.1/drivers/net/hamradio/scc.c.orig	2004-01-09 07:59:56.000000000 +0100
+++ linux-2.6.1/drivers/net/hamradio/scc.c	2004-01-20 20:01:22.000000000 +0100
@@ -1625,6 +1625,7 @@
 	}
 		
 	scc->dev_stat.rx_packets++;
+	scc->dev_stat.rx_bytes += skb->len;
 
 	skb->dev      = scc->dev;
 	skb->protocol = htons(ETH_P_AX25);
@@ -1651,6 +1652,7 @@
 	}
 	
 	scc->dev_stat.tx_packets++;
+	scc->dev_stat.tx_bytes += skb->len;
 	scc->stat.txframes++;
 	
 	kisscmd = *skb->data & 0x1f;

--=-M6V+oEppzngEGt3t5RHj--

