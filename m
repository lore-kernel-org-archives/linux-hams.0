From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [Outreachy kernel] [PATCH] net: ax25: Fix multiple blank lines
 warning
Date: Sat, 23 Feb 2019 14:22:48 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1902231421530.2551@hadrien>
References: <20190223111751.14620-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223111751.14620-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jules Irenge <jbi.octave@gmail.com>
Cc: jreuter@yaina.de, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, netdev@vger.kernel.org, outreachy-kernel@googlegroups.com

On Sat, 23 Feb 2019, Jules Irenge wrote:

You need a commit message here.

> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  net/ax25/af_ax25.c | 2 --

This is the same file as in your previous patch, so they should be in a
series.

But please work on files in drivers/staging instead.

julia

>  1 file changed, 2 deletions(-)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 5048790a75f6..2da349b7854a 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -49,8 +49,6 @@
>  #include <net/ip.h>
>  #include <net/arp.h>
>
> -
> -
>  HLIST_HEAD(ax25_list);
>  DEFINE_SPINLOCK(ax25_list_lock);
>
> --
> 2.20.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To post to this group, send email to outreachy-kernel@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20190223111751.14620-1-jbi.octave%40gmail.com.
> For more options, visit https://groups.google.com/d/optout.
>
