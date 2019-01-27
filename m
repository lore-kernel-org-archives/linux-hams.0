From: David Miller <davem@davemloft.net>
Subject: Re: [Patch net] netrom: switch to sock timer API
Date: Sun, 27 Jan 2019 10:38:27 -0800 (PST)
Message-ID: <20190127.103827.1899288807188697902.davem@davemloft.net>
References: <20190124221818.15813-1-xiyou.wangcong@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190124221818.15813-1-xiyou.wangcong@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: xiyou.wangcong@gmail.com
Cc: netdev@vger.kernel.org, syzbot+defa700d16f1bd1b9a05@syzkaller.appspotmail.com, ralf@linux-mips.org, linux-hams@vger.kernel.org

From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Thu, 24 Jan 2019 14:18:18 -0800

> sk_reset_timer() and sk_stop_timer() properly handle
> sock refcnt for timer function. Switching to them
> could fix a refcounting bug reported by syzbot.
> 
> Reported-and-tested-by: syzbot+defa700d16f1bd1b9a05@syzkaller.appspotmail.com
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-hams@vger.kernel.org
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>

Applied and queued up for -stable, thanks!
