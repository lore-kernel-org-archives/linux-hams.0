From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net v3 0/4] net: don't call dev_kfree_skb() under
 spin_lock_irqsave()
Date: Mon, 12 Dec 2022 10:10:16 +0000
Message-ID: <167083981658.16910.12851344633864662339.git-patchwork-notify@kernel.org>
References: <20221208142147.2376671-1-yangyingliang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVX8ymZP5nZJqjWu+JP+heUZwzKVyAy+t6mRUiPdfuY=; b=elePTS2ids+wZl
	pHlDfjsJZmaoXS3nC0+n0nzsmbIel2ahnyf98XRHp8yPuxM07BfNPeWMoZIwy7Z93RGDc3NR5G7HX
	Z0KFv6FSDAeILnRB9LxSUnRzlhVTfPgg5fSb+GA5OBCf83sW2SCXR/8WxnmyDO6j5kyYxj/b7ZpLS
	nUdR6LC9nPssZYQMbCeOqrEFjQLNCdZvtpQI+uLuKw0lObyJm88J/k1RquvFc4R0Y3igG6ijwm6LV
	bCdLN8CkCptkJaQ4ETZfqaBkeqsAImqIymq390FZGaEKagOAdVV3/bC264SkgEnKKeAPlLEq1O/H4
	N1w3mb/2nKl/bOSU4pfg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670839816;
	bh=QFNLzaGC3QQ2Tj6+OzuD4bFPgh429PAk7aeLLtqqlfc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I4MLg2BWjXyINZYUI2Ti7MSte7xMMmcjpturaSpA448ggWU3cSlpbyntrDBXAd7fQ
	 3012/t3JOwT9u4LkIDk/5f5CZqrIjm6p4SBvYK5cGTpKU7Lal4ma/StpsYJtKtnhZE
	 GVrI5opa2DKNLZ2CCkp6LEKZUKr1rpKk0T+bAkmcNHRuRWZVdwb8BvQcIHp1jRy1dW
	 SvCnSQMNgON8dS3ONtc8IK7MWe8JQNAlbnYsjripo4wtP0D9HD0avIYY5/X5U+A1Om
	 bl3BGQUx4Q4jxhHsNOkevd58JGbqNvKLmeA/ft8Ier1i8JOpLnvMMJtjsXB2tXjz/r
	 ybFFKFUzg/DEQ==
In-Reply-To: <20221208142147.2376671-1-yangyingliang@huawei.com>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, leon@kernel.org, michal.simek@xilinx.com, john.linn@xilinx.com, sadanan@xilinx.com, linux-arm-kernel@lists.infradead.org, yanok@emcraft.com, jreuter@yaina.de, linux-hams@vger.kernel.org

Hello:

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 8 Dec 2022 22:21:43 +0800 you wrote:
> It is not allowed to call consume_skb() from hardware interrupt context
> or with interrupts being disabled. This patchset replace dev_kfree_skb()
> with dev_kfree_skb_irq/dev_consume_skb_irq() under spin_lock_irqsave()
> in some drivers, or move dev_kfree_skb() after spin_unlock_irqrestore().
> 
> v2 -> v3:
>   Update commit message, and change to use dev_kfree_skb_irq() in patch #1, #3.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/4] net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
    https://git.kernel.org/netdev/net/c/d1678bf45f21
  - [net,v3,2/4] net: ethernet: dnet: don't call dev_kfree_skb() under spin_lock_irqsave()
    https://git.kernel.org/netdev/net/c/f07fadcbee2a
  - [net,v3,3/4] hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
    https://git.kernel.org/netdev/net/c/3727f742915f
  - [net,v3,4/4] net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()
    https://git.kernel.org/netdev/net/c/6151d105dfce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html
