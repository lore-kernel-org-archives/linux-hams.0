From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Fri, 26 Jul 2002 20:15:10 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020726201510.A28240@dea.linux-mips.net>
References: <20020726134216.A4126@dea.linux-mips.net> <200207261250.NAA32030@gw.chygwyn.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200207261250.NAA32030@gw.chygwyn.com>; from steve@gw.chygwyn.com on Fri, Jul 26, 2002 at 01:50:45PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Whitehouse <Steve@ChyGwyn.com>
Cc: linux-hams@vger.kernel.org

On Fri, Jul 26, 2002 at 01:50:45PM +0100, Steven Whitehouse wrote:

> I started a little. Untested yet, but for what its worth:
> 
> http://www.chygwyn.com/~steve/kpatch/ax25/ax25-uid-2.5.25.diff
> 
> Please feel free to use as much/little as you like of this patch. It would
> be nice to do enough tidying to these protocols that we can get rid of
> things like deliver_to_old_ones() from the core code. I can't spare a
> lot of time, but I'll help where I can.
> 
> I spoke to Dave Jones at the recent UKUUG conference and he mentioned that
> it appeared that nobody was doing any work on AX.25 and associated
> protocols which was why I started something. It would be a good idea to
> drop him a line to let him know that you are working on it,

I took a look at your code; it's orthogonal to what I did so far.  I
consider the removal of global cli/sti & co the most immediate problem,
so I started redoing the whole locking in net/ax25/.  Some of that stuff
was unbelievably bad wrt. to SMP machines.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
