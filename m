From: Martijn Hijdra <martijn@esrac.ele.tue.nl>
Subject: Statistics patch for scc.c  driver
Date: Fri, 05 Sep 2003 10:15:27 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1062749727.4434.4.camel@imst153.imst.de>
References: <Pine.LNX.4.33.0307091916160.8812-100000@zoef.pe1icq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-GIR3lJy9QLfAnVOV2+/v"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0307091916160.8812-100000@zoef.pe1icq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org


--=-GIR3lJy9QLfAnVOV2+/v
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi All,


I had some spare time and generated a small patch to
fill the statistics counters for the scc driver.
see output of ifconfig RX bytes and TX bytes.


Patch is generated for 2.6.0 kernel but should apply
on numerous other (read older) kernels because the driver is not changed
in a long time.

Please test and if this patch works correctly we can apply this to the standard kernel.


btw, a small compile fix is is in scc.h to change datatype.




-- 
Martijn Hijdra <martijn@esrac.ele.tue.nl>

--=-GIR3lJy9QLfAnVOV2+/v
Content-Disposition: attachment; filename=patch
Content-Type: text/plain; name=patch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

--- drivers/net/hamradio/scc.c.orig	2003-08-23 01:58:57.000000000 +0200
+++ drivers/net/hamradio/scc.c	2003-09-03 08:57:50.000000000 +0200
@@ -1635,6 +1635,7 @@
 	}
 		
 	scc->dev_stat.rx_packets++;
+	scc->dev_stat.rx_bytes += skb->len;
 
 	skb->dev      = scc->dev;
 	skb->protocol = htons(ETH_P_AX25);
@@ -1661,6 +1662,7 @@
 	}
 	
 	scc->dev_stat.tx_packets++;
+	scc->dev_stat.tx_bytes += skb->len;
 	scc->stat.txframes++;
 	
 	kisscmd = *skb->data & 0x1f;
--- include/linux/scc.h.orig	2003-09-03 09:13:26.000000000 +0200
+++ include/linux/scc.h	2003-09-03 09:13:55.000000000 +0200
@@ -200,7 +200,7 @@
 	unsigned char fulldup;		/* Full Duplex mode 0=CSMA 1=DUP 2=ALWAYS KEYED */
 	unsigned char waittime;		/* Waittime before any transmit attempt */
 	unsigned int  maxkeyup;		/* Maximum time to transmit (seconds) */
-	unsigned char mintime;		/* Minimal offtime after MAXKEYUP timeout (seconds) */
+	unsigned int  mintime;		/* Minimal offtime after MAXKEYUP timeout (seconds) */
 	unsigned int  idletime;		/* Maximum idle time in ALWAYS KEYED mode (seconds) */
 	unsigned int  maxdefer;		/* Timer for CSMA channel busy limit */
 	unsigned char tx_inhibit;	/* Transmit is not allowed when set */	

--=-GIR3lJy9QLfAnVOV2+/v--

