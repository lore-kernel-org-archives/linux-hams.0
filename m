From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] mkiss
Date: Sat, 5 Jul 2003 21:17:33 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030705211733.A255@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a patch to get mkiss working under 2.5.74
It used the driver_data field of the tty structure, this field can be NULL.
Further the whole mkiss magic stuff seems to be unreachable as I can't find
a single piece of code in the kernel that sets the driver_data field with
this structure... Is is something from a long time ago?? Shouldn't it be
removed completly?
This patch also removes the MOD_*_USE_COUNT calls.

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="mkiss-2.5.74.rxq.diff"

diff -ru linux-2.5.74/drivers/net/hamradio/mkiss.c linux-2.5.74.rxq/drivers/net/hamradio/mkiss.c
--- linux-2.5.74/drivers/net/hamradio/mkiss.c	2003-07-02 22:57:13.000000000 +0200
+++ linux-2.5.74.rxq/drivers/net/hamradio/mkiss.c	2003-07-05 19:33:20.000000000 +0200
@@ -22,6 +22,8 @@
  *	Matthias (DG2FEF)       Added support for FlexNet CRC (on special request)
  *                              Fixed bug in ax25_close(): dev_lock_wait() was
  *                              called twice, causing a deadlock.
+ *	Jeroen (PE1RXQ)		Added NULL check for tty->driver_data and removed
+ *				MOD_*_USE_COUNT calls
  */
 
 #include <linux/config.h>
@@ -320,7 +322,7 @@
 	if (ax->rbuff[0] > 0x0f) {
 		if (ax->mkiss != NULL) {
 			mkiss= ax->mkiss->tty->driver_data;
-			if (mkiss->magic == MKISS_DRIVER_MAGIC)
+			if (mkiss && mkiss->magic == MKISS_DRIVER_MAGIC)
 				tmp_ax = ax->mkiss;
 		} else if (ax->rbuff[0] & 0x20) {
 		        ax->crcmode = CRC_MODE_FLEX;
@@ -376,7 +378,7 @@
 
 	p = icp;
 
-	if (mkiss->magic  != MKISS_DRIVER_MAGIC) {
+	if (!mkiss || mkiss->magic  != MKISS_DRIVER_MAGIC) {
 	        switch (ax->crcmode) {
 		         unsigned short crc;
 
@@ -430,7 +432,7 @@
 
 		if (ax->mkiss != NULL) {
 			mkiss= ax->mkiss->tty->driver_data;
-			if (mkiss->magic  == MKISS_DRIVER_MAGIC)
+			if (mkiss && mkiss->magic  == MKISS_DRIVER_MAGIC)
 				ax_unlock(ax->mkiss);
 	        }
 
@@ -452,7 +454,7 @@
 
 	tmp_ax = NULL;
 
-	if (mkiss->magic  == MKISS_DRIVER_MAGIC) {
+	if (mkiss && mkiss->magic  == MKISS_DRIVER_MAGIC) {
 		if (skb->data[0] < 0x10)
 			skb->data[0] = skb->data[0] + 0x10;
 		tmp_ax = ax->mkiss;
@@ -666,7 +668,7 @@
 
 	mkiss = ax->tty->driver_data;
 
-	if (mkiss->magic  == MKISS_DRIVER_MAGIC) {
+	if (mkiss && mkiss->magic  == MKISS_DRIVER_MAGIC) {
 		for (cnt = 1; cnt < ax25_maxdev; cnt++) {
 			if (ax25_ctrls[cnt]) {
 				if (netif_running(&ax25_ctrls[cnt]->dev)) {
@@ -685,8 +687,6 @@
 		tmp_ax->mkiss = ax;
 	}
 
-	MOD_INC_USE_COUNT;
-
 	/* Done.  We have linked the TTY line to a channel. */
 	return ax->dev->base_addr;
 }
@@ -705,7 +705,6 @@
 	ax->tty        = NULL;
 
 	ax_free(ax);
-	MOD_DEC_USE_COUNT;
 }
 
 

--AWniW0JNca5xppdA--

