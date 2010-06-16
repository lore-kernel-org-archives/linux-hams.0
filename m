From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Linux Packet Interface Hardware
Date: Thu, 17 Jun 2010 01:29:13 +0300
Message-ID: <20100616222913.GO898@mea-ext.zmailer.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
 <4C183169.3060206@radagast.org>
 <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
 <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org

On Wed, Jun 16, 2010 at 09:16:29AM -0700, Jim Kusznir wrote:
> Thanks everyone, lots of good info!
> 
> A few questions:
> 
> I've seen a few references to 6-pack, and know that its a "special
> firmware" that one would load on the TNCs...But I can't seem to find
> that firmware anywhere.  Does anyone know where I can actually get it,
> and find info about what TNCs it supports?

  http://www.baycom.org/bayweb/tech/tnc/firmware.htm
  http://www.symek.com/g/tnc2firmware.html
  http://www.flexnet.be/main/Firmware.htm

There are some advantages at 6PACK, but they relate to time of real
serial ports, not USB virtual devices that run at 500 or 20 000 times
the speed of 1200 bps packet...

But then we hams tend to prefer running with _old_ hardware instead of
doing something truly smart.  A GMSK modulation and some sort of FEC
coding would be smart, but as it is incompatible with 1960es landline
audio modulation used for 1200 bps packet, such ideas will never gain
any use.

> It seems that for hardware available today, the recommendation for
> infrastructure use is to use a TNC in KISS or 6-pack mode.  I've been
> using one at home in KISS mode for a while, and I've been noticing
> what I think now is the T1 timer problem, and its been causing very
> frustrating and massive reduction in throughput on my local 9k6
> channel, even though my radio and the node are the only two on
> frequency!  I often see my system try and send retransmits before the
> first packet ever even makes it out the radio (but on the other hand,
> I also think my TNC is sitting on packets way too long -- PacComm
> Spirit-2).  I am contemplating replacing the firmware chip with a
> KISS-only or 6-pack firmware chip and see what that does, if I can
> find one for this TNC.

Existing firmwares are available mainly for TAPR TNC2 clones.

I did recently search for source code of KISS firmware - and did find it
from my local archive.  Trying to get it to compile with some modern
Z80 compiler existing on UNIX is entirely different scale of adventure,
and I haven't done that yet completely..

  ftp://ftp.funet.fi/pub/ham/packet/tapr/kissv7.zip

I am trying to get that compiled with sdcc's z80 assembler, but...
there are a number of syntax differences, and available assembler syntax
documentation isn't clearest.. (neither original Z80, nor sdcc-as-z80)

I would like to improve that with two ways:
  - Strict transmission queue timeout of N seconds (10-15 seconds)
  - CRC on KISS frames (SMACK or FLEXNET way)

The first one is needed for avoiding packets to wait too long in Tx queue
waiting for silence on channel and thus tx permit.  The second one is
always a good idea.


> As to new installations, does anyone recommend a 9k6 TNC for a good
> cost/performance metric that can be used with linux effectively?  It
> should be external, as the embedded hardware I'm likely to run it on
> will not have PCI slots, and definitely will NOT have ISA slots.
> 
> I like the ideas about a BPQether USB device; from the description,
> though I gather one has not been made to date?  I'm curious, and I'll
> keep this in mind for a potential CE/EE project here (School of EECS,
> WSU and the W7YH Amateur Radio Club).

One related USB interface issue is that there is no specification for
serial port!  All that exist are proprietary chip vendor specific things.
(Unless something has crept up during last month.)

However there are good abstractions for ethernet-like devices, and
for some reason I didn't like "modem" specifications when I looked
at them a while back -- I think because they don't seem to offer
"packet oriented" interface, whereas "ethernet" does have that.
But I could remember wrong...

> The information on sound modems is well taken; I think I'll limit that
> deployment to end-user stations in my planning.
> 
> Thanks all for the ideas/input.  I think the BPQether driver best fits
> what I was hoping to find, except for the fact that it doesn't exist
> off-the-shelf yet....

Not even off-the-lab...
To be seen if I have time for the project this summer - an NXP LPC2368
with USB device interface, and a couple CML MX164 modems..
I made the hardware last summer, but didn't have time for the software.

> --Jim

73 de Matti, OH2MQK
