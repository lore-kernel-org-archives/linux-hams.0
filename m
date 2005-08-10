From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH] 6pack persistence fix
Date: Wed, 10 Aug 2005 14:23:19 +0100
Message-ID: <20050810132319.GB10602@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Resend, vger seems to had this posting for breakfast when I first sent it
two days ago ...

Fix the p-persistence CSMA algorithm which in simplex mode was starting
with a slottime delay before doing anything else as if there was carrier
collision resulting in bad performance on simplex links.

Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 drivers/net/hamradio/6pack.c |   20 ++++----------------
 1 files changed, 4 insertions(+), 16 deletions(-)

Index: linux-cvs/drivers/net/hamradio/6pack.c
===================================================================
--- linux-cvs.orig/drivers/net/hamradio/6pack.c
+++ linux-cvs/drivers/net/hamradio/6pack.c
@@ -130,12 +130,11 @@ struct sixpack {
 
 #define AX25_6PACK_HEADER_LEN 0
 
-static void sp_start_tx_timer(struct sixpack *);
 static void sixpack_decode(struct sixpack *, unsigned char[], int);
 static int encode_sixpack(unsigned char *, unsigned char *, int, unsigned char);
 
 /*
- * perform the persistence/slottime algorithm for CSMA access. If the
+ * Perform the persistence/slottime algorithm for CSMA access. If the
  * persistence check was successful, write the data to the serial driver.
  * Note that in case of DAMA operation, the data is not sent here.
  */
@@ -143,7 +142,7 @@ static int encode_sixpack(unsigned char 
 static void sp_xmit_on_air(unsigned long channel)
 {
 	struct sixpack *sp = (struct sixpack *) channel;
-	int actual;
+	int actual, when = sp->slottime;
 	static unsigned char random;
 
 	random = random * 17 + 41;
@@ -159,20 +158,10 @@ static void sp_xmit_on_air(unsigned long
 		sp->tty->driver->write(sp->tty, &sp->led_state, 1);
 		sp->status2 = 0;
 	} else
-		sp_start_tx_timer(sp);
+		mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);
 }
 
 /* ----> 6pack timer interrupt handler and friends. <---- */
-static void sp_start_tx_timer(struct sixpack *sp)
-{
-	int when = sp->slottime;
-
-	del_timer(&sp->tx_t);
-	sp->tx_t.data = (unsigned long) sp;
-	sp->tx_t.function = sp_xmit_on_air;
-	sp->tx_t.expires = jiffies + ((when + 1) * HZ) / 100;
-	add_timer(&sp->tx_t);
-}
 
 /* Encapsulate one AX.25 frame and stuff into a TTY queue. */
 static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
@@ -243,8 +232,7 @@ static void sp_encaps(struct sixpack *sp
 		sp->xleft = count;
 		sp->xhead = sp->xbuff;
 		sp->status2 = count;
-		if (sp->duplex == 0)
-			sp_start_tx_timer(sp);
+		sp_xmit_on_air((unsigned long)sp);
 	}
 
 	return;

----- End forwarded message -----

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
