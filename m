From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Ethereal ax25 monitoring
Date: Mon, 15 Aug 2005 11:28:08 +0100
Message-ID: <20050815102808.GA7339@linux-mips.org>
References: <620c90570508131043a53b9db@mail.gmail.com> <42FE6C9E.2060808@rns-stearn.demon.co.uk> <42FFBDA1.6040400@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42FFBDA1.6040400@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, Aug 14, 2005 at 10:54:41PM +0100, Richard Stearn wrote:

> Before I actually get down to design and coding I will make some enquiries
> on the Ethereal dev mailing list to see if anybody on that list is currently
> working on an AX.25 dissector and also to see if it would be accepted if 
> offered.
> 
> So is there anybody on this list who has done/is doing/has abandoned an 
> AX.25
> dissector for Ethereal?

I looked at it and it was looking like it was going to sidetrack me more
than I wanted by that time.

> Is there anybody on the list who is up for testing?

Definately; this is going to be a highly valuable tool.

> My guess is that Netrom & Rose would also be on the followup list, any 
> others?.

Any protocols built on top of these, that would include, IP over AX.25,
ARP over AX.25, VJ compressed IP over AX.25, IP over NET/ROM, IP over ROSE,
routing protocols such as RSPF.

  Ralf
