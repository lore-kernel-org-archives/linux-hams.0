From: Mike Markowski <mm@UDel.Edu>
Subject: Re: PTT with soundmodem - solved!
Date: Thu, 5 Feb 2004 20:05:28 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040206010528.GA18301@strauss.udel.edu>
References: <20040201215530.GA572@strauss.udel.edu> <20040201215530.GA572@strauss.udel.edu> <3.0.6.32.20040201220959.0079bd30@pop.telus.net> <1075724381.1263.19.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1075724381.1263.19.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Tomi,

You were exactly right!

On Mon 02-Feb-04 at  719 EST, Tomi Manninen wrote:
> On Sun, Feb 01, 2004 at 04:55:30PM -0500, Mike Markowski wrote:
> 
> >     sm[15891]: ioctl: SNDCTL_DSP_SYNC: Device or resource busy (16)
> 
> [...] Unfortunately the only cause for the failure I can think of, is a 
> poorly written sound card driver 

> [...] Another remedy might be trying the ALSA driver.

I read up on ALSA et al., downloaded the software, and started to
compile.  Only then did I download kernel 2.6.1 and discover ALSA
drivers are now in the kernel.  Doh!  Anyway, I cranked up xastir
after rebooting with the new kernel and starting soundmodem, and
everything is working fine!  Seeing acks come back from my aprs messages
really capped off the effort.  So now that everything is working...I
have to learn what other applications are available on packet.  :-)

Thanks very much for the help getting my laptop "packeting."

	Mike  AB3AP
