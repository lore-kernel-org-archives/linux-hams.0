From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Tue, 6 Aug 2002 12:22:39 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020806122238.A22149@dea.linux-mips.net>
References: <20020801194618.GA722@columbia.g7iii.bogus> <20020802023237.B28097@dea.linux-mips.net> <20020802182854.GA503@columbia.g7iii.bogus> <20020805142824.A23501@dea.linux-mips.net> <1028570528.20010.51.camel@maze.mythral.org> <20020805203520.A5959@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020805203520.A5959@pull.privacy.nb.ca>; from mctylr@privacy.nb.ca on Mon, Aug 05, 2002 at 08:35:20PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: M Taylor <mctylr@privacy.nb.ca>
Cc: Ray Heasman <nurf@spamcop.net>, linux-hams@vger.kernel.org

On Mon, Aug 05, 2002 at 08:35:20PM +0100, M Taylor wrote:

> > and 2.2 kernels (I have yet to get it to run for >24 hours on a 2.4
> > kernel without a kernel panic, with my Baycom scc card and all my other
> > ports). Yes, it nominally sends some packets around. No, it doesn't do
> > it correctly.
> 
> Do you have an decoded Oops from a 2.4 kernel panic?

I'd also interested just to see it the AX.25 stack or any of the ham radio
drivers was the culprit.

> I disagree with the idea of putting the AX.25 (and/or Net/ROM) network
> protocol stacks into userspace. That would be a silly idea with no
> benefit.

I'm not sure if we already can put a full network stack into userspace
while maintaining the socket API.  And anything but the standard socket
API is inacceptable.  In particular I consider apps that come with their
own stack builtin like TheNetNode heavily missdesigned.

> The idea of putting amateur radio device drivers (mkiss, BayCom, soundcard,
> SCC, etc.) in userspace only makes sense for soundcard and perhaps BayCom,
> because of the amount of CPU utilitization by these drivers. Since I don't
> use BayCom I am not certain, but it may or may not use enough CPU to
> make it sensible to put it into userspace. I suspect userspace soundcard
> is safer. Why would you want mkiss, SCC or other drivers in userspace?

Soundmodem is doing heavy numbercrunching.  That's a workload that doesn't
behave to nicely in there kernel where the driver cannot be preempted.  Once
the 2.5 scheduler redesign finally has finished I hope running a realtime
workload like soundmodem in userspace will be reliable.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
