From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH V3] ax25: Fix refcount leaks caused by ax25_cb_del()
Date: Fri, 11 Mar 2022 13:53:44 +0300
Message-ID: <20220311105344.GI3293@kadam>
References: <20220311014624.51117-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=IcY6uXCp3/+iW0CzyQbMpAKcNLHHMfWleig6SiaZscg=;
 b=JekMgv5ivfNWkgs+K8jORjucb0Hty0aY2P6wGnpv94P83Y5hTlWq2Q9UswRB8m55H1HM
 tZxr+6j8+JKXJdkNih8jlP1bJJuk5blJWi3tc3Mwpiwb5/cIhiuy8Vn7PQi4VcoeoLb0
 Js5PZI63UziEabH1eoFBVg30fVRpoTOOkUE44bnE7SzQwoijxSVJCk9y15u3EQT0MEg+
 p69lNEmwyfgblbJdI95y3dFh2GZ/pMzGwT4YkoCFYNY9n/noeT8a9CPJV22klXFyAH+e
 4y1lh0UAu+frayc42xgI0W+AefsH+BSnCq1PTaekqx8MoSjPvCYMOIbgRVjIDaunKKL/ vg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcY6uXCp3/+iW0CzyQbMpAKcNLHHMfWleig6SiaZscg=;
 b=iLYZWfFt1MFbqijTsNzJ9yeNtQrYlyZXl5oAbkjh6QhGW6pMvp5xcVIO8Fyzpo2/wGDWzB32tXWzae4pgQddTixzPnGYtQzkgRzkCVz67pc/dUaya+QlyBBdz+BBXp2CPXmCylJp7B265FRdNoEKA2NrO6yZmwrvdnHi1nYugLs=
Content-Disposition: inline
In-Reply-To: <20220311014624.51117-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jreuter@yaina.de, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, thomas@osterried.de

On Fri, Mar 11, 2022 at 09:46:24AM +0800, Duoming Zhou wrote:
> This patch adds a flag in ax25_dev in order to prevent reference count
> leaks. If the above condition happens, the "test_bit" condition check
> in ax25_kill_by_device() could pass and the refcounts could be
> decreased properly.
>

Why are you using test_bit()?  Just use booleans.

I am not a networking person but this whole thing feel like adding on
layers of cruft.  If refcounting needs a lot of additional tracking
information then probably the reference counts are not being done in
the correct location.

> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 6bd09718077..fc564b87acc 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -86,6 +86,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>  again:
>  	ax25_for_each(s, &ax25_list) {
>  		if (s->ax25_dev == ax25_dev) {
> +			set_bit(AX25_DEV_KILL, &ax25_dev->flag);
>  			sk = s->sk;
>  			if (!sk) {
>  				spin_unlock_bh(&ax25_list_lock);

Why can this not be a local variable.

	bool found = false;

	ax25_for_each(s, &ax25_list) {
		if (s->ax25_dev == ax25_dev) {
			found = true;
			...

> @@ -115,6 +116,10 @@ static void ax25_kill_by_device(struct net_device *dev)
>  		}
>  	}
>  	spin_unlock_bh(&ax25_list_lock);
> +	if (!test_bit(AX25_DEV_KILL, &ax25_dev->flag) && test_bit(AX25_DEV_BIND, &ax25_dev->flag)) {

The comments for ax25_kill_by_device() say:

/*
 *      Kill all bound sockets on a dropped device.
 */

So how can test_bit(AX25_DEV_BIND, &ax25_dev->flag) ever be false at
this location?

	if (!found) {
		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
		ax25_dev_put(ax25_dev);
	}

But even here, my instinct is that if the refcounting is were done in
the correct place we would not need any additional variables.  Is there
no simpler solution?

> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index d2a244e1c26..9b04d74a1be 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -77,6 +77,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  	ax25_dev->values[AX25_VALUES_PACLEN]	= AX25_DEF_PACLEN;
>  	ax25_dev->values[AX25_VALUES_PROTOCOL]  = AX25_DEF_PROTOCOL;
>  	ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
> +	ax25_dev->flag = AX25_DEV_INIT;

There is no need for this, it's allocated with kzalloc().

>  
>  #if defined(CONFIG_AX25_DAMA_SLAVE) || defined(CONFIG_AX25_DAMA_MASTER)
>  	ax25_ds_setup_timer(ax25_dev);

regards,
dan carpenter
