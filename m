From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net 1/2] net: rose: fix UAF bugs caused by timer handler
Date: Thu, 23 Jun 2022 11:13:41 +0200
Message-ID: <91952d00df215751cbc0e4846c2d688f964fbfc1.camel@redhat.com>
References: <cover.1655869357.git.duoming@zju.edu.cn>
         <bbc81ddb35efd09b89e2f8f6af72866bcc9c1550.1655869357.git.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655975626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UUQ0NEqqglgxwxJbdDc/0JUwCyiwUSo3CM6cNI7KLok=;
        b=hXJvBgwjDB5L2KruDOaP+5reSl3cZrBZxZMWNPUU4RQlOr0ZEQzQJVIN4N3FDMOciMekhw
        uzCCXy6lYlje+i7FdOr6GVXLs0zhcE5j8leBhcPld51PF087AjafBAzsTBB87i64ADMjjm
        J/VCHOQrllJEUKyOGZTxCUQjwwIbNjA=
In-Reply-To: <bbc81ddb35efd09b89e2f8f6af72866bcc9c1550.1655869357.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2022-06-22 at 12:01 +0800, Duoming Zhou wrote:
> There are UAF bugs in rose_heartbeat_expiry(), rose_timer_expiry()
> and rose_idletimer_expiry(). The root cause is that del_timer()
> could not stop the timer handler that is running and the refcount
> of sock is not managed properly.
> 
> One of the UAF bugs is shown below:
> 
>     (thread 1)          |        (thread 2)
>                         |  rose_bind
>                         |  rose_connect
>                         |    rose_start_heartbeat
> rose_release            |    (wait a time)
>   case ROSE_STATE_0     |
>   rose_destroy_socket   |  rose_heartbeat_expiry
>     rose_stop_heartbeat |
>     sock_put(sk)        |    ...
>   sock_put(sk) // FREE  |
>                         |    bh_lock_sock(sk) // USE
> 
> The sock is deallocated by sock_put() in rose_release() and
> then used by bh_lock_sock() in rose_heartbeat_expiry().
> 
> Although rose_destroy_socket() calls rose_stop_heartbeat(),
> it could not stop the timer that is running.
> 
> The KASAN report triggered by POC is shown below:
> 
> BUG: KASAN: use-after-free in _raw_spin_lock+0x5a/0x110
> Write of size 4 at addr ffff88800ae59098 by task swapper/3/0
> ...
> Call Trace:
>  <IRQ>
>  dump_stack_lvl+0xbf/0xee
>  print_address_description+0x7b/0x440
>  print_report+0x101/0x230
>  ? irq_work_single+0xbb/0x140
>  ? _raw_spin_lock+0x5a/0x110
>  kasan_report+0xed/0x120
>  ? _raw_spin_lock+0x5a/0x110
>  kasan_check_range+0x2bd/0x2e0
>  _raw_spin_lock+0x5a/0x110
>  rose_heartbeat_expiry+0x39/0x370
>  ? rose_start_heartbeat+0xb0/0xb0
>  call_timer_fn+0x2d/0x1c0
>  ? rose_start_heartbeat+0xb0/0xb0
>  expire_timers+0x1f3/0x320
>  __run_timers+0x3ff/0x4d0
>  run_timer_softirq+0x41/0x80
>  __do_softirq+0x233/0x544
>  irq_exit_rcu+0x41/0xa0
>  sysvec_apic_timer_interrupt+0x8c/0xb0
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1b/0x20
> RIP: 0010:default_idle+0xb/0x10
> RSP: 0018:ffffc9000012fea0 EFLAGS: 00000202
> RAX: 000000000000bcae RBX: ffff888006660f00 RCX: 000000000000bcae
> RDX: 0000000000000001 RSI: ffffffff843a11c0 RDI: ffffffff843a1180
> RBP: dffffc0000000000 R08: dffffc0000000000 R09: ffffed100da36d46
> R10: dfffe9100da36d47 R11: ffffffff83cf0950 R12: 0000000000000000
> R13: 1ffff11000ccc1e0 R14: ffffffff8542af28 R15: dffffc0000000000
> ...
> Allocated by task 146:
>  __kasan_kmalloc+0xc4/0xf0
>  sk_prot_alloc+0xdd/0x1a0
>  sk_alloc+0x2d/0x4e0
>  rose_create+0x7b/0x330
>  __sock_create+0x2dd/0x640
>  __sys_socket+0xc7/0x270
>  __x64_sys_socket+0x71/0x80
>  do_syscall_64+0x43/0x90
>  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> Freed by task 152:
>  kasan_set_track+0x4c/0x70
>  kasan_set_free_info+0x1f/0x40
>  ____kasan_slab_free+0x124/0x190
>  kfree+0xd3/0x270
>  __sk_destruct+0x314/0x460
>  rose_release+0x2fa/0x3b0
>  sock_close+0xcb/0x230
>  __fput+0x2d9/0x650
>  task_work_run+0xd6/0x160
>  exit_to_user_mode_loop+0xc7/0xd0
>  exit_to_user_mode_prepare+0x4e/0x80
>  syscall_exit_to_user_mode+0x20/0x40
>  do_syscall_64+0x4f/0x90
>  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> This patch adds refcount of sock when we use functions
> such as rose_start_heartbeat() and so on to start timer,
> and decreases the refcount of sock when timer is finished
> or deleted by functions such as rose_stop_heartbeat()
> and so on. As a result, the UAF bugs could be mitigated.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> Tested-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  net/rose/rose_timer.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
> index b3138fc2e55..18d1912520b 100644
> --- a/net/rose/rose_timer.c
> +++ b/net/rose/rose_timer.c
> @@ -36,7 +36,7 @@ void rose_start_heartbeat(struct sock *sk)
>  	sk->sk_timer.function = rose_heartbeat_expiry;
>  	sk->sk_timer.expires  = jiffies + 5 * HZ;
>  
> -	add_timer(&sk->sk_timer);
> +	sk_reset_timer(sk, &sk->sk_timer, sk->sk_timer.expires);
>  }
>  
>  void rose_start_t1timer(struct sock *sk)
> @@ -48,7 +48,7 @@ void rose_start_t1timer(struct sock *sk)
>  	rose->timer.function = rose_timer_expiry;
>  	rose->timer.expires  = jiffies + rose->t1;
>  
> -	add_timer(&rose->timer);
> +	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
>  }
>  
>  void rose_start_t2timer(struct sock *sk)
> @@ -60,7 +60,7 @@ void rose_start_t2timer(struct sock *sk)
>  	rose->timer.function = rose_timer_expiry;
>  	rose->timer.expires  = jiffies + rose->t2;
>  
> -	add_timer(&rose->timer);
> +	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
>  }
>  
>  void rose_start_t3timer(struct sock *sk)
> @@ -72,7 +72,7 @@ void rose_start_t3timer(struct sock *sk)
>  	rose->timer.function = rose_timer_expiry;
>  	rose->timer.expires  = jiffies + rose->t3;
>  
> -	add_timer(&rose->timer);
> +	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
>  }
>  
>  void rose_start_hbtimer(struct sock *sk)
> @@ -84,7 +84,7 @@ void rose_start_hbtimer(struct sock *sk)
>  	rose->timer.function = rose_timer_expiry;
>  	rose->timer.expires  = jiffies + rose->hb;
>  
> -	add_timer(&rose->timer);
> +	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
>  }
>  
>  void rose_start_idletimer(struct sock *sk)
> @@ -97,23 +97,23 @@ void rose_start_idletimer(struct sock *sk)
>  		rose->idletimer.function = rose_idletimer_expiry;
>  		rose->idletimer.expires  = jiffies + rose->idle;
>  
> -		add_timer(&rose->idletimer);
> +		sk_reset_timer(sk, &rose->idletimer, rose->idletimer.expires);

A few lines above there is still a 'del_timer(&rose->idletimer);' call
which must be converted to sk_stop_timer(), otherwise there will be a
possible sk reference leak.

There are other del_timer(&rose->timer) that need conversion.

Thanks

Paolo

