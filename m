From: Ray Heasman <nurf@spamcop.net>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: 05 Aug 2002 11:02:06 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1028570528.20010.51.camel@maze.mythral.org>
References: <20020801194618.GA722@columbia.g7iii.bogus>
	<20020802023237.B28097@dea.linux-mips.net>
	<20020802182854.GA503@columbia.g7iii.bogus> 
	<20020805142824.A23501@dea.linux-mips.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020805142824.A23501@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Cc: Iain Young - G7III <g7iii@g7iii.demon.co.uk>, linux-hams@vger.kernel.org

Hi Ralf,

On Mon, 2002-08-05 at 05:28, Ralf Baechle DO1GRB wrote:
> Thanks for reminding me of that code again.  I'd not mind taking that
> patch as a base to start with.  However the author doesn't even claim it
> to be working and the patch only minimally deals with the problems that
> the current code is suffering from.  I also had a conversation with
> Alan Cox (GW4PTS) who originally wrote the code.  Alan wasn't fond at all
> of newax25 because the oldcode despite it's problem is fairly stable in
> practical use.  So I came to the conclusion the the best thing will be if
> I first solve the problems of the current codebase and then later import
> code from the DG1KJD.

I am sad to hear you say this. As someone who has extensively used the
AX25 stack in different and weird ways on several machines with many (>8
ports/machine), I feel comfortable saying that:

1) The current stack is an anachronistic nightmare to actually use.
2) The current stack is terribly bug ridden and unpredictable.
3) The current stack has several misfeatures 

I think perhaps Alan doesn't really use his stack very much or perhaps
suffers a bit from parent's myopia. Yes, it doesn't kernel panic on 2.0
and 2.2 kernels (I have yet to get it to run for >24 hours on a 2.4
kernel without a kernel panic, with my Baycom scc card and all my other
ports). Yes, it nominally sends some packets around. No, it doesn't do
it correctly.

Just because it sits there and keys rigs without crashing doesn't mean
it does the right thing.

I am sorry if this comes across as rather extreme, but from the
perspective of someone who remote administers a complex station, it is
hard to say anything good about the current stack except "It doesn't
kernel panic my 2.2 kernel". If there was something else out there that
was as easy to connect to remotely over a low bandwidth link, I would
use it.

I think Jens suggestion to do most everything in userspace with a tiny
link into some useful kernel support is the right way to go.

I do see the point of making the current code worthy of being included
in a stable kernel, but I think the "next" ax25 stack should be mostly
in userspace and reimplemented from the ground up.

If anyone really cares, I am willing to sit down and try to remember and
list all the pathological behaviour I have seen in the last 4 years.

Cheers,
Ray
ZR6RAY

