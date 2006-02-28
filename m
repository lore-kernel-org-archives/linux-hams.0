From: Ricardo Saiz Villoria <rsaizv@yahoo.es>
Subject: Re: [ANN] Hamlib 1.2.5 released
Date: Tue, 28 Feb 2006 23:52:55 +0100
Message-ID: <4404D447.2050609@yahoo.es>
References: <4403823C.2090603@yahoo.es> <9923fd660602280739j7feda442ofb1315bf5d748bc9@mail.gmail.com> <20060228210401.GA12763@flying-gecko.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060228210401.GA12763@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux HAMs <linux-hams@vger.kernel.org>



Patrick A. Ouellette wrote:
> At the risk of sounding low tech, you could use a telnet/ssh session =
to
> the remote PC and run rigctl to change settings.  Not the flashy
> monitoring of grig or an ncurses interface, but it would get the job
> done.
>=20
> You still have to get the audio to and from the radio....
>=20
> 73,
>=20
> Pat KB8PYM

It is easier than that: the hamlib can talk to grig by rpc via udp=20
packets across a network. So the required network bandwidth is close to=
=20
that of the rs232 link.

You can control your rig in these ways:

rigctl   : with commands
grig     : graphically; grig calls rigctl in the background
rpc.rigd : the daemon stays listening for udp packets
followed by:
grig -m 1901 -r <host>    : grig in local or remote machine
or:
rigctl -m 1901 -r <host>  : command line in local or remote machine

ophone and gnomemeeting both use h.323

=46or one-way audio broadcast you can use liveice/icecast and listen wi=
th=20
an mp3 player as xmms.

73 Ricardo

--=20
Ricardo Saiz Villoria
WEB:	http://www.qsl.net/ea1apm
E-MAIL: mailto:rsaizv@yahoo.es
public PGP key available at/clave p=FAblica PGP disponible en:
http://pgp.mit.edu/


	=09
______________________________________________=20
LLama Gratis a cualquier PC del Mundo.=20
Llamadas a fijos y m=F3viles desde 1 c=E9ntimo por minuto.=20
http://es.voice.yahoo.com=0D
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
