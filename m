From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/2] ax25: add refcount in ax25_dev to avoid UAF bugs
Date: Mon, 31 Jan 2022 16:22:41 +0300
Message-ID: <20220131132241.GK1951@kadam>
References: <cover.1643343397.git.duoming@zju.edu.cn>
 <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=7VTflFPpvvIjoJRuq+gGxX9hfCZ5qUNQtmWor8yG0A4=;
 b=asy47KY1xTWjwfW/2prLV6FrQaehO0TUhvJf7Jfrby42kVs5R8u1XuNiop2Kp9UZPPdF
 ZCG6j/Ro/3YEsNzvGG7yoBRLQqtWmeiXuHmNPkZUayQtMIZfzoHZxR/ADFB+87bE3unB
 9of+tNXPUdnEYWrtYZAvpIX1hCAaXQ72QQXVGKiRmPWp1A7N2XUXlvNScBfxSRhlTVFL
 oV6SN+KScFLf8HoCptExii13wabGdjZwI9B1FDtHX3EPJKy8DdLDvE2Kal8IYVyFD3xO
 q4P0I+u/OHrKZ7NjGiZ0BwA1dWHfOp9lpXPTzOHjjejZdZGhInyucZs8kTNXr822zfRv Kw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VTflFPpvvIjoJRuq+gGxX9hfCZ5qUNQtmWor8yG0A4=;
 b=ZeDUmwEpCpDZ6/yNIln5JuG/XPcto9MlrFodWDeKBaxs7vTNvy3wGcibH+LEGgRgdzNadpq7TkVYyYnuLrJJ2IlsG5v8htHxUBxYtKKNZpRBDpP2JyeC9ZhOo2ozlxOV6BSa9ss+6jS/7qEifJlKLOH09iLVYYFpQf197qMICFQ=
Content-Disposition: inline
In-Reply-To: <855641b37699b6ff501c4bae8370d26f59da9c81.1643343397.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 28, 2022 at 12:47:16PM +0800, Duoming Zhou wrote:
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 526e4958919..50b417df622 100644
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
> @@ -293,6 +294,15 @@ static __inline__ void ax25_cb_put(ax25_cb *ax25)
>  	}
>  }
>  
> +#define ax25_dev_hold(__ax25_dev) \
> +	refcount_inc(&((__ax25_dev)->refcount))

Make this an inline function.

> +
> +static __inline__ void ax25_dev_put(ax25_dev *ax25_dev)

Please run checkpatch.pl --strict on your patches.  s/__inline__/inline/

> +{
> +	if (refcount_dec_and_test(&ax25_dev->refcount)) {
> +		kfree(ax25_dev);
> +	}

Delete the extra curly braces.

> +}
>  static inline __be16 ax25_type_trans(struct sk_buff *skb, struct net_device *dev)
>  {
>  	skb->dev      = dev;
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 44a8730c26a..32f61978ff2 100644
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
> @@ -439,6 +440,7 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
>  	  }
>  
>  out_put:
> +	ax25_dev_put(ax25_dev);

The ax25_ctl_ioctl() has a ton of reference leak paths now.  Almost
every return -ESOMETHING needs to be fixed.

>  	ax25_cb_put(ax25);
>  	return ret;
>  
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index 256fadb94df..770b787fb7b 100644
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
> @@ -112,20 +115,22 @@ void ax25_dev_device_down(struct net_device *dev)
>  
>  	if ((s = ax25_dev_list) == ax25_dev) {
>  		ax25_dev_list = s->next;
> +		ax25_dev_put(ax25_dev);

Do we not have to call ax25_dev_hold(s->next)?

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
>  			s->next = ax25_dev->next;
> +			ax25_dev_put(ax25_dev);

ax25_dev_hold(ax25_dev->next)?

>  			spin_unlock_bh(&ax25_dev_lock);
>  			dev->ax25_ptr = NULL;
>  			dev_put_track(dev, &ax25_dev->dev_tracker);
> -			kfree(ax25_dev);
> +			ax25_dev_put(ax25_dev);
>  			return;
>  		}
>  
> @@ -133,6 +138,7 @@ void ax25_dev_device_down(struct net_device *dev)
>  	}
>  	spin_unlock_bh(&ax25_dev_lock);
>  	dev->ax25_ptr = NULL;
> +	ax25_dev_put(ax25_dev);
>  }
>  
>  int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)
> @@ -149,6 +155,7 @@ int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)
>  		if (ax25_dev->forward != NULL)
>  			return -EINVAL;

Every return -ERROR; in this function leaks reference counts.  This one
should drop the reference for both fwd_dev and ax25_dev.


>  		ax25_dev->forward = fwd_dev->dev;
> +		ax25_dev_put(fwd_dev);
>  		break;
>  
>  	case SIOCAX25DELFWD:

regards,
dan carpenter

