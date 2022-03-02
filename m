From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] net: hamradio: fix compliation error
Date: Wed, 02 Mar 2022 18:00:11 +0000
Message-ID: <164624401128.29389.5358685462275620570.git-patchwork-notify@kernel.org>
References: <1646203277-83159-1-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646244011;
        bh=v/COIc+X+EM2q8D/TuV93XKDdU5ewdBka72ch/RrZP4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=S4PLV395wr0JXJoyENgV2quWokBxSRSK9PNrpotPqwzpBAp14YIFBBJI6DvXl+9o6
         HBIT/bEuTg1PyaCGjuzXYDgGhIc0GtrQHBX/TOMq3ZFmkHE50e9bhiFi5mQQvKrWqn
         l4KgQN4PF7bNs/SWuz4QINPIcC8pGvG4wiWAjF4MueVWzFp7gDR+A7pQOHJXJ1Mvnr
         FnulFn1+QUzXBPf+wGthpLkz2PzI6h9I3aC8yTEZHO50B22rjuS0PhkjH5kTyZ6gH3
         GWsy+VLckeUwWHpNVykN2aIFTJBglml/4vdudb0rzK8+EGhvgda9+Uagm5puPB7+Hk
         s+L7AX+Pte5gg==
In-Reply-To: <1646203277-83159-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Qing Wang <wangqing@vivo.com>
Cc: jreuter@yaina.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  1 Mar 2022 22:41:14 -0800 you wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> add missing ")" which caused by previous commit.
> 
> Link: https://lore.kernel.org/all/1646018012-61129-1-git-send-email-wangqing@vivo.com/
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> 
> [...]

Here is the summary with links:
  - net: hamradio: fix compliation error
    https://git.kernel.org/netdev/net-next/c/a577223a97df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


