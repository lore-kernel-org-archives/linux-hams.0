From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH] Fix 6pack resynchronizatio with a TNC
Date: Wed, 9 Feb 2005 00:34:26 +0000
Message-ID: <20050209003425.GA18719@linux-mips.org>
Mime-Version: 1.0
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Keep the resynchronization timer running or we're never going to sync
after a 6pack has been disconnected / reconnected or powercycled.
While we're at it, it's time to upgrade my callsign in the source :-)

Please test this and let me know of your test results.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

 6pack.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

Index: bk-afu/drivers/net/hamradio/6pack.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/6pack.c	2005-02-08 17:06:24.465393600 +0000
+++ bk-afu/drivers/net/hamradio/6pack.c	2005-02-08 17:08:37.682141576 +0000
@@ -1023,10 +1023,8 @@
 
 	for (count1 = 0; count1 < count; count1++) {
 		inbyte = pre_rbuff[count1];
-		if (inbyte == SIXP_FOUND_TNC) {
+		if (inbyte == SIXP_FOUND_TNC)
 			tnc_set_sync_state(sp, TNC_IN_SYNC);
-			del_timer(&sp->resync_t);
-		}
 		if ((inbyte & SIXP_PRIO_CMD_MASK) != 0)
 			decode_prio_command(sp, inbyte);
 		else if ((inbyte & SIXP_STD_CMD_MASK) != 0)
@@ -1036,7 +1034,7 @@
 	}
 }
 
-MODULE_AUTHOR("Ralf Baechle DO1GRB <ralf@linux-mips.org>");
+MODULE_AUTHOR("Ralf Baechle DL5RB <ralf@linux-mips.org>");
 MODULE_DESCRIPTION("6pack driver for AX.25");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_LDISC(N_6PACK);
