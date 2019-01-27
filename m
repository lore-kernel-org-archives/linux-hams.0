From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/rose: fix NULL ax25_cb kernel panic
Date: Sun, 27 Jan 2019 10:41:42 -0800 (PST)
Message-ID: <20190127.104142.813336159923265386.davem@davemloft.net>
References: <20190125104640.253862-1-dvyukov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190125104640.253862-1-dvyukov@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: dvyukov@gmail.com
Cc: f6bvp@free.fr, linux-hams@vger.kernel.org, netdev@vger.kernel.org, dvyukov@google.com, syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com, ralf@linux-mips.org, linux-kernel@vger.kernel.org

From: Dmitry Vyukov <dvyukov@gmail.com>
Date: Fri, 25 Jan 2019 11:46:40 +0100

> From: Bernard Pidoux <f6bvp@free.fr>
> 
> When an internally generated frame is handled by rose_xmit(),
> rose_route_frame() is called:
> 
>         if (!rose_route_frame(skb, NULL)) {
>                 dev_kfree_skb(skb);
>                 stats->tx_errors++;
>                 return NETDEV_TX_OK;
>         }
> 
> We have the same code sequence in Net/Rom where an internally generated
> frame is handled by nr_xmit() calling nr_route_frame(skb, NULL).
> However, in this function NULL argument is tested while it is not in
> rose_route_frame().
> Then kernel panic occurs later on when calling ax25cmp() with a NULL
> ax25_cb argument as reported many times and recently with syzbot.
> 
> We need to test if ax25 is NULL before using it.
> 
> Testing:
> Built kernel with CONFIG_ROSE=y.
> 
> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
> Acked-by: Dmitry Vyukov <dvyukov@google.com>
> Reported-by: syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com

Applied and queued up for -stable, thanks.
