From: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Wed, 31 Jul 2002 18:53:19 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020731175319.GA584@columbia.g7iii.bogus>
References: <20020729185037.GA684@columbia.g7iii.bogus> <Pine.HPX.4.10.10207301239530.2883-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.HPX.4.10.10207301239530.2883-100000@saturn.trs.ntc.nokia.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

Hi Tomi,

You Wrote:

> Out of curiosity (and without having any strong personal opinion of my
> own) why do you think this not the way to go? I know it breaks ARP but I
> suppose that could be corrected somehow.

To be honest, it is just network 'purity', and my own personal
preference.

To me, Layer 2 (AX25 in our case) should not dictate the Layer 3 (IP)
routing decisions. Layer 3 routing should be the domain of Layer 3.

Letting Layer 2 make the decision, while in most cases will get you
the shortest path, may not give you the path you actually want
(Again, network purity and my personal opinion)

I like to be able to say things like 44.0/16 should be routed via
g7iii-1, 44.128/16 via dummy0 (black hole), 44.130 via g7iii-2,
and route of last resort, 44/8 via g7iii-3 etc.

(You can probably guess that I deal with networks, DNS, etc etc
for a living :>)

Of course, I do understand that I am probably the odd-ball case here,
and for most AX25 users, the KJD stack behaviour is fine.

Which is of course why I considered modifying the ipax device to
be a module, and only talk to a named layer 2 interface, and load
several modules, so i could route 44.0/16 via ipax0, 44.128/16
via dummy0, 44.130 via ipax1, and the last resort of 44/8 via
ipax2.


All the Best

Iain
