From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Re: AX.25 unaccepted socket makes problems
Date: Wed, 28 May 2003 11:20:26 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200305281020.LAA18189@gw.chygwyn.com>
References: <2278@9A0TCP>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2278@9A0TCP> from "Tihomir Heidelberg" at May 28, 2003 08:46:03 AM
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org>
Cc: thomas@osterried.de, linux-hams@vger.kernel.org

Hi,

I've got a few odd bits of patches for AX.25 for 2.5 kernels that I'm intending
to feed into the kernel shortly. I'll take a look at the problem you've
brought up at the same time as I'd like to have that solved. My main
interest though is 2.5 rather than fixing up 2.4.

[snip]
> 
> > [as i mentioned also, ax25rtd which adds ax25 route lists to the kernel,
> > causes troubles to the kernel. perhaps it's one of those routines which
> > messes up the ax25 cb lists as side effect]
> 
> ax25rtd/axparms calls ioctl(SIOCADDRT) on ax.25 socket, I see that
> ax25_route_list is not protected with cli() stuff, maybe we should
> protect this list too ? dont know how this can hurt ax25_list, but
> protecting this list will not hurt anyone...
> 
> anyway, I read that Ralf is doing some things in 2.5 kernel tree,
> spinlock instead cli() protection should be used in future ax.25
> kernel, as I read Ralf works on spinlock in ax.25 code... should
> we move to spinlocks in 2.4 kernels too or we will wait for 2.6 ?
>
Yes, some of his work has made it in, some more can be found in the linux-hams
bkbits tree. If you are looking at structures that are not currently
protected in 2.4, then I'd suggest looking at spinlocks right away. You
might find the solution in Ralf's work for 2.5 and it would be a good
idea to try and keep 2.4 similar to 2.5 where possible.

The last day or two I've been quite busy and I hope to have some time to
put out my patches for testing shortly,

Steve.
G7RRM

