From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Mon, 5 Aug 2002 20:35:20 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020805203520.A5959@pull.privacy.nb.ca>
References: <20020801194618.GA722@columbia.g7iii.bogus> <20020802023237.B28097@dea.linux-mips.net> <20020802182854.GA503@columbia.g7iii.bogus> <20020805142824.A23501@dea.linux-mips.net> <1028570528.20010.51.camel@maze.mythral.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1028570528.20010.51.camel@maze.mythral.org>; from nurf@spamcop.net on Mon, Aug 05, 2002 at 11:02:06AM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Heasman <nurf@spamcop.net>
Cc: linux-hams@vger.kernel.org

On Mon, Aug 05, 2002 at 11:02:06AM -0700, Ray Heasman wrote:
> Hi Ralf,
> 
> and 2.2 kernels (I have yet to get it to run for >24 hours on a 2.4
> kernel without a kernel panic, with my Baycom scc card and all my other
> ports). Yes, it nominally sends some packets around. No, it doesn't do
> it correctly.

Do you have an decoded Oops from a 2.4 kernel panic?

> I think Jens suggestion to do most everything in userspace with a tiny
> link into some useful kernel support is the right way to go.
> 
> I do see the point of making the current code worthy of being included
> in a stable kernel, but I think the "next" ax25 stack should be mostly
> in userspace and reimplemented from the ground up.

I disagree with the idea of putting the AX.25 (and/or Net/ROM) network
protocol stacks into userspace. That would be a silly idea with no
benefit.

The idea of putting amateur radio device drivers (mkiss, BayCom, soundcard,
SCC, etc.) in userspace only makes sense for soundcard and perhaps BayCom,
because of the amount of CPU utilitization by these drivers. Since I don't
use BayCom I am not certain, but it may or may not use enough CPU to
make it sensible to put it into userspace. I suspect userspace soundcard
is safer. Why would you want mkiss, SCC or other drivers in userspace?

M Taylor
