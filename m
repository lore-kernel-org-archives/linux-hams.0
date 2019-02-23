From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] net: ax25: Add SPDX License to fix missing License
 warning
Date: Sat, 23 Feb 2019 13:58:59 +0100
Message-ID: <20190223125859.GB16686@kroah.com>
References: <20190223111100.13983-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550926751;
        bh=URtqAbFknCcwvo/VzvLUW5RZFktZe2xJ609TnGFWeg0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FbtnKcfTcqWnBKd7zBR4S3bPJBJyE1Ru424iFFHx/YFl/JXDuik1xo/vOQDeDTYyA
         9CYA6UoP30d5VOHgFlWrSgMWOztwTzVBVveT7HbQQmw2dfHDayuZZBK1ni3MTGLqiT
         lFenWzRbfsSM7IZIRQFfAE6yonjXwcw6zqAEwasE=
Content-Disposition: inline
In-Reply-To: <20190223111100.13983-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jules Irenge <jbi.octave@gmail.com>
Cc: jreuter@yaina.de, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, netdev@vger.kernel.org, outreachy-kernel@googlegroups.com

On Sat, Feb 23, 2019 at 11:11:00AM +0000, Jules Irenge wrote:
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

I know I never take patches without any changelog text :(


> ---
>  net/ax25/af_ax25.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 5d01edf8d819..5048790a75f6 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

That is the incorrect license of this file!

NEVER add or modify a SPDX line if you do not really really really know
what you are doing.  Putting the wrong license tag on a file is worse
than not having any tag at all.

BE VERY CAREFUL ABOUT THESE THINGS, they matter.  If you get them wrong,
lawyers get very grumpy :)

thanks,

greg k-h
