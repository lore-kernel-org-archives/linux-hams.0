From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Fri, 26 Jul 2002 15:16:03 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207261512490.22573-100000@saturn.trs.ntc.nokia.com>
References: <20020726134216.A4126@dea.linux-mips.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020726134216.A4126@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@uni-koblenz.de>
Cc: linux-hams@vger.kernel.org

On Fri, 26 Jul 2002, Ralf Baechle wrote:

> No substancial changes have been done to the AX.25 kernel stack in a extended
> period of time.  As the result it is still doing crude stuff like globally
> enabling and disabling interrupts, has no understanding of shared skb, isn't
> fully multithreaded and probably plenty more problems I haven't spotted yet.
> Now that we're about to remove global cli() / sti() from the kernel this
> means the AX.25 stack will soon break entirely.
> 
> Is there any ongoing development I'm not aware of?  Just in case I've
> started doing some cleanup last night ...

As far as I know there is no development going on. Or if there is, people
have hidden it pretty well. So I think everyone will warmly welcome your
efforts!

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

