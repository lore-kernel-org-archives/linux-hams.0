From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 18/29] drivers/net: rename random32() to prandom_u32()
Date: Mon, 24 Dec 2012 11:14:05 +0900
Message-ID: <1356315256-6572-19-git-send-email-akinobu.mita@gmail.com>
References: <1356315256-6572-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=weKV3xjKKCdPG93ayLgqF7dkfsIQ3ts64Ek5hvUQ+aw=;
        b=vX+/MGzQjCmy/GPXd4iVTIAJOWMWNQn521fPVowp49bYr1xeGpW4JKciR1oTT/SslA
         tRoUUA8gLWpfHEn5RjlaYbUXsOHPTmyuHTZ1e1XrmTDHsLHxjm9258MACmPZHXLqLs2S
         hvF7OtdBw4OLEeOLIGksoXcfHPBR8KliI7ilzVOtXYKw1WpAm6OtmK19hEEW7tgKO56Z
         VslUt4/gR5z9xd+uXsRWlN4B1arkF4yH4muNwD1lvW/OajiR8aF4melUF+0SkUzcRqE9
         DT+bujebar3ID/Tce0fGDXHfDgyGpOLoGgrX0jX0xhpb+IYyK3SIpANvs73TTyjuIz2B
         TGmA==
In-Reply-To: <1356315256-6572-1-git-send-email-akinobu.mita@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, "David S. Miller" <davem@davemloft.net>, Michael Chan <mchan@broadcom.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, Jean-Paul Roubelat <jpr@f6fbb.org>, Bing Zhao <bzhao@marvell.com>, netdev@vger.kernel.org, linux-hams@vger.kernel.org, linux-wireless@vger.kernel.org

Use more preferable function name which implies using a pseudo-random
number generator.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Michael Chan <mchan@broadcom.com>
Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: Jean-Paul Roubelat <jpr@f6fbb.org>
Cc: Bing Zhao <bzhao@marvell.com>
Cc: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
---
 drivers/net/ethernet/broadcom/cnic.c    | 4 ++--
 drivers/net/hamradio/baycom_epp.c       | 2 +-
 drivers/net/hamradio/hdlcdrv.c          | 2 +-
 drivers/net/hamradio/yam.c              | 2 +-
 drivers/net/wireless/mwifiex/cfg80211.c | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index df8c30d..27d7a32 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -4085,7 +4085,7 @@ static int cnic_cm_alloc_mem(struct cnic_dev *dev)
 	if (!cp->csk_tbl)
 		return -ENOMEM;
 
-	port_id = random32();
+	port_id = prandom_u32();
 	port_id %= CNIC_LOCAL_PORT_RANGE;
 	if (cnic_init_id_tbl(&cp->csk_port_tbl, CNIC_LOCAL_PORT_RANGE,
 			     CNIC_LOCAL_PORT_MIN, port_id)) {
@@ -4145,7 +4145,7 @@ static int cnic_cm_init_bnx2_hw(struct cnic_dev *dev)
 {
 	u32 seed;
 
-	seed = random32();
+	seed = prandom_u32();
 	cnic_ctx_wr(dev, 45, 0, seed);
 	return 0;
 }
diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 49b8b58..484f77e 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -449,7 +449,7 @@ static int transmit(struct baycom_state *bc, int cnt, unsigned char stat)
 			if ((--bc->hdlctx.slotcnt) > 0)
 				return 0;
 			bc->hdlctx.slotcnt = bc->ch_params.slottime;
-			if ((random32() % 256) > bc->ch_params.ppersist)
+			if ((prandom_u32() % 256) > bc->ch_params.ppersist)
 				return 0;
 		}
 	}
diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index a4a3516..3169252 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -389,7 +389,7 @@ void hdlcdrv_arbitrate(struct net_device *dev, struct hdlcdrv_state *s)
 	if ((--s->hdlctx.slotcnt) > 0)
 		return;
 	s->hdlctx.slotcnt = s->ch_params.slottime;
-	if ((random32() % 256) > s->ch_params.ppersist)
+	if ((prandom_u32() % 256) > s->ch_params.ppersist)
 		return;
 	start_tx(dev, s);
 }
diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index c6645f1..21f231a 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -638,7 +638,7 @@ static void yam_arbitrate(struct net_device *dev)
 	yp->slotcnt = yp->slot / 10;
 
 	/* is random > persist ? */
-	if ((random32() % 256) > yp->pers)
+	if ((prandom_u32() % 256) > yp->pers)
 		return;
 
 	yam_start_tx(dev, yp);
diff --git a/drivers/net/wireless/mwifiex/cfg80211.c b/drivers/net/wireless/mwifiex/cfg80211.c
index a875499..78dbc18 100644
--- a/drivers/net/wireless/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/mwifiex/cfg80211.c
@@ -216,7 +216,7 @@ mwifiex_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	mwifiex_form_mgmt_frame(skb, buf, len);
 	mwifiex_queue_tx_pkt(priv, skb);
 
-	*cookie = random32() | 1;
+	*cookie = prandom_u32() | 1;
 	cfg80211_mgmt_tx_status(wdev, *cookie, buf, len, true, GFP_ATOMIC);
 
 	wiphy_dbg(wiphy, "info: management frame transmitted\n");
@@ -271,7 +271,7 @@ mwifiex_cfg80211_remain_on_channel(struct wiphy *wiphy,
 					 duration);
 
 	if (!ret) {
-		*cookie = random32() | 1;
+		*cookie = prandom_u32() | 1;
 		priv->roc_cfg.cookie = *cookie;
 		priv->roc_cfg.chan = *chan;
 
-- 
1.7.11.7
