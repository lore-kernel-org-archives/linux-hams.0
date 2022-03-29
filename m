From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net 0/2] Fix UAF bugs caused by ax25_release()
Date: Tue, 29 Mar 2022 08:50:11 +0000
Message-ID: <164854381180.32009.1756665388491287782.git-patchwork-notify@kernel.org>
References: <cover.1648472006.git.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648543812;
        bh=dlBuGuUnOKTfSTpEd5whjluEjge0pFJX6fOgYdNnCnA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uug9glEPY/1EA0plVvFdzTlF7Mcc2WgxxIn5h0FRSRjsS6v9KE2CJkxwI7ujzhK4K
         YlMiBEHMutwAFcnuqXQku79yw27Mo2ebzXwf5GsW6b8GF15Ypphm0hIN05D8tFWxfY
         bH/kZ/Lq9rAJ3lIdkMGEJ/YeGc/HfRbkGG24UUTta10HonQoBX09M6cLIBhJEPAz8X
         UzrWg3XnA97cGhmgbTAL0zMXq2e9539L3a8ZKNFkDm6OP1xGt28NE0znwEfv71BF6d
         qxtq9Vj1oyvWBp91vGQKZ/GRGwI5Ffwu/LCWReIa2U0eRUgBpBGhiXrir9qzQscqXQ
         +REQdu8xDntCA==
In-Reply-To: <cover.1648472006.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, dan.carpenter@oracle.com

Hello:

This series was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 28 Mar 2022 21:00:13 +0800 you wrote:
> The first patch fixes UAF bugs in ax25_send_control, and
> the second patch fixes UAF bugs in ax25 timers.
> 
> Duoming Zhou (2):
>   ax25: fix UAF bug in ax25_send_control()
>   ax25: Fix UAF bugs in ax25 timers
> 
> [...]

Here is the summary with links:
  - [net,1/2,V2] ax25: fix UAF bug in ax25_send_control()
    https://git.kernel.org/netdev/net/c/5352a7613083
  - [net,2/2] ax25: Fix UAF bugs in ax25 timers
    https://git.kernel.org/netdev/net/c/82e31755e55f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


