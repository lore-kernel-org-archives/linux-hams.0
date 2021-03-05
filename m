From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] net/hamradio/6pack: remove redundant check in sp_encaps()
Date: Fri, 05 Mar 2021 21:10:09 +0000
Message-ID: <161497860934.24588.18272207864656241633.git-patchwork-notify@kernel.org>
References: <20210305162622.67993-1-efremov@linux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614978609;
        bh=MhaNOUG9C8mNaglH6NiBaYfSD1D026SBkCEvk86ZE4w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tO7X0rTMg0D2avoUDTt2mTUHPwJ9I9x1PGU/IRCBFsuO3M++XsR4PtXWLhuLpneWk
         I5usBcsihTB2NckvsKqcfXzgdLKI2RON1wr6MYSPbRXKHpMzZXlOM2+T3xEX42/wFi
         qpmQP4PeqNKyw6wGgC7khCit7CJChB8p5NwUSDwAxjDJMXSzefyhMZ3lSiQNevBSzu
         Eii6Vt6ZGs/KfDuRECTeCamOxOdFAWW0AbQ+Kycxn4rDgSrf6ueeUjhi54M+DKaCIZ
         SLNp7U3Zkzh1MVyU5VF9STWFLadmMj+3kCFlM3a39v4LMu591xtpZWMAPZEZtwqsyO
         cYolyPDr50iIg==
In-Reply-To: <20210305162622.67993-1-efremov@linux.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Efremov <efremov@linux.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri,  5 Mar 2021 19:26:22 +0300 you wrote:
> "len > sp->mtu" checked twice in a row in sp_encaps().
> Remove the second check.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  drivers/net/hamradio/6pack.c | 5 -----
>  1 file changed, 5 deletions(-)

Here is the summary with links:
  - net/hamradio/6pack: remove redundant check in sp_encaps()
    https://git.kernel.org/netdev/net/c/85554bcd123e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


