From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 04/06] net: ax25: fix misuse of %x
Date: Sun, 21 Apr 2019 10:37:53 -0700 (PDT)
Message-ID: <20190421.103753.1999670260642966946.davem@davemloft.net>
References: <20190421114806.20450-1-huangfq.daxian@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190421114806.20450-1-huangfq.daxian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: huangfq.daxian@gmail.com
Cc: jreuter@yaina.de, ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Sun, 21 Apr 2019 19:48:06 +0800

> Pointers should be printed with %p or %px rather than
> cast to long type and printed with %8.8lx.
> Change %8.8lx to %p to print the pointer.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

Applied to net-next.
