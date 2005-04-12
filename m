From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Rose module and kernel 2.6.11
Date: Wed, 13 Apr 2005 00:16:02 +0100
Message-ID: <20050412231602.GA4548@linux-mips.org>
References: <BAY102-F35A48877CA3B5F1F485F68DB3F0@phx.gbl> <425ADD44.8090509@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <425ADD44.8090509@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Mon, Apr 11, 2005 at 10:25:40PM +0200, Bernard Pidoux wrote:

> I have noticed something strange with rose module and 2.6 kernel (at 
> least 2.6.10 and 2.6.11).
> 
> When loading rose module, it loads now automatically ax25 module. Good.

Modprobe certainly got that right in 2.4 also.

> But, it also creates 9 interfaces from rose0 to rose9 with hardware 
> address 0000000 as seen with IP address or ifconfig.
> 
> Is this what rose module should do actually ?
> With previous versions, loading rose module did not create any rose 
> interface. They were created by the application such as ROSE/FPAC.

It's crufty, yes.  No idea why the code was written the way it is but on
startup the code will generate 10 ROSE interfaces just in case.  However
the kernel does no "ifconfig roseX up", so ifconfig shouldn't display
them without the -a option.  If that happens to you then then I guess one
of your distribution's configuration mechanisms is playing a little
crazy.  You can easily see that in /proc/net/dev - any ROSE system will
have 10 rose%d devices in there.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

