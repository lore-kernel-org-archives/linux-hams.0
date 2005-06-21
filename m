From: Patrick Koehn <koehnp@yahoo.com>
Subject: Re: Embedded Linux and Amateur Radio
Date: Tue, 21 Jun 2005 14:35:41 -0700 (PDT)
Message-ID: <20050621213541.53861.qmail@web30311.mail.mud.yahoo.com>
References: <42B84FB5.8090907@wa7v.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42B84FB5.8090907@wa7v.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brett Mueller <wa7v@wa7v.com>
Cc: linux-hams@vger.kernel.org

Hi, Brent - 

I've spent a lot of time trying to get a small version of linux running
on a Soekris Engineering single-board computer (http://soekris.com),
with the intent of running packet radio through it.  Ultimately it will
be the communications payload for a weather balloon, similar to what
Jim Meehan did at http://vpizza.org/~jmeehan/balloon/.

I thought the tough part would be getting the OS running - not so.  I'm
using Bering 1.2, which runs fine by itself but has no way to rebuild
the kernel - no make, no gcc, no nothing.  I'm trying to build an ax25
module on another machine, but I'm a kernel-building newbie and I'm
scratching around in the dark.

If you *do* come up with something, please share!  And if anyone out
there has tried what I'm trying, or has a better suggestion, please
chime in!

Thanks, and good luck!

Patrick Koehn

--- Brett Mueller <wa7v@wa7v.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Good day all,
> 
> I am currently brainstorming on developing and implementing a amateur
> network in our region (northeast Oregon, southeast Washington), to
> include using 802.11 devices running under US FCC part 97
> regulations,
> similar to Green Bay Professional Packet Radio:
>     http://www.qsl.net/n9zia/
> 
> But, having had some very positive experience with commercial outdoor
> 802.11a/b/g access points built around Linux single board computers
> (SBC), I'd really like to move in that general direction.  That is,
> I'd
> like to build a system with no moving parts, using Linux as the
> operating system, with miniPCI 802.11 radio cards, and having serial
> ports to support KISS or 6PACK on TNCs.  I'd like the ability to run
> LinuxNode at the least, or preferrably (X)Net.  I'd imagine that the
> latter would mean that the CPU would have to be x86 compatible, since
> (X)Net is not open source and only binaries are available for it. 
> The
> ability to compile the kernel is almost certainly a must, to roll in
> AX.25 support, etc.  Since some of the sites are fairly remote and
> inaccessible for six months of the year, stability and reliability is
> an
> absolute must.  For that reason, I'm leaning towards the 2.2 series
> kernels, as my experience was that it was always rock solid with
> AX.25
> compiled in -- although I did just have 190 days uptime on my gateway
> with 2.4.24 before it inexplicably rebooted (power bump? -- my UPS is
> shot).
> 
> Has anyone already expended some energy along these lines, either
> time
> on the drawing boards, or actually spent building such a system?  Any
> words of wisdom?  It would be much appreciated.
> 
> 73 es tnx,
> 
> Brett Mueller, WA7V
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (MingW32)
> 
> iD8DBQFCuE+1+/Ps1x4JxWYRAk7mAJ9JJoNk3vZ0ERokIddWTNpG+N8piACfdx5Q
> X8hPIkxiQhV27ABjrHsQq78=
> =dxDx
> -----END PGP SIGNATURE-----
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

