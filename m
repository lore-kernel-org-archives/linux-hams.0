From: Jorge Matias <martin@andorinha.ist.utl.pt>
Subject: Re: Kpsk doesn't work with ALSA/es1968 module
Date: Sun, 22 Feb 2004 14:19:30 +0000 (WET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0402221410450.3627@andorinha.ist.utl.pt>
References: <Pine.LNX.4.44.0402192108340.7064-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0402192108340.7064-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <w.knol@niwa.co.nz>
Cc: Linux-Ham Mailing List <linux-hams@vger.kernel.org>

On Thu, 19 Feb 2004, Wilbert Knol wrote:

>
>
> On Wed, 18 Feb 2004, Jorge Matias wrote:
> <snip>
> >   Anyone had this problem?
>
>
> Yes. I had *endless* problems with the soundcard (Yamaha OPL3SA2) in
> my Toshiba Satellite 2520CDS notebook. It turned out to be interrupt
> and DMA conflicts with the parallel port.

Well, it is possible that I have problems with PCI Interrupts. All the
Laptop's hardware is using PCI Sharing IRQ (11).

>
> Make sure your sound card works flawlessly with other apps, before
> blaming KPSK. Linux is  often unable (on laptops) to detect sound
> cards correctly and you wind up with incorrect DMA/IRQ settings.
> Don't blindly trust P&P on laptops. They are full of on-board junk
> that is outside the PCI bus, and, if P&P fails, you're in trouble.

  I have tried several audio programs, audio playback programs and audio
sampling programs and I have noted that I only have problems with the
sound sampling.
  In this same Laptop I have also WindowsXP installed and don't any kind
of problem with the soundcard.


> If there are no known problems with your sound chipset and OSS, and
> the OSS driver doesn't work, chances are it's wrongly configured or
> there is a hardware conflict. Changing to ALSA won't fix that, and
> you'll have to do some detective work.
>
> My approach would be to disable BIOS P&P, disable in the BIOS all
> non-essential hardware, and force non-conflicting settings on the
> sound card. Then boot Linux and force the driver to use those
> settings. Once you have that going, you can turn other hardware back
> on, one at a time... parport, serial port, IR bridge etc etc whilst
> you keep testing everything under Linux and watching dmesg every time
> you boot with a new set of hardware.
> ...

Thanks for your suggestions. I'm going to try to force another IRQ for the
sound card and see what happens.
I will report here the results.

73,
Jorge Matias
CT2HBZ
