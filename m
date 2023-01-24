From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v1 net] netrom: Fix use-after-free of a listening socket.
Date: Tue, 24 Jan 2023 11:30:16 +0000
Message-ID: <167455981697.20043.16136032100144497483.git-patchwork-notify@kernel.org>
References: <20230120231927.51711-1-kuniyu@amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674559817;
        bh=aqhPfNSJCvE036s6Wn2GGUEN9lsdj/GZC1YsIBumS5I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L1idvWTcUBmh23SXhVrnoiet6k2ooLpcjlrhNPTkw0Ae1Q4+7IZTS0x9hhFeNeGre
         doqfT2Zp4WazZNhLZJkMm89vOkVzza8z9Xu1SzeeBLwgoxcveeGcAegFQJIbpm+cds
         yK5fFekSRShMgowtuOi2XgCtR8WbFr2KrSBrA4pxwK3NCTpbCLOldWFGeUbZlTReee
         ulkWMJ6ejsWk7hakN6DnnKfBsszrQZcr/FhQ/GdE7NIyJk158yn6Kni2MXDnJyT9rv
         Nem1S/q5nX8s1ulL3NxFK9XH1S64QTk1pUy5bjtGhCJClxv0RrD05qRKcWCF7JrRVa
         izvn5QcIu1A2g==
In-Reply-To: <20230120231927.51711-1-kuniyu@amazon.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, phind.uet@gmail.com, kuni1840@gmail.com, netdev@vger.kernel.org, linux-hams@vger.kernel.org, syzbot+5fafd5cfe1fc91f6b352@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 20 Jan 2023 15:19:27 -0800 you wrote:
> syzbot reported a use-after-free in do_accept(), precisely nr_accept()
> as sk_prot_alloc() allocated the memory and sock_put() frees it. [0]
> 
> The issue could happen if the heartbeat timer is fired and
> nr_heartbeat_expiry() calls nr_destroy_socket(), where a socket
> has SOCK_DESTROY or a listening socket has SOCK_DEAD.
> 
> [...]

Here is the summary with links:
  - [v1,net] netrom: Fix use-after-free of a listening socket.
    https://git.kernel.org/netdev/net/c/409db27e3a2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


