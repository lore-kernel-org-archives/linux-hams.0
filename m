From: Mike Markowski <mm@UDel.Edu>
Subject: Re: PTT with soundmodem
Date: Mon, 2 Feb 2004 10:38:24 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040202153824.GA15819@strauss.udel.edu>
References: <20040201215530.GA572@strauss.udel.edu> <20040201215530.GA572@strauss.udel.edu> <3.0.6.32.20040201220959.0079bd30@pop.telus.net> <1075724381.1263.19.camel@oh2bns.ampr.org> <20040201215530.GA572@strauss.udel.edu> <20040201215530.GA572@strauss.udel.edu> <3.0.6.32.20040201220959.0079bd30@pop.telus.net> <20040201215530.GA572@strauss.udel.edu> <20040201220920.GA18771@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1075724381.1263.19.camel@oh2bns.ampr.org> <3.0.6.32.20040201220959.0079bd30@pop.telus.net> <20040201220920.GA18771@cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Thanks, guys, for the replies to my note.

On Sun 01-Feb-04 at 1709 EST, Hamish Moffatt wrote:
>
> Is AX.25 working properly in 2.4.24? I was under the impression that it
> was never reliable in 2.4, and fixes are going straight to 2.6.

I don't really know.  Though I'm certainly willing to a new kernel -
and especially if any new soundcard drivers are included!  (See
below.)

On Mon 02-Feb-04 at  109 EST, Mike Fenske wrote:
>
> Which version of soundmodem are you using and which interface for PTT??

I currently use the serial port for PTT (but will soon switch to
parallel so I can have rig control on the serial).  And I compiled
soundmodem-0.7 from source.

On Mon 02-Feb-04 at  719 EST, Tomi Manninen wrote:
> On Sun, Feb 01, 2004 at 04:55:30PM -0500, Mike Markowski wrote:
>
> >     sm[15891]: ioctl: SNDCTL_DSP_SYNC: Device or resource busy (16)

> For some reason this now fails and then PTT is released immediately.
> Unfortunately the only cause for the failure I can think of, is a
> poorly written sound card driver (I could be wrong though -- what
> is your card btw?).

That might be the problem.  I'm using a several-year-old HP Omnibook
XE3 laptop from work.  It has an ESS Maestro3 soundcard, which is
labeled as Experimental in the kernel config sound menu.

> You could try forcing the driver to half duplex (in the IO tab in
> soundmodemconfig) and see if that fixes it.

I gave it a try, and it keeps the PTT asserted long enough to
trigger the rig now, but still just briefly and I get the same error.

> Another remedy might be trying the ALSA driver.

Ok, I'll go to the ALSA website and read up on it, since I've
never played with that.  I'm hoping I can stick with the laptop,
but we'll see how it goes...  Thanks for the help!

         Mike  AB3AP
