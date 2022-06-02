From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net v5] ax25: Fix ax25 session cleanup problems
Date: Thu, 02 Jun 2022 09:00:12 +0000
Message-ID: <165416041295.6334.1196583658510604194.git-patchwork-notify@kernel.org>
References: <20220530152158.108619-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654160413;
        bh=6NQyQsEyYucHVOkZbLnJ7urn0m0WnyT2Zt9bDJz9iLk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=R2753QVItjwhML4hrwNDUHP17Wgs1oqlCqs953uQQjJew6LjcgqHcHsWNPIAn2K/q
         UJ6DnNkLJgj+rcnaVng5AxtMFIEIp39U6aHPmfGnBVG+WvKcR0jxABzIMg07ON3NjM
         Xwm9isntYdxK9sUHgF4aL/9sNgVZH8LkWDBV9dMyojn1WlopJGGgple9tFvkqsgwK8
         bAHb7GI1nPq/CgtYDu2ERfEyrICsTOOc4iO9z7bOCLCUPJfHpo6F0yNZ+TX4k9ZGJ2
         afRBwHO0xma2WtRMrfsOn5XR3UIXy5oOr4Lv20nyp9HXEtit7dY2S5GuPII5eadUkR
         5UgBC5c+w7dRw==
In-Reply-To: <20220530152158.108619-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, thomas@osterried.de

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 30 May 2022 23:21:58 +0800 you wrote:
> There are session cleanup problems in ax25_release() and
> ax25_disconnect(). If we setup a session and then disconnect,
> the disconnected session is still in "LISTENING" state that
> is shown below.
> 
> Active AX.25 sockets
> Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
> DL9SAU-4   DL9SAU-3   ???     LISTENING    000/000  0       0
> DL9SAU-3   DL9SAU-4   ???     LISTENING    000/000  0       0
> 
> [...]

Here is the summary with links:
  - [net,v5] ax25: Fix ax25 session cleanup problems
    https://git.kernel.org/netdev/net/c/7d8a3a477b3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


