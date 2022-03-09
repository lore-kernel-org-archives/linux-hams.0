From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] ax25: Fix NULL pointer dereference in ax25_kill_by_device
Date: Wed, 09 Mar 2022 12:50:10 +0000
Message-ID: <164683021074.2371.639793018206811147.git-patchwork-notify@kernel.org>
References: <20220308081223.15919-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646830210;
        bh=I6ozOdglKxYbxHYFDFEkcL7osJhYjFDadHAfNPgMPFI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cGlkfYnpR/eAABCt2nS59oAeCyM60fcONQKj7SwKoaBj4ZNcyfKL8KcNY/qQceRpM
         C5RuSyJIxuC0NUVTCwJCsYrBJKFaBNRznFtoxt35vKJXC9FlFInaxj4yZCDgbvwyM/
         cTBO0hMp7SljK1ODE6OiYBSj6AcJ+HSczZD7QOxF2+M3vgFWxVOsA9nqqTdSfpjed1
         mJCfUUmiFC6m8Wfsj5OoLGBiXkB/DYwcOsBcojfWS7ZzEQ2e4Be1Cjg8ay0J6brBG6
         SoUJoBpgofDL/HZgfdhg2SmV2KxUacWKQluWVkkQYB3sh+ynNh4ZN9btkZ8GRQlLE3
         pIBuSbIIegs9w==
In-Reply-To: <20220308081223.15919-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  8 Mar 2022 16:12:23 +0800 you wrote:
> When two ax25 devices attempted to establish connection, the requester use ax25_create(),
> ax25_bind() and ax25_connect() to initiate connection. The receiver use ax25_rcv() to
> accept connection and use ax25_create_cb() in ax25_rcv() to create ax25_cb, but the
> ax25_cb->sk is NULL. When the receiver is detaching, a NULL pointer dereference bug
> caused by sock_hold(sk) in ax25_kill_by_device() will happen. The corresponding
> fail log is shown below:
> 
> [...]

Here is the summary with links:
  - ax25: Fix NULL pointer dereference in ax25_kill_by_device
    https://git.kernel.org/netdev/net/c/71171ac8eb34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


