From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net] ax25: uninitialized variable in ax25_setsockopt()
Date: Fri, 07 Jan 2022 14:20:10 +0000
Message-ID: <164156521031.21832.2063678868639107574.git-patchwork-notify@kernel.org>
References: <20220107071312.GB22086@kili>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641565210;
        bh=8ArphtMs5lHlkG3KGagptlon8x0XX0zifyrk+uhpTVI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GoFSHisj/ZHjeUEdZ6l+HgWeaayeO7lOVRbmRqTi+t14HkH+jp7DFX+RVX0k0shGv
         Xfm9+rWbuQWdHD8GyhXG2V/bkZCRDuF3aDR4aO/mpkdVehpiwHSuUuNL3VYEnGgvJ4
         n9mHraUyMIvfaqWGRZo1c3Sa00OutwRka40PtZUaj/hGvXseDtYq2Vs6tUDb06+X2K
         x5LnJ3TM+OlrYTQ3LbNBNtVf4w8zW/jhhXPDE3/IIdv7/bTSAHdbuSoRLXERaswpjz
         C36LF3utcjSORC55O7CpwBYARi8i4NKwNJwVnoKOSrEPmmM9N/ASjhePmbolYVkqtS
         RtN4MRM7jX0rg==
In-Reply-To: <20220107071312.GB22086@kili>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: jreuter@yaina.de, hch@lst.de, ralf@linux-mips.org, stefan@datenfreihafen.org, matthieu.baerts@tessares.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 7 Jan 2022 10:13:12 +0300 you wrote:
> The "opt" variable is unsigned long but we only copy 4 bytes from
> the user so the lower 4 bytes are uninitialized.
> 
> I have changed the integer overflow checks from ULONG to UINT as well.
> This is a slight API change but I don't expect it to break anything.
> 
> Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net] ax25: uninitialized variable in ax25_setsockopt()
    https://git.kernel.org/netdev/net/c/9371937092d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


