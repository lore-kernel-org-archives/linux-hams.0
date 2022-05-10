From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] [NET] ROSE: Remove unused code and clean up some inconsistent
 indenting
Date: Tue, 10 May 2022 00:30:14 +0000
Message-ID: <165214261440.23610.14293636513999790192.git-patchwork-notify@kernel.org>
References: <20220507034207.18651-1-jiapeng.chong@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652142614;
        bh=VKqlSpMwsrf8kmGASDW+ONiJ1G6G8fKLEvEmo94TDJU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tDdv3+rwe99pTbx81NayFxAV9v/36UDmSr2muzVCGswqWPl04YsvEPWc6VpN5+3H/
         HpGa2rHfalgrZorUC+57W7UFX9PpW+cg6gECqR3gCiJvSJsFaUDoZ99ZrSCAMeOC3D
         crcYd4AiErK+MQKvzga8SZqW91x2FskDm+osnS1I+VUgt7YSEgG224FeW9QM3D80HA
         58zRuUxcV+Vk/LWJ6q6LT/vZn1orLUE8jqFCEjXnUdYZN0udwAbco9bPgzbK6Bq/Un
         px0zq6ijB8n4rTuNt3KJ3jk8jzpxs4qDLaJQKOkc634EscON33g7RmZIrKPJO2Ci5l
         UghSn82CTMqMQ==
In-Reply-To: <20220507034207.18651-1-jiapeng.chong@linux.alibaba.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, abaci@linux.alibaba.com

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  7 May 2022 11:42:07 +0800 you wrote:
> Eliminate the follow smatch warning:
> 
> net/rose/rose_route.c:1136 rose_node_show() warn: inconsistent
> indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - [NET] ROSE: Remove unused code and clean up some inconsistent indenting
    https://git.kernel.org/netdev/net-next/c/eef0dc7e517e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


