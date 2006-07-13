From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 19:23:47 -0400
Message-ID: <620c90570607131623w459e65d4i47041509c9496249@mail.gmail.com>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
	 <20060712231643.GA16205@linux-mips.org>
	 <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
	 <20060713112041.GA20294@linux-mips.org>
	 <20060713122824.GA4729@lina.inka.de>
	 <20060713133633.GA23187@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060713133633.GA23187@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Bernd Eckenfels <be-mail2006@lina.inka.de>, linux-hams <linux-hams@vger.kernel.org>

On 7/13/06, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Thu, Jul 13, 2006 at 02:28:24PM +0200, Bernd Eckenfels wrote:
>
> > > Yes, you just need to recompile net-tools.
> >
> > I think the reason why rose is not enabled by default is because there are
> > some header files (kernel, libc, other package - cant remeber) which are not
> > available on all distributions.
> >
> > This used to be also the case for AX25, but that changed with recent libcs.
> >
> > Running configure is enough to enable ROSE support. If your system misses
> > some headers in that case, let me know so i can document this.
>
> Glibc 2.1 which is over 7 years old will suffice which is why I proposed
> the change at all.
>
> Asking users to rebuild their software without an urgent need is just
> raising the user pain level for distributions which go with the provided
> defaults so I figured it's going to be the most productive approach to
> convince you to change the defaults.
>
> Patch below,
>
>   Ralf
>
> diff -ur net-tools-1.60.orig/config.in net-tools-1.60/config.in
> --- net-tools-1.60.orig/config.in       Sun May 21 16:32:12 2000
> +++ net-tools-1.60/config.in    Thu Jul 13 15:17:30 2006
> @@ -54,7 +54,7 @@
>  bool 'Appletalk DDP protocol family' HAVE_AFATALK y
>  bool 'AX25 (packet radio) protocol family' HAVE_AFAX25 y
>  bool 'NET/ROM (packet radio) protocol family' HAVE_AFNETROM y
> -bool 'Rose (packet radio) protocol family' HAVE_AFROSE n
> +bool 'Rose (packet radio) protocol family' HAVE_AFROSE y
>  bool 'X.25 (CCITT) protocol family' HAVE_AFX25 y
>  bool 'Econet protocol family' HAVE_AFECONET n
>  bool 'DECnet protocol family' HAVE_AFDECnet n
> @@ -71,7 +71,7 @@
>  bool 'STRIP (Metricom radio) support' HAVE_HWSTRIP y
>  bool 'Token ring (generic) support' HAVE_HWTR y
>  bool 'AX25 (packet radio) support' HAVE_HWAX25 y
> -bool 'Rose (packet radio) support' HAVE_HWROSE n
> +bool 'Rose (packet radio) support' HAVE_HWROSE y
>  bool 'NET/ROM (packet radio) support' HAVE_HWNETROM y
>  bool 'X.25 (generic) support' HAVE_HWX25 y
>  bool 'DLCI/FRAD (frame relay) support' HAVE_HWFR y
>

I did the re-compile and see that the new netstat file in in there but I do not
see any info on the ROSE piece that is running on the target machine.

Indeed I see no indication that anything was changed except that the date
on the binaries is now that of today. Was there some other things that needed
to be updated also?



-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
