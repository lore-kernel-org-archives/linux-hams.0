From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: Compiling FBB
Date: Fri, 21 Oct 2011 14:04:00 +0200
Message-ID: <20111021120359.GO8243@x-berg.in-berlin.de>
References: <4E93FBEC.7050907@free.fr>
 <4E98B35E.1050602@eunet.rs>
 <4E993C82.2090601@free.fr>
 <4EA0EEE4.7050502@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EA0EEE4.7050502@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>, "Bernard, f6bvp" <f6bvp@free.fr>, ralf@linux-mips.org, linux-hams <linux-hams@vger.kernel.org>

Hello,

On 2011-10-20 21:02:44 -0700, David Ranch <linux-hams@trinnet.net>
wrote in <4EA0EEE4.7050502@trinnet.net>:
> 
> Hello Bernard, Ralf, Thomas,
> 
> I've been meaning to ask this question for a while now:  Do you know
> why the official version of the ax25 apps/libs/tools hasn't been
> updated in ages?

Unfortunately, there's no debian-developer who regulary builds new
packages from the CVS head of ax25-apps, -tools and libax25.

> I've been slowly hacking up the legacy "released"
> versions to work around bugs I've found in my personal uses and I'm
> sure there are other issues I haven't hit.. yet:

We're trying to fix bugs we're aware of.

> nrattach.c - non-incrementing nr interfaces (netrom)
> http://marc.info/?l=linux-hams&m=125646640011531&w=2

http://www.linux-ax25.org/cvsweb/ax25-tools/netrom/nrattach.c.diff?r1=1.3;r2=1.4;f=h

I was guilty. I have fixed it 2009/11/02.
> 
> axipd/kiss.c - control byte non-zero when used for axudp tunnels
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=606338

It has been a long thread.

We rejected the patch because it leads kiss-commands to be converted
to normal data packets.

If there really come data packets with the wrong kiss header (i.E.
slottime+DATA), the software (or kernel-driver) which sends false data
has to be fixed.

> It seems that many of these issues are resolved in the official CVS
> but maybe other issues as you pointed out in that Google URL aren't.

Again: We're trying to fix bugs get aware of.

> It would be nice if we could at least get  the current CVS pushed
> out as say a new official version of 0.0.13 and be aligned across
> all three packages.   Even better, have this 0.0.13 version
> integrate the fixes in the Google repo too?

What google repo?

The ax25-apps, -tools and libax25 are homed at linux-ax25.org.

vy 73,
	- Thomas  dl9sau
