From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH V3] drivers: hamradio: 6pack: fix UAF bug caused by
 mod_timer()
Date: Fri, 18 Feb 2022 11:00:09 +0000
Message-ID: <164518200987.19952.16423799122287139298.git-patchwork-notify@kernel.org>
References: <20220217014303.102986-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645182010;
        bh=KwglRraOwOZOyLVRrYY428yqdeqobp9eallBt0vf47w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ifQQtPSY4h9ByFo7m6Lj86wzl27AaVnW50/hj4q6IbZZyWHhdn5Jpo3cOlrYj+vc/
         9yCWB0LunTBgmZZj2hdX9cT7OQQ/VfMYF62XramxmF78eb3pTVWcIgil9vZlRv7hww
         T6CTMacI2yrhfbmj8F+AMEe9DDIgtXnVPMWQn2CtSiC4KstBfHQ7ZNXtSyOOVYMPPX
         Xv+YsTGl1fSGoZiOYTRIRw0c/lXuwxlcWuQnzSvtPTyYADPBVrPbc0DZ9SwQm1rL+t
         XWu5b9UqGuojhVMerU/PbxjoOwqyoA0O9TrLaY5ivEVq6dN3cUHdAVL5dI3Vs7ADxh
         C6p2I6GkPpIUg==
In-Reply-To: <20220217014303.102986-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?utf-8?b?5ZGo5aSa5piOIDxkdW9taW5nQHpqdS5lZHUuY24+?=@ci.codeaurora.org
Cc: linux-hams@vger.kernel.org, kuba@kernel.org, ajk@comnets.uni-bremen.de, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linma@zju.edu.cn

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 17 Feb 2022 09:43:03 +0800 you wrote:
> When a 6pack device is detaching, the sixpack_close() will act to cleanup
> necessary resources. Although del_timer_sync() in sixpack_close()
> won't return if there is an active timer, one could use mod_timer() in
> sp_xmit_on_air() to wake up timer again by calling userspace syscall such
> as ax25_sendmsg(), ax25_connect() and ax25_ioctl().
> 
> This unexpected waked handler, sp_xmit_on_air(), realizes nothing about
> the undergoing cleanup and may still call pty_write() to use driver layer
> resources that have already been released.
> 
> [...]

Here is the summary with links:
  - [V3] drivers: hamradio: 6pack: fix UAF bug caused by mod_timer()
    https://git.kernel.org/netdev/net/c/efe4186e6a1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


