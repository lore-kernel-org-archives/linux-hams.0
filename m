From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Fri, 26 Jul 2002 13:50:45 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200207261250.NAA32030@gw.chygwyn.com>
References: <20020726134216.A4126@dea.linux-mips.net>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020726134216.A4126@dea.linux-mips.net> from "Ralf Baechle" at Jul 26, 2002 01:42:16 PM
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@uni-koblenz.de>
Cc: linux-hams@vger.kernel.org

Hi,

> 
> Forgive if I'm missing any developments on this list; I've been (again ...)
> unsubscribed by one of Mati's scripts ...
> 
> No substancial changes have been done to the AX.25 kernel stack in a extended
> period of time.  As the result it is still doing crude stuff like globally
> enabling and disabling interrupts, has no understanding of shared skb, isn't
> fully multithreaded and probably plenty more problems I haven't spotted yet.
> Now that we're about to remove global cli() / sti() from the kernel this
> means the AX.25 stack will soon break entirely.
> 
> Is there any ongoing development I'm not aware of?  Just in case I've
> started doing some cleanup last night ...
> 
> 73 de DO1GRB op Ralf
>
I started a little. Untested yet, but for what its worth:

http://www.chygwyn.com/~steve/kpatch/ax25/ax25-uid-2.5.25.diff

Please feel free to use as much/little as you like of this patch. It would
be nice to do enough tidying to these protocols that we can get rid of
things like deliver_to_old_ones() from the core code. I can't spare a
lot of time, but I'll help where I can.

I spoke to Dave Jones at the recent UKUUG conference and he mentioned that
it appeared that nobody was doing any work on AX.25 and associated
protocols which was why I started something. It would be a good idea to
drop him a line to let him know that you are working on it,

Steve.
G7RRM

