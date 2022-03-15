From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH net V4 2/2] ax25: Fix NULL pointer dereferences in ax25
 timers
Date: Mon, 14 Mar 2022 20:02:54 -0700
Message-ID: <c6052f5c-c1c4-18a0-a04f-e48f366200e4@gmail.com>
References: <20220315015654.79941-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A455krXMhhy8/LLYYm9vWAWvlzZHEKZiVzhbnonkNws=;
        b=jhcAENCFBWZcmbZIoMa4IBixoqkt2DRSnQnBe9VESilKn4CEEqf3AYoyR3vIQxCdYT
         pJ+KMvc61kTkjENj0c10iWam3OS9WYzsndLB5E34Ru/pUPujcpJbqVYOLXqfKhvd4fot
         XgGUmP9Cr1T5I1WTZkKbsF1ffq004PWTUxMhwfC5XLQsCoShyIrrHRJGUZlHhMfsVEsv
         rmkth4GoRFsGnAcqW5wn6vwbBocXG/NjFw/ENW+cBadja5I4eFnsFvyFcsdz5TixPIcB
         Hl3+OhGXuMwXX84KMLTToAUySmj2HtArumZLaOGNxGf8xnVP6qSTN3A2OkEZFq6OdrfE
         DJDQ==
Content-Language: en-US
In-Reply-To: <20220315015654.79941-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, dan.carpenter@oracle.com


On 3/14/22 18:56, Duoming Zhou wrote:
> There are race conditions that may lead to null pointer dereferences in
> ax25_heartbeat_expiry(), ax25_t1timer_expiry(), ax25_t2timer_expiry(),
> ax25_t3timer_expiry() and ax25_idletimer_expiry(), when we use
> ax25_kill_by_device() to detach the ax25 device.
>
> One of the race conditions that cause null pointer dereferences can be
> shown as below:
>
>        (Thread 1)                    |      (Thread 2)
> ax25_connect()                      |
>   ax25_std_establish_data_link()     |
>    ax25_start_t1timer()              |
>     mod_timer(&ax25->t1timer,..)     |
>                                      | ax25_kill_by_device()
>     (wait a time)                    |  ...
>                                      |  s->ax25_dev = NULL; //(1)
>     ax25_t1timer_expiry()            |
>      ax25->ax25_dev->values[..] //(2)|  ...
>       ...                            |
>
> We set null to ax25_cb->ax25_dev in position (1) and dereference
> the null pointer in position (2).
>
> The corresponding fail log is shown below:
> ===============================================================
> BUG: kernel NULL pointer dereference, address: 0000000000000050
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc6-00794-g45690b7d0
> RIP: 0010:ax25_t1timer_expiry+0x12/0x40
> ...
> Call Trace:
>   call_timer_fn+0x21/0x120
>   __run_timers.part.0+0x1ca/0x250
>   run_timer_softirq+0x2c/0x60
>   __do_softirq+0xef/0x2f3
>   irq_exit_rcu+0xb6/0x100
>   sysvec_apic_timer_interrupt+0xa2/0xd0
> ...
>
> This patch uses ax25_disconnect() to delete timers before we set null to
> ax25_cb->ax25_dev in ax25_kill_by_device().The function ax25_disconnect()
> will not return until all timers are stopped, because we have changed
> del_timer() to del_timer_sync(). What`s more, we add condition check in
> ax25_destroy_socket(), because ax25_stop_heartbeat() will not return,
> if there is still heartbeat.
>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

Missing FIxes: tag ?


> ---
> Changes in V4:
>    - Based on [PATCH net V4 1/2] ax25: Fix refcount leaks caused by ax25_cb_del().
>
>   net/ax25/af_ax25.c    |  7 ++++---
>   net/ax25/ax25_timer.c | 10 +++++-----
>   2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 0886109421a..dc6161a75a1 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -89,20 +89,20 @@ static void ax25_kill_by_device(struct net_device *dev)
>   			sk = s->sk;
>   			if (!sk) {
>   				spin_unlock_bh(&ax25_list_lock);
> -				s->ax25_dev = NULL;
>   				ax25_disconnect(s, ENETUNREACH);
> +				s->ax25_dev = NULL;
>   				spin_lock_bh(&ax25_list_lock);
>   				goto again;
>   			}
>   			sock_hold(sk);
>   			spin_unlock_bh(&ax25_list_lock);
>   			lock_sock(sk);
> +			ax25_disconnect(s, ENETUNREACH);
>   			s->ax25_dev = NULL;
>   			if (sk->sk_wq) {
>   				dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>   				ax25_dev_put(ax25_dev);
>   			}
> -			ax25_disconnect(s, ENETUNREACH);
>   			release_sock(sk);
>   			spin_lock_bh(&ax25_list_lock);
>   			sock_put(sk);
> @@ -307,7 +307,8 @@ void ax25_destroy_socket(ax25_cb *ax25)
>   
>   	ax25_cb_del(ax25);
>   
> -	ax25_stop_heartbeat(ax25);
> +	if (!ax25->sk || !sock_flag(ax25->sk, SOCK_DESTROY))
> +		ax25_stop_heartbeat(ax25);
>   	ax25_stop_t1timer(ax25);
>   	ax25_stop_t2timer(ax25);
>   	ax25_stop_t3timer(ax25);
> diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
> index 85865ebfdfa..99af3d1aeec 100644
> --- a/net/ax25/ax25_timer.c
> +++ b/net/ax25/ax25_timer.c
> @@ -78,27 +78,27 @@ void ax25_start_idletimer(ax25_cb *ax25)
>   
>   void ax25_stop_heartbeat(ax25_cb *ax25)
>   {
> -	del_timer(&ax25->timer);
> +	del_timer_sync(&ax25->timer);
>   }
>   
>   void ax25_stop_t1timer(ax25_cb *ax25)
>   {
> -	del_timer(&ax25->t1timer);
> +	del_timer_sync(&ax25->t1timer);
>   }
>   
>   void ax25_stop_t2timer(ax25_cb *ax25)
>   {
> -	del_timer(&ax25->t2timer);
> +	del_timer_sync(&ax25->t2timer);
>   }
>   
>   void ax25_stop_t3timer(ax25_cb *ax25)
>   {
> -	del_timer(&ax25->t3timer);
> +	del_timer_sync(&ax25->t3timer);
>   }
>   
>   void ax25_stop_idletimer(ax25_cb *ax25)
>   {
> -	del_timer(&ax25->idletimer);
> +	del_timer_sync(&ax25->idletimer);
>   }
>   
>   int ax25_t1timer_running(ax25_cb *ax25)



Are you sure calling del_time_sync() wont deadlock ?


If the timer handlers need a lock owned by the thread calling 
del_timer_sync(),

then this will block forever.


Usually, we make sure each active timer owns a reference 
(sk_stop_timer() for example)




