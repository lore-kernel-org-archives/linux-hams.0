From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net v2] net: rose: fix UAF bug caused by rose_t0timer_expiry
Date: Thu, 07 Jul 2022 03:00:13 +0000
Message-ID: <165716281344.11165.3540358551022288195.git-patchwork-notify@kernel.org>
References: <20220705125610.77971-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657162813;
        bh=N8b8Kgo3TvZmFgrWYY3ovqkpBeOo6ywQTI9gO+NvEcI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DYo65RSKuCA308SwdH4IS29/zn5qkE/oeVaqJUNnCyepBLgX4fyYSRZ08pJORE3iq
         XN6bn5MlDIAhE2SAURtNVGix1erky5naN9BYVUee+BSF+dzcUm/D0l1Aa//8Vj3l80
         W/tSUvXK0bfLxlh9tp+1luFwK6Iz6SFOeMItwneLSm+O+va/AwXxOUWwAWX38q54Rf
         KhnR5ApY7PksUeJy8GLzeEIplzlW5MNmNV95UhWmPGUQTreHdUjyuSKl081QSwd5+i
         K4Ai8GrmyR5bKBPMjuBBps0BGJhW+rAqvryQMYLHnFc3+ZUD7fnGIv/99Ogo8eGMHy
         YoAlLlMveOlPA==
In-Reply-To: <20220705125610.77971-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  5 Jul 2022 20:56:10 +0800 you wrote:
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
> [...]

Here is the summary with links:
  - [net,v2] net: rose: fix UAF bug caused by rose_t0timer_expiry
    https://git.kernel.org/netdev/net/c/148ca0451807

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


