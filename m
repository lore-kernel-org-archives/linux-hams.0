From: "DL5DI" <dl5di@prgm.org>
Subject: BUGs into libax25
Date: Mon, 2 Jun 2008 11:36:25 +0200
Message-ID: <1K36Sn-0OkOu00@fwd26.aul.t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

This special event station callsign that we sometimes find like
DQ2008ANYEVENT will never work in packet radio.
The protocol header of ax25 frames only allows 6 bytes of callsign and =
1
halfbyte of SSID.
Not only for the destiantion, also for all digipeaters inbetween.
We would need to change the whole protocol and all digipeaters and stat=
ions
using it worldwide to get that covered.
I expect that packet radio will be dead before that happens. :-)

73 de Hans, DL5DI

> -----Urspr=FCngliche Nachricht-----
> Von: linux-hams-owner@vger.kernel.org=20
> [mailto:linux-hams-owner@vger.kernel.org] Im Auftrag von Ralf Baechle=
=20
> DL5RB
> Gesendet: Montag, 2. Juni 2008 11:16
> An: Mike McCarthy, W1NR
> Cc: Bernard Pidoux; linux-hams; Ray Wells; Charlie k4gbb; Jerry=20
> DeLong; F1TE; f8arr
> Betreff: Re: BUGs into libax25
>=20
> On Sun, Jun 01, 2008 at 10:14:54PM -0400, Mike McCarthy, W1NR wrote:
>=20
> > As I recall, there is a limit to the size of a callsign in
> the AX.25
> > protocol specification.  Will changing it create an incompatibility=
=20
> > with standard TNC protocol stacks?
>=20
> Afaik the currently only user of 6-letter callsigns aside of special=20
> event stations are Australien foundation license which look like=20
> VK3FABC so 4-letter suffix and those are not permitted to use packet=20
> radio anyway.
> I was wondering if Swaziland which only has a half-series assignment=20
> is possibly using 3+3 calls.
>=20
> Anyway, the maximum callsign length in the AX.25 spec is 6 characters=
=20
> and (I looked into that ...) there is no way of extending that withou=
t=20
> causing large scale software breakage :-(  It's almost like=20
> retrofitting 128-bit addresses into
> IPv4 - it took a new protocol.
>=20
>   Ralf
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
=20
> in the body of a message to majordomo@vger.kernel.org More majordomo=20
> info at http://vger.kernel.org/majordomo-info.html
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
