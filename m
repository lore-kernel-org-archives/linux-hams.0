From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 12:20:41 +0100
Message-ID: <20060713112041.GA20294@linux-mips.org>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com> <20060712231643.GA16205@linux-mips.org> <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>, Bernd Eckenfels <ecki@debian.org>

On Thu, Jul 13, 2006 at 07:08:39AM -0400, Chuck Hast wrote:

> >All protocol and hardware support in net-tools is configurable and
> >unfortunately the default configuration has shipped enables AX.25 and
> >NETROM and disables ROSE.
> >
> >It seems all Linux distributions just stick to the default configuration
> >so I cc my reply to the net-tools maintainer with the request to enable
> >ROSE in the net-tools default configuration.

> Thank you for this information, does this mean that if I re-compile
> the net-tools
> all I need to do is enable ROSE? If so I guess I will have to try to do it,
> unless of course there is a binary which I can download somewhere.

Yes, you just need to recompile net-tools.

  Ralf
