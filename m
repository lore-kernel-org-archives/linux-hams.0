From: Ken Koster <n7ipb@koster.seatcp.net>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Thu, 1 Aug 2002 15:10:34 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200208011510.34815.n7ipb@koster.seatcp.net>
References: <20020729185037.GA684@columbia.g7iii.bogus> <Pine.HPX.4.10.10207301239530.2883-100000@saturn.trs.ntc.nokia.com> <20020731175319.GA584@columbia.g7iii.bogus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020731175319.GA584@columbia.g7iii.bogus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Iain Young - G7III <g7iii@g7iii.demon.co.uk>, Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

On Wednesday 31 July 2002 10:53, Iain Young - G7III wrote:
> Hi Tomi,
>
> You Wrote:
> > Out of curiosity (and without having any strong personal opinion of my
> > own) why do you think this not the way to go? I know it breaks ARP but I
> > suppose that could be corrected somehow.
>
> To be honest, it is just network 'purity', and my own personal
> preference.

And mine as well,  let's not muck with the layers at least not in such an
egregious way.  And fixing ARP may not be that easy.

> To me, Layer 2 (AX25 in our case) should not dictate the Layer 3 (IP)
> routing decisions. Layer 3 routing should be the domain of Layer 3.
>
> Letting Layer 2 make the decision, while in most cases will get you
> the shortest path, may not give you the path you actually want
> (Again, network purity and my personal opinion)
>
> I like to be able to say things like 44.0/16 should be routed via
> g7iii-1, 44.128/16 via dummy0 (black hole), 44.130 via g7iii-2,
> and route of last resort, 44/8 via g7iii-3 etc.
>
> (You can probably guess that I deal with networks, DNS, etc etc
> for a living :>)
>
> Of course, I do understand that I am probably the odd-ball case here,
> and for most AX25 users, the KJD stack behaviour is fine.

You're not the only one, our whole Puget Sound network is configured with
ax25 as just a simple link level protocol, no netrom, rose or other protocols.
Each lan is independant and RIP2 is used for dynamic routing between
lan's.  If the KJD stack behaviour gets in our way it won't be finding it's way
into any kernel we build.

>
> Which is of course why I considered modifying the ipax device to
> be a module, and only talk to a named layer 2 interface, and load
> several modules, so i could route 44.0/16 via ipax0, 44.128/16
> via dummy0, 44.130 via ipax1, and the last resort of 44/8 via
> ipax2.

That would probably work for us as well.

Ken,  N7IPB


