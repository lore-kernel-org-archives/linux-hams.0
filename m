From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v3 RESEND] net: rose: fix UAF bugs caused by timer handler
Date: Thu, 30 Jun 2022 09:40:12 +0000
Message-ID: <165658201299.18643.15753400397215370488.git-patchwork-notify@kernel.org>
References: <20220629002640.5693-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656582013;
        bh=RY4c7Pum0yD/rlWNWuPghL/24LB9E8YULvxz3Jn4vsA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=T0VlJwQJ3Dt59UgcmGhcz+EZl+yiCOCupLsKaZoV8A10tZvI3Qh7c77/lrSQ/uxGR
         tTtAnreuB3Uzgf7up8qNa8BMVxc650SfqBTHZ+f5qZ66UPJaeuJ0RN43sxrIs8oS4A
         ZJNN9Zbob2AoVslMcyXCfl4HjWZcaY9+5OERTO/7nqmUd9x7t73F1mCP0T1WVKnF3q
         yeeIJ+EMy6mzr5u7tFG1q1P7tNkbN34BAS782HN0KJcc4NqC6W9803J8BhKhZuMx67
         PHFGKG6tsP9OwXPdbKlgQ6YDNt5Inxn5SOIlHLDwYJMA0Q/sdFeHohuMN62BG4Izju
         6nNt74+Y3sjKA==
In-Reply-To: <20220629002640.5693-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net, ralf@linux-mips.org

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 29 Jun 2022 08:26:40 +0800 you wrote:
> There are UAF bugs in rose_heartbeat_expiry(), rose_timer_expiry()
> and rose_idletimer_expiry(). The root cause is that del_timer()
> could not stop the timer handler that is running and the refcount
> of sock is not managed properly.
> 
> One of the UAF bugs is shown below:
> 
> [...]

Here is the summary with links:
  - [v3,RESEND] net: rose: fix UAF bugs caused by timer handler
    https://git.kernel.org/netdev/net/c/9cc02ede6962

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


