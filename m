From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Mon, 5 Aug 2002 14:28:24 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020805142824.A23501@dea.linux-mips.net>
References: <20020801194618.GA722@columbia.g7iii.bogus> <20020802023237.B28097@dea.linux-mips.net> <20020802182854.GA503@columbia.g7iii.bogus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020802182854.GA503@columbia.g7iii.bogus>; from g7iii@g7iii.demon.co.uk on Fri, Aug 02, 2002 at 07:28:54PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Fri, Aug 02, 2002 at 07:28:54PM +0100, Iain Young - G7III wrote:

> > > (since the AX25 stack hasn't been touched much for a while, I
> > > thought it would be easier than other subsystems, that have had
> > > constant change).
> > 
> > Definately not.  The whole AX.25, NET/ROM and ROSE code is suffering from
> > severe bitrot.  None of the internal data structures are properly locked
> > etc.  I'm currently working on that.
> 
> I meant easier as in easier to merge, as there would be few patches
> that have been added to the mainline, thus less rejects.
> 
> Id actually be interested in your fixes, I may be able to integrate
> them into any 2.5 version of the KJD AX25 stack that I manage to
> produce.

I'll make them available asap; I've still a huge number of loose ends to
solve, hours of typing ahead ...

> > So you may find it easy to get old code into the current kerrnel - but
> > then it'll suffer from the same problems.  The fact is that the AX.25
> > code is looking like it was written for a 2.0 or 2.2 kernel ...
> 
> The KJD 'patch' is more like an entirely new AX25 stack - The Stack
> in 2.4/2.5 currently predates it. The origional idea was to get the
> KJD/FEF stack into 2.3, and thus 2.4 when it was released.
> 
> Unfortunatley Matt and Jens ran out of time, and priorties changed,
> however a 2.4.x version was started by Jens, and was up to 2.4.9, but
> is only a partial patch (there are a few .rej's actually in the patch).
> 
> Checkout http://www.afthd.tu-darmstadt.de/~dg1kjd/linux-ax25 for more
> details, and why Jens gave it up.

Thanks for reminding me of that code again.  I'd not mind taking that
patch as a base to start with.  However the author doesn't even claim it
to be working and the patch only minimally deals with the problems that
the current code is suffering from.  I also had a conversation with
Alan Cox (GW4PTS) who originally wrote the code.  Alan wasn't fond at all
of newax25 because the oldcode despite it's problem is fairly stable in
practical use.  So I came to the conclusion the the best thing will be if
I first solve the problems of the current codebase and then later import
code from the DG1KJD.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
