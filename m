From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] netrom: fix copying in user data in nr_setsockopt
Date: Thu, 6 Jan 2022 17:52:11 +0300
Message-ID: <20220106145211.GN7674@kadam>
References: <20220104092126.172508-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=b3kEKXIS/rFv6cORIsdnrQlq4R6zO+kp91GmjZH6kkE=;
 b=dPol1dYsmaCmy0XuNfoGPcaRqFGN8Y4s6nFbwlfkOwLLHJr0LKobq+nCYsgy0Xlvl68x
 mRUczVE72gBJqvqy+SiVbR2jZGm6+F9Y/2mfDdgRz8VlFoWNY+6tD6y5ryVuhJo674J7
 WrrDmfzdhGcXM9TqKvC052vLDX2gLDUyex2ENdtmkp6193eXhz+Ap0nihmdb8FuuLuKI
 Hf27204tS487HqLK3NK5nT15DsNJN29PJctG2ecGFM+KI1fEasrpfYHrLuu234NKJ089
 UGhtBnLTliIx40a28VpRwxV8dhMKwUtFCXNtAvOwpDUuc22tFiEzEsF95zT/s5yXhfXE zQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3kEKXIS/rFv6cORIsdnrQlq4R6zO+kp91GmjZH6kkE=;
 b=LQgDK46e/s+3Ld4S0D7pm0vpbpxH5GfJeiY+qMIM4w7kpHb7QhCfF/HSYMhnoECze+71OM5Q0nGv5TdthHaoAWkCwML0OgJUAncNly8x8K39xcBwfd5pC4gBjb6DTY46ZEuqQQl6vonNUW1tQk2s7IN6eBZx7RwsNQTbLpKXqSc=
Content-Disposition: inline
In-Reply-To: <20220104092126.172508-1-hch@lst.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, ralf@linux-mips.org
Cc: davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Tue, Jan 04, 2022 at 10:21:26AM +0100, Christoph Hellwig wrote:
> This code used to copy in an unsigned long worth of data before
> the sockptr_t conversion, so restore that.
> 
> Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  net/netrom/af_netrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
> index 775064cdd0ee4..f1ba7dd3d253d 100644
> --- a/net/netrom/af_netrom.c
> +++ b/net/netrom/af_netrom.c
> @@ -306,7 +306,7 @@ static int nr_setsockopt(struct socket *sock, int level, int optname,
>  	if (optlen < sizeof(unsigned int))
>  		return -EINVAL;
>  
> -	if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))
> +	if (copy_from_sockptr(&opt, optval, sizeof(unsigned long)))
>  		return -EFAULT;

No this isn't right.  In the original code, it copied an unsigned int.

	if (get_user(opt, (unsigned int __user *)optval))

The fix is to probably to change "opt" to an unsigned int.  I wonder if
I need to update all the integer overflow checks to from:

-	if (opt > ULONG_MAX / HZ)
+	if (opt > UINT_MAX / HZ)

...

Probably no one cares, right?  Ralf?

regards,
dan carpenter

