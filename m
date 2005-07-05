From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [stable] [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 17:23:29 +0100
Message-ID: <20050705162329.GN5171@linux-mips.org>
References: <20050704173042.GA3090@linux-mips.org> <20050705152606.GI9046@shell0.pdx.osdl.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050705152606.GI9046@shell0.pdx.osdl.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wright <chrisw@osdl.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, stable@kernel.org, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

On Tue, Jul 05, 2005 at 08:26:06AM -0700, Chris Wright wrote:

> * Ralf Baechle (ralf@linux-mips.org) wrote:
> > Drivers really only work well in SMP if they actually can be selected.
> > This is a leftover from the time when the 6pack drive only used to be
> > a bitrotten variant of the slip driver.
> 
> Hmm, it's been this way for quite a while, and users can still build w/
> CONFIG_CLEAN_COMPILE=n.  So, obligatory questions...  I suspect it was
> orignally marked broken for cli/sti abuse, quick grep suggests this has
> been dealt with.  Have the reasons it was marked broken been addressed?

Obviously, otherwise I'd not send such a patch :-)  cli/sti abuse etc.
6pack was pretty much 2.0 or even pre-2.0 code before I started.

Somehow I managed to strip the BROKEN_ON_SMP patch bit from the last set
of 6pack patches I sent, it was supposed to be in there.

I got a similar near-rewrite for mkiss in the queue but that certainly
isn't something for -stable, way too large.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
