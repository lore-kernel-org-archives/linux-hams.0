From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH V5 0/2] Fix refcount leak and NPD bugs in ax25
Date: Mon, 21 Mar 2022 11:00:10 +0000
Message-ID: <164786041078.7161.8989814381753324978.git-patchwork-notify@kernel.org>
References: <cover.1647563511.git.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647860410;
        bh=n6qC4hmVpj4wVG8saQK+2Vx0mlcjl2MotPLnb9j2Ah4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=e9jjBk/m4GcECe2Y/ELBhccRNWRsggoHb9n/NvAs8SdSKbjwLgU4xAtBnWR7jb2Z5
         ZsJin8g4vLzmxXAFKL1/ugRQdXiOauwKfjhdGjx/+n8P/jGcsXYpaJVdwc70GGhyXp
         8nQ8U7w3EhsIqdaeyHA83+eAxi2qUHsGCA2O1MOPtrErBFDNs3B1F0CauGH1eLm4x4
         PC8tPELsAwIulIaqylAHHvSsh//ZVf9He70DXExzhoXGV6SJcjjBnr8RRE8zaIDreG
         1tkMlK20Oz4pFYkS0bN+VSHrQH+sNYpVscu6mTe44NR/qvlmry0bbfTq3qHf9rapDH
         F02hvaR8vsjBA==
In-Reply-To: <cover.1647563511.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, eric.dumazet@gmail.com, dan.carpenter@oracle.com

Hello:

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 18 Mar 2022 08:54:03 +0800 you wrote:
> The first patch fixes refcount leak in ax25 that could cause
> ax25-ex-connected-session-now-listening-state-bug.
> 
> The second patch fixes NPD bugs in ax25 timers.
> 
> Duoming Zhou (2):
>   ax25: Fix refcount leaks caused by ax25_cb_del()
>   ax25: Fix NULL pointer dereferences in ax25 timers
> 
> [...]

Here is the summary with links:
  - [V5,1/2] ax25: Fix refcount leaks caused by ax25_cb_del()
    https://git.kernel.org/netdev/net/c/9fd75b66b8f6
  - [V6,2/2] ax25: Fix NULL pointer dereferences in ax25 timers
    https://git.kernel.org/netdev/net/c/fc6d01ff9ef0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


