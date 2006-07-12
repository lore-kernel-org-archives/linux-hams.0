From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 00:16:43 +0100
Message-ID: <20060712231643.GA16205@linux-mips.org>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>, Bernd Eckenfels <ecki@debian.org>

On Tue, Jul 11, 2006 at 11:14:00PM -0400, Chuck Hast wrote:

> I see netstat with netrom support, and I think I have seen something where 
> it
> may have had some form of support for ROSE, does anyone know if there
> is a version out there that does have support for the protocol?

All protocol and hardware support in net-tools is configurable and
unfortunately the default configuration has shipped enables AX.25 and
NETROM and disables ROSE.

It seems all Linux distributions just stick to the default configuration
so I cc my reply to the net-tools maintainer with the request to enable
ROSE in the net-tools default configuration.

  Ralf
