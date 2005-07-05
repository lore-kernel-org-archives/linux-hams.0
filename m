From: Chris Wright <chrisw@osdl.org>
Subject: Re: [stable] [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 08:26:06 -0700
Message-ID: <20050705152606.GI9046@shell0.pdx.osdl.net>
References: <20050704173042.GA3090@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050704173042.GA3090@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, stable@kernel.org, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

* Ralf Baechle (ralf@linux-mips.org) wrote:
> Drivers really only work well in SMP if they actually can be selected.
> This is a leftover from the time when the 6pack drive only used to be
> a bitrotten variant of the slip driver.

Hmm, it's been this way for quite a while, and users can still build w/
CONFIG_CLEAN_COMPILE=n.  So, obligatory questions...  I suspect it was
orignally marked broken for cli/sti abuse, quick grep suggests this has
been dealt with.  Have the reasons it was marked broken been addressed?

thanks,
-chris
