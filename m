From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Embedded Linux and Amateur Radio
Date: Tue, 21 Jun 2005 20:25:49 +0100
Message-ID: <20050621192549.GO6461@linux-mips.org>
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

> But, having had some very positive experience with commercial outdoor
> 802.11a/b/g access points built around Linux single board computers
> (SBC), I'd really like to move in that general direction.  That is, I'd
> like to build a system with no moving parts, using Linux as the
> operating system, with miniPCI 802.11 radio cards, and having serial
> ports to support KISS or 6PACK on TNCs.  I'd like the ability to run
> LinuxNode at the least, or preferrably (X)Net.  I'd imagine that the
> latter would mean that the CPU would have to be x86 compatible, since
> (X)Net is not open source and only binaries are available for it.

I've ported Xnet to MIPS; it's been demonstrated on the Packet Radio
Congress in Darmstadt in April running on a WRT54G wireless access point.

>  The
> ability to compile the kernel is almost certainly a must, to roll in
> AX.25 support, etc.  Since some of the sites are fairly remote and
> inaccessible for six months of the year, stability and reliability is an
> absolute must.

In such a case you want a watchdog or remote reset facility anyway.  And
a machine that minimizes mechnical parts such as fans.

  For that reason, I'm leaning towards the 2.2 series
> kernels, as my experience was that it was always rock solid with AX.25
> compiled in -- although I did just have 190 days uptime on my gateway
> with 2.4.24 before it inexplicably rebooted (power bump? -- my UPS is shot).

Pure luck.  The kernel AX.25 was and is full of potencially fatal bugs.

> Has anyone already expended some energy along these lines, either time
> on the drawing boards, or actually spent building such a system?  Any
> words of wisdom?  It would be much appreciated.

The wisdom says use proven OTS components :-)  It may not be as fun as
homebrewing but minimizes potencial points of failure.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
