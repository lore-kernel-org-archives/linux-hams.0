From: Chuck Hast <wchast@gmail.com>
Subject: Re: [fpac] Re: ax25ipd issue
Date: Mon, 13 Jun 2005 05:19:57 -0600
Message-ID: <620c905705061304194a4f53ee@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <68826e6e97da1023788e9ddc026b6e0d@utac.net>
	 <42AC8791.6080401@ccr.jussieu.fr>
	 <620c9057050612143763a373a5@mail.gmail.com>
	 <42AD56D0.6050705@ccr.jussieu.fr>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42AD56D0.6050705@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, fpac@home.f6fbb.org, John Hurst <jhurst@utac.net>, Linux-Hams <linux-hams@vger.kernel.org>

On 6/13/05, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
> Chuck Hast a =E9crit :
> > Bernard,
> > Does double ax25ipd command at the bottom start up two instances of
> > ax25ipd? Also I believe that the -l4 is log level 4 correct?
>=20
> No, It starts only one instance of ax25ipd.
> The second call is in case ax25ipd will not be able to connect
> immediately to remote ip stations, it only gives it a second chance.
> Otherwise, the system would have to wait for one more hour until the
> script starts again.

Ahh, now I understand.=20

>=20
> By the way, I had to introduce a small patch into ax25ipd source code
> for it would fail if a LAN connexion through UDP port is not reachabl=
e,
> All the AXIP system would lock and thus FPAC.
>=20
> The patch is in io_error() routine.
>=20
>                          exit(2);
>                  } else if (mode =3D=3D UDP_MODE) {
>                          syslog(LOG_ERR, "reading from udp socket,
> %s\n", strerror(errno));
> //                      perror("reading from udp socket");
> //                      exit(2);
>                  } else if (mode =3D=3D TTY_MODE) {
>=20
> In case of read error, ax25ipd will keep on trying to read, instead o=
f
> aborting.
>=20
>=20

OK, I shall find the source and add this to it so that the problem will=
  be
corrected.


--=20
Chuck Hast=20
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my goin=
g
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
