From: Elena Reshetova <elena.reshetova@intel.com>
Subject: [PATCH 02/16] drivers, net,
 ethernet: convert mtk_eth.dma_refcnt from atomic_t to refcount_t
Date: Tue, 28 Mar 2017 11:56:29 +0300
Message-ID: <1490691403-4016-3-git-send-email-elena.reshetova@intel.com>
References: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YVQ1o8FUj7UnR3C7ZgORpsxBpuIJRX06I3wYwUpLIcc=; b=qT9MWHWMsyHY5Om+nie/192JQr
	rHUDq+ruua1AeODsAQ0SfarKxqoHDkIm+Dg6yMr4AVgpdUKNcOBA5SfA0aY2Hz3YudLQDHtwLWAu3
	e0K3M51+P6EuPBKYZcRk7ATkdH7iqBDMl/69vZlQlfQLdE6ZfdioY91RAbT3bZKG2fdY3hxIoDCH5
	C/A4bYPJhW61zSWULGfTtQOTRKGmQjhck/jqvrWtqoIPoV7aBKnq1l98heIFpzDpDGUbZT7TIHd98
	MWpIGDuRMzffIGR3I+O3x5+b27WRzdZJJTS+NS5ljvou/Fam+2TL/SUhP8cSpFdkTFkQMZ6DH3FXr
	5FA0LOYQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=intel;
 t=1490691445; x=1522227445;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ZowmVovshKvN52910OstiIIseE3jgV8t/JJ8FD/yyuU=;
 b=i03JHA4HXcVA3U+Bjk+Q6KzattJnZ/ml12OdVw1MAlplprqgThpa16kL
 okCzNJhXKhd5ECweHJyow2jOHCteVg==;
In-Reply-To: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: netdev@vger.kernel.org
Cc: peterz@infradead.org, matanb@mellanox.com, paulus@samba.org, Elena Reshetova <elena.reshetova@intel.com>, nbd@openwrt.org, linux-rdma@vger.kernel.org, saeedm@mellanox.com, ganeshgr@chelsio.com, Hans Liljestrand <ishkamiel@gmail.com>, David Windsor <dwindsor@gmail.com>, keescook@chromium.org, j@w1.fi, ajk@comnets.uni-bremen.de, leonro@mellanox.com, matthias.bgg@gmail.com, linux-hams@vger.kernel.org, kvalo@codeaurora.org, blogic@openwrt.org, linux-arm-kernel@lists.infradead.org, linux-ppp@vger.kernel.org, yishaih@mellanox.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org

refcount_t type and corresponding API should be
used instead of atomic_t when the variable is used as
a reference counter. This allows to avoid accidental
refcounter overflows that might lead to use-after-free
situations.

Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: David Windsor <dwindsor@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 +++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 +++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bf6317e..d27f9d9 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1725,7 +1725,7 @@ static int mtk_open(struct net_device *dev)
 	struct mtk_eth *eth = mac->hw;
 
 	/* we run 2 netdevs on the same dma ring so we only bring it up once */
-	if (!atomic_read(&eth->dma_refcnt)) {
+	if (!refcount_read(&eth->dma_refcnt)) {
 		int err = mtk_start_dma(eth);
 
 		if (err)
@@ -1735,8 +1735,10 @@ static int mtk_open(struct net_device *dev)
 		napi_enable(&eth->rx_napi);
 		mtk_irq_enable(eth, MTK_QDMA_INT_MASK, MTK_TX_DONE_INT);
 		mtk_irq_enable(eth, MTK_PDMA_INT_MASK, MTK_RX_DONE_INT);
+		refcount_set(&eth->dma_refcnt, 1);
 	}
-	atomic_inc(&eth->dma_refcnt);
+	else
+		refcount_inc(&eth->dma_refcnt);
 
 	phy_start(dev->phydev);
 	netif_start_queue(dev);
@@ -1776,7 +1778,7 @@ static int mtk_stop(struct net_device *dev)
 	phy_stop(dev->phydev);
 
 	/* only shutdown DMA if this is the last user */
-	if (!atomic_dec_and_test(&eth->dma_refcnt))
+	if (!refcount_dec_and_test(&eth->dma_refcnt))
 		return 0;
 
 	mtk_irq_disable(eth, MTK_QDMA_INT_MASK, MTK_TX_DONE_INT);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 99b1c8e..e5b99b7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -15,6 +15,8 @@
 #ifndef MTK_ETH_H
 #define MTK_ETH_H
 
+#include <linux/refcount.h>
+
 #define MTK_QDMA_PAGE_SIZE	2048
 #define	MTK_MAX_RX_LENGTH	1536
 #define MTK_TX_DMA_BUF_LEN	0x3fff
@@ -541,7 +543,7 @@ struct mtk_eth {
 	struct regmap			*pctl;
 	u32				chip_id;
 	bool				hwlro;
-	atomic_t			dma_refcnt;
+	refcount_t			dma_refcnt;
 	struct mtk_tx_ring		tx_ring;
 	struct mtk_rx_ring		rx_ring[MTK_MAX_RX_RING_NUM];
 	struct napi_struct		tx_napi;
-- 
2.7.4
