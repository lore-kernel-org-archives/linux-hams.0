From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: AX25 in libpcap & wireshark (was ethereal)
Date: Wed, 14 Mar 2007 23:20:37 +0200
Message-ID: <1173907238.8292.7.camel@oh2bns.ampr.org>
References: <45F6FE23.8040306@rns-stearn.demon.co.uk>
	 <620c90570703131407m6372026fh605a78dcc2ae162c@mail.gmail.com>
	 <45F72044.9000207@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <45F72044.9000207@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Tue, 2007-03-13 at 22:05 +0000, Richard Stearn wrote:

> Trying to figure if ROSE is the same as (or derivitive of)
> 	"X.880 OSI Remote Operations Service"

ROSE is similar but not equal to X.25 PLP (layer 3). And
that's about all I know about it... :)

> I am also wary of using listen code due to licensing issues.
> IIRC most of listen is Phil Karns code and not released under
> GPL (don't quote me on that, it is a year since I looked last).

Listen is GPL. All of ax25-libs/tools/apps is. Specifically,
listen uses code from KA9Q with permission to distribute it
under the GPL. Does anyone remember the details? I don't think
Jonathan reads this anymore?

-- 
Tomi Manninen / OH2BNS / KP20JF74


