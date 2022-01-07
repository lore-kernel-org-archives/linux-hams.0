From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net] netrom: fix api breakage in nr_setsockopt()
Date: Fri, 07 Jan 2022 14:20:10 +0000
Message-ID: <164156521023.21832.17160553680833983322.git-patchwork-notify@kernel.org>
References: <20220107071209.GA22086@kili>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641565210;
        bh=2EOzG7oNFW/lw0SW/jsqf0o8yZgPDhMEI/bsIL/aFi4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PjIPfavU1YO/VWl4tZBgZRo2cFIL2w/wwzYWxk2Qos+kbOvB8I+aAkjQEdEBHI+re
         WLHuAAiddq7+A0q+aCGJ87x8b4GUcm7QdtqIbrUKIbk8f7Y5wB8YuHwiERH15z5OxD
         Q3Xhhiy+BYUB5031P0Dwvi5G0YB86o6+xtz2l+2mN5eboNbjTuZ8GALwiCH17BVRoG
         9Onnu5HLotbLA3b8x++h9tu+2n9X5X2+w1SnSV2TEfMneODsekgNyuhI+iRqsfFKmO
         M6FbnQsc92YLkA/DIaHTMjvbe1pyuY7voP8a2O+/Q2iruNu90QHcHGZjAv0paT4xvt
         /ocNj6IU3ut6w==
In-Reply-To: <20220107071209.GA22086@kili>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 7 Jan 2022 10:12:10 +0300 you wrote:
> This needs to copy an unsigned int from user space instead of a long to
> avoid breaking user space with an API change.
> 
> I have updated all the integer overflow checks from ULONG to UINT as
> well.  This is a slight API change but I do not expect it to affect
> anything in real life.
> 
> [...]

Here is the summary with links:
  - [net] netrom: fix api breakage in nr_setsockopt()
    https://git.kernel.org/netdev/net/c/dc35616e6c29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


