From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH 0/2] ax25: fix NPD and UAF bugs when detaching ax25 device
Date: Fri, 28 Jan 2022 15:10:11 +0000
Message-ID: <164338261149.2420.16351407833253880236.git-patchwork-notify@kernel.org>
References: <cover.1643343397.git.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643382611;
        bh=upUbrLfCOw1Vh49+BWsrSMrdEFkeqSF7qD5m4/nErbE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=f40k58h+NqKXYK97fudU+SvGvOU2UCg79e7tCoGp4zuokN3COhljw/VHXZX/AGjh+
         L8pLlaRxIhwoFD/IqZLwh6spSXii6r77FrvEqUa9qslSPr6gpti/qZXBI2dFvgzd7Z
         7Os/M0rr1U/uoUNHg5UosNCGfErfemp6rdBN5svTbdRud/6GzDa7wuDkNKIHlHRSBm
         aw8CnEGJ5D0mgghBzcY8R8NZRmelVkvHq+5NdY3Rj+LAyQN0qOSbaLhaGZ/sqlEGc2
         WgTi6Ha2WYCDPL5HxK+jVRSc4a9aGaDrH2lzKmSEWbJyCrbKN1iKcOiSMY83Wf3g6t
         lL+y4oOyyTHpQ==
In-Reply-To: <cover.1643343397.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 28 Jan 2022 12:47:14 +0800 you wrote:
> There are NPD and UAF bugs when detaching ax25 device, we
> use lock and refcount to mitigate these bugs.
> 
> Duoming Zhou (2):
>   ax25: improve the incomplete fix to avoid UAF and NPD bugs
>   ax25: add refcount in ax25_dev to avoid UAF bugs
> 
> [...]

Here is the summary with links:
  - [1/2] ax25: improve the incomplete fix to avoid UAF and NPD bugs
    https://git.kernel.org/netdev/net/c/4e0f718daf97
  - [2/2] ax25: add refcount in ax25_dev to avoid UAF bugs
    https://git.kernel.org/netdev/net/c/d01ffb9eee4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


