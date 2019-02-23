From: Greg KH <greg@kroah.com>
Subject: Re: [Outreachy kernel] [PATCH] net: ax25: Fix  multiple blank lines
 warning
Date: Sat, 23 Feb 2019 13:59:32 +0100
Message-ID: <20190223125932.GC16686@kroah.com>
References: <20190223111751.14620-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=vey0nNazD+X8kjF1BvoRxBo/gA/
        LX0jWJJjEp4hPVog=; b=u4tvWyMppYaRoN0mbgwtrERRLBd12h82C3AkFURrycY
        u4A7YWWYocAqDcf9ah+yQR8+XpiQVdh7Ah2HkcIA/ep/yvb1V/WAzbPG04gTbuYI
        ZiNJltl9G7YvaUehxVGSaeZpBTLs7i2/I7m2CYUuvTvuEgT16fMnzbTS1cFlZ8br
        0sMjDhfQftkkI+OvtxwJ0Fmf6AGKIqX3bqQzLisPfwIGRZkcI9+c5EHhf6e6VMSD
        JWQX6Dzqqx45nsFJg8FGYxOll3CoLibFk2uIcqrfrbw/URKDWa1ARskGS9sh1S1F
        JOPor9bYTdXsIkn3CncxxgwveYVeNxSGlHyozIR451A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vey0nN
        azD+X8kjF1BvoRxBo/gA/LX0jWJJjEp4hPVog=; b=atHSHEhR3ePAo0KDsBHzIC
        jGYIo+NYznFRcqW2VxrGLrEwLpG7Q296w8nle31lMClwN4FEbzQpQhu5TKimTxmP
        9Jth9OjKZHhK41DBMUMWbJWBgcr8JK7HbaMYcvDSO2n/js9jflPClqmcseCResGc
        4wGQAryxND/a0DIEoSNdS9lPvM4R+GOohEC+XwmK3SoudP8JuWht5zbHdulegIBi
        ireDFbtvqZmSltEw6OCmvV0Qz/cb21j7aDn/2rH7VPzsayVpW6aSGtWWDPi5xHNQ
        S9YSfsKkm8UWP0MUyYQC9qRlF6drjxzj3Y7JgWzpUDEXZIeUMpJPHT/aOBaVWcsw
        ==
Content-Disposition: inline
In-Reply-To: <20190223111751.14620-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jules Irenge <jbi.octave@gmail.com>
Cc: jreuter@yaina.de, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, netdev@vger.kernel.org, outreachy-kernel@googlegroups.com

On Sat, Feb 23, 2019 at 11:17:51AM +0000, Jules Irenge wrote:
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  net/ax25/af_ax25.c | 2 --
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

Why are you doing outreachy application patches in net/?  We only accept
them in drivers/staging/  Always start there first.

thanks,

greg k-h
