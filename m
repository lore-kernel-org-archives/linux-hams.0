From: Dennis Boone <drb@msu.edu>
Subject: Re: Linux flavor ?
Date: Sun, 11 Apr 2010 14:31:24 -0400
Message-ID: <201004111831.o3BIVOfv011116@yagi.h-net.msu.edu>
References: <0c5901cad99e$34fa4ec0$9eeeec40$@net> <S936242AbYCSX7m/20080319235943Z+449@vger.kernel.org> <4BC03522.2070408@NorthTech.US>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Sun, 11 Apr 2010 12:41:24 CDT.)
             <0c5901cad99e$34fa4ec0$9eeeec40$@net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I just picked up a CF-M34 866Mhz 512mb RAM.

 > I'm wondering what would be the best version of Linux to install, either
 > a Linux only or a dual boot with Xp or W2K system.

 > It would have to be wireless capable for internet use.

 > I've used SuSe, Ubuntu and Debian before, some years ago, but newer
 > versions probably take more horse power.

That processor speed and RAM size will be much more practical than the
300 MHz/128 MB in my CF-17.

My suggestion would be to use Debian.  Don't let it install a desktop
system; Gnome with all its wretched overhead will kill you.  Install
just the base system.  Then manually add X, a window manager of choice,
and individual applications.  (Note that more and more packages get
infested with the Gnome crap, resulting in more and more of the unwanted
underlying daemons getting installed etc, so choose packages carefully.)

I don't recall what type of wireless card was offered in the -34s.
Enough things are supported that it may not be a difficult problem.  The
touch screen may be trickier; I haven't set one up in long enough that
the bits may all be in the distribution now.  I had to build it from
source.

Until the serial port connector got damaged, I had a full set of packet
tools and services on my -17, and carried it for activations.

De
