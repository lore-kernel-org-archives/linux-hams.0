From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/netrom: Fix socket locking
Date: Wed, 22 Apr 2009 00:50:27 -0700 (PDT)
Message-ID: <20090422.005027.65381788.davem@davemloft.net>
References: <200904212249.46323.jdelvare@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200904212249.46323.jdelvare@suse.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jdelvare@suse.de
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, alan@lxorguk.ukuu.org.uk

From: Jean Delvare <jdelvare@suse.de>
Date: Tue, 21 Apr 2009 22:49:45 +0200

> Patch "af_rose/x25: Sanity check the maximum user frame size"
> (commit 83e0bbcbe2145f160fbaa109b0439dae7f4a38a9) from Alan Cox got
> locking wrong. If we bail out due to user frame size being too large,
> we must unlock the socket beforehand.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
> Cc: David S. Miller <davem@davemloft.net>

Applied, thanks.

Please CC: netdev@vger.kernel.org on all networking patches in
the future.  Otherwise it won't get tracked properly at:

	http://patchwork.ozlabs.org/project/netdev/list/

Thanks.

> ---
>  net/netrom/af_netrom.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> --- linux-2.6.30-rc2.orig/net/netrom/af_netrom.c	2009-04-08 08:54:00.000000000 +0200
> +++ linux-2.6.30-rc2/net/netrom/af_netrom.c	2009-04-21 21:57:01.000000000 +0200
> @@ -1084,8 +1084,10 @@ static int nr_sendmsg(struct kiocb *iocb
>  
>  	/* Build a packet - the conventional user limit is 236 bytes. We can
>  	   do ludicrously large NetROM frames but must not overflow */
> -	if (len > 65536)
> -		return -EMSGSIZE;
> +	if (len > 65536) {
> +		err = -EMSGSIZE;
> +		goto out;
> +	}
>  
>  	SOCK_DEBUG(sk, "NET/ROM: sendto: building packet.\n");
>  	size = len + NR_NETWORK_LEN + NR_TRANSPORT_LEN;
> 
> -- 
> Jean Delvare
> Suse L3
