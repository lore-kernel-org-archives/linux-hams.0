From: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v2 resend 0/4] net: don't call dev_kfree_skb() under
 spin_lock_irqsave()
Date: Thu, 8 Dec 2022 11:29:04 +0200
Message-ID: <Y5GuYA/abm1UvUro@unreal>
References: <20221208032655.1024032-1-yangyingliang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670491748;
        bh=JTSnvjJbgzaHvbJe+ytd+IiJru5C8GekViaefPzGqjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YRgGiT7IJv5CJgKhokEss4bEjglrQqeNSiwFnI6ShvcMt5gBD+76VhZGTqsIRhjuh
         Pzn44al0MvYfwk32ddPNEw0i1ezI1II2/1lLAqhc7yBXFb+MinvQMXPbppiufR3ebE
         sEQJB+RmgJltNq8yabqt69XmhPRb2EksnyCg42keAS1BSrLlqyhzwQ/+zRTDRLnQkz
         GQEg13MCaMNHkL8UEONxe8hnL35dE5LgbT3bzxQJpfI4AJVoRJ/TBrIRGH3Hnv3xm2
         v/qGvuLBAV/b55yeO2yprdKUPT+ipaglA+re7PU5Ba4M4GA9twBUxdTjlxBFyWDUvi
         PJb5i/YM3OyRQ==
Content-Disposition: inline
In-Reply-To: <20221208032655.1024032-1-yangyingliang@huawei.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, Michal Simek <michal.simek@xilinx.com>, John Linn <john.linn@xilinx.com>, Sadanand M <sadanan@xilinx.com>, linux-arm-kernel@lists.infradead.org, Ilya Yanok <yanok@emcraft.com>, Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org

On Thu, Dec 08, 2022 at 11:26:51AM +0800, Yang Yingliang wrote:
> It is not allowed to call consume_skb() from hardware interrupt context
> or with interrupts being disabled. This patchset replace dev_kfree_skb()
> with dev_consume_skb_irq() under spin_lock_irqsave() in some drivers, or
> move dev_kfree_skb() after spin_unlock_irqrestore().

Like I said it to you already. You MUST explain why dev_consume_skb_irq()
was chosen over dev_kfree_skb_irq().

Thanks

> 
> Resend for CC all authors / reviewers of commits under "Fixes:".
> 
> v1 -> v2:
>   patch #2 Move dev_kfree_skb() after spin_unlock_irqrestore()
> 
> Yang Yingliang (4):
>   net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
>   net: ethernet: dnet: don't call dev_kfree_skb() under
>     spin_lock_irqsave()
>   hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
>   net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()
> 
>  drivers/net/ethernet/amd/atarilance.c         | 2 +-
>  drivers/net/ethernet/amd/lance.c              | 2 +-
>  drivers/net/ethernet/dnet.c                   | 4 ++--
>  drivers/net/ethernet/xilinx/xilinx_emaclite.c | 2 +-
>  drivers/net/hamradio/scc.c                    | 6 +++---
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> -- 
> 2.25.1
> 
