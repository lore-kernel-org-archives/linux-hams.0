From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Something about timers
Date: Fri, 9 Sep 2005 11:14:04 +0100
Message-ID: <20050909101403.GC3747@linux-mips.org>
References: <200509090834.51941.oh1mrr@nic.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200509090834.51941.oh1mrr@nic.fi>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Fri, Sep 09, 2005 at 08:34:51AM +0300, jarmo wrote:

> Just noticed, that if you compile kernel without looking,
> Prosessor type and features -> Timer frequency, default is
> 250ms, you get quite suprising behaviour with your ax25 stuff,
> especially 6pack :)
> I'd say quite quick actions and in server case crashes :(. That
> mean you have both fbb and cluster running in same computer
> with 5 user ports.
> 
> So when taking forinstance kernel 2.6.13 in use, select timer as 1000ms,
> then your normal ax25 timers should work.

Time in AX.25, NET/ROM and ROSE is still being meassured in units of
timer ticks which has not only changed going from 2.4 to 2.6; it's
also differing between architectures.  I've recently sent out a set of
three patches to standardize that on ms.  That's probably a too small unit
so I think I'm going to change that again before submitting to upstream.

Any crashes you may see are certainly unrelated to this.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
