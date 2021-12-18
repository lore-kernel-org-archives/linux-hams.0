From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v0] ax25: NPD bug when detaching AX25 device
Date: Sat, 18 Dec 2021 12:40:10 +0000
Message-ID: <163983121017.1461.2630742040562872080.git-patchwork-notify@kernel.org>
References: <20211217022941.27901-1-linma@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639831210;
        bh=FFGB3RVCB4aGnm21eSkJPuLKnXWaHQmdFoXWAE6bFbY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MbCre2X9znaR5kVnA1IqQx5PI1if92J3Cs5WBC6MPztINXd/dUPHSp5iYZckgMGTC
         0RkzsNpBw5os7Y/NoKZ1C4H7s3PyiGiPeXmlDFFPdkCQSQ20NrxvNLT0BaTpwFtaSk
         68FHDrNrHiTW2qp7BxnhrrULXAHwAS5MDcmAhwH2LZCKg3vjIcRK4aV8Y5kyGEzPNF
         XhAYN6rDuWeSlzh+fdrnyma8YgKntbvF1zTfS3kvhq5makB3/WWPm1g3YUHRcb0LEP
         onFgLBW+OP9vTTdEQCriufLgNPbWsFqKvQwScoZp28Hh/rxkyxpLYNG4LiQ+71qrzl
         6Hhcfe8xTYTUg==
In-Reply-To: <20211217022941.27901-1-linma@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lin Ma <linma@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, nagi@zju.edu.cn

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 17 Dec 2021 10:29:41 +0800 you wrote:
> The existing cleanup routine implementation is not well synchronized
> with the syscall routine. When a device is detaching, below race could
> occur.
> 
> static int ax25_sendmsg(...) {
>   ...
>   lock_sock()
>   ax25 = sk_to_ax25(sk);
>   if (ax25->ax25_dev == NULL) // CHECK
>   ...
>   ax25_queue_xmit(skb, ax25->ax25_dev->dev); // USE
>   ...
> }
> 
> [...]

Here is the summary with links:
  - [v0] ax25: NPD bug when detaching AX25 device
    https://git.kernel.org/netdev/net/c/1ade48d0c27d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


