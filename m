From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWgOiBSZaA=?=
	=?iso-8859-1?Q?=3A?= Help, not rudeness, requested
Date: Tue, 4 Nov 2003 20:32:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031104193256.GG11010@tangerine.coulon.evette>
References: <Pine.LNX.4.58.0311040841580.19958@debian.ehrlichtronics.com> <20031104140305.GE1477@tangerine.coulon.evette> <Pine.LNX.4.58.0311041419190.22150@debian.ehrlichtronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0311041419190.22150@debian.ehrlichtronics.com> (from scott@ehrlichtronics.com on mar, nov 04, 2003 at 20:20:51 +0100)
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="Flowed	DelSp=Yes"
To: Scott Ehrlich <scott@ehrlichtronics.com>
Cc: linux-hams@vger.kernel.org

There _is_ a support in the kernel 2.4.22 but I think it is better to =20
use the userland soundmodem from Thomas Sailer.

Here is a copy of the ax25 support I get (sorry for the bad looking =20
screen)


Linux Kernel v2.4.22 Configuration
 =20
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq=
qqqqqqq
  lqqqqqqqqqqqqqqqqqqqqq AX.25 network device drivers =20
qqqqqqqqqqqqqqqqqqqqqqk
  x  Arrow keys navigate the menu.  <Enter> selects submenus --->.     =
     =20
x
  x  Highlighted letters are hotkeys.  Pressing <Y> includes, <N> =20
excludes, x
  x  <M> modularizes features.  Press <Esc><Esc> to exit, <?> for Help.=
     =20
x
  x  Legend: [*] built-in  [ ] excluded  <M> module  < > module capable=
     =20
x
  x lqqqq^(-)=20
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk x
  x x    < > High-speed (DMA) SCC driver for AX.25                     =
   =20
x x
  x x    <M> Z8530 SCC driver                                          =
   =20
x x
  x x    [ ]   additional delay for PA0HZP OptoSCC compatible boards   =
   =20
x x
  x x    [ ]   support for TRX that feedback the tx signal to rx       =
   =20
x x
  x x    <M> BAYCOM ser12 fullduplex driver for AX.25                  =
   =20
x x
  x x    < > BAYCOM ser12 halfduplex driver for AX.25                  =
   =20
x x
  x x    < > BAYCOM picpar and par96 driver for AX.25                  =
   =20
x x
  x x    < > BAYCOM epp driver for AX.25                               =
   =20
x x
  x x    < > Soundcard modem driver                                    =
   =20
x x
  x x    < > YAM driver for AX.25                                      =
   =20
x x
  x =20
mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj=
 =20
x
  =20
tqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq=
qqqu
  x                    <Select>    < Exit >    < Help >                =
     =20
x
  =20
mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq=
qqqj


--
			- f5ibh - Jean-Luc
Le 04.11.2003 20:20, Scott Ehrlich a =E9crit=A0:
> Greetings:
>=20
> Well aware of the dev drivers :-)
>=20
> I neglected to say I had enabled them during make menuconfig, but
> still
> saw no sign of soundmodem support in Amateur Radio support.  I'll
> check
> out the baycom stuff when I get back home.
>=20
> Thanks.
>=20
> Scott
>=20
>=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
