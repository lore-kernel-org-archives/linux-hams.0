From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Kpsk doesn't work with ALSA/es1968 module
Date: Thu, 19 Feb 2004 22:04:18 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0402192108340.7064-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.58.0402181542330.2143@andorinha.ist.utl.pt>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0402181542330.2143@andorinha.ist.utl.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jorge Matias <martin@andorinha.ist.utl.pt>
Cc: Linux-Ham Mailing List <linux-hams@vger.kernel.org>



On Wed, 18 Feb 2004, Jorge Matias wrote:
<snip>
>   Anyone had this problem?


Yes. I had *endless* problems with the soundcard (Yamaha OPL3SA2) in
my Toshiba Satellite 2520CDS notebook. It turned out to be interrupt
and DMA conflicts with the parallel port.

Make sure your sound card works flawlessly with other apps, before
blaming KPSK. Linux is  often unable (on laptops) to detect sound
cards correctly and you wind up with incorrect DMA/IRQ settings.
Don't blindly trust P&P on laptops. They are full of on-board junk
that is outside the PCI bus, and, if P&P fails, you're in trouble.

If there are no known problems with your sound chipset and OSS, and
the OSS driver doesn't work, chances are it's wrongly configured or
there is a hardware conflict. Changing to ALSA won't fix that, and
you'll have to do some detective work.

My approach would be to disable BIOS P&P, disable in the BIOS all
non-essential hardware, and force non-conflicting settings on the
sound card. Then boot Linux and force the driver to use those
settings. Once you have that going, you can turn other hardware back
on, one at a time... parport, serial port, IR bridge etc etc whilst
you keep testing everything under Linux and watching dmesg every time
you boot with a new set of hardware.

This seems like a lot of work, but it isn't too bad. The laptop BIOS
is very limited, a lot of things are fixed, it isn't as  complicated
as desktop machines.

The sound system is really easy to wipe out, because it uses two DMA
channels, more than one interrupt (from memory) and lots of IO ports.

I am not saying your problem is necessarily hardware, but it is a
candidate. I have never seen a laptop that didn't require some
intervention to get all system components working properly.

HTH...

Wilbert, ZL2BSJ



