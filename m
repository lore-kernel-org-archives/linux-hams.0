From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH] ax25: unsigned cannot be less than 0 in ax25_ctl_ioctl()
Date: Mon, 12 Oct 2009 17:37:32 +0200
Message-ID: <4AD34D3C.1060206@bfs.de>
References: <4AD0FB0B.8050609@gmail.com>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AD0FB0B.8050609@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roel Kluin <roel.kluin@gmail.com>
Cc: linux-hams@vger.kernel.org


what is about something like:

 tmp_arg=ax25_ctl.arg * HZ;

  if (arg == 0 || arg >  ULONG_MAX )
		goto einval_put;

re,
 wh



Roel Kluin schrieb:
> struct ax25_ctl_struct member `arg' is unsigned and cannot be less
> than 0.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> If the ax25_ctl.arg limit is known to be lower, please suggest
> other values.
> 
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index f454607..0d99704 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -398,14 +398,14 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
>  		break;
>  
>  	case AX25_T1:
> -		if (ax25_ctl.arg < 1)
> +		if (ax25_ctl.arg < 1 || ax25_ctl.arg * HZ > ULONG_MAX)
>  			goto einval_put;
>  		ax25->rtt = (ax25_ctl.arg * HZ) / 2;
>  		ax25->t1  = ax25_ctl.arg * HZ;
>  		break;
>  
>  	case AX25_T2:
> -		if (ax25_ctl.arg < 1)
> +		if (ax25_ctl.arg < 1 || ax25_ctl.arg * HZ > ULONG_MAX)
>  			goto einval_put;
>  		ax25->t2 = ax25_ctl.arg * HZ;
>  		break;
> @@ -418,13 +418,13 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
>  		break;
>  
>  	case AX25_T3:
> -		if (ax25_ctl.arg < 0)
> +		if (ax25_ctl.arg * HZ > ULONG_MAX)
>  			goto einval_put;
>  		ax25->t3 = ax25_ctl.arg * HZ;
>  		break;
>  
>  	case AX25_IDLE:
> -		if (ax25_ctl.arg < 0)
> +		if (ax25_ctl.arg * 60 * HZ > ULONG_MAX)
>  			goto einval_put;
>  		ax25->idle = ax25_ctl.arg * 60 * HZ;
>  		break;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
