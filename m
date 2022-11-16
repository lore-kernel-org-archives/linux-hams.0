From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] ax25: af_ax25: Remove unnecessary (void*) conversions
Date: Wed, 16 Nov 2022 13:40:16 +0000
Message-ID: <166860601617.31330.7738435256770513736.git-patchwork-notify@kernel.org>
References: <20221115021424.3367-1-zeming@nfschina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668606016;
        bh=9ssDzJCVb+IM3Mp3/H+XJ4ZS7rQ6o6pgVr8DoqOYW+Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RnUbzuDV4CahgLZEorZwuO1hUjI0wUxph0m8aE6iuEj/KbG3cEkMSmjydwMFrzAfO
         y3Dwnz9DnKLNMuEfgUKblP+Rjvxpav2hEMTDwYNk96LAslbEhFXd0phGrhZ0cy3fTf
         iXIjA9/unNnNq2GBGf35se5ewNsiPChjWDMiw1jnGoNgxlw+ztwxVfNhppLfukvays
         cxpOdIu/DqHJUiITig3dxWe+ZqzweVOkzLZYW+Uk/u9qzHjJG6Gcp16iiwZ/uJmF42
         Ezs+IOhmMAap4deaz+zLctR4+lG1/vlJSc47+CVvG1XMVw2+l3q4I/uBYTqH/WRD4b
         jfqLuDBR1Jh6w==
In-Reply-To: <20221115021424.3367-1-zeming@nfschina.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Li zeming <zeming@nfschina.com>
Cc: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 15 Nov 2022 10:14:24 +0800 you wrote:
> The valptr pointer is of (void *) type, so other pointers need not be
> forced to assign values to it.
> 
> Signed-off-by: Li zeming <zeming@nfschina.com>
> ---
>  net/ax25/af_ax25.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - ax25: af_ax25: Remove unnecessary (void*) conversions
    https://git.kernel.org/netdev/net-next/c/1d7322f28fde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


