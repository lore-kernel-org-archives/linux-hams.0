From: Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH net v3 0/4] net: don't call dev_kfree_skb() under spin_lock_irqsave()
Date: Thu, 8 Dec 2022 22:21:43 +0800
Message-ID: <20221208142147.2376671-1-yangyingliang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, leon@kernel.org, Yang Yingliang <yangyingliang@huawei.com>, Michal Simek <michal.simek@xilinx.com>, John Linn <john.linn@xilinx.com>, Sadanand M <sadanan@xilinx.com>, linux-arm-kernel@lists.infradead.org, Ilya Yanok <yanok@emcraft.com>, Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org

It is not allowed to call consume_skb() from hardware interrupt context
or with interrupts being disabled. This patchset replace dev_kfree_skb()
with dev_kfree_skb_irq/dev_consume_skb_irq() under spin_lock_irqsave()
in some drivers, or move dev_kfree_skb() after spin_unlock_irqrestore().

v2 -> v3:
  Update commit message, and change to use dev_kfree_skb_irq() in patch #1, #3.

v1 -> v2:
  patch #2 Move dev_kfree_skb() after spin_unlock_irqrestore()

Yang Yingliang (4):
  net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
  net: ethernet: dnet: don't call dev_kfree_skb() under
    spin_lock_irqsave()
  hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
  net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()

 drivers/net/ethernet/amd/atarilance.c         | 2 +-
 drivers/net/ethernet/amd/lance.c              | 2 +-
 drivers/net/ethernet/dnet.c                   | 4 ++--
 drivers/net/ethernet/xilinx/xilinx_emaclite.c | 2 +-
 drivers/net/hamradio/scc.c                    | 6 +++---
 5 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.25.1

