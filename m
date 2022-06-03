From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] ax25: use GFP_KERNEL over GFP_ATOMIC where possible
Date: Thu, 2 Jun 2022 19:47:41 -0700
Message-ID: <20220602194741.6bba0611@kernel.org>
References: <20220602112138.8200-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654224462;
        bh=QpU53RoJdAdCnP8jdYOtc2Hs4xhTtWtlmS+OW4nJ7R0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J1xZfil0Hbqojp2D/PUUnQCSTrqhMcJnUNscIDLPT5ctZn+JCQLaXonE7ZssC12cj
         jWq5BiNys05aMpJKvhucLZiJjrj3IPwzZHF5G8rdby1mWQbHT0bqnbfAzD8yKcOTT7
         3m1HXVnD9iovCMHzJPA7x1syBUAv/+MKWaFhgmff/CoUXhPdueVtrAjyi8hq+C/+do
         xibiTPAlkY1RM17MkkS+r0hkSkxiYHEyl9TVQ1zxjpznT1sA6qPLAlYO9bS5yHVK5A
         jRYNCeaxKsRZADWI2btMVsNKIYOFNWInSBWbXdQg4BSUgDI6i35jJ6VinhqIj05ssi
         TwZRpgJ228QFQ==
In-Reply-To: <20220602112138.8200-1-pjlafren@mtu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Lafreniere <pjlafren@mtu.edu>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org, netdev@vger.kernel.org

On Thu,  2 Jun 2022 07:21:38 -0400 Peter Lafreniere wrote:
> There are a few functions that can sleep that use GFP_ATOMIC.
> Here we change allocations to use the more reliable GFP_KERNEL
> flag.
> 
> ax25_dev_device_up() is only called during device setup, which is
> done in user context. In addition, ax25_dev_device_up()
> unconditionally calls ax25_register_dev_sysctl(), which already
> allocates with GFP_KERNEL.
> 
> ax25_rt_add() is a static function that is only called from
> ax25_rt_ioctl(), which must run in user context already due to
> copy_from_user() usage.
> 
> Since it is allowed to sleep in both of these functions, here we
> change the functions to use GFP_KERNEL to reduce unnecessary
> out-of-memory errors.
> 
> Signed-off-by: Peter Lafreniere <pjlafren@mtu.edu>

For merging into the Linux networking trees you'll have to repost next
week, this seems like an optimization and we're currently in the merge
window period where we only accept fixes.
