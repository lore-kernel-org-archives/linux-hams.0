From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Re: AX.25 in kernel 2.5 status?
Date: Fri, 11 Oct 2002 15:56:23 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200210111456.PAA20991@gw.chygwyn.com>
References: <20021011163542.A17419@linux-mips.org>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021011163542.A17419@linux-mips.org> from "Ralf Baechle DO1GRB" at Oct 11, 2002 04:35:42 PM
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: M Taylor <mctylr@privacy.nb.ca>, linux-hams@vger.kernel.org

Hi,

> 
> On Fri, Oct 11, 2002 at 02:47:36PM +0100, Steven Whitehouse wrote:
> 
> > > I yesterday published my changes to redo the /proc files for AX.25,
> > > NET/ROM and ROSE with the seq_file stuff.  As usually these changesets
> > > are available at http://linux-ham.bkbits.net/linux-2.5.
> > > 
> > > 73 de DO1GRB op Ralf
> > 
> > It seems you beat me to it :-) though there is one extra thing that still needs
> > to be fixed in the uid code from my patch where ax25_findbyuid() returns
> > a pointer to a structure which might disappear at any time. Its only use
> > is to check permissions at bind time, so I just moved the check under
> > the lock,
> 
> Unfortunately the code is full of such funnies.  Remember as the code is
> in 2.5 there are no more locks outside protecting us from our own thread
> safety - or rather the lack thereof.  In particular the socket locking
> is rather hard to get right.
>
Yes I know, I worked on this for DECnet a while back :-) My plan since I am
rather constrained by time was to start at the lower levels of this
and do one small easily testable feature as I get time to work on it
and very slowly work towards the higher layers.
 
> Another problem we still have - and we're sharing it with other protocols
> such ipv4 - is that our proc code is holding a lock for the time the
> /proc file is open.  That's not a significant time but it may delay
> access, so I've made most of those loads rw locks.  Worst case a buggy
> or malicious piece of software might even hold a proc file open for a long
> time thereby stalling the functioning of the stack partially or fully.
> 
Its only during read operations, not the open that the lock is held I
think, but I agree that an rw lock is the best solution here.

> If you could update your fix I certainly would accept it :)
> 
> 73 de DO1GRB op Ralf
>
Ok. I'll do that,

Steve.
