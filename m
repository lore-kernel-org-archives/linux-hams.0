From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH V2 RESEND] net: hamradio: use time_is_after_jiffies()
 instead of open coding it
Date: Tue, 1 Mar 2022 18:55:06 -0800
Message-ID: <20220301185506.64c3aa0a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <1646188174-81401-1-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646189707;
        bh=ddZiuRfG/pCjWbi6WqOWsXn5TumLyIc1oQDqNkZnoB0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ImFQjPN9wpJveDl0gLQK9UlifidI2fSbkxhse8a5XqFIP2287QhESbvoVvBSwufIA
         kBYxSH1vCxcSFkqLyStRP0TGdIxu8ZmdH3nqn1e0T9/9h46LiqPFxoUWjJSUzWk4di
         66nCxsRIZnroz8+LnkEME85egnmSrehRx8Zuc4Ff/dKRddXCQdNv3d/2bi1wrldQoP
         V3ajxyLCYza/EvwgrEKwBko2I8ZBn/jgbUtcB3emn6KrGK4mL4Mz+s6dlN7ga0COWv
         lUg7H3KnjfMep7Rnq7KBf2T1Bn3vLP/BkCFsG5QlHhYX7D8DWiV19UH7umDEmvJyZV
         iDEociZLdne3A==
In-Reply-To: <1646188174-81401-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Qing Wang <wangqing@vivo.com>
Cc: Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue,  1 Mar 2022 18:29:31 -0800 Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
> 
> V2:
> add missing ")" at line 1357 which will cause compliation error.

I see :S  So since the v1 was already applied could you please send 
a patch that only adds the missing bracket based on this tree:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

? We can't discard the old patch, we need an incremental fix.

Thanks!
