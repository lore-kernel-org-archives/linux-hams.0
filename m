From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Mon, 5 Aug 2002 21:11:39 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020805211137.B25963@dea.linux-mips.net>
References: <20020801194618.GA722@columbia.g7iii.bogus> <20020802023237.B28097@dea.linux-mips.net> <20020802182854.GA503@columbia.g7iii.bogus> <20020805142824.A23501@dea.linux-mips.net> <1028570528.20010.51.camel@maze.mythral.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1028570528.20010.51.camel@maze.mythral.org>; from nurf@spamcop.net on Mon, Aug 05, 2002 at 11:02:06AM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Heasman <nurf@spamcop.net>
Cc: Iain Young - G7III <g7iii@g7iii.demon.co.uk>, linux-hams@vger.kernel.org

On Mon, Aug 05, 2002 at 11:02:06AM -0700, Ray Heasman wrote:

> On Mon, 2002-08-05 at 05:28, Ralf Baechle DO1GRB wrote:
> > Thanks for reminding me of that code again.  I'd not mind taking that
> > patch as a base to start with.  However the author doesn't even claim it
> > to be working and the patch only minimally deals with the problems that
> > the current code is suffering from.  I also had a conversation with
> > Alan Cox (GW4PTS) who originally wrote the code.  Alan wasn't fond at all
> > of newax25 because the oldcode despite it's problem is fairly stable in
> > practical use.  So I came to the conclusion the the best thing will be if
> > I first solve the problems of the current codebase and then later import
> > code from the DG1KJD.
> 
> I am sad to hear you say this. As someone who has extensively used the
> AX25 stack in different and weird ways on several machines with many (>8
> ports/machine), I feel comfortable saying that:
> 
> 1) The current stack is an anachronistic nightmare to actually use.
> 2) The current stack is terribly bug ridden and unpredictable.
> 3) The current stack has several misfeatures 
> 
> I think perhaps Alan doesn't really use his stack very much or perhaps
> suffers a bit from parent's myopia. Yes, it doesn't kernel panic on 2.0
> and 2.2 kernels (I have yet to get it to run for >24 hours on a 2.4
> kernel without a kernel panic, with my Baycom scc card and all my other
> ports). Yes, it nominally sends some packets around. No, it doesn't do
> it correctly.
> 
> Just because it sits there and keys rigs without crashing doesn't mean
> it does the right thing.
> 
> I am sorry if this comes across as rather extreme, but from the
> perspective of someone who remote administers a complex station, it is
> hard to say anything good about the current stack except "It doesn't
> kernel panic my 2.2 kernel". If there was something else out there that
> was as easy to connect to remotely over a low bandwidth link, I would
> use it.
> 
> I think Jens suggestion to do most everything in userspace with a tiny
> link into some useful kernel support is the right way to go.

Alan rejected that idea for performance reasons.  The code is also in use
with multimegabit link ...

> I do see the point of making the current code worthy of being included
> in a stable kernel, but I think the "next" ax25 stack should be mostly
> in userspace and reimplemented from the ground up.
> 
> If anyone really cares, I am willing to sit down and try to remember and
> list all the pathological behaviour I have seen in the last 4 years.

That would be very much appreciated.  I'm trying to cure the problems of
the existing code base from a kernel hackers perspective - I cannot claim
years of experience with it.

I'd also be interested in what hardware your system has and what bandwidth
all the interfaces are running at.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
