From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: Re: Problems with system lockup
Date: Thu, 18 Nov 2010 19:13:24 +0000
Message-ID: <1290107604.21069.17.camel@localhost.localdomain>
References: <555517178-1290101199-cardhu_decombobulator_blackberry.rim.net-278429640-@bda381.bisx.prod.on.blackberry>
	 <4CE573AC.1010607@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CE573AC.1010607@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Thu, 2010-11-18 at 10:42 -0800, Dave Platt wrote:

> -  Hardware problems on the motherboard, pure and simple...
>    bad DRAM, for example, or an overheating CPU due to a
>    fan failure, or overly-aggressive overclocking.  It
>    wouldn't hurt to install, and then run the stand-alone
>    MEMTEST86+ check (let it run overnight, at least) to
>    see if there are DRAM or timing problems.

This ^^^.  It smells hardware-y.  I'd be really surprised if JNOS could
do anything to hard-lock the system - typically even if something is
poking really low-level drivers the worst it will do is cause a kernel
panic.  Okay, that *will* basically lock up your system, but it should
be more informative than "just plain catatonic".

Very nearly all "just locks up" problems I've run across have been down
to dying memory or overheating CPUs.  In the past I've found that the
latter has been quite good for causing segfaults when the CPU is driven
hard, like compiling code or rendering video.

Gordon MM0YEQ

