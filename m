From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
Date: Thu, 22 Jul 2021 14:48:46 +0200
Message-ID: <YPlpLpL3Yrz/YE6R@linux-mips.org>
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave van der Locht <d.vanderlocht@gmail.com>
Cc: linux-hams@vger.kernel.org

On Thu, Jul 22, 2021 at 01:40:23PM +0200, Dave van der Locht wrote:

> With Linux kernel 5.4 and up I've noticed some type of NETROM frames
> (conn, disc, etc.) contain random fragments of data from memory.
> I've seen all kinds of data fragments with security sensitive
> information in them depending on the software running.
> 
> Those random data fragments seem to appear only in some NETROM frames,
> haven't noticed them in any other frame type.
> 
> Most, if not all, remote node software seems to ignore those fragments
> and it won't be noticed until you capture the AX.25 over UDP frames.
> You'll see the frames are larger than expected and contain random
> fragments of data from (shared?) memory.
> 
> I've tested this with several 5.4 and 5.10 kernel versions
> distributions and they all seem to leak security sensitive information
> the same way into NETROM frames. Mostly logging data, but I've also
> seen MySQL data and other random fragments of data.
> I've also tested with kernel 4.19, which doesn't seem te be affected.

While that's not as accurate as a git bisect, it's good start.  Can you
provide a dump of such packets?

  Ralf
