From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net-next] net: rename reference+tracking helpers
Date: Fri, 10 Jun 2022 05:40:16 +0000
Message-ID: <165483961628.13976.4015696054691394649.git-patchwork-notify@kernel.org>
References: <20220608043955.919359-1-kuba@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654839616;
        bh=piL3ZUsVXKLpnDEjDM8fV8VxAK87PAtjngdGcTceFhY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bZlgtvihg6Vva7Kcpfx4fg9/usXpMClwd3MBNr+K2bi2LwFBFb5/wrYpE+o7N87GF
         T1TaIW+pKzzeRD3sxEhbrfRUIXam5v1vdqzUIgLyv+LQX1XPtMuncB47k3Z6Jc7gZa
         pRU8fbeMk7mxFKPkHUJbfr+hzd5WNI+O33NtHY9M+btwu7612BWtjKvvuq74tT5FGe
         olAyOzF33iMacLoGp9NE9GwoKdG8rjE6Pr1inP5X8Djsd7jfFyMr7JrJf/2BtZMx7C
         QrKzFFnqDCQq+LkM3Dp6pe/QtVNa9OIw1esqaEWeShyzWgcllt/Mh9Ps9DCHy//J0B
         F1PY32q+dUGBw==
In-Reply-To: <20220608043955.919359-1-kuba@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, dsahern@kernel.org, steffen.klassert@secunet.com, jreuter@yaina.de, razor@blackwall.org, jiri@resnulli.us, kgraul@linux.ibm.com, ivecera@redhat.com, jmaloy@redhat.com, ying.xue@windriver.com, lucien.xin@gmail.com, arnd@arndb.de, yajun.deng@linux.dev, atenart@kernel.org, richardsonnick@google.com, hkallweit1@gmail.com, linux-hams@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org, tipc-discussion@lists.sourceforge.net

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  7 Jun 2022 21:39:55 -0700 you wrote:
> Netdev reference helpers have a dev_ prefix for historic
> reasons. Renaming the old helpers would be too much churn
> but we can rename the tracking ones which are relatively
> recent and should be the default for new code.
> 
> Rename:
>  dev_hold_track()    -> netdev_hold()
>  dev_put_track()     -> netdev_put()
>  dev_replace_track() -> netdev_ref_replace()
> 
> [...]

Here is the summary with links:
  - [net-next] net: rename reference+tracking helpers
    https://git.kernel.org/netdev/net-next/c/d62607c3fe45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


