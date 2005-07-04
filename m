From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] SMP fix for 6pack driver
Date: Mon, 4 Jul 2005 18:30:42 +0100
Message-ID: <20050704173042.GA3090@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>, stable@kernel.org
Cc: linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

Drivers really only work well in SMP if they actually can be selected.
This is a leftover from the time when the 6pack drive only used to be
a bitrotten variant of the slip driver.

Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 Kconfig |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-cvs/drivers/net/hamradio/Kconfig
===================================================================
--- linux-cvs.orig/drivers/net/hamradio/Kconfig	2005-05-20 12:29:58.000000000 +0100
+++ linux-cvs/drivers/net/hamradio/Kconfig	2005-07-04 18:23:17.000000000 +0100
@@ -17,7 +17,7 @@
 
 config 6PACK
 	tristate "Serial port 6PACK driver"
-	depends on AX25 && BROKEN_ON_SMP
+	depends on AX25
 	---help---
 	  6pack is a transmission protocol for the data exchange between your
 	  PC and your TNC (the Terminal Node Controller acts as a kind of

