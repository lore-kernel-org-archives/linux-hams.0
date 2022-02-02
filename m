From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Fixes] ax25: add refcount in ax25_dev to avoid UAF bugs
Date: Wed, 2 Feb 2022 20:47:09 +0300
Message-ID: <20220202174709.GY1978@kadam>
References: <20220202161846.26198-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=X3LRawdiu+q/Ctvp53dn9yHstWqyzhqA99pUAZzo8EI=;
 b=iCuh9LpSrkk/QtB+t8f4Re3v/MeLtlrw+CdSdBTu4DJE6VIcdd+o+GWG/LFYkq7ISTfX
 qCRyfV68WpMrDeIuDC7dwuGHM70eSyZAV3iPRvIndsuBUwio8Aa40Rv3ky4ViTwuc0F9
 TLyO6ttejTI9nvI82yADmHugk0FBTWTNG1bmx/jj679J9WxVaxzhFJgm+EosdbyeJgWM
 3de7UC1peiEL+5RtDWvPNiXdxB6f/Vwf0NWZIAblEbVhvEzuFhaOBAJtbQSjhkye2CTE
 lC+pL1hB5mSREw0vxo5G3Hun8Fq2YnQz1Mg9YqnRQdh4BAqgP1yyw63pzL8u+6YVT3eZ hg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3LRawdiu+q/Ctvp53dn9yHstWqyzhqA99pUAZzo8EI=;
 b=bkZ77os/Zd3iE15vWnT8A9GTYv7DFV2MxpAzkQ3Dc2bJVx+VsVpYnuH+kUTezNl/LHGpUkjwQqbHlDWot+qJkzhmronq1KeFzEzHQ9Q1MIZkm68rka9LEX5kOx4DXImHKqkfQWwdn1wJQanh7IheqjnOo3lByY6Rn/PoAAotaCA=
Content-Disposition: inline
In-Reply-To: <20220202161846.26198-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Duoming Zhou,

The original patch was already applied so you need to just send the
fixes by themselves on top of the net-next git tree.

> ---
>  include/net/ax25.h    | 12 ++++++++++++
>  net/ax25/af_ax25.c    | 20 ++++++++++++++++----
>  net/ax25/ax25_dev.c   | 33 +++++++++++++++++++++++++++------
>  net/ax25/ax25_route.c | 27 ++++++++++++++++++++++-----
>  4 files changed, 77 insertions(+), 15 deletions(-)
> 
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 526e4958919..1a38b1ad529 100644
> --- a/include/net/ax25.h
> +++ b/include/net/ax25.h
> @@ -239,6 +239,7 @@ typedef struct ax25_dev {
>  #if defined(CONFIG_AX25_DAMA_SLAVE) || defined(CONFIG_AX25_DAMA_MASTER)
>  	ax25_dama_info		dama;
>  #endif
> +	refcount_t		refcount;
>  } ax25_dev;
>  
>  typedef struct ax25_cb {
> @@ -293,6 +294,17 @@ static __inline__ void ax25_cb_put(ax25_cb *ax25)
>  	}
>  }
>  
> +static inline void ax25_dev_hold(ax25_dev *ax25_dev)
> +{
> +	refcount_inc(&ax25_dev->refcount);
> +}
> +
> +static inline void ax25_dev_put(ax25_dev *ax25_dev)
> +{
> +	if (refcount_dec_and_test(&ax25_dev->refcount))
> +		kfree(ax25_dev);
> +}
> +

Forget about these cleanups for now.  Just fix the reference leaks on
error.

>  static inline __be16 ax25_type_trans(struct sk_buff *skb, struct net_device *dev)
>  {
>  	skb->dev      = dev;
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 44a8730c26a..7463bbd4e63 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -91,6 +91,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>  			spin_unlock_bh(&ax25_list_lock);
>  			lock_sock(sk);
>  			s->ax25_dev = NULL;
> +			ax25_dev_put(ax25_dev);
>  			release_sock(sk);
>  			ax25_disconnect(s, ENETUNREACH);
>  			spin_lock_bh(&ax25_list_lock);
> @@ -358,21 +359,31 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
>  	if (copy_from_user(&ax25_ctl, arg, sizeof(ax25_ctl)))
>  		return -EFAULT;
>  
> -	if ((ax25_dev = ax25_addr_ax25dev(&ax25_ctl.port_addr)) == NULL)
> +	ax25_dev = ax25_addr_ax25dev(&ax25_ctl.port_addr);
> +	if (ax25_dev == NULL) {
> +		ax25_dev_put(ax25_dev);

This one will lead to a NULL dereference.  These NULL dereferences are

>  		return -ENODEV;
> +	}
>  
> -	if (ax25_ctl.digi_count > AX25_MAX_DIGIS)
> +	if (ax25_ctl.digi_count > AX25_MAX_DIGIS) {
> +		ax25_dev_put(ax25_dev);
>  		return -EINVAL;
> +	}
>  
> -	if (ax25_ctl.arg > ULONG_MAX / HZ && ax25_ctl.cmd != AX25_KILL)
> +	if (ax25_ctl.arg > ULONG_MAX / HZ && ax25_ctl.cmd != AX25_KILL) {
> +		ax25_dev_put(ax25_dev);
>  		return -EINVAL;
> +	}
>  
>  	digi.ndigi = ax25_ctl.digi_count;
>  	for (k = 0; k < digi.ndigi; k++)
>  		digi.calls[k] = ax25_ctl.digi_addr[k];
>  
> -	if ((ax25 = ax25_find_cb(&ax25_ctl.source_addr, &ax25_ctl.dest_addr, &digi, ax25_dev->dev)) == NULL)
> +	ax25 = ax25_find_cb(&ax25_ctl.source_addr, &ax25_ctl.dest_addr, &digi, ax25_dev->dev);
> +	if (ax25 == NULL) {
> +		ax25_dev_put(ax25_dev);

Don't do this.

>  		return -ENOTCONN;
> +	}
>  
>  	switch (ax25_ctl.cmd) {
>  	case AX25_KILL:
> @@ -439,6 +450,7 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
>  	  }
>  
>  out_put:
> +	ax25_dev_put(ax25_dev);
>  	ax25_cb_put(ax25);
>  	return ret;
>  
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index 256fadb94df..77d9aa2ccab 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -37,6 +37,7 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
>  	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
>  		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
>  			res = ax25_dev;
> +			ax25_dev_hold(ax25_dev);
>  		}
>  	spin_unlock_bh(&ax25_dev_lock);
>  
> @@ -56,6 +57,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  		return;
>  	}
>  
> +	refcount_set(&ax25_dev->refcount, 1);
>  	dev->ax25_ptr     = ax25_dev;
>  	ax25_dev->dev     = dev;
>  	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
> @@ -83,6 +85,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  	spin_lock_bh(&ax25_dev_lock);
>  	ax25_dev->next = ax25_dev_list;
>  	ax25_dev_list  = ax25_dev;
> +	ax25_dev_hold(ax25_dev);
>  	spin_unlock_bh(&ax25_dev_lock);
>  
>  	ax25_register_dev_sysctl(ax25_dev);
> @@ -111,21 +114,23 @@ void ax25_dev_device_down(struct net_device *dev)
>  			s->forward = NULL;
>  
>  	if ((s = ax25_dev_list) == ax25_dev) {
> +		ax25_dev_put(ax25_dev_list);

Just leave the style changes until later.  I'm sorry I brought it up.

>  		ax25_dev_list = s->next;
>  		spin_unlock_bh(&ax25_dev_lock);
>  		dev->ax25_ptr = NULL;
>  		dev_put_track(dev, &ax25_dev->dev_tracker);
> -		kfree(ax25_dev);
> +		ax25_dev_put(ax25_dev);
>  		return;
>  	}
>  
>  	while (s != NULL && s->next != NULL) {
>  		if (s->next == ax25_dev) {
> +			ax25_dev_put(s->next);
>  			s->next = ax25_dev->next;
>  			spin_unlock_bh(&ax25_dev_lock);
>  			dev->ax25_ptr = NULL;
>  			dev_put_track(dev, &ax25_dev->dev_tracker);
> -			kfree(ax25_dev);
> +			ax25_dev_put(ax25_dev);
>  			return;
>  		}
>  
> @@ -133,31 +138,47 @@ void ax25_dev_device_down(struct net_device *dev)
>  	}
>  	spin_unlock_bh(&ax25_dev_lock);
>  	dev->ax25_ptr = NULL;
> +	ax25_dev_put(ax25_dev);
>  }
>  
>  int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)
>  {
>  	ax25_dev *ax25_dev, *fwd_dev;
>  
> -	if ((ax25_dev = ax25_addr_ax25dev(&fwd->port_from)) == NULL)
> +	ax25_dev = ax25_addr_ax25dev(&fwd->port_from);
> +	if (ax25_dev == NULL) {
> +		ax25_dev_put(ax25_dev);

NULL dereference.

>  		return -EINVAL;
> +	}
>  
>  	switch (cmd) {
>  	case SIOCAX25ADDFWD:
> -		if ((fwd_dev = ax25_addr_ax25dev(&fwd->port_to)) == NULL)
> +		fwd_dev = ax25_addr_ax25dev(&fwd->port_to);
> +		if (fwd_dev == NULL) {
> +			ax25_dev_put(fwd_dev);

NULL dereference.

> +			ax25_dev_put(ax25_dev);
>  			return -EINVAL;
> -		if (ax25_dev->forward != NULL)
> +		}
> +		if (ax25_dev->forward != NULL) {
> +			ax25_dev_put(ax25_dev);

Drop the fwd_dev reference as well.

>  			return -EINVAL;
> +		}
>  		ax25_dev->forward = fwd_dev->dev;
> +		ax25_dev_put(fwd_dev);
> +		ax25_dev_put(ax25_dev);
>  		break;
>  
>  	case SIOCAX25DELFWD:
> -		if (ax25_dev->forward == NULL)
> +		if (ax25_dev->forward == NULL) {
> +			ax25_dev_put(ax25_dev);
>  			return -EINVAL;
> +		}
>  		ax25_dev->forward = NULL;
> +		ax25_dev_put(ax25_dev);
>  		break;
>  
>  	default:
> +		ax25_dev_put(ax25_dev);
>  		return -EINVAL;
>  	}
>  
> diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
> index d0b2e094bd5..7fe7a83b2a3 100644
> --- a/net/ax25/ax25_route.c
> +++ b/net/ax25/ax25_route.c
> @@ -75,10 +75,15 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  	ax25_dev *ax25_dev;
>  	int i;
>  
> -	if ((ax25_dev = ax25_addr_ax25dev(&route->port_addr)) == NULL)
> +	ax25_dev = ax25_addr_ax25dev(&route->port_addr);
> +	if (ax25_dev == NULL) {
> +		ax25_dev_put(ax25_dev);

NULL dereference.

>  		return -EINVAL;
> -	if (route->digi_count > AX25_MAX_DIGIS)
> +	}
> +	if (route->digi_count > AX25_MAX_DIGIS) {
> +		ax25_dev_put(ax25_dev);
>  		return -EINVAL;
> +	}
>  
>  	write_lock_bh(&ax25_route_lock);
>  
> @@ -91,6 +96,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  			if (route->digi_count != 0) {
>  				if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
>  					write_unlock_bh(&ax25_route_lock);
> +					ax25_dev_put(ax25_dev);
>  					return -ENOMEM;
>  				}
>  				ax25_rt->digipeat->lastrepeat = -1;
> @@ -101,6 +107,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  				}
>  			}
>  			write_unlock_bh(&ax25_route_lock);
> +			ax25_dev_put(ax25_dev);
>  			return 0;
>  		}
>  		ax25_rt = ax25_rt->next;
> @@ -108,6 +115,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  
>  	if ((ax25_rt = kmalloc(sizeof(ax25_route), GFP_ATOMIC)) == NULL) {
>  		write_unlock_bh(&ax25_route_lock);
> +		ax25_dev_put(ax25_dev);
>  		return -ENOMEM;
>  	}
>  
> @@ -120,6 +128,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  		if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
>  			write_unlock_bh(&ax25_route_lock);
>  			kfree(ax25_rt);
> +			ax25_dev_put(ax25_dev);
>  			return -ENOMEM;
>  		}
>  		ax25_rt->digipeat->lastrepeat = -1;
> @@ -132,6 +141,7 @@ static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
>  	ax25_rt->next   = ax25_route_list;
>  	ax25_route_list = ax25_rt;
>  	write_unlock_bh(&ax25_route_lock);
> +	ax25_dev_put(ax25_dev);
>  
>  	return 0;
>  }
> @@ -147,8 +157,11 @@ static int ax25_rt_del(struct ax25_routes_struct *route)
>  	ax25_route *s, *t, *ax25_rt;
>  	ax25_dev *ax25_dev;
>  
> -	if ((ax25_dev = ax25_addr_ax25dev(&route->port_addr)) == NULL)
> +	ax25_dev = ax25_addr_ax25dev(&route->port_addr);
> +	if (ax25_dev == NULL) {
> +		ax25_dev_put(ax25_dev);

NULL dereference.

>  		return -EINVAL;
> +	}
>  
>  	write_lock_bh(&ax25_route_lock);
>  
> @@ -173,7 +186,7 @@ static int ax25_rt_del(struct ax25_routes_struct *route)
>  		}
>  	}
>  	write_unlock_bh(&ax25_route_lock);
> -
> +	ax25_dev_put(ax25_dev);
>  	return 0;
>  }
>  
> @@ -183,8 +196,11 @@ static int ax25_rt_opt(struct ax25_route_opt_struct *rt_option)
>  	ax25_dev *ax25_dev;
>  	int err = 0;
>  
> -	if ((ax25_dev = ax25_addr_ax25dev(&rt_option->port_addr)) == NULL)
> +	ax25_dev = ax25_addr_ax25dev(&rt_option->port_addr);
> +	if (ax25_dev == NULL) {
> +		ax25_dev_put(ax25_dev);

NULL dereference.

>  		return -EINVAL;
> +	}
>  
>  	write_lock_bh(&ax25_route_lock);
>  
> @@ -215,6 +231,7 @@ static int ax25_rt_opt(struct ax25_route_opt_struct *rt_option)
>  
>  out:
>  	write_unlock_bh(&ax25_route_lock);
> +	ax25_dev_put(ax25_dev);
>  	return err;
>  }

Thanks for this, but please can you resend with the above issues fixed
and based on top of net-next.

regards,
dan carpenter

