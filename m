From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: ax25 kernel problem sometimes accur
Date: Sun, 8 Dec 2002 00:39:11 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021208003911.A30880@linux-mips.org>
References: <20021207021016.A15120@linux-mips.org> <Pine.LNX.4.44.0212072115500.2444-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212072115500.2444-100000@oh2bns.ampr.org>; from tpm@prkele.tky.hut.fi on Sat, Dec 07, 2002 at 09:32:44PM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

On Sat, Dec 07, 2002 at 09:32:44PM +0200, Tomi Manninen wrote:

> > As is the 2.4 AX.25 code is totally racy.  Basically it only has a chance
> > to survive if the user is nice ...
> 
> This reminds me... What is the situation with your fixes? I understood the 
> kernel is now in feature freeze. Will the next release kernel have a bit 
> more un-racy AX.25 stack?

I consider everything I'm currently working on as pure bug fix.  As such
they're not affected by the feature freeze.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
