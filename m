From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] netrom: fix copying in user data in nr_setsockopt
Date: Tue, 04 Jan 2022 12:40:10 +0000
Message-ID: <164130001057.24992.16411426784038058921.git-patchwork-notify@kernel.org>
References: <20220104092126.172508-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641300010;
        bh=E1qmSjqC/aHssBJwzDrvVpd10JpyZ01jMBr+08BO3Sc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HbvAfqFJERRXpyJN1K+xs9iXFkWM0Ob+nCmCNFmc/3apPzPcyHCfEC+ooTUtjOji3
         /OVp6GQmVH/niyzfUfUAM+hitBwvgLGOh+lprX5H2Nz0oRbFlAGmiz+ouKhgVerwta
         BTGSj0k+gCNYKtzFdSHWZ1X5uuvgP3P6lmDnQQg8vbaXq4kgeTz3yWDrmVtle3CRpA
         f9AjujCbjG/Td8X9UZ6KZYOGpgXXlo0LP9utVYONMenpktZv6G6+4CTB3//j+aege8
         vIAxlaNhbd9nTNx+z9incKWiQYuQ0VCGDaapu1mW8S33u49K+2vPn5PtF16fLXIFmu
         eNbt3w8wYCWsw==
In-Reply-To: <20220104092126.172508-1-hch@lst.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, dan.carpenter@oracle.com

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  4 Jan 2022 10:21:26 +0100 you wrote:
> This code used to copy in an unsigned long worth of data before
> the sockptr_t conversion, so restore that.
> 
> Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> [...]

Here is the summary with links:
  - netrom: fix copying in user data in nr_setsockopt
    https://git.kernel.org/netdev/net/c/3087a6f36ee0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


