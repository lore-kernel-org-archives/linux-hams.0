From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: [RFC][PATCH] mkiss.[ch]
Date: Tue, 14 Jan 2003 13:05:20 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <3E23FD00.3EE99F2E@ccr.jussieu.fr>
References: <3E217B22.7040309@cool.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Driegert <bd@cool.de>
Cc: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org

Bernd Driegert wrote :
> 
> The following patch does (hopefully):
> 1) change MOD_xxx_USE_COUNT to module calls
> 2) change cli() to use spin_lock
> 
> Can someone check:
> a) ist it right in terms of usage (it's my first try for cleanup)
> b) does it work with the appropriate HW, since im no ham-guy
> 
> Bernd
> 

I tried to apply your patch to mkiss.ch (I am using kernel 2.4.19-16mdk)
but two functions are missing :

try_module_get() and module_put()

Are these only available with 2.5.x kernels or is it possible to
incorporate them in previous kernel versions ?

I suspect your patch is very important because I am using mkiss and it
gives interrupt problems in all 2.4.x kernels I have used, resulting in
system malfunctions after mkiss driver is insmoded : at least bad AX25
frame decoding and ethernet dysfunctions on low speed machines. 

The worst situation lead to system crash with softirq interrupt handler
problems and kernel panic.

I traced the numerous kernel panic I had and they are related to
__wake_up() in sched.c
I agree that this could be caused by cli() in mkiss.c

73 de Bernard, F6BVP

> --- linux-2.5.56/drivers/net/hamradio/mkiss.h   Sun Jan 12 14:22:50 2003
> +++ mkiss.h     Sun Jan 12 14:24:22 2003
> @@ -55,6 +55,7 @@
>   #define CRC_MODE_NONE   0
>   #define CRC_MODE_FLEX   1
>   #define CRC_MODE_SMACK  2
> +       spinlock_t      driver_lock;
>   };
> 
>   #define AX25_MAGIC             0x5316
> --- linux-2.5.56/drivers/net/hamradio/mkiss.c   Mon Nov 18 05:29:57 2002
> +++ mkiss.c     Sun Jan 12 15:55:06 2003
> @@ -253,8 +253,7 @@
>                  return;
>          }
> 
> -       save_flags(flags);
> -       cli();
> +       spin_lock_irqsave(&ax->driver_lock, flags);
> 
>          oxbuff    = ax->xbuff;
>          ax->xbuff = xbuff;
> @@ -285,7 +284,7 @@
>          ax->mtu      = dev->mtu + 73;
>          ax->buffsize = len;
> 
> -       restore_flags(flags);
> +       spin_unlock_irqrestore(&ax->driver_lock, flags);
> 
>          if (oxbuff != NULL)
>                  kfree(oxbuff);
> @@ -676,7 +675,7 @@
>                  tmp_ax->mkiss = ax;
>          }
> 
> -       MOD_INC_USE_COUNT;
> +       try_module_get(THIS_MODULE);
> 
>          /* Done.  We have linked the TTY line to a channel. */
>          return ax->dev->base_addr;
> @@ -696,7 +695,7 @@
>          ax->tty        = NULL;
> 
>          ax_free(ax);
> -       MOD_DEC_USE_COUNT;
> +       module_put(THIS_MODULE);
>   }
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
