From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Tue, 30 Jul 2002 12:44:23 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207301239530.2883-100000@saturn.trs.ntc.nokia.com>
References: <20020729185037.GA684@columbia.g7iii.bogus>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020729185037.GA684@columbia.g7iii.bogus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Mon, 29 Jul 2002, Iain Young - G7III wrote:

> Currently (IIRC), the patch routes all IP traffic destined for radio
> links (44/8) down the ipax0 device, and then decides the best layer 2
> (AX25) interface to throw it out.
> 
> I _personally_ believe that this is not the way it should be, I don't
> actually like this, but unfortunatley the ipax0 device actually
> encapsulates the IP packet, and puts the AX25 header on etc..

Out of curiosity (and without having any strong personal opinion of my
own) why do you think this not the way to go? I know it breaks ARP but I
suppose that could be corrected somehow.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

