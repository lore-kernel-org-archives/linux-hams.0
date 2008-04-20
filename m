From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] soft lockup rose_node_list_lock
Date: Sun, 20 Apr 2008 15:59:24 -0700 (PDT)
Message-ID: <20080420.155924.86075645.davem@davemloft.net>
References: <480A6034.1080806@ccr.jussieu.fr>
	<20080419.184010.113401925.davem@davemloft.net>
	<480B78C3.4040205@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757884AbYDTW7n@vger.kernel.org>
In-Reply-To: <480B78C3.4040205@ccr.jussieu.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: pidoux@ccr.jussieu.fr
Cc: ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org

From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Date: Sun, 20 Apr 2008 19:09:23 +0200

> Since rose_route_frame() does not use rose_node_list we can safely
> remove rose_node_list_lock spin lock here and let it be free for
> rose_get_neigh().
> 
> Signed-off-by: Bernard Pidoux <f6bvp@amsat.org>

Indeed, I went over this code several times and I can't
see any reason for rose_route_frame() to take the node
list lock.

Patch applied, thanks Bernard.  But one thing...

> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index fb9359f..5053a53 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -857,7 +857,6 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
>          src_addr  = (rose_address *)(skb->data + 9);
>          dest_addr = (rose_address *)(skb->data + 4);
> 
> -       spin_lock_bh(&rose_node_list_lock);
>          spin_lock_bh(&rose_neigh_list_lock);
>          spin_lock_bh(&rose_route_list_lock);
> 

Could you please fix your email client so it doesn't corrupt
patches like this?  I've had to apply all of your patches by
hand because the tabs have been converted into spaces.  Use
MIME attachments if you have to.

Thanks again.
