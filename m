From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Packet at the physical level
Date: Fri, 19 Sep 2003 10:25:48 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F6ACB9C.7020008@rns-stearn.demon.co.uk>
References: <memo.20030919071047.57493A@rovoreed.compulink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Mike Davies wrote:
> 	Thanks for all the replies (so far). A little bit of fiddling here 
> has confirmed that valid packets can start with either tone. You learn 
> something every day.
> 
> 	By the way, VHF amateur packet is not Bell202 compatible. I've 
> seen this mentioned before, but I've got the source code for a Bell202 
> modem which I know works, and that simply uses a 1300Hz tone for high bit 
> and a 2100Hz tone for a low bit. So not only does it use different tones 
> it doesn't do the NRZ modulation.
> 
> 	Hopefully in the next day or two I'll be able to transmit a few 
> test packets, and then I'll be able to determine the CRC polynomial if 
> nothing turns up before.

Mike

The Z80-SIO-0's in my homebrewed 4-port sync serial card are set to:

	HDLC
	CRC16

CRC16 is:
	x16+x15+x2+1
the CRC generator is preset to 0's (non-HDLC)

Info from Zilog comps databook 1983 and the source code for my 4-port sync 
serial card from about 1987 (still the mainstay of my packet system).

-- 
Regards
	Richard
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Amateur radio callsign: G1SOG         Home BBS: G1SOG@GB7GLO.#46.GBR.EU
                 Amprnet co-ordinator for Wiltshire
Unix is user friendly.        Just rather selective about it's friends.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

