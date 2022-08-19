From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 1/1] MAINTAINERS: update amateur radio status.
Date: Fri, 19 Aug 2022 15:11:20 -0700
Message-ID: <20220819151120.37830ae7@kernel.org>
References: <Yv6fCCB3vW++EGaP@electric-eye.fr.zoreil.com>
        <Yv9NOmXjRLf6WSCB@x-berg.in-berlin.de>
        <Yv+xPBPpxDOSxny7@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660947081;
        bh=5ZOU1HRa0GHUmzfoG0+pKTNSbyLC8sA6bEnsIms+xEg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rCMSgCzX6NrxYx7bynXuMcXnUf1sV2g7FzmdSgiv7I5yoWoPEA4e9jWHt2N1ih68g
         nukXDSLzwjzRspEaEJsNNEVKQx4Pp44Mk/ToctLUGDUFicJSS3RmYhOHTGyGL1KVOX
         P7ngVAWR86I8ckZcbX9SikOAdznxYvNZqCqjC6yKfTGQjD3rDrLAQSHO7RzO9OwNbm
         Q8+dqxjjWyPFRboLWK2cDX+SXtpgM/kd31FsrueT9742gB1zHuXhCxiO/ghBF4szcT
         gTsaVzmWspWpcDeT20Tiq0IcP5vS6n0YgEcM9a4P0zjLi1vJhypkTzHuSTefzbcSSN
         3BQNa/M15UmIw==
In-Reply-To: <Yv+xPBPpxDOSxny7@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: Thomas Osterried <thomas@osterried.de>, netdev@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Bernard Pidoux <f6bvp@free.fr>

On Fri, 19 Aug 2022 17:50:20 +0200 Francois Romieu wrote:
> > I hoped Ralf will come back and waited with my offer to do the maintainership.
> >
> > A question for the process: What needs to be done to get listet as maintainer?  
> 
> Someone sends a patch, there's no obvious consensus against the victim (was
> there ever ?) as he is usually known for some decent track of work or
> unformal, de-facto maintainership and he get listed within a few days.

Yup, there can also be multiple M: and/or additional R: lines..
