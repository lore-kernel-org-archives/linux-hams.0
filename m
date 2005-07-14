From: domen@coderock.org
Subject: [patch 1/1] drivers/net/hamradio/mkiss.c : Use of time_before macro
Date: Fri, 15 Jul 2005 00:22:02 +0200
Message-ID: <20050714222202.362855000@homer>
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline; filename=time_after-drivers_net_hamradio_mkiss
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org
Cc: linux-hams@vger.kernel.org, Marcelo Feitoza Parisi <marcelo@feitoza.com.br>, domen@coderock.org

From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>


Use of time_before() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Signed-off-by: Domen Puncer <domen@coderock.org>

---
 mkiss.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Index: quilt/drivers/net/hamradio/mkiss.c
===================================================================
--- quilt.orig/drivers/net/hamradio/mkiss.c
+++ quilt/drivers/net/hamradio/mkiss.c
@@ -46,6 +46,7 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/if_arp.h>
+#include <linux/jiffies.h>
 
 #include <net/ax25.h>
 
@@ -429,7 +430,7 @@ static int ax_xmit(struct sk_buff *skb, 
 		 * May be we must check transmitter timeout here ?
 		 *      14 Oct 1994 Dmitry Gorodchanin.
 		 */
-		if (jiffies - dev->trans_start  < 20 * HZ) {
+		if (time_before(jiffies, dev->trans_start + 20 * HZ)) {
 			/* 20 sec timeout not reached */
 			return 1;
 		}

--
