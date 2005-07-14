From: domen@coderock.org
Subject: [patch 1/1] drivers/net/hamradio/ : Use of time_after_eq macro
Date: Fri, 15 Jul 2005 00:21:55 +0200
Message-ID: <20050714222154.711941000@homer>
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline; filename=time_after-drivers_net_hamradio_baycom_epp
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: t.sailer@alumni.ethz.ch
Cc: linux-hams@vger.kernel.org, Marcelo Feitoza Parisi <marcelo@feitoza.com.br>, domen@coderock.org

From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>


Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Signed-off-by: Domen Puncer <domen@coderock.org>

---
 baycom_epp.c     |    3 ++-
 baycom_par.c     |    3 ++-
 baycom_ser_fdx.c |    3 ++-
 baycom_ser_hdx.c |    3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

Index: quilt/drivers/net/hamradio/baycom_epp.c
===================================================================
--- quilt.orig/drivers/net/hamradio/baycom_epp.c
+++ quilt/drivers/net/hamradio/baycom_epp.c
@@ -54,6 +54,7 @@
 #include <linux/kmod.h>
 #include <linux/hdlcdrv.h>
 #include <linux/baycom.h>
+#include <linux/jiffies.h>
 #if defined(CONFIG_AX25) || defined(CONFIG_AX25_MODULE)
 /* prototypes for ax25_encapsulate and ax25_rebuild_header */
 #include <net/ax25.h> 
@@ -287,7 +288,7 @@ static inline void baycom_int_freq(struc
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;
Index: quilt/drivers/net/hamradio/baycom_par.c
===================================================================
--- quilt.orig/drivers/net/hamradio/baycom_par.c
+++ quilt/drivers/net/hamradio/baycom_par.c
@@ -84,6 +84,7 @@
 #include <linux/baycom.h>
 #include <linux/parport.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/bug.h>
 #include <asm/system.h>
@@ -165,7 +166,7 @@ static void __inline__ baycom_int_freq(s
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;
Index: quilt/drivers/net/hamradio/baycom_ser_fdx.c
===================================================================
--- quilt.orig/drivers/net/hamradio/baycom_ser_fdx.c
+++ quilt/drivers/net/hamradio/baycom_ser_fdx.c
@@ -79,6 +79,7 @@
 #include <asm/io.h>
 #include <linux/hdlcdrv.h>
 #include <linux/baycom.h>
+#include <linux/jiffies.h>
 
 /* --------------------------------------------------------------------- */
 
@@ -159,7 +160,7 @@ static inline void baycom_int_freq(struc
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;
Index: quilt/drivers/net/hamradio/baycom_ser_hdx.c
===================================================================
--- quilt.orig/drivers/net/hamradio/baycom_ser_hdx.c
+++ quilt/drivers/net/hamradio/baycom_ser_hdx.c
@@ -69,6 +69,7 @@
 #include <asm/io.h>
 #include <linux/hdlcdrv.h>
 #include <linux/baycom.h>
+#include <linux/jiffies.h>
 
 /* --------------------------------------------------------------------- */
 
@@ -150,7 +151,7 @@ static inline void baycom_int_freq(struc
 	 * measure the interrupt frequency
 	 */
 	bc->debug_vals.cur_intcnt++;
-	if ((cur_jiffies - bc->debug_vals.last_jiffies) >= HZ) {
+	if (time_after_eq(cur_jiffies, bc->debug_vals.last_jiffies + HZ)) {
 		bc->debug_vals.last_jiffies = cur_jiffies;
 		bc->debug_vals.last_intcnt = bc->debug_vals.cur_intcnt;
 		bc->debug_vals.cur_intcnt = 0;

--
