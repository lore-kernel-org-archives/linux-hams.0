From: "Petri T. Koistinen" <petri.koistinen@iki.fi>
Subject: [PATCH] drivers/net/hamradio/Kconfig URL update
Date: Wed, 11 Feb 2004 22:20:51 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0402112216291.12093@dsl-hkigw4m08.dial.inet.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@redhat.com>
Cc: linux-hams@vger.kernel.org

Hi!

URL update and unify some documentation.

Petri

--- linux-2.6/drivers/net/hamradio/Kconfig	2004-02-05 17:02:11.000000000 +0200
+++ linux-2.6-trivial/drivers/net/hamradio/Kconfig	2004-02-11 22:14:17.000000000 +0200
@@ -71,9 +71,9 @@
 	  Before you configure each interface with ifconfig, you MUST set
 	  certain parameters, such as channel access timing, clock mode, and
 	  DMA channel. This is accomplished with a small utility program,
-	  dmascc_cfg, available at
-	  <http://www.nt.tuwien.ac.at/~kkudielk/Linux/>. Please be sure to get
-	  at least version 1.27 of dmascc_cfg, as older versions will not
+	  dmascc_cfg, available at
+	  <http://cacofonix.nt.tuwien.ac.at/~oe1kib/Linux/>. Please be sure to
+	  get at least version 1.27 of dmascc_cfg, as older versions will not
 	  work with the current driver.

 config SCC
@@ -96,8 +96,9 @@
 	help
 	  Say Y here if you experience problems with the SCC driver not
 	  working properly; please read
-	  <file:Documentation/networking/z8530drv.txt> for details. If unsure,
-	  say N.
+	  <file:Documentation/networking/z8530drv.txt> for details.
+
+	  If unsure, say N.

 config SCC_TRXECHO
 	bool "support for TRX that feedback the tx signal to rx"
@@ -105,7 +106,9 @@
 	help
 	  Some transmitters feed the transmitted signal back to the receive
 	  line.  Say Y here to foil this by explicitly disabling the receiver
-	  during data transmission.  If in doubt, say Y.
+	  during data transmission.
+
+	  If in doubt, say Y.

 config BAYCOM_SER_FDX
 	tristate "BAYCOM ser12 fullduplex driver for AX.25"
