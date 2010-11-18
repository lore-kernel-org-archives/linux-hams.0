From: Dave Platt <dplatt@radagast.org>
Subject: Re: Problems with system lockup
Date: Thu, 18 Nov 2010 10:42:52 -0800
Message-ID: <4CE573AC.1010607@radagast.org>
References: <555517178-1290101199-cardhu_decombobulator_blackberry.rim.net-278429640-@bda381.bisx.prod.on.blackberry>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <555517178-1290101199-cardhu_decombobulator_blackberry.rim.net-278429640-@bda381.bisx.prod.on.blackberry>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kd1zd@rtcubed.org
Cc: linux-hams@vger.kernel.org

kd1zd@rtcubed.org wrote:
> I've been having problems recently with my Linux system.  It randomly locks up, and I was wondering if anyone out there has experienced problems with a hung system.  
> 
> My system is CentOS 5.5, and is running UROnode and JNOS.  I have been having segmentation violation issues with JNOS, which I'm trying to figure out.  I have two serial ports which drive TNCs connected to radios.  
> 
> When I say the system is hung, I mean that the only thing that will liven it is a hard reboot or power cycle.  Anyone else troubleshoot these issues before?  I'm trying to run a 24/7 TCP/IP node and BBS, but these lockups make it very hard to do so.

There can be a number of problems which can cause these
sorts of lockups... sometimes hardware, sometimes software,
sometimes an interaction of the two.  I've run into a bunch
of them over the years.

Some examples:

-  Hardware problems on the motherboard, pure and simple...
   bad DRAM, for example, or an overheating CPU due to a
   fan failure, or overly-aggressive overclocking.  It
   wouldn't hurt to install, and then run the stand-alone
   MEMTEST86+ check (let it run overnight, at least) to
   see if there are DRAM or timing problems.

   The fact that you're seeing segfaults in JNOS, as well
   as complete freezes, brings this possibility to the
   top of my UsualSuspects list.

-  Power-supply problems... momentary voltage sags can
   glitch a box pretty badly.

-  Problems with the power-management code, in the kernel
   or in the BIOS (e.g. Intel SpeedStep, or the AMD
   equivalent).  There have been a fair number of motherboards
   and CPUs which don't handle the switching between different
   processor clock speeds and voltages properly.

-  PCI (or other) cards not plugged securely into their slots,
   resulting in intermittent contacts that can cause all sorts
   of confusion.

-  Driver bugs.  I had a nasty periodic full freeze on my new
   firewall/server system at home, which turned out to be a bug
   in the driver for the USB Ethernet dongle I was using to add
   a third Ethernet port... it worked OK under light load but
   froze the system solid under some heavy-load conditions.  If
   you've got a uSB dongle which uses the "kaweth" driver, get
   rid of it.

Something you may be able to do, as a very short term ugly
workaround, is to use a hardware-based watchdog to reboot
the system if it freezes.  A lot of motherboards these days
use a "Super IO" chip which incorporates such a watchdog, and
Linux has a driver and utility program to access it.  Start up
the watchdog program (in the "no exit allowed" mode), and if
the watchdog program doesn't wake up and successfully poke the
watchdog chip's registers every ten seconds or so, the chip will
yank the board's /RESET line and do a hard reboot.  Nasty, but
perhaps better than a day-long hang until you can get home
and push the Big Red Button yourself.  As the man said in
Young Frankenstein, "A riot is an ugly thing... and I think
it's about time we had one!!!"

