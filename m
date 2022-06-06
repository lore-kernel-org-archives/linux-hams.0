From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ax25: use GFP_KERNEL over GFP_ATOMIC where possible
Date: Mon, 6 Jun 2022 14:50:59 +0300
Message-ID: <20220606115058.GV2146@kadam>
References: <20220602112138.8200-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=KKeWb9XGndknSZs6IoOtMf7NJugw7lr2Xl640+sx3Aw=;
 b=SsZh/Bg3uOasDV/Twg1SO1FaNPl8IqbWFA4zqBwHjPEritWrng6IX6gOJrYqMTr3PQ0g
 A2ly/SVYg6yBL8FwkUGNDtK7Rqw51gtwJNyLRMEnTBuSyo9RQFpr28YJ77ziu4Ln69W2
 VW8A1zV3ybhDEs+Tfk/p7npdLpFPjxX4zkwKM55aD4MOYE79eLoIB6jxe4Fwcgtg/XcV
 CzdbUlO5Gz3zo1IVZVjKDflGbFLCgEB4Dtc+8MvJ66WRn+I9Y7JjmgFFvJPZY6zlqHjO
 DJsvTBt5amKsC84RFkcCUSyepy/9cOy04vpBQebknEwWQfjIeKsilIqnmtb/+tLyTqqH yw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKeWb9XGndknSZs6IoOtMf7NJugw7lr2Xl640+sx3Aw=;
 b=is3UYJYgzrhF1wnCmvzb6N2+u5nyAH3FSHplWGKPgtVRXO+b/N6z7h7N+O9ZIPYrIMEYDMxBMvjjC3N1hzeWADblWNgYulJwyVzqhX8ppQizhhHQWFRNei6UFVRXhpeZVW2YuhbGCXDtdC/4feNEg+YZcol4FcNICOjglEYKNAk=
Content-Disposition: inline
In-Reply-To: <20220602112138.8200-1-pjlafren@mtu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Lafreniere <pjlafren@mtu.edu>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org, netdev@vger.kernel.org

On Thu, Jun 02, 2022 at 07:21:38AM -0400, Peter Lafreniere wrote:
>  net/ax25/ax25_dev.c   | 4 ++--
>  net/ax25/ax25_route.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index d2a244e1c260..b264904980a8 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -52,7 +52,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  {
>  	ax25_dev *ax25_dev;
>  
> -	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_ATOMIC)) == NULL) {
> +	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL)) == NULL) {
>  		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
>  		return;
>  	}
> @@ -60,7 +60,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  	refcount_set(&ax25_dev->refcount, 1);
>  	dev->ax25_ptr     = ax25_dev;
>  	ax25_dev->dev     = dev;
> -	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
> +	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
>  	ax25_dev->forward = NULL;
>  
>  	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;

These two are fine.

> diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
> index b7c4d656a94b..c77b848ccfc7 100644
> --- a/net/ax25/ax25_route.c
> +++ b/net/ax25/ax25_route.c
> @@ -91,7 +91,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  			kfree(ax25_rt->digipeat);
>  			ax25_rt->digipeat = NULL;
>  			if (route->digi_count != 0) {
> -				if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
> +				if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_KERNEL)) == NULL) {
>  					write_unlock_bh(&ax25_route_lock);

This write lock means it has to be GFP_ATOMIC.

>  					ax25_dev_put(ax25_dev);
>  					return -ENOMEM;
> @@ -110,7 +110,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  		ax25_rt = ax25_rt->next;
>  	}
>  
> -	if ((ax25_rt = kmalloc(sizeof(ax25_route), GFP_ATOMIC)) == NULL) {
> +	if ((ax25_rt = kmalloc(sizeof(ax25_route), GFP_KERNEL)) == NULL) {
>  		write_unlock_bh(&ax25_route_lock);

This change is buggy as well.

>  		ax25_dev_put(ax25_dev);
>  		return -ENOMEM;

regards,
dan carpenter
