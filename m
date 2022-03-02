From: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] net: hamradio: fix compliation error
Date: Tue,  1 Mar 2022 22:41:14 -0800
Message-ID: <1646203277-83159-1-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=732Y1mduzolRxlHj8FbTSTY/tzXpomQ4qHm6ZX1gfpI=;
 b=d+vNt7p8TPQxpkxTyjlt3kRbRTR8o316W4w7DQCVLfvpjcOkkwYIF3hNcUreODrNd7j5PYWUk1XQwqk1OaHLcbYEK1D4oGn/Xc6jpqkY81pNu5IEEBx6ZOObYfBAVdvpovLpsXlgMGWL68WntXMTqiTSO9BeZa9CjNRuB+9JSIU=
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>

From: Wang Qing <wangqing@vivo.com>

add missing ")" which caused by previous commit.

Link: https://lore.kernel.org/all/1646018012-61129-1-git-send-email-wangqing@vivo.com/
Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/net/hamradio/dmascc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/dmascc.c b/drivers/net/hamradio/dmascc.c
index 6e7d17a..a2a1220
--- a/drivers/net/hamradio/dmascc.c
+++ b/drivers/net/hamradio/dmascc.c
@@ -1354,7 +1354,7 @@ static void es_isr(struct scc_priv *priv)
 		/* Switch state */
 		write_scc(priv, R15, 0);
 		if (priv->tx_count &&
-		    time_is_after_jiffies(priv->tx_start + priv->param.txtimeout) {
+		    time_is_after_jiffies(priv->tx_start + priv->param.txtimeout)) {
 			priv->state = TX_PAUSE;
 			start_timer(priv, priv->param.txpause, 0);
 		} else {
-- 
2.7.4

