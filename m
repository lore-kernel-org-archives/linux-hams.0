From: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
Subject: Re: make-3.79.1 bug breaks linux-2.5.24/drivers/net/hamradio/soundmodem
Date: Sat, 22 Jun 2002 16:24:13 -0500 (CDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0206221611430.7338-100000@chaos.physics.uiowa.edu>
References: <Pine.LNX.4.21.0206222052540.15173-100000@Consulate.UFP.CX>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0206222052540.15173-100000@Consulate.UFP.CX>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Riley Williams <rhw@InfraDead.Org>
Cc: Henning Makholm <henning@makholm.net>, "Adam J. Richter" <adam@yggdrasil.com>, bug-make@gnu.org, Linux Ham Radio <linux-hams@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, sailer@ife.ee.ethz.ch

On Sat, 22 Jun 2002, Riley Williams wrote:

> >> $(obj)/sm_tbl_%: $(obj)/gentbl
> >>         PATH=$(obj):$$PATH $<
> 
> > That looks like an excessively complicated workaround. Why not just
> >
> > $(obj)/sm_tbl_%: $(obj)/gentbl
> > 	$(obj)/gentbl
> >
> > instead ?

I think I like the latter better as well. Anyway, $(obj) is just "."
currently, so it doesn't have a space in it. For $(src), I'll always use
relative paths, so there won't be any spaces in them either. I think it's
a sensible restriction for separate src/obj trees to disallow spaces in
the obj tree path, I fear it'd cause problems at a huge number of places.
At least it's certainly acceptable to do "no space" first and then see
what needs to be done in order to remove that restriction.

(I also think the two are functionally equivalent even if $(obj) contains 
a space, but I haven't tried at all)

--Kai


