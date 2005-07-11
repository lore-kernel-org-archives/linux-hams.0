From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: mkiss driver patch applied ?
Date: Mon, 11 Jul 2005 16:55:05 +0100
Message-ID: <20050711155505.GA7176@linux-mips.org>
References: <20050704173042.GA3090@linux-mips.org> <42CEDEFF.30304@ccr.jussieu.fr> <42D000AF.90703@ccr.jussieu.fr> <200507092313.11144.vk3heg@iinet.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200507092313.11144.vk3heg@iinet.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen <vk3heg@iinet.net.au>
Cc: linux-hams@vger.kernel.org

On Sat, Jul 09, 2005 at 11:13:10PM +0000, Stephen wrote:

> 
> > I tried to apply Ralf's patch to mkiss.c without success.
> >
> > Did someone succeed ?
> >
> > I would like very much to test this version with 2.6.11mdksmp kernel.
> >
> > Could someone send me privately the full modified mkiss.c ?
> 
> the patch is only for 2.6.12.x kernels

Or more accurately, it should work for 2.6.12-rc4 or newer.  The
sympthom for kernels older than this is this warning:

  CC      drivers/net/hamradio/mkiss.o
drivers/net/hamradio/mkiss.c: In function `ax_bump':
drivers/net/hamradio/mkiss.c:267: warning: implicit declaration of function
`ax25_type_trans'

The warning unfortunately is the sympthom of a serious problem ...

  Ralf
