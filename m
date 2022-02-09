From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] ax25: fix UAF bugs of net_device caused by rebinding
 operation
Date: Wed, 09 Feb 2022 13:40:09 +0000
Message-ID: <164441400990.27404.8523744997637933787.git-patchwork-notify@kernel.org>
References: <20220209125345.86638-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644414010;
        bh=HWEAu+STtdRsqLfSf1qNlMrv6jFrO1gMU5XBn5i6RLM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BqSgcWOahL5we71RfYJADvXO0jnL6vdCKetpXzrv2GJQZvJdq3nrG3TABO8Dg2lLP
         0ZfsVhh+g8ir3mY443Tr/wZ0EPhumQcQoNQ+eSWrYy6w9Dm63M/v3g/0iGNiqxMV21
         oLB/zIu2rFYTGmuLeVmuZdIz8JFkWEsHeYiKpazQpGlGUAkzgCKNKZFU36W2fJXs9y
         L81InoH2fygLyCmUKsY60QYJ1Iy1ZqJliDC/baNH4iltg5pGbo8plW8arc6J6nSlQW
         //a9nkS7HNW5rVkigjWSHsKiuD4ilDa3V0t2EHc51qxiZd3hxOlUJfVWT5aPmPK+Hq
         WlVVktos7O0rA==
In-Reply-To: <20220209125345.86638-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, dan.carpenter@oracle.com, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed,  9 Feb 2022 20:53:45 +0800 you wrote:
> The ax25_kill_by_device() will set s->ax25_dev = NULL and
> call ax25_disconnect() to change states of ax25_cb and
> sock, if we call ax25_bind() before ax25_kill_by_device().
> 
> However, if we call ax25_bind() again between the window of
> ax25_kill_by_device() and ax25_dev_device_down(), the values
> and states changed by ax25_kill_by_device() will be reassigned.
> 
> [...]

Here is the summary with links:
  - ax25: fix UAF bugs of net_device caused by rebinding operation
    https://git.kernel.org/netdev/net/c/feef318c855a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


