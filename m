From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: AX.25 in kernel 2.5 status?
Date: Fri, 11 Oct 2002 15:03:40 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021011150339.A15592@linux-mips.org>
References: <20021010035703.B8136@pull.privacy.nb.ca> <200210110949.KAA19486@gw.chygwyn.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200210110949.KAA19486@gw.chygwyn.com>; from steve@gw.chygwyn.com on Fri, Oct 11, 2002 at 10:49:25AM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Whitehouse <Steve@ChyGwyn.com>
Cc: M Taylor <mctylr@privacy.nb.ca>, linux-hams@vger.kernel.org

On Fri, Oct 11, 2002 at 10:49:25AM +0100, Steven Whitehouse wrote:

> > A while back (a few months ago) a couple of developers/hams (Ralf and others) 
> > mentioned that work needed to be done in the 2.5 linux kernel due to changes
> > (I believe relating cli()/sti() plus other things).
> > 
> > Has there been any progress? There appears to be some patches included
> > in 2.5.37 from Ralf and David Miller. Does include all the changes we 
> > _need_ to make? (that is for when cli()/sti() and such calls go away)
> >
> The patch I proposed still hasn't made it into mainline yet. I had a
> message from Arnaldo Carvalho de Melo recently asking about /proc
> changes very much along the lines of the patch I did, so this has
> brought it to mind again. I'll do my best to update, test and submit
> it shortly providing there are no objections to it,

I yesterday published my changes to redo the /proc files for AX.25,
NET/ROM and ROSE with the seq_file stuff.  As usually these changesets
are available at http://linux-ham.bkbits.net/linux-2.5.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
