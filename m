From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Ethereal ax25 monitoring
Date: Thu, 1 Sep 2005 16:34:50 +0100
Message-ID: <20050901153450.GG2876@linux-mips.org>
References: <620c90570508131043a53b9db@mail.gmail.com> <42FE6C9E.2060808@rns-stearn.demon.co.uk> <42FFBDA1.6040400@rns-stearn.demon.co.uk> <4316253A.2060009@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4316253A.2060009@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Wed, Aug 31, 2005 at 10:46:34PM +0100, Richard Stearn wrote:

> An update on AX.25 in Ethereal.
> 
> I have enquired on the Ethereal list and the attitude (sample of 1) is
> that "if the protocol exists and is used then it will be accepted".
> Subject to a few pratical provisos.
> 
> The deeper issue I have found is that Ethereal uses libpcap for the
> actual packet capture, and libpcap does not support AX.25 as a packet
> type.
> 
> There appears to a replacement for libpcap in development within Ethereal
> however that is probably a long term project. So my next move is to see
> what the issues are with getting the AX.25 packet type added to libpcap.
> 
> It looks to me that AX.25 on Ethereal is going to be a long time coming.

Libpcap is also being used for example by tcpdump, so it's certainly very
useful to have it ported anyway.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
