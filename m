From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH] hamradio: baycom: remove useless link in Kconfig
Date: Fri, 22 Sep 2023 07:20:23 +0000
Message-ID: <169536722310.5471.3731844839478615297.git-patchwork-notify@kernel.org>
References: <20230919141417.39702-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695367223;
        bh=BHybtxwY47uYYHFXoDtvlNNeebGa5opZ5WlHJz0v3Rs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mbSkkHZ8pd3qzc8pjpZc3Dku6xjLGdQvXmjxPtw65nHH1CkUnGvVs6oot1KwI/nUW
         y2XX7Kl8QJCDvQAxrwW+27XENXRokAkjFfUAEHTzwZfW2xOifE8wnFpz1lG70aiMdl
         d7NT/IRvfw9i7P8/qxZHTKQGHu+rr1vswU8LkBjxDRIL2NntQSv+JSHSnQPDkIYVwv
         aq+JORGici5TpbU/WQM/36C4tAWvsOq8L1a6SSSpxvmNfyK9mOFCfOYb83b5mTA2oO
         T0UItb3g4J4LGIaEqHVLl/eNsuOQ2BKE4mnxXK/o+y2OgRIfRA2Lnb+r0tlBAOBWj+
         mdxIERzIFYRSA==
In-Reply-To: <20230919141417.39702-1-peter@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 19 Sep 2023 14:14:23 +0000 you wrote:
> The Kconfig help text for baycom drivers suggests that more information
> on the hardware can be found at <https://www.baycom.de>. The website now
> includes no information on their ham radio products other than a mention
> that they were once produced by the company, saying:
> "The amateur radio equipment is now no longer part and business of BayCom GmbH"
> 
> As there is no information relavent to the baycom driver on the site,
> remove the link.
> 
> [...]

Here is the summary with links:
  - hamradio: baycom: remove useless link in Kconfig
    https://git.kernel.org/netdev/net-next/c/84c19e655b29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


