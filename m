From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v4] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date: Sat, 18 Jun 2022 03:40:12 +0000
Message-ID: <165552361299.10717.7998088987527311239.git-patchwork-notify@kernel.org>
References: <20220616152333.9812-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655523613;
        bh=hohAOtR0LpeUR1occu7KFZMNLwRI76rxHxBy0YVtukY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y1NtvL8PD9ZLuJ7ylS2p6Jcq4s4ri9YyD+I5hr/iL12KTLmGz8bBlPay5o1ORfpxK
         i6fA8J5C6LWtW1d2DC73F7PcuJDGeOHGO3DxcZF9SMo5Dps37UleYdZhXCNwDAH90v
         G0mgoBNNvWmRjaDJjT9u+FHq0mnX6VZx8MvYbpEEtbIWSU+0CzDO/2JRxopV939WW/
         2GQLBI6UFyTkiCSBBhexHiEAzrbvzTo41lvICCYXQ8X8ulOvmLYumWTPJMsNgh3r2k
         dY/6QFgIELJu2zdG1egIs930efft8Vfhn36owAAkfLgfraexO6exwokNZ9Co4ZCJv8
         S/ntGqBWXKP0Q==
In-Reply-To: <20220616152333.9812-1-pjlafren@mtu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Lafreniere <pjlafren@mtu.edu>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, lkp@intel.com, dan.carpenter@oracle.com

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Jun 2022 11:23:33 -0400 you wrote:
> ax25_dev_device_up() is only called during device setup, which is
> done in user context. In addition, ax25_dev_device_up()
> unconditionally calls ax25_register_dev_sysctl(), which already
> allocates with GFP_KERNEL.
> 
> Since it is allowed to sleep in this function, here we change
> ax25_dev_device_up() to use GFP_KERNEL to reduce unnecessary
> out-of-memory errors.
> 
> [...]

Here is the summary with links:
  - [v4] ax25: use GFP_KERNEL in ax25_dev_device_up()
    https://git.kernel.org/netdev/net-next/c/f0623340fd2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


