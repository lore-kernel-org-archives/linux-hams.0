From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Embedded Linux and Amateur Radio
Date: Sat, 25 Jun 2005 20:04:04 -0700
Message-ID: <20050626030404.GA15311@oz.net>
References: <42B84FB5.8090907@wa7v.com> <42BB49C4.10004@wa7v.com> <20050625193602.GA23792@linux-mips.org> <20050626021245.GC5086@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050626021245.GC5086@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams <linux-hams@vger.kernel.org>

On Sun, Jun 26, 2005 at 12:12:45PM +1000, Hamish Moffatt wrote:
> On Sat, Jun 25, 2005 at 09:36:02PM +0200, Ralf Baechle DL5RB wrote:
> > In the end I however consider usermode stack integrated with a whole set
> > of applications and server daemons such as Xnet a design mistake for
> > operating systems such as Linux that are pretending to have full blown and
> > universal network stacks and I'm working - time permitting - on getting
> > the kernel stack to work just as well.  Nontrivial, challenging - and
> > hopefully at some point - also rewarding ...
> 
> In the case of the WRT54GS, I'm concerned that it will be running linux
> 2.4 yet AX.25 (from what I've read) was never too good on 2.4.
> 
> I want to run an APRS gateway on it and aprsd can work with just a
> serial port to the TNC, but I prefer the AX.25 method. (And I might want
> to switch away from AX.25 at some point).
> 
> I don't know if the WRT54GS could be upgraded to 2.6; I think it has
> some proprietary (binary-only) drivers for the Broadcom wifi chipset.
> 

I recall that early 2.4 (<2.4.18?) kernels had problems with AX.25, but 
I have been running a DX Spider node with 2.4 kernels (currently 2.4.26) 
for quite a while and have not experienced any AX.25 difficulties.

Bob, N7XY
