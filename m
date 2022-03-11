From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH V2] ax25: Fix NULL pointer dereferences in ax25 timers
Date: Thu, 10 Mar 2022 20:40:51 -0800
Message-ID: <20220310204051.44c9555d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20220310144347.102465-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646973652;
        bh=IRqFVrpyUqt1gWh3UlejHjKKJ5lWo3XyNfF+ss8+feQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vJDhLDo3FNR21w4iHUox8q/APrfcRVEb5nH+UN4+VzcaO9RYqiOGt3vqla7yXSgIn
         7FvXJqOBccD+qOuDUM6nlE1PKFuwjSNhMuvsMNDeobgy6MLDjW18Lar0vWFESqlDgo
         uwe19sOWTWVuJC9DpnSWz/MlFKHk9QBh0sNZEJQ0BNEDdH3ne08Pt1rITBTdtXGZJE
         3gsm0lbovQuvU3nQC/TcEy8igB8z7KLNJGRvhA4jyZNOyz/fw3vnj+61PZ5+J4M253
         KATIwgsADjxt8yOQnW8ny+gsznhANiy/3BDrpXr1SYIfbqlRqqIoTjZMDeIoppTDjG
         N7S7eMMVQitYw==
In-Reply-To: <20220310144347.102465-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de

On Thu, 10 Mar 2022 22:43:47 +0800 Duoming Zhou wrote:
> There are race conditions that may lead to null pointer dereferences in
> ax25_heartbeat_expiry(), ax25_t1timer_expiry(), ax25_t2timer_expiry(),
> ax25_t3timer_expiry() and ax25_idletimer_expiry(), when we use
> ax25_kill_by_device() to detach the ax25 device.

None of your last 4 patches applied to our trees.

If you're sending fixes for networking please base them on 
net/master and put [PATCH net] in the subject.
