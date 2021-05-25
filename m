From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] net/hamradio/6pack: Fix inconsistent indenting
Date: Tue, 25 May 2021 22:30:11 +0000
Message-ID: <162198181109.18500.6883153906905606285.git-patchwork-notify@kernel.org>
References: <1621940145-70195-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621981811;
        bh=Hoat5UgNb2kQktQ6xl7cU6eQ2/61umKYl6Ml6lQvh4c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y2AlBieAHqNtsRA4VGiQ1lvogO65iwgr9950OFqoI0hebh/GbS9q94yZWuB7k20HS
         NI4gzlywVyO295CM87NfhTRJoVAziy+emsSgJMY4TYd92OfWouFDBzNg52HV7rlvZo
         wHhFbruqotXlXZdr+nOp5dJ44fY+ryiRFuPQW1QkAYR+Xu5RnhbGrNQ1JcJwKTYBh7
         TI6ImlxXCnmFmsJ0SiRR6A18rF5n5Y9WaHfBAim/xtzxqkP92COLqmT3hD+V0Bp7yE
         Ut0jGc1qA1UUz9y0QB51jd1J6dY399Vp3KDBvUzZX+JJhcZvhMh4R1aDAioRvsa6fs
         ++X60OHYji40g==
In-Reply-To: <1621940145-70195-1-git-send-email-jiapeng.chong@linux.alibaba.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 25 May 2021 18:55:45 +0800 you wrote:
> Eliminate the follow smatch warning:
> 
> drivers/net/hamradio/6pack.c:728 sixpack_ioctl() warn: inconsistent
> indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - net/hamradio/6pack: Fix inconsistent indenting
    https://git.kernel.org/netdev/net-next/c/687c87adc11a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


