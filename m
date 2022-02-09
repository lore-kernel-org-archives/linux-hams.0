From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] ax25: fix NPD bug in ax25_disconnect
Date: Wed, 09 Feb 2022 12:00:09 +0000
Message-ID: <164440800978.11178.6673926020768387853.git-patchwork-notify@kernel.org>
References: <20220208154000.87070-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644408009;
        bh=Fm5+OJPUurlyd7zM2elkix6JLbemo3kzsfDEOCIzb3M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mpF+E9eYevoGovtKDFnbVlmrwB6o2q6FiQ5qpxfosH+GHDDI1ivcTvfExOejGSEE/
         /MzxJOC5pExDuNgtg7LIlTm3RkAhzv5qYUCL4+Nb5jqEmO+5lIu/3VyjATXwjB9r1i
         Lk6e/g11nUfsgAgIz0zmHYk2lx3LilfyyvReqavCqDPeRx7VXwOI/MCbYoIIlkn+Yu
         EyZeLwcR6w6ClWnLE11s2uZVQRbc5sv1DeDw3SGza85pepZ/Wdf5ox0D9qmCzXdt+A
         Cxuqyn+AQSuMe4eYhX2PQEtq7DTMjyyFXHwiDxJPirWeEvVLa2hyx068W42Kr7MkwM
         ochffalcGUBfA==
In-Reply-To: <20220208154000.87070-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  8 Feb 2022 23:40:00 +0800 you wrote:
> The ax25_disconnect() in ax25_kill_by_device() is not
> protected by any locks, thus there is a race condition
> between ax25_disconnect() and ax25_destroy_socket().
> when ax25->sk is assigned as NULL by ax25_destroy_socket(),
> a NULL pointer dereference bug will occur if site (1) or (2)
> dereferences ax25->sk.
> 
> [...]

Here is the summary with links:
  - ax25: fix NPD bug in ax25_disconnect
    https://git.kernel.org/netdev/net/c/7ec02f5ac8a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


