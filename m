From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Sun, 28 Jul 2002 15:15:49 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020728151549.A6657@dea.linux-mips.net>
References: <001401c2355e$2ef96750$e239832c@jrws2> <200207270637.01098.n7ipb@koster.seatcp.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200207270637.01098.n7ipb@koster.seatcp.net>; from n7ipb@koster.seatcp.net on Sat, Jul 27, 2002 at 06:38:43AM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ken Koster <n7ipb@koster.seatcp.net>
Cc: Robert Jenkins <raj@jrw.co.uk>, linux-hams@vger.kernel.org

On Sat, Jul 27, 2002 at 06:38:43AM -0700, Ken Koster wrote:

> It sounds like we have several people who've been digging into the kernel 
> code.  Do we perhaps need to make a real project of this, with a common 
> place for the code and CVS to keep track of the changes?  We could do this 
> as a sourceforge project, or if everyone would rather keep this small, at 
> least setup a CVS account somewhere that could keep track of changes.  I 
> could probably be talked into hosting such if needed.

I have server space but before I'm going to show off what we have I think
we first need to have something.  Unfortunatley the number of race
conditions in that code are just frightening and the longer I'm hacking
the code the more I discover.  Basically you can't run AX.25 on a system
with untrusted users ...

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
