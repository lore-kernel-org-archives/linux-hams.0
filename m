From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: AX.25 in kernel 2.5 status?
Date: Thu, 10 Oct 2002 19:22:28 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021010192228.A565@linux-mips.org>
References: <20021010035703.B8136@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021010035703.B8136@pull.privacy.nb.ca>; from mctylr@privacy.nb.ca on Thu, Oct 10, 2002 at 03:57:03AM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: M Taylor <mctylr@privacy.nb.ca>
Cc: linux-hams@vger.kernel.org

On Thu, Oct 10, 2002 at 03:57:03AM +0100, M Taylor wrote:

> A while back (a few months ago) a couple of developers/hams (Ralf and others) 
> mentioned that work needed to be done in the 2.5 linux kernel due to changes
> (I believe relating cli()/sti() plus other things).
> 
> Has there been any progress? There appears to be some patches included
> in 2.5.37 from Ralf and David Miller. Does include all the changes we 
> _need_ to make? (that is for when cli()/sti() and such calls go away)

Not by far.  The entire locking in the code is a mess.  It just happens
to work if you're nice to the code that is uniprocessor, no preemption
patches, avoid configuring routes etc. while the system is active etc.
Fixing all those omissions takes a while.  And cli/sti was just the peak
of the ice berg.  The SOCKCALL_WRAP wrap stuff will go away for example
and getting away without that require even more auverhaul of the locking
strategy which I'm just working on.

The result will probably be the only multithreaded AX.25, NETROM and ROSE
stacks on the planet.  An attribute of dubious value for a low bandwidth
protocols - but at least the thing will work.

> I guess I am asking what needs to be done before users can "safely" use
> 2.5.x kernels for amateur radio stuff.

2.4 needs the same stuff.  If it's working for you then just because you're
not shaking the code hard enough.

> Should the http://sourceforge.net/projects/ax25 Bug tracking, Support
> Requests / Patches / Feature Requires be used for the AX.25 (et all)
> kernel as well as the userland libraries, tools, and apps?

That project looks rather dead.

Anyway, all the userspace stuff stays usable.  I've been careful to not
change any of the kernel interfaces.

> Oh, and can a non-kernel programmer help? (I'm not familiar with kernel
> programming, but I can program, can I be of assistance?)

I don't have the bandwidth to do that but I think we need some documentation
of the AX.25 / NETROM/ ROSE network interface for programmers.  And all
the userspace stuff is still way too complex for the average "plug and play"
ham ...

  Ralf
