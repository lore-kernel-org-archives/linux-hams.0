From: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Fri, 26 Jul 2002 14:50:25 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020726145025.A24762@dea.linux-mips.net>
References: <20020726134216.A4126@dea.linux-mips.net> <Pine.HPX.4.10.10207261512490.22573-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.HPX.4.10.10207261512490.22573-100000@saturn.trs.ntc.nokia.com>; from tpm@prkele.tky.hut.fi on Fri, Jul 26, 2002 at 03:16:03PM +0300
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

On Fri, Jul 26, 2002 at 03:16:03PM +0300, Tomi Manninen OH2BNS wrote:

> > No substancial changes have been done to the AX.25 kernel stack in a
> > extended period of time.  As the result it is still doing crude stuff
> > like globally enabling and disabling interrupts, has no understanding
> > of shared skb, isn't fully multithreaded and probably plenty more
> > problems I haven't spotted yet. Now that we're about to remove global
> > cli() / sti() from the kernel this means the AX.25 stack will soon break
> > entirely.
> > 
> > Is there any ongoing development I'm not aware of?  Just in case I've
> > started doing some cleanup last night ...
> 
> As far as I know there is no development going on. Or if there is, people
> have hidden it pretty well. So I think everyone will warmly welcome your
> efforts!

Cute.  I started hacking on it because I'm interested in packet but I'm
not even QRV in packet right now.  While I'm killing another bit of forest
by printing the AX.25 spec, anybody got me a pointer to some sort of DAMA
spec?

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
