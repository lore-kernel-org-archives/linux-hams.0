From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Packet Problem
Date: Tue, 16 Sep 2003 20:49:21 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200309162049.21787.pa3gcu@zeelandnet.nl>
References: <20030916012317.GA9420@leo.tneu.visi.com> <200309160933.10609.pa3gcu@zeelandnet.nl> <20030916124603.GA10749@leo.tneu.visi.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030916124603.GA10749@leo.tneu.visi.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Neu <tim@tneu.visi.com>
Cc: linux-hams@vger.kernel.org

On Tuesday 16 September 2003 14:46, Tim Neu wrote:
> # name callsign speed paclen window description
> #
> p1       KB0UPW-1        1200    255     2       145.670 MHz
> (1200
> bps)

Your ax25 versions are uptodate and should pose no problems as thats what most 
of us use.

Tomi and another chap mentioned the "line" speed  i suggest you take note of 
that. I belive that the problem must lye there.

Another thing is in your start script you start 2 ax25 interfaces while in 
your axports you only have one entry, possably you cut it out.

You use 2 different ip#'s, there is no need, one is sufficent unless you have 
needs to do otherwise.

-- 
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



