From: Brett Mueller <wa7v@wa7v.com>
Subject: Re: Embedded Linux and Amateur Radio
Date: Thu, 23 Jun 2005 16:46:12 -0700
Message-ID: <42BB49C4.10004@wa7v.com>
References: <42B84FB5.8090907@wa7v.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42B84FB5.8090907@wa7v.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/21/2005 10:34, I wrote, in part:
> I am currently brainstorming on developing and implementing a amateur
> network in our region (northeast Oregon, southeast Washington), to
> include using 802.11 devices running under US FCC part 97 regulations,
<snip>
> I'd like to build a system with no moving parts, using Linux as the
> operating system, with miniPCI 802.11 radio cards, and having serial
> ports to support KISS or 6PACK on TNCs.

Hello everyone.  First off, thank you very much for your responses, both
on list and off.  I really appreciate them.  I was directed to a number
of good resources, some which I had previously found, and others that I
hadn't.  As I read some of your replies, I realized that I had neglected
to mention a key fact that can significantly impact my selection of
hardware: the project has a decent level of funding.  As a ham, I know
what it's like to come up with solutions on a shoestring budget --
oftentimes "it may not be glamorous, but it works!"  In this case,
however, I have access to a number of prime public safety sites, and can
spend a bit more on equipment than the average ham can cough up
(certainly more than I could on my own).  Also, equipment installed in
those locations must be professional in appearance, and meet standards
for grounding, lightning protection, etc.

For other (non-ham) projects, I have used Demarctech outdoor access
points, which have a nicely laid-out Linux-based system (StarOS Router)
on a PC Engines WRAP board (AMD Geode CPU).
  http://www.demarctech.com/products/reliawave-rwv/rwv.htm
  http://www.staros.com/
  http://www.pcengines.ch/wrap.htm
For this proposed ham project, I was envisioning something similar,
while adding the ability to load amateur-related software on the system.
 I'd like to be able to have dedicated point-to-point connections
between the sites, perhaps on 5.8 GHz where possible.  This would
preclude using the WRT54G for those links, although I can see great
possibilities for the Linksys unit elsewhere -- particularly other
"peripheral" sites that don't have the "funding" resources available.
Thanks to those that pointed out the great capabilities and hackability
(in the old traditional sense of the word) of the WRT54G.

Compact flash cards certainly seem like the way to go (as per my
original criteria -- no moving parts), but I think I'd probably invest
in a CF - IDE adapter (especially if I went with an x86 based solution)
so that I could compile/install/test from a faster machine.

Power-over-ethernet (POE) is great stuff, too, where you can easily
mount the SBC / radio in an outdoor enclosure, use a meter or so of
feedline to minimize your losses, and run some relatively inexpensive
UV-rated CAT5 down the tower and into the facility (through lightning
protection, of course).

Ralf's MIPS port of (X)Net also opens up other possibilities, having the
option of using it on SBCs based on the MIPS architecture.  He also
correctly points out the inherent problems in the kernel AX.25 code, and
I came to the realization that AX.25 support in the kernel would be
unnecessary if (X)Net was running.

I like the looks of the Soekris boards that a couple of people pointed
me to.  I'd like to find one with dual Mini-PCI and dual serial ports,
but I'm not seeing it.  (hmm, will (X)Net do something like MKISS?)
Nevertheless, great possibilities there.

Paul directed me to a "smallish" distro called Pebble Linux.  Their page
also includes good information on setting up a Soekris access point:
http://www.nycwireless.net/pebble

I'll keep sorting through the information out there.  Thanks again...

73,

Brett, WA7V

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)

iD8DBQFCu0nE+/Ps1x4JxWYRAnXOAJ456qfVPMz7AZMXEjnLyOLC6Z6XWwCfWk7D
R0RU7ARFGx4P0TMKTJ8/3bA=
=5YZ8
-----END PGP SIGNATURE-----
