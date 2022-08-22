From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v2 net 1/1] rose: check NULL rose_loopback_neigh->loopback
Date: Mon, 22 Aug 2022 13:30:14 +0000
Message-ID: <166117501433.5977.6208963641259789772.git-patchwork-notify@kernel.org>
References: <Yv2BhXInteHP7eJm@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661175014;
        bh=Br3dFwFRKh/ahgdNc3tJhfg8BpRtaS6hl84zqsj1IYg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uwG4falmfE+b83C+0Kk7MSK4UDH0aIctQdfs/EFkJ4PfZq4B1mry3qI3ypJopg7vk
         rpES1nCLFjbW0Q1scF8OqP6uUGAvBvIWxUMgjZ63JmAxHiywNTmfBsHV3nzEjFAYKd
         L6adaW/YBCWBJpYUDK4cvFG5q8i5lcIuvFgYbSMEsru5pRoCK80pkE1HJJWBS/W2Nw
         lsY85GJh5w007sG4JKcHzvkINWIlcf6dHVNQSs8v9VULQqr7m9/yqdP5jYAeCaN1xb
         jIMUpyC9wqYVB4EVSG3pajzzGeMUTRZxpK280JQqTNS04vmuJupDEKairtTTFyGlGb
         bYKx62hp3RZog==
In-Reply-To: <Yv2BhXInteHP7eJm@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, bernard.f6bvp@gmail.com, f6bvp@free.fr, thomas@osterried.de, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, edumazet@google.com

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 18 Aug 2022 02:02:13 +0200 you wrote:
> From: Bernard Pidoux <f6bvp@free.fr>
> 
> Commit 3b3fd068c56e3fbea30090859216a368398e39bf added NULL check for
> `rose_loopback_neigh->dev` in rose_loopback_timer() but omitted to
> check rose_loopback_neigh->loopback.
> 
> It thus prevents *all* rose connect.
> 
> [...]

Here is the summary with links:
  - [v2,net,1/1] rose: check NULL rose_loopback_neigh->loopback
    https://git.kernel.org/netdev/net/c/3c53cd65dece

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


