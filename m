From: Jean Delvare <khali@linux-fr.org>
Subject: [PATCH] Masking bug in 6pack driver?
Date: Thu, 23 Nov 2006 18:58:10 +0100
Message-ID: <20061123185810.f86d7225.khali@linux-fr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Koensgen <ajk@iehk.rwth-aachen.de>
Cc: linux-hams@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

Looks like a broken masking to me, binary not is used where bitwise not
was intended.

Signed-off-by: Jean Delvare <khali@linux-fr.org>
---
 drivers/net/hamradio/6pack.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.19-rc6.orig/drivers/net/hamradio/6pack.c	2006-09-21 21:27:38.000000000 +0200
+++ linux-2.6.19-rc6/drivers/net/hamradio/6pack.c	2006-11-23 18:46:37.000000000 +0100
@@ -914,7 +914,7 @@
 					printk(KERN_DEBUG "6pack: protocol violation\n");
 				else
 					sp->status = 0;
-				cmd &= !SIXP_RX_DCD_MASK;
+				cmd &= ~SIXP_RX_DCD_MASK;
 		}
 		sp->status = cmd & SIXP_PRIO_DATA_MASK;
 	} else { /* output watchdog char if idle */


-- 
Jean Delvare
