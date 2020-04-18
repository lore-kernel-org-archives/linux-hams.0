From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: netrom: Fix potential nr_neigh refcnt leak in
 nr_add_node
Date: Sat, 18 Apr 2020 13:11:00 -0700 (PDT)
Message-ID: <20200418.131100.1675181599729717011.davem@davemloft.net>
References: <1586939780-69791-1-git-send-email-xiyuyang19@fudan.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1586939780-69791-1-git-send-email-xiyuyang19@fudan.edu.cn>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: xiyuyang19@fudan.edu.cn
Cc: ralf@linux-mips.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, yuanxzhang@fudan.edu.cn, kjlu@umn.edu, tanxin.ctf@gmail.com

From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Date: Wed, 15 Apr 2020 16:36:19 +0800

> nr_add_node() invokes nr_neigh_get_dev(), which returns a local
> reference of the nr_neigh object to "nr_neigh" with increased refcnt.
> 
> When nr_add_node() returns, "nr_neigh" becomes invalid, so the refcount
> should be decreased to keep refcount balanced.
> 
> The issue happens in one normal path of nr_add_node(), which forgets to
> decrease the refcnt increased by nr_neigh_get_dev() and causes a refcnt
> leak. It should decrease the refcnt before the function returns like
> other normal paths do.
> 
> Fix this issue by calling nr_neigh_put() before the nr_add_node()
> returns.
> 
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>

Applied and queued up for -stable, thanks.
