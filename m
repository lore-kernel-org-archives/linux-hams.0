From: Markus Roch <markus@roch.tv>
Subject: Re: 2.6.15 ax25 system lockup with kissattach
Date: Sat, 07 Jan 2006 13:50:47 +0100
Message-ID: <20060107135047.rggpiuzyji54cc0k@webmail.roch.tv>
References: <008401c6124f$7ceed0e0$3849a8c0@lan.w1nr.net>
	<20060107004231.GB12765@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060107004231.GB12765@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hi,

I've inserted "spin_unlock_bh(&ax->buflock);" from Ralf's patch
to mkiss.c and recompiled the kernel and modules and now everything
ist working again under 2.6.15 :-)

Thanks
73 de Markus, DL2KMR


Zitat von Ralf Baechle DL5RB <ralf@linux-mips.org>:

> On Thu, Jan 05, 2006 at 06:26:43PM -0500, Mike McCarthy, W1NR wrote:
>
>> That's all folks.  System locked up hard.  Caps lock and scroll lock lights
>> flashing.  System needs a hard reset.
>>
>> 2.6.14-5 appears to be fine.  Tried recompiled tools and libraries as well.
>> Others report similar problems on Debian systems with 2.6.15 kernel as well.
>
> Can you try below patch?  It fixes a locking bug which was affecting only
> preemptable or SMP kernels until the recent rewrite of the locking code.
>
> 73 de DL5RB op Ralf
>
> --
> Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
>
> drivers/net/hamradio/mkiss.c |    1 +
> 1 files changed, 1 insertion(+)
>
> Index: net.git/drivers/net/hamradio/mkiss.c
> ===================================================================
> --- net.git.orig/drivers/net/hamradio/mkiss.c
> +++ net.git/drivers/net/hamradio/mkiss.c
> @@ -515,6 +515,7 @@ static void ax_encaps(struct net_device
> 			count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
> 		}
>   	}
> +	spin_unlock_bh(&ax->buflock);
>
> 	set_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
> 	actual = ax->tty->driver->write(ax->tty, ax->xbuff, count);
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



