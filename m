From: Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH v2 resend 3/4] hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
Date: Thu, 8 Dec 2022 11:26:54 +0800
Message-ID: <20221208032655.1024032-4-yangyingliang@huawei.com>
References: <20221208032655.1024032-1-yangyingliang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20221208032655.1024032-1-yangyingliang@huawei.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, Yang Yingliang <yangyingliang@huawei.com>, Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org

It is not allowed to call consume_skb() from hardware interrupt context
or with interrupts being disabled. So replace dev_kfree_skb() with
dev_consume_skb_irq() under spin_lock_irqsave().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/hamradio/scc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index f90830d3dfa6..bd80e8ca6c79 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -302,12 +302,12 @@ static inline void scc_discard_buffers(struct scc_channel *scc)
 	spin_lock_irqsave(&scc->lock, flags);	
 	if (scc->tx_buff != NULL)
 	{
-		dev_kfree_skb(scc->tx_buff);
+		dev_consume_skb_irq(scc->tx_buff);
 		scc->tx_buff = NULL;
 	}
 	
 	while (!skb_queue_empty(&scc->tx_queue))
-		dev_kfree_skb(skb_dequeue(&scc->tx_queue));
+		dev_consume_skb_irq(skb_dequeue(&scc->tx_queue));
 
 	spin_unlock_irqrestore(&scc->lock, flags);
 }
@@ -1668,7 +1668,7 @@ static netdev_tx_t scc_net_tx(struct sk_buff *skb, struct net_device *dev)
 	if (skb_queue_len(&scc->tx_queue) > scc->dev->tx_queue_len) {
 		struct sk_buff *skb_del;
 		skb_del = skb_dequeue(&scc->tx_queue);
-		dev_kfree_skb(skb_del);
+		dev_consume_skb_irq(skb_del);
 	}
 	skb_queue_tail(&scc->tx_queue, skb);
 	netif_trans_update(dev);
-- 
2.25.1

