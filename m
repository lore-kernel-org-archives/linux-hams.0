From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [RFC] Future of INP3 patch
Date: Tue, 30 Mar 2004 16:14:28 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040330141428.GA27173@linux-mips.org>
References: <20040329202649.C231@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0403310016220.28083-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0403310016220.28083-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <w.knol@niwa.co.nz>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Wed, Mar 31, 2004 at 12:27:33AM +1200, Wilbert Knol wrote:

> It is not a case of not caring. I haven't the guts to try the 2.6
> kernels...
> 
> My experience upgrading 2.2 to  2.4 wasn't a happy one. I rely on a
> working AX25 system for my E-mail, and the current 2.4.22 kernel
> (without NETROM) is reasonably stable.

Recall for how long nobody at all was looking after that code - it's quite
amazing 2.4 was working as well as it does.  Here we're trying to balance
the risk of including the patch with the advantages it's going to deliver.

> I suspect several list subscribers (those running full-service DX
> Clusters, BBS's, gateways etc etc) are in the same boat.
> 
> However, if the 2.6.4 kernel with Jeroen's inp3 patches applied is OK
> for AX25, then I am quite prepared to give it a try. What is the
> verdict?

The potencial of Jeroen's patch to disturb netrom systems when enabled is
fairly low; it's zero if CONFIG_NETROM is disabled or the module not loaded.
It'll need minor changes to make it bulletproof against optimizatios of
modern compiler (the extern vs. static inline thing) but with that applied
I'm very inclined to apply it.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
