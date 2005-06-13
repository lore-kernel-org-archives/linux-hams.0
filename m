From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: [fpac] Re: ax25ipd issue
Date: Mon, 13 Jun 2005 11:50:08 +0200
Message-ID: <42AD56D0.6050705@ccr.jussieu.fr>
References: <620c90570506110638c4a2659@mail.gmail.com>	<68826e6e97da1023788e9ddc026b6e0d@utac.net>	<42AC8791.6080401@ccr.jussieu.fr> <620c9057050612143763a373a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057050612143763a373a5@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chuck Hast <wchast@gmail.com>, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>
Cc: fpac@home.f6fbb.org, John Hurst <jhurst@utac.net>, Linux-Hams <linux-hams@vger.kernel.org>

Chuck Hast a =E9crit :
> Bernard,
> Does double ax25ipd command at the bottom start up two instances of
> ax25ipd? Also I believe that the -l4 is log level 4 correct?=20

No, It starts only one instance of ax25ipd.
The second call is in case ax25ipd will not be able to connect=20
immediately to remote ip stations, it only gives it a second chance.=20
Otherwise, the system would have to wait for one more hour until the=20
script starts again.

By the way, I had to introduce a small patch into ax25ipd source code=20
for it would fail if a LAN connexion through UDP port is not reachable,=
=20
All the AXIP system would lock and thus FPAC.

The patch is in io_error() routine.

                         exit(2);
                 } else if (mode =3D=3D UDP_MODE) {
                         syslog(LOG_ERR, "reading from udp socket,=20
%s\n", strerror(errno));
//                      perror("reading from udp socket");
//                      exit(2);
                 } else if (mode =3D=3D TTY_MODE) {

In case of read error, ax25ipd will keep on trying to read, instead of=20
aborting.


>=20
> Sure would be nice not to have to kill the thing and restart it but I=
 guess if
> you do it fast enough your links may not even notice it...
>=20
> Need to get someone to look at coming up with perhaps a new version o=
r
> something that will keep things running without dropping the whole th=
ing.
>=20
> I guess the only things I need to change are the call signs, IP domai=
ne
> names and the paths which may be different.
>=20
>=20
>=20

73 de Bernard, f6bvp
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
