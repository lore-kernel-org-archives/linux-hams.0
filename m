From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v4] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Fri, 1 Jul 2022 19:41:55 -0700
Message-ID: <20220701194155.5bd61e58@kernel.org>
References: <20220629104941.26351-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656729717;
        bh=Sm9lhSTRgNM8o4IlZEyh366RuQsTgSkbhEG4P3KRiRo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Erc18y7RaSJz6gdjdeb7ycXcGAuApkdXnctOzJLTg6oDKvAx6k/qWELu90xoryvsJ
         Dhcd+otpOb9HCXHCKDYKMMY1tVuX1h+a6G3SMixBCljgvIriMPPtEMdvzSaFxsT15v
         UqsxVqg54Ukm/dO6gQ9pZp4qVhxShX0rKmGmSWrWhwC1HQel9O+e3ljswHzLL+Q3Fe
         vWV9zPicgxk5lXhW1Z9hnKs3mwEhk1xAYv7X1Ewry8WPrWdtI4cDxAyJ7dkxwgMfCf
         cNf9X56YZKF9cTTKV8GaKG0JLbM/HV6Ihlhc4TDI1dS4rV3v0voo/yVffilxi6iSuX
         +YDe9Yts8vmGw==
In-Reply-To: <20220629104941.26351-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com

On Wed, 29 Jun 2022 18:49:41 +0800 Duoming Zhou wrote:
> When the link layer connection is broken, the rose->neighbour is
> set to null. But rose->neighbour could be used by rose_connection()
> and rose_release() later, because there is no synchronization among
> them. As a result, the null-ptr-deref bugs will happen.
> 
> One of the null-ptr-deref bugs is shown below:
> 
>     (thread 1)                  |        (thread 2)
>                                 |  rose_connect
> rose_kill_by_neigh              |    lock_sock(sk)
>   spin_lock_bh(&rose_list_lock) |    if (!rose->neighbour)
>   rose->neighbour = NULL;//(1)  |
>                                 |    rose->neighbour->use++;//(2)

>  		if (rose->neighbour == neigh) {

Why is it okay to perform this comparison without the socket lock,
if we need a socket lock to clear it? Looks like rose_kill_by_neigh()
is not guaranteed to clear all the uses of a neighbor.

> +			sock_hold(s);
> +			spin_unlock_bh(&rose_list_lock);
> +			lock_sock(s);
>  			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
>  			rose->neighbour->use--;

What protects the use counter?

>  			rose->neighbour = NULL;
> +			release_sock(s);
> +			spin_lock_bh(&rose_list_lock);

Don't take the lock here just dump one line further back.

> +			sock_put(s);
> +			goto again;
>  		}
>  	}
>  	spin_unlock_bh(&rose_list_lock);
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index fee6409c2bb..b116828b422 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -827,7 +827,9 @@ void rose_link_failed(ax25_cb *ax25, int reason)
>  		ax25_cb_put(ax25);
>  
>  		rose_del_route_by_neigh(rose_neigh);
> +		spin_unlock_bh(&rose_neigh_list_lock);
>  		rose_kill_by_neigh(rose_neigh);
> +		return;
>  	}
>  	spin_unlock_bh(&rose_neigh_list_lock);
>  }

