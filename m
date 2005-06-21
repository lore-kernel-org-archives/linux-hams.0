From: Braddock Gaskill <braddock@braddock.com>
Subject: Re: Embedded Linux and Amateur Radio
Date: Tue, 21 Jun 2005 13:58:01 -0400
Message-ID: <20050621175801.GA22967@braddock.com>
References: <42B84FB5.8090907@wa7v.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42B84FB5.8090907@wa7v.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Mueller <wa7v@wa7v.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Tue, Jun 21, 2005 at 10:34:45AM -0700, Brett Mueller wrote:
> like to build a system with no moving parts, using Linux as the
> operating system, with miniPCI 802.11 radio cards, and having serial
> ports to support KISS or 6PACK on TNCs.  I'd like the ability to run

One of the niftiest ideas I can think of in this realm would be to use
a Linksys WRT54GS access point as a Linux Packet device.  It runs
Linux, with OpenWRT firmware you have a fully read/write 6MB
filesystem in firmware, and you can easilly hack on two serial ports
to talk to external TNCs (although I'm not sure they support hardware
handshaking).  Oh, and it would remain a 6-ethernet-port Wifi device. :)

http://www.rwhitby.net/wrt54gs/serial.html

That hack would be slashdot-worthy, and probably not TOO hard.  :)

Braddock Gaskill
Writing this through a reflashed BusyBox Linux WRT54G...

On Tue, Jun 21, 2005 at 10:34:45AM -0700, Brett Mueller wrote:
> I am currently brainstorming on developing and implementing a amateur
> network in our region (northeast Oregon, southeast Washington), to
> include using 802.11 devices running under US FCC part 97 regulations,
> similar to Green Bay Professional Packet Radio:
>     http://www.qsl.net/n9zia/
> 
> But, having had some very positive experience with commercial outdoor
> 802.11a/b/g access points built around Linux single board computers
> (SBC), I'd really like to move in that general direction.  That is, I'd
> like to build a system with no moving parts, using Linux as the
> operating system, with miniPCI 802.11 radio cards, and having serial
> ports to support KISS or 6PACK on TNCs.  I'd like the ability to run
> LinuxNode at the least, or preferrably (X)Net.  I'd imagine that the
> latter would mean that the CPU would have to be x86 compatible, since
> (X)Net is not open source and only binaries are available for it.  The
> ability to compile the kernel is almost certainly a must, to roll in
> AX.25 support, etc.  Since some of the sites are fairly remote and
> inaccessible for six months of the year, stability and reliability is an
> absolute must.  For that reason, I'm leaning towards the 2.2 series
> kernels, as my experience was that it was always rock solid with AX.25
> compiled in -- although I did just have 190 days uptime on my gateway
> with 2.4.24 before it inexplicably rebooted (power bump? -- my UPS is shot).
> 
> Has anyone already expended some energy along these lines, either time
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
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
