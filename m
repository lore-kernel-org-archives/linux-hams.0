From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: PTT with soundmodem
Date: Mon, 02 Feb 2004 14:19:42 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1075724381.1263.19.camel@oh2bns.ampr.org>
References: <20040201215530.GA572@strauss.udel.edu>
	 <20040201215530.GA572@strauss.udel.edu>
	 <3.0.6.32.20040201220959.0079bd30@pop.telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3.0.6.32.20040201220959.0079bd30@pop.telus.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

On Sun, Feb 01, 2004 at 04:55:30PM -0500, Mike Markowski wrote:

>  I'm thiiis close to having my packet set up working in kernel 2.4.24
>  (currently unpatched).  I'm using the user space soundmodem to create
>  interface ax0 -- so I assume I don't need to do a kissattach.  When I
>  use soundmodemconfig to test the setup, I can successfully use the
>  PTT gui button to get my rig to transmit (and also have no problem
>  with PTT when using Tomi's great gMFSK!).  However, while i can
>  receive APRS packets while running xastir, when it tries to transmit,
>  soundmodem complains after the xastir info:
>  
>     Tx: fm AB3AP-0 to APX121-0 via RELAY-0,WIDE-0 UI^ pid=F0
>     =/:B7_;?z&y ab3ap@arrl.net, Avondale PA (XASTIR-Linux)
>   
>     sm[15891]: ioctl: SNDCTL_DSP_SYNC: Device or resource busy (16)
>  
>  I see the LED on my PTT interface briefly light, but not long
>  enough to activate the rig itself before the error above is
>  printed.

The SNDCTL_DSP_SYNC call is supposed to cause the driver to wait
until all samples buffered to the soundcard are actually written to
the output. This is done at the end of each transmission so that 
soundmodem knows when it can release the PTT and switch to RX.

For some reason this now fails and then PTT is released immediately.
Unfortunately the only cause for the failure I can think of, is a 
poorly written sound card driver (I could be wrong though -- what 
is your card btw?).

You could try forcing the driver to half duplex (in the IO tab in
soundmodemconfig) and see if that fixes it. That is not a good solution 
though as it can cause additional latency in tx/rx switching (bad for 
CSMA performance).

Another remedy might be trying the ALSA driver.

(And FWIW, gMFSK uses the same technique to time PTT switching,
but as latencies are not nearly as important in gMFSK, I can always
use half duplex audio IO. That tends to be fool (and poor driver) 
proof... :)

-- 
Tomi Manninen / OH2BNS / KP20ME04

