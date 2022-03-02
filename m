From: Qing Wang <wangqing@vivo.com>
Subject: [PATCH V2 RESEND] net: hamradio: use time_is_after_jiffies() instead of open coding it
Date: Tue,  1 Mar 2022 18:29:31 -0800
Message-ID: <1646188174-81401-1-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfpex77UUxkpnx/WicXmrroWr9FfviIWowPmRoFx9vQ=;
 b=mr+rfy1al35A+sZYkTX6GEDtSpS0apZlAm4IxGuw1QZ4MDZ6pxnhuLunbR5LzWgm4kyFF3SjaopoboVTbrQKr9O/KVTLk4Dm9OaSEUMzJ8fu1v62tSSu+ByC0x6VCNJBopZJOu+dwS1D3ExCkWfowdsTRGSsQwHjr2CkiNk35AY=
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>

From: Wang Qing <wangqing@vivo.com>

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

V2:
add missing ")" at line 1357 which will cause compliation error.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/net/hamradio/dmascc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/dmascc.c b/drivers/net/hamradio/dmascc.c
index 7e52749..6e7d17a
--- a/drivers/net/hamradio/dmascc.c
+++ b/drivers/net/hamradio/dmascc.c
@@ -28,6 +28,7 @@
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
+#include <linux/jiffies.h>
 #include <net/ax25.h>
 #include "z8530.h"
 
@@ -377,7 +378,7 @@ static int __init dmascc_init(void)
 		udelay(2000000 / TMR_0_HZ);
 
 		/* Timing loop */
-		while (jiffies - time < 13) {
+		while (time_is_after_jiffies(time + 13)) {
 			for (i = 0; i < hw[h].num_devs; i++)
 				if (base[i] && counting[i]) {
 					/* Read back Timer 1: latch; read LSB; read MSB */
@@ -525,7 +526,7 @@ static int __init setup_adapter(int card_base, int type, int n)
 
 	/* Wait and detect IRQ */
 	time = jiffies;
-	while (jiffies - time < 2 + HZ / TMR_0_HZ);
+	while (time_is_after_jiffies(time + 2 + HZ / TMR_0_HZ));
 	irq = probe_irq_off(irqs);
 
 	/* Clear pending interrupt, disable interrupts */
@@ -1353,7 +1354,7 @@ static void es_isr(struct scc_priv *priv)
 		/* Switch state */
 		write_scc(priv, R15, 0);
 		if (priv->tx_count &&
-		    (jiffies - priv->tx_start) < priv->param.txtimeout) {
+		    time_is_after_jiffies(priv->tx_start + priv->param.txtimeout)) {
 			priv->state = TX_PAUSE;
 			start_timer(priv, priv->param.txpause, 0);
 		} else {
-- 
2.7.4

