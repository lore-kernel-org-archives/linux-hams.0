From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: AX.25 in kernel 2.5 status?
Date: Fri, 11 Oct 2002 17:38:50 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021011173850.A19593@linux-mips.org>
References: <20021011163542.A17419@linux-mips.org> <200210111456.PAA20991@gw.chygwyn.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200210111456.PAA20991@gw.chygwyn.com>; from steve@gw.chygwyn.com on Fri, Oct 11, 2002 at 03:56:23PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Whitehouse <Steve@ChyGwyn.com>
Cc: M Taylor <mctylr@privacy.nb.ca>, linux-hams@vger.kernel.org

On Fri, Oct 11, 2002 at 03:56:23PM +0100, Steven Whitehouse wrote:

> > Another problem we still have - and we're sharing it with other protocols
> > such ipv4 - is that our proc code is holding a lock for the time the
> > /proc file is open.  That's not a significant time but it may delay
> > access, so I've made most of those loads rw locks.  Worst case a buggy
> > or malicious piece of software might even hold a proc file open for a long
> > time thereby stalling the functioning of the stack partially or fully.
> > 
> Its only during read operations, not the open that the lock is held I
> think, but I agree that an rw lock is the best solution here.

The only solution I see would be redoing the data structures or as
implemented in a few other places in the kernel accepting O(n) behaviour
for the seq_operations.next method - which would make reading the
performance for reading the proc file O(n^2).  But that's a minor
problem at the moment.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
