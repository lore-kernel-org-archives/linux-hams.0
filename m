From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Beginner questions about soundmodem and others
Date: Fri, 10 Jan 2003 10:11:01 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10301101003520.8319-100000@saturn.trs.ntc.nokia.com>
References: <20030109175607.0c94ab8f.washer@trlp.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030109175607.0c94ab8f.washer@trlp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Washer <washer@trlp.com>
Cc: linux-hams@vger.kernel.org

On Thu, 9 Jan 2003, James Washer wrote:

> 1)I'm confused by this whole AX.25 kernel thing... I had assumed that
> (most) TNCs handled the AX.25 protocol themselves. I understand that
> with a soundmodem, the linux system would have to do the AX.25, but
> what about if I use an off-the-shelf TNC ( kpc3 for example ). Does
> linux arrange to turn the AX.25 handling OFF in the TNC and do it in
> software?

Yes, typically the TNC is put to a so called KISS mode (6PACK is another
alternative). In KISS mode the TNC only handles modulation and
demodulation, HDLC en/decoding (bit stuffing and framing that is) and
AX.25 CRC checking. Everything else is left to the PC.

This is basically the only sane way to be able to support higher level
protocols on top of AX.25. Also it makes the simple text mode support much
more flexible.

> 2) Can I put more than one sound card in my linux box.. One for music,
> the other, perhaps multiple soundcards, for packet?

Yes.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

