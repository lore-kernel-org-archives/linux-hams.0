From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH net] ax25: Fix ax25 session cleanup problem in
 ax25_release
Date: Fri, 27 May 2022 10:11:33 +0200
Message-ID: <YpCHtRoxEXU7UAji@x-berg.in-berlin.de>
References: <20220525112850.102363-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220525112850.102363-1-duoming@zju.edu.cn>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, thomas@osterried.de


I Tested several cases: this patch works as expected.

Anyone else testet it?

vy 73,
	- Thomas  dl9sau


On Wed, May 25, 2022 at 07:28:50PM +0800, Duoming Zhou wrote:
> The timers of ax25 are used for correct session cleanup.
> If we use ax25_release() to close ax25 sessions and
> ax25_dev is not null, the del_timer_sync() functions in
> ax25_release() will execute. As a result, the sessions
> could not be cleaned up correctly, because the timers
> have stopped.
> 
> This patch adds a device_up flag in ax25_dev in order to
> judge whether the device is up. If there are sessions to
> be cleaned up, the del_timer_sync() in ax25_release() will
> not execute. As a result the sessions could be cleaned up
> correctly.
> 
> Fixes: 82e31755e55f ("ax25: Fix UAF bugs in ax25 timers")
> Reported-by: Thomas Osterried <thomas@osterried.de>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  include/net/ax25.h  |  1 +
>  net/ax25/af_ax25.c  | 13 ++++++++-----
>  net/ax25/ax25_dev.c |  1 +
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 0f9790c455b..a427a05672e 100644
> --- a/include/net/ax25.h
> +++ b/include/net/ax25.h
> @@ -228,6 +228,7 @@ typedef struct ax25_dev {
>  	ax25_dama_info		dama;
>  #endif
>  	refcount_t		refcount;
> +	bool device_up;
>  } ax25_dev;
>  
>  typedef struct ax25_cb {
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 363d47f9453..47ce6b630cc 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -81,6 +81,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>  
>  	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
>  		return;
> +	ax25_dev->device_up = false;
>  
>  	spin_lock_bh(&ax25_list_lock);
>  again:
> @@ -1053,11 +1054,13 @@ static int ax25_release(struct socket *sock)
>  		ax25_destroy_socket(ax25);
>  	}
>  	if (ax25_dev) {
> -		del_timer_sync(&ax25->timer);
> -		del_timer_sync(&ax25->t1timer);
> -		del_timer_sync(&ax25->t2timer);
> -		del_timer_sync(&ax25->t3timer);
> -		del_timer_sync(&ax25->idletimer);
> +		if (!ax25_dev->device_up) {
> +			del_timer_sync(&ax25->timer);
> +			del_timer_sync(&ax25->t1timer);
> +			del_timer_sync(&ax25->t2timer);
> +			del_timer_sync(&ax25->t3timer);
> +			del_timer_sync(&ax25->idletimer);
> +		}
>  		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>  		ax25_dev_put(ax25_dev);
>  	}
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index d2a244e1c26..5451be15e07 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -62,6 +62,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  	ax25_dev->dev     = dev;
>  	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
>  	ax25_dev->forward = NULL;
> +	ax25_dev->device_up = true;
>  
>  	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
>  	ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;
> -- 
> 2.17.1
> 
