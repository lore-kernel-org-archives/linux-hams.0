From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Strange AXIP / AX25 Frames
Date: Wed, 8 Jan 2003 01:01:58 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030108000158.GA25575@osterried.de>
References: <Pine.LNX.4.44.0301072207280.12010-100000@zl2bsj.ampr.org> <200301071516.56542.robert@steinhaeusser.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200301071516.56542.robert@steinhaeusser.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert =?iso-8859-1?Q?Steinh=E4u=DFer?= <robert@steinhaeusser.com>
Cc: linux-hams@vger.kernel.org

> > > 9: fm [invalid] to [invalid] via 90gGB7-2* M0GB7-3* [invalid] [invalid]*
> > > [invalid] gGB7BM 0GB7CR [invalid] ctl [invalid]0^ [DAMA]
> >
> > Kernel 2.4.20 & latest AX25 apps, lib, tools. TNC-2 in KISS-mode.
> 
> KISS mode normally has no checksumming, so any stray HF will mess up the data 
> on your serial line between TNC and PC. Use shielded cabling and SMACK or 
> RMNC-CRC-KISS or (even better for numerous reasons) 6PACK.

the initial question was for a problem with axip.
because axip frames have a checksum, these errors should not occur.


kiss: there are some checksum variants for kiss. one is crc-rmnc, the
other is smack. for crc-cmnc, there's no tnc software available. on the
other hand, smack is not implemented in the linux kernel kiss module.

considering this, 6pack is the better choice.


back to the problem. kernel 2.4.20 is quite new. it would be great if
you could test, if it is
  - a kernel problem
  - a problem with libax25 / ax25tools
  - listen does not exactly match with the libax25 library - a recompile
    may help

whil still running kernel-2.4.19, i could say nothing abt 2.4.20 issuses,
but if i remember correctly, there were only some scc driver fixes.


73,

	- thomas  dl9sau

