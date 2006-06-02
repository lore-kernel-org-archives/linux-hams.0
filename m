From: Kevin Dawson <kevind@esi.com.au>
Subject: Re: callsign limit
Date: Fri, 2 Jun 2006 12:51:17 +1000
Message-ID: <20060602025117.GB9713@glottis.kd>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531093716.GA21395@cloud.net.au> <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com> <20060531111919.GA22980@cloud.net.au> <20060601014047.GB27504@linux-mips.org> <447ED7B2.3070701@sktc.net> <Pine.SUN.4.58.0606010723410.10879@eskimo.com> <20060601150854.GA19527@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060601150854.GA19527@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On various dates at various times, various people wrote: :-=3D)

> Date: 	Wed, 31 May 2006 16:02:03 +0300
> From: Matti Aarnio <matti.aarnio@zmailer.org>
>=20
> I have at times considered of what would be decent new way to do thin=
gs
> so that these big callsigns are also supported, and worst (or all) AX=
=2E25
> shortcomings are fixed at the same time.
>=20
> [ IPv6 ]
>=20
> Of course it is completely incompatible with existing AX.25 ...

As will be any change to the address field.  There is no immediate need
for a 7-character callsign on packet (even here in VK, although I
predict it will only be a few years); there is some time to work on it.

IPv6 isn't as omnipresent as one would hope - look at the mail headers
in this message.  All the addresses are likely IPv4.  That's not say
the various stages along the way don't use IPv6, of course, but the
world has been waiting a long time for the omnipresence to happen.

> Unfortunately we have _huge_ deployed base of inferior technology...

Definitely.  That will be the largest stumbling block to anything new.

In the meantime, there was an idea that jumped at me, which will solve
the callsign length problems.  I'll make some comments on other posts
along the way.

> From: Bob Nielsen <nielsen@oz.net>
> Date: 	Wed, 31 May 2006 07:57:25 -0700
>=20
> On May 31, 2006, at 6:15 AM, Robert Steinh=E4u=DFer wrote:
>=20
> > Perhaps somebody could check which syntax is valid now? I don't kno=
w
> > where to look. Was there any statement made on how calls longer tha=
n
> > 6 chars are to be used on packet? Perhaps just use a different ID
> > (which one?) and additionally set a beacon with the correct call in=
 =20
> > the data part? How do other modes (was it AMTOR?) handle this?

AMTOR used 4 letters, which IIRC were just the first 4 letters of
the callsign (no digits).  Although it's not unique, it seemed to
work enough to be usable.

> That is probably the best way (for now, at least).  Although I =20
> haven't encountered it, I suspect that is the way it is handled by =20
> stations operating from other than their home country (using =20
> designators such as DL/W1AAA).

One of the regulations (at least in VK) is that *every* packet must
contain the full callsign of stations involved, so a shortened version
won't be enjoyed by the authorities.  Visitors to VK only have VK
callsigns (on application), so VK/xxxxx doesn't happen.

> There may be a need for a change to AX.25. TAPR (as custodian of the =
=20
> AX.25 specification) has a mailing list which is already discussing =20
> this issue:
>=20
>   <https://lists.tapr.org/cgi-bin/mailman/listinfo/ax25-layer2>.

I've just joined that list, being where this should really be discussed=
,
so if this spills over to there, that's OK.

> Date: 	Thu, 1 Jun 2006 14:25:00 +0100
> From: Ralf Baechle DL5RB <ralf@linux-mips.org>
>=20
> But the WRC03 rules set no limit for callsigns length.  And, let's fa=
ce it,
> the current format of AX.25 MAC addresses sucks anyway, 7 bytes with
> various other junk thrown in just because space was available make
> processing more complicated than needed.

I agree, although I don't know all the little quirks that had to be
accommodated in reaching the specification.  But then, I started in
packet using Vancouver's V2 and V3 protocols...

In these days of computing power, it makes sense to keep separate
fields in different octets.  The problems will come when you try
to please everyone.

> Date: 	Thu, 1 Jun 2006 16:08:54 +0100
> From: Ralf Baechle DL5RB <ralf@linux-mips.org>
>=20
> On Thu, Jun 01, 2006 at 07:31:54AM -0700, Curt, WE7U wrote:
>=20
> > "The characters of the call sign should be standard seven-bit ASCII
> > (upper case only) placed in the leftmost seven bits of the octet to
> > make room for the address extension bit. If the call sign contains
> > fewer than six characters, it should be padded with ASCII spaces
> > between the last call sign character and the SSID octet."
> > ...
> > There are also two reserved bits in the SSID byte.  I didn't check
> > the later version 2.2 spec (which isn't implemented anywhere as far
> > as I know) to see if they decided to use those two bits.  There may
> > be some other reserved bits further down the header to use as well.
>=20
> DAMA packs some information into the the unused bits of the SSID fiel=
d.

The spec still has them as reserved in 2.2, plus:
| c) The bits marked ?R? are reserved bits. They may be used in an
| agreed-upon manner in individual networks. When not implemented,
| they are set to one.

DAMA's use of them doesn't prevent other implementations.  Yes,
there will be pain when networks interoperate.

So Curt seeded my thoughts.  At present, the address extension bit is
used to indicate the end of the entire address field.  I propose that
this be modified to indicate the end of an individual callsign, then
use one of the reserved bits in the SSID octet (say bit 5) to indicate
the end of the address field as the present address extension bit does.
That simply changes the definition of what address is being extended,
rather than completely rewriting the format of the field.  The padding
of shorter callsigns with spaces is then unnecessary, although there
may be a weak case for compatibility with the current format to retain
it.  I'd rather not.  The SSID and control bits should perhaps be put
into separate octets, although this is getting further away from the
minimalist approach I'm giving.  You may as well just write a new
format (and I'm in support of that).

So, using the example of Figure 3.8 in the spec (single repeater hop),
the address field octets, still with space padding, would be:
98 94 6E A0 40 40 C1   98 6E 98 8A 9A 40 41   98 6E 9E 9E 40 40 E3
To not have space padding, the '40' octets are removed.

Secondly, I'd suggest allowing the '/' character to be allowed for the
case of DL/xxxxx.  Perhaps just allow the entire 7-bit ASCII set.  The
next hurdle will then be internationalisation in callsigns, which (in
the extreme case) could be handled as in email.  But I digress.

Advantages I see:
- no more length restrictions
- allowance for the XX/yyyyy format of callsign
- allowance for other future addressing methods.  If I wanted to send a
  signal from Germany, showing a separate receive frequency for this
  particular link, my address might look like DL/VK2KD-2:RX=3D433.750
- it's conceptually simple for programmers to implement the present
  callsign conventions in this scheme
- it keeps the authorities happy

Disadvantages:
- Of course, most things now will break.  Difficult to avoid unless one
  of the control bits is used to indicate an extended addressing scheme
  which would sit in the I field under the current protocol.
- more intelligence and finer control required, but this should be easy=
=2E
- it discourages proper work in bringing the format up to date.  As I
  understand it, Phil Karn is not entirely happy that KISS is *still*
  being used...

There is no doubt more to think about, so I'll happily listen!

Kevin
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
