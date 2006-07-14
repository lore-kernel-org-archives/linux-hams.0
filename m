From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 23:32:17 -0400
Message-ID: <620c90570607132032i5e144fe4nad370f67c9d101a0@mail.gmail.com>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
	 <20060712231643.GA16205@linux-mips.org>
	 <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
	 <20060713112041.GA20294@linux-mips.org>
	 <20060713122824.GA4729@lina.inka.de>
	 <20060713133633.GA23187@linux-mips.org>
	 <620c90570607131623w459e65d4i47041509c9496249@mail.gmail.com>
	 <20060714032426.GA11804@lina.inka.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060714032426.GA11804@lina.inka.de>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Eckenfels <be-mail2006@lina.inka.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams <linux-hams@vger.kernel.org>

On 7/13/06, Bernd Eckenfels <be-mail2006@lina.inka.de> wrote:
> On Thu, Jul 13, 2006 at 07:23:47PM -0400, Chuck Hast wrote:
> > Indeed I see no indication that anything was changed except that the date
> > on the binaries is now that of today. Was there some other things that
> > needed
> > to be updated also?
>
> # netstat -V
> net-tools 1.60
> netstat 1.42 (2001-04-15)
> Fred Baumgarten, Alan Cox, Bernd Eckenfels, Phil Blundell, Tuan Hoang and others
> +NEW_ADDRT +RTF_IRTT +RTF_REJECT +FW_MASQUERADE +I18N
> AF: (inet) +UNIX +INET +INET6 +IPX +AX25 +NETROM +X25 +ATALK +ECONET +ROSE
> HW:  +ETHER +ARC +SLIP +PPP +TUNNEL +TR +AX25 +NETROM +X25 +FR +ROSE +ASH +SIT +FDDI +HIPPI +HDLC/LAPB +EUI64
>

Bernd:
Yes I see that too on mine but when I do a netstat --rose I get the short help
page (i.e. that was wrong try again) but if I do say a netstat --netrom I get:

root@fpac-dev:/usr/src/net-tools# netstat --netrom
Active NET/ROM sockets
User       Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
*          *          KP4DJT-14  nr0     LISTENING    000/000  0       0

I looked at the netstat.c file and I can see where all of the other protocols
call out data from different parts of the system such as the /proc/net areas
but none of that is visible for ROSE, it is as though it never existed, but I
see references to it in the past on the 'net, so at one time it was in there.

It would appear that it was removed.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
