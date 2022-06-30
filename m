From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net] net: rose: fix UAF bug caused by rose_t0timer_expiry
Date: Thu, 30 Jun 2022 16:44:29 +0200
Message-ID: <CANn89iLda2oxoPQaGd9r8frAaOu1LqxmWYm2O8W4HXaGRN8tcQ@mail.gmail.com>
References: <20220630143842.24906-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSGCf3INUeQnbAR4csX9+UIfMipKtpmqBXRf98s34f8=;
        b=coTWYclPD0QG+vO946f3aUVHNcKK40/FozAR7d7FMaU9d0S9CaVHSPcYb/YSL6wwLB
         LAMpeUzcB3kZHZlMEksl0lgUprkcJXK/HYpczYvTtKe9ivw3GlnUeTKg4tueLvPdd2Ys
         +ZKdkU/8i2x24qgQtGpo7N9MCBLCTz9agXxmLHk1aw4Q3KPvPdqjUB7mUOqc8iEovn4s
         eETT2QXBXm3YqIXn3owvzSxk1KxHKV7SV08dpyOEggDyOGgjGG1iB3vVOMMnKRJ1QJcA
         0fmiHj34szI3fIPy0Omf95J1D13wlFs+jxjffMRhG4pqOUGL0/Y5QBlSwOfYdaWGg0c8
         5WyA==
In-Reply-To: <20220630143842.24906-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, Ralf Baechle <ralf@linux-mips.org>

On Thu, Jun 30, 2022 at 4:38 PM Duoming Zhou <duoming@zju.edu.cn> wrote:
>
> There are UAF bugs caused by rose_t0timer_expiry(). The
> root cause is that del_timer() could not stop the timer
> handler that is running and there is no synchronization.
> One of the race conditions is shown below:
>
>     (thread 1)             |        (thread 2)
>                            | rose_device_event
>                            |   rose_rt_device_down
>                            |     rose_remove_neigh
> rose_t0timer_expiry        |       rose_stop_t0timer(rose_neigh)
>   ...                      |         del_timer(&neigh->t0timer)
>                            |         kfree(rose_neigh) //[1]FREE
>   neigh->dce_mode //[2]USE |
>
> The rose_neigh is deallocated in position [1] and use in
> position [2].
>
> The crash trace triggered by POC is like below:
>
> BUG: KASAN: use-after-free in expire_timers+0x144/0x320
> Write of size 8 at addr ffff888009b19658 by task swapper/0/0
> ...
> Call Trace:
>  <IRQ>
>  dump_stack_lvl+0xbf/0xee
>  print_address_description+0x7b/0x440
>  print_report+0x101/0x230
>  ? expire_timers+0x144/0x320
>  kasan_report+0xed/0x120
>  ? expire_timers+0x144/0x320
>  expire_timers+0x144/0x320
>  __run_timers+0x3ff/0x4d0
>  run_timer_softirq+0x41/0x80
>  __do_softirq+0x233/0x544
>  ...
>
> This patch changes del_timer() in rose_stop_t0timer() and
> rose_stop_ftimer() to del_timer_sync() in order that the
> timer handler could be finished before the resources such as
> rose_neigh and so on are deallocated. As a result, the UAF
> bugs could be mitigated.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  net/rose/rose_link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> index 8b96a56d3a4..9734d1264de 100644
> --- a/net/rose/rose_link.c
> +++ b/net/rose/rose_link.c
> @@ -54,12 +54,12 @@ static void rose_start_t0timer(struct rose_neigh *neigh)
>
>  void rose_stop_ftimer(struct rose_neigh *neigh)
>  {
> -       del_timer(&neigh->ftimer);
> +       del_timer_sync(&neigh->ftimer);
>  }

Are you sure this is safe ?

del_timer_sync() could hang if the caller holds a lock that the timer
function would need to acquire.



>
>  void rose_stop_t0timer(struct rose_neigh *neigh)
>  {
> -       del_timer(&neigh->t0timer);
> +       del_timer_sync(&neigh->t0timer);
>  }

Same here, please explain why it is safe.

>
>  int rose_ftimer_running(struct rose_neigh *neigh)
> --
> 2.17.1
>
