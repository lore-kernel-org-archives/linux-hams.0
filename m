From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Re: AX.25 in kernel 2.5 status?
Date: Fri, 11 Oct 2002 10:49:25 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200210110949.KAA19486@gw.chygwyn.com>
References: <20021010035703.B8136@pull.privacy.nb.ca>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021010035703.B8136@pull.privacy.nb.ca> from "M Taylor" at Oct 10, 2002 03:57:03 AM
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: M Taylor <mctylr@privacy.nb.ca>
Cc: linux-hams@vger.kernel.org

Hi,

> 
> 
> A while back (a few months ago) a couple of developers/hams (Ralf and others) 
> mentioned that work needed to be done in the 2.5 linux kernel due to changes
> (I believe relating cli()/sti() plus other things).
> 
> Has there been any progress? There appears to be some patches included
> in 2.5.37 from Ralf and David Miller. Does include all the changes we 
> _need_ to make? (that is for when cli()/sti() and such calls go away)
>
The patch I proposed still hasn't made it into mainline yet. I had a
message from Arnaldo Carvalho de Melo recently asking about /proc
changes very much along the lines of the patch I did, so this has
brought it to mind again. I'll do my best to update, test and submit
it shortly providing there are no objections to it,

Steve.
