From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 11 Dec 2002 02:40:19 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021211024019.A28178@linux-mips.org>
References: <20021208003911.A30880@linux-mips.org> <Pine.HPX.4.10.10212101608040.23101-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.HPX.4.10.10212101608040.23101-100000@saturn.trs.ntc.nokia.com>; from tpm@prkele.tky.hut.fi on Tue, Dec 10, 2002 at 04:09:20PM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

On Tue, Dec 10, 2002 at 04:09:20PM +0200, Tomi Manninen OH2BNS wrote:

> > I consider everything I'm currently working on as pure bug fix.  As such
> > they're not affected by the feature freeze.
> 
> Agreed.
> 
> Anyway, what is the situation now? Are there still lots of known races
> unfixed in your tree?

The whole job is much bigger than you may assume.  I've removed
SOCKOPS_WRAP which so far was forcing single threaded execution of most of
the AX.25 code.  I did that because for 2.5 the removal of SOCKOPS_WRAP
the entire kernel was on the agenda.  This didn't happen yet but I'm
removed it's use from AX.25 & Co. anyway.  As the result the entire locking
work isn't just plugging a few holes which would have been bad enough, it's
completly redoing the locking stuff from scratch.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
