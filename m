From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: instant oops with AF_ROSE
Date: Wed, 20 Jul 2011 10:32:14 +0100
Message-ID: <20110720093214.GA20152@linux-mips.org>
References: <4E186E25.5080200@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E186E25.5080200@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard F6BVP <f6bvp@free.fr>
Cc: wchast@gmail.com, davem@davemloft.net, linux-hams@vger.kernel.org

On Sat, Jul 09, 2011 at 05:05:09PM +0200, Bernard F6BVP wrote:

> What we do with ROSE nodes is to create a network allowing AX25
> frames routing based on destination address. However, basically,
> ROSE frames
> are still AX.25 standard frames that can be sent over packet radio.
> In order to relay rose frames through Internet, applications like
> ax25ipd encapsulates rose inside of IP or UDP frames.
> 
> I agree that rose module is still unfriendly and will crash linux
> kernel on some occasions.
> For example, after creating rose socket and populating rose routing
> table, removing rose module is not possible.
> 
> There is either a kernel crash or a looping message
> 
> kernel:unregister_netdevice: waiting for rose0 to become free. Usage
> count = 6
> 
> where count can be any number without any relation to actual usage
> and remaining the same, preventing Linux to shutdown.
> 
> I noticed that there are no refcount entries in rose node or rose neigh
> structures. This may be related ?

As part of fixing the problem reported by David I've found 4 race conditions
so far.  I've posted the patches to linux-hams for testing but on a 2nd
thought I think the race accessing rose_neigh->use is unlikely to be the
cause for what Bernard is observing.

  Ralf
