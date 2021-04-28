From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] net: netrom: nr_in: Remove redundant assignment to ns
Date: Wed, 28 Apr 2021 21:10:09 +0000
Message-ID: <161964420989.17892.17707045391606271909.git-patchwork-notify@kernel.org>
References: <1619603885-115604-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619644210;
        bh=nWu+4MC0p0h/TPcQl+GmrsrvoDFvQ6RJs8CvXhH5Iow=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FHJ8ddSaCCfv9aYg5skWf5NEQWvEcs/jQuHd+7MEVVEAbO5szoddX31PlG4u7WoWD
         WRBiltjRlTSaQrxvHnbX2NS4bGKf3vgBjL5k9GMAabGjgReKoXkbCA1I7VOVH13/TV
         IErmYYFp5NImYE+OS8N2NsNLHpMl1naVxY90iXd4pqDsvMwm9pt/v7jepSbdOH+uSq
         ubX4ouT9sdNJdU7acDzY5FrlxGK/j4bMsgAioh1RO/n1Ax+cS/b7qU45FJ9UpdLPOy
         U1VqHCd5EIwUQTZjmSUXmcPFBDLm5fR08WPkI8WK4eZuPBteLSOWGer7IFVcoTaTWE
         dsNTGkmCAfCXg==
In-Reply-To: <1619603885-115604-1-git-send-email-jiapeng.chong@linux.alibaba.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 28 Apr 2021 17:58:05 +0800 you wrote:
> Variable ns is set to 'skb->data[17]' but this value is never read as
> it is overwritten or not used later on, hence it is a redundant
> assignment and can be removed.
> 
> Cleans up the following clang-analyzer warning:
> 
> net/netrom/nr_in.c:156:2: warning: Value stored to 'ns' is never read
> [clang-analyzer-deadcode.DeadStores].
> 
> [...]

Here is the summary with links:
  - net: netrom: nr_in: Remove redundant assignment to ns
    https://git.kernel.org/netdev/net-next/c/15c0a64bfcbc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


