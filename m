From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Linux AX25 Digipeating Software
Date: Wed, 22 Dec 2004 12:49:55 -0800
Message-ID: <20041222204955.GC8131@office.n7xy.net>
References: <41C9A12A.2000401@utoronto.ca> <NCBBKBAJDJIPKFIAFBKLIEGOFFAC.wilson.hein@verizon.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLIEGOFFAC.wilson.hein@verizon.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams List <linux-hams@vger.kernel.org>

On Wed, Dec 22, 2004 at 01:25:27PM -0500, Wilson G. Hein wrote:
> -----Original Message-----
> >>So, after all that - is there a good program out there that does simple,
> >>single-port, layer 2, AX.25 digipeating and works with kernel 2.6?
> >>
> >>
> >>
> >
> >I'm not aware of any other non-APRS digi software, but you can get
> >ax25digi at:
> >
> >ftp://ftp.tapr.org/software_lib/Linux/ax25/ax25digi.tgz
> >
> >
> >
> Actually, there's no file there with that name at all.
> 
> Try without the 25, axdigi.tgz downloaded for me:-)
> 
> I also could noit get it to compile, and get an error from the binary, and
> would love to have the this app working. Just no time to try myself.
> 

Sorry about the broken URL, thanks Willie.  

The binary appears to have been built with libc4 (this thing really is
old!).  I suspect that it is written for an older version of gcc, as
well.  The oldest one I have is 2.95 and that bombs, as do 3.2 and 3.3. 
I'm not a C programmer, so can't reallly help there.

The only reason it still exists in the TAPR repository is that I haven't
taken the time to clean out the obsolete stuff.  I probably will, once 
we get the new tapr.org server fully online.

I don't know if Craig VK2XLZ (the author) still frequents this list, but
if so maybe he could comment.

Bob, N7XY
