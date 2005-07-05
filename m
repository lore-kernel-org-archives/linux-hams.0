From: Chris Wright <chrisw@osdl.org>
Subject: Re: [stable] [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 09:26:15 -0700
Message-ID: <20050705162615.GO9046@shell0.pdx.osdl.net>
References: <20050704173042.GA3090@linux-mips.org> <20050705152606.GI9046@shell0.pdx.osdl.net> <20050705162329.GN5171@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050705162329.GN5171@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Chris Wright <chrisw@osdl.org>, Jeff Garzik <jgarzik@pobox.com>, stable@kernel.org, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

* Ralf Baechle DL5RB (ralf@linux-mips.org) wrote:
> Obviously, otherwise I'd not send such a patch :-)

;-)

> cli/sti abuse etc.
> 6pack was pretty much 2.0 or even pre-2.0 code before I started.
> 
> Somehow I managed to strip the BROKEN_ON_SMP patch bit from the last set
> of 6pack patches I sent, it was supposed to be in there.

Thanks Ralf, I've no issue with this, esp. since it's so trivial.
-chris
