From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] net: hamradio: use time_is_after_jiffies() instead of open
 coding it
Date: Mon, 28 Feb 2022 13:30:59 +0000
Message-ID: <164605505952.13902.7199174306567919754.git-patchwork-notify@kernel.org>
References: <1646018012-61129-1-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646055059;
        bh=055+r7Bv0YKZLvW2yw6sPT6DWnJzO/MTP8OxhUtCSac=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=E584kEgauBkAa3o8F4en2NVEZC4Hk4ZoqFTLbuItRh27GHeySF6/923XzN5UXuP/b
         INGgWhp8e7E/rsaATEq16lh9k+h13PIKyBXqSc+bu7X+lvYKOCxTWeAHGp/feK67T4
         d+BxSZxZAUyAyrKhQxmpkmsR0bTTAvSZQuDjKJ92G+xiCEi4Q1cDjIFGcyzt6qiB5W
         c9s1eCSLXs3P6pdURXzwE1GahI581Ep7y/Ebsck+gBY9ubuRA/e3K9R3XzaDCtFzjd
         iUGokDX6+uvEMMtMuTfJ9UnNnl5QVN3Hzpf9QDzB5O20XDnFG4leONFkwYxb85bwKh
         cK3OFRLKoeQDg==
In-Reply-To: <1646018012-61129-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Qing Wang <wangqing@vivo.com>
Cc: jreuter@yaina.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Sun, 27 Feb 2022 19:13:31 -0800 you wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> 
> [...]

Here is the summary with links:
  - net: hamradio: use time_is_after_jiffies() instead of open coding it
    https://git.kernel.org/netdev/net-next/c/61c4fb9c4d09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


