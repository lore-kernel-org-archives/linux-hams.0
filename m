From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: soundmodem support for HF modes?
Date: Mon, 26 Jan 2004 14:48:50 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1075121330.1281.79.camel@oh2bns.ampr.org>
References: <20040125193512.055d315e.washer@trlp.com>
	 <20040126034836.GD19534@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040126034836.GD19534@cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2004-01-26 at 05:48, Hamish Moffatt wrote:

> On Sun, Jan 25, 2004 at 07:35:12PM -0800, James Washer wrote:
> > Any linux soundmodem support for HF digital modes?
> 
> There's a separate program which implements q15x25 (newqpsk) using the
> same structure as the user-space soundmodem.

That separate program is now obsolete. Soundmodem itself has the latest
newqpsk/q15x25 code included.

Soundmodem of course also supports regular HF packet as well, just
use the afsk modem and set the parameters correct (tones with a
200 Hz shift and bps to 300).

> Other than there's gMFSK which is a GNOME program which does PSK31,
> RTTY, FeldHell, MT63 and MFSK. Those aren't packet radio modes so not
> suitable for inclusion in the soundmodem.

http://gmfsk.connect.fi/

-- 
Tomi Manninen / OH2BNS / KP20ME04

