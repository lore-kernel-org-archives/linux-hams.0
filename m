From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX.25 in tcpdump.
Date: Sun, 25 Sep 2005 12:56:26 +0200
Message-ID: <20050925105626.GB4444@linux-mips.org>
References: <4335D980.503@rns-stearn.demon.co.uk> <620c9057050924172134d0069e@mail.gmail.com> <43367A25.70805@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43367A25.70805@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, Sep 25, 2005 at 11:21:25AM +0100, Richard Stearn wrote:

> Chuck Hast wrote:
> >If you get the info would you do the ROSE stuff (we use FPAC here in FL
> >which is a super set of ROSE which is actually X.25) ?
> 
> Chuck
> 
> Yes, but a qualified one. Can we establish that it actually needs to be 
> done?
> 
> A grep for 8208 turns up:
> 
> 	print-llc.c:        { LLCSAP_ISO8208,  "ISO8208" },
> 
> so I would like to try connecting that in as the print routine and have
> someone test the result before I look at coding a print-rose.c. If the
> 8208 implementation in print-llc is close then I could use that as a 
> starting
> point and just add the extras to create a print-rose or look at extending
> print-llc (which might be be vetoed by the current maintainer).

ROSE is supposedly the X.25 PLP (Packet Layer Protocol), so I suggest you
get yourself a copy of the ITU's X.25 spec.  Fortunately the ITU permits
upto 3 free downloads of their otherwise pricey specs per person and year.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
