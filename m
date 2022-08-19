From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH net-next 1/1] MAINTAINERS: update amateur radio status.
Date: Fri, 19 Aug 2022 10:43:38 +0200
Message-ID: <Yv9NOmXjRLf6WSCB@x-berg.in-berlin.de>
References: <Yv6fCCB3vW++EGaP@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Yv6fCCB3vW++EGaP@electric-eye.fr.zoreil.com>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: netdev@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Bernard Pidoux <f6bvp@free.fr>, Thomas Osterried <thomas@osterried.de>

Hello,

I disagree.

I hoped Ralf will come back and waited with my offer to do the maintainership.

A question for the process: What needs to be done to get listet as maintainer?

vy 73,
	- Thomas  dl9sau


On Thu, Aug 18, 2022 at 10:20:24PM +0200, Francois Romieu wrote:
> There is still useful work in the linux kernel amateur radio area but
> it should not hurt to align advertised expectations in MAINTAINERS file
> with Ralf Baechle's stance from 2021/07/17.
> 
> Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>
> Link: https://marc.info/?l=linux-hams&m=162651322506623
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2d64020399b..691aa4e84537 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3436,7 +3436,7 @@ F:	drivers/iio/adc/hx711.c
>  AX.25 NETWORK LAYER
>  M:	Ralf Baechle <ralf@linux-mips.org>
>  L:	linux-hams@vger.kernel.org
> -S:	Maintained
> +S:	Odd Fixes
>  W:	http://www.linux-ax25.org/
>  F:	include/net/ax25.h
>  F:	include/uapi/linux/ax25.h
> @@ -14074,7 +14074,7 @@ F:	net/netfilter/
>  NETROM NETWORK LAYER
>  M:	Ralf Baechle <ralf@linux-mips.org>
>  L:	linux-hams@vger.kernel.org
> -S:	Maintained
> +S:	Odd Fixes
>  W:	http://www.linux-ax25.org/
>  F:	include/net/netrom.h
>  F:	include/uapi/linux/netrom.h
> @@ -17640,7 +17640,7 @@ F:	include/linux/mfd/rohm-shared.h
>  ROSE NETWORK LAYER
>  M:	Ralf Baechle <ralf@linux-mips.org>
>  L:	linux-hams@vger.kernel.org
> -S:	Maintained
> +S:	Odd Fixes
>  W:	http://www.linux-ax25.org/
>  F:	include/net/rose.h
>  F:	include/uapi/linux/rose.h
> -- 
> 2.37.1
> 
> 
