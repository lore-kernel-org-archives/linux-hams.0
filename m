From: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Mon, 5 Aug 2002 18:19:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020805171956.GA566@columbia.g7iii.bogus>
References: <20020801194618.GA722@columbia.g7iii.bogus> <20020802023237.B28097@dea.linux-mips.net> <20020802182854.GA503@columbia.g7iii.bogus> <20020805142824.A23501@dea.linux-mips.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020805142824.A23501@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Cc: linux-hams@vger.kernel.org

On Mon, Aug 05, 2002 at 02:28:24PM +0200, Ralf Baechle DO1GRB wrote:

> I'll make them available asap; I've still a huge number of loose ends to
> solve, hours of typing ahead ...

Heh, I know that feeling :) 
 
> Thanks for reminding me of that code again.  I'd not mind taking that
> patch as a base to start with.  However the author doesn't even claim it
> to be working and the patch only minimally deals with the problems that
> the current code is suffering from.  I also had a conversation with
> Alan Cox (GW4PTS) who originally wrote the code.  Alan wasn't fond at all
> of newax25 because the oldcode despite it's problem is fairly stable in
> practical use.  So I came to the conclusion the the best thing will be if
> I first solve the problems of the current codebase and then later import
> code from the DG1KJD.

Yeah, that is actually a good point from Alan. And there are things that
KJD code does that I consider 'wrong' - see my previous recent emails on
'network purity'. 

I believe it also changes the interface definitions, and needs a modified
libax25/apps/tools.

For what its worth, I did get quite far in getting it merged into a
2.5.29 tree. Got approximatley 50% of the rejects sorted, but most of
the remaining ones were the soundmodem, and scc drivers.

Unfortunatley, most of the remainder are in the core AX25 code, and
one reject in particular is 60K!


All the Best

Iain

