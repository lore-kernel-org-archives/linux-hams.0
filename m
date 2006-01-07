From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 2.6.15 ax25 system lockup with kissattach
Date: Sat, 7 Jan 2006 01:42:31 +0100
Message-ID: <20060107004231.GB12765@linux-mips.org>
References: <008401c6124f$7ceed0e0$3849a8c0@lan.w1nr.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <008401c6124f$7ceed0e0$3849a8c0@lan.w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mike McCarthy, W1NR" <mike@w1nr.net>
Cc: linux-hams@vger.kernel.org

On Thu, Jan 05, 2006 at 06:26:43PM -0500, Mike McCarthy, W1NR wrote:

> That's all folks.  System locked up hard.  Caps lock and scroll lock lights
> flashing.  System needs a hard reset.
> 
> 2.6.14-5 appears to be fine.  Tried recompiled tools and libraries as well.
> Others report similar problems on Debian systems with 2.6.15 kernel as well.

Can you try below patch?  It fixes a locking bug which was affecting only
preemptable or SMP kernels until the recent rewrite of the locking code.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

 drivers/net/hamradio/mkiss.c |    1 +
 1 files changed, 1 insertion(+)

Index: net.git/drivers/net/hamradio/mkiss.c
===================================================================
--- net.git.orig/drivers/net/hamradio/mkiss.c
+++ net.git/drivers/net/hamradio/mkiss.c
@@ -515,6 +515,7 @@ static void ax_encaps(struct net_device 
 			count = kiss_esc(p, (unsigned char *)ax->xbuff, len);
 		}
   	}
+	spin_unlock_bh(&ax->buflock);
 
 	set_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
 	actual = ax->tty->driver->write(ax->tty, ax->xbuff, count);
