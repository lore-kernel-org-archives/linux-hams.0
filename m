From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] yam: fix a memory leak in yam_siocdevprivate()
Date: Tue, 25 Jan 2022 16:46:14 +0000
Message-ID: <164312917410.15904.16284523460013653550.git-patchwork-notify@kernel.org>
References: <20220124032954.18283-1-hbh25y@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643129174;
        bh=lWUX+M/m5LBPUZVAosLkpl2CMXtqXfCRE6ggsbUarCk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Go7wfveBOvEByjFtpvgQX0vWqUpDDAnLWtFVaPVb2A9O95uDe8asBb5ENTb27yJB/
         s7Yn5JL5i4vRnyzpLMRlsWeSi3dtZ/wq1KMshaK23UBHogsKXt2pvCyVhJsb2dhZdV
         3J090yq/zTkmJ3uAZWJdnmU+ZhRs2XmHprSYcBixxl89eahUpEgepjGamjad+kkwMi
         9y4FrbCd+MN4GdI1XpIN27vXcJIzsONUaum8ypGhMs0hoX4itnDPZuaGfMb6DQRSWI
         /CrRl3d/HFD7pm0e9vWYSXcvGf/BQ8YcOMQ9G28ru5Odv+5rX1u8GjP2SHkrPM9wHS
         p0vtjoEXW/iqw==
In-Reply-To: <20220124032954.18283-1-hbh25y@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hangyu Hua <hbh25y@gmail.com>
Cc: jpr@f6fbb.org, davem@davemloft.net, kuba@kernel.org, wang6495@umn.edu, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 24 Jan 2022 11:29:54 +0800 you wrote:
> ym needs to be free when ym->cmd != SIOCYAMSMCS.
> 
> Fixes: 0781168e23a2 ("yam: fix a missing-check bug")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/net/hamradio/yam.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Here is the summary with links:
  - yam: fix a memory leak in yam_siocdevprivate()
    https://git.kernel.org/netdev/net/c/29eb31542787

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


