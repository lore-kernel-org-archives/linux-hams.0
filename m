From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 11 Dec 2002 12:29:12 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10212111219220.22086-100000@saturn.trs.ntc.nokia.com>
References: <20021211024019.A28178@linux-mips.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021211024019.A28178@linux-mips.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

On Wed, 11 Dec 2002, Ralf Baechle DO1GRB wrote:

> On Tue, Dec 10, 2002 at 04:09:20PM +0200, Tomi Manninen OH2BNS wrote:
> 
> > > I consider everything I'm currently working on as pure bug fix.  As such
> > > they're not affected by the feature freeze.
> > 
> > Agreed.
> > 
> > Anyway, what is the situation now? Are there still lots of known races
> > unfixed in your tree?
> 
> The whole job is much bigger than you may assume.  I've removed
> SOCKOPS_WRAP which so far was forcing single threaded execution of most of
> the AX.25 code.  I did that because for 2.5 the removal of SOCKOPS_WRAP
> the entire kernel was on the agenda.  This didn't happen yet but I'm
> removed it's use from AX.25 & Co. anyway.  As the result the entire locking
> work isn't just plugging a few holes which would have been bad enough, it's
> completly redoing the locking stuff from scratch.

Ok, I understand. Anyway some kind of progress report would be nice. Even
something like: "don't hold your breath", if that is appropriate... :-)

I have gotten surprisingly many private queries about this lately, so to
recap what I have understood so far: the 2.4 code is bad, full of races,
works only if treated nicely. Your SOCKOPS_WRAP removal obviously makes
things even worse until you redo the locking stuff. When that is done we
have a perfect ax.25 stack again. Right? ;-)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

