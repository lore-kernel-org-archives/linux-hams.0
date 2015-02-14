From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: conversd-saupp-1.62a
Date: Sat, 14 Feb 2015 11:12:54 +0000
Message-ID: <20150214111254.GA425@ds20.borg.net>
References: <1422692681.5081.9.camel@freemail.gr>
 <54CDB20F.8040201@trinnet.net>
 <viRt6JJd$g3UFw1b@skywaves.demon.co.uk>
 <20150213190950.GA437@ds20.borg.net>
 <cYqBEHCy$o3UFwxI@skywaves.demon.co.uk>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cYqBEHCy$o3UFwxI@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Fri, Feb 13, 2015 at 11:59:46PM +0000, Paul Lewis wrote:
> Hi all
>=20
> made the changes to convers.c as suggested
> make clean
> make install
> make install-all
>=20
>=20
> got a lot of warnings and these look like errors flagged up
> which I have extracted

[warnings snipped]

> gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
> -DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
> -DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
> -DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"loca=
lhost\"
> -DSETLOGNAMES -DHAVE_LIBREADLINE -DHAVE_READLINE_READLINE_H \
>                 convers.c ba_stub.o -o convers -lreadline -lncurses
> convers.c: In function =C3=A2main=C3=A2:
> convers.c:652:23: error: =C3=A2Function=C3=A2 undeclared (first use i=
n this
> function)
>       rl_event_hook =3D (Function *) do_select_call;
>                        ^
> convers.c:652:23: note: each undeclared identifier is reported only o=
nce
> for each function it appears in
> convers.c:652:33: error: expected expression before =C3=A2)=C3=A2 tok=
en
>       rl_event_hook =3D (Function *) do_select_call;
>                                  ^

replace these two lines (line 651-652 in convers.c)

    if (RL_READLINE_VERSION < 0x0400)
        rl_event_hook =3D (Function *) do_select_call;

with these three lines:

#   if (RL_READLINE_VERSION < 0x0400)
        rl_event_hook =3D (Function *) do_select_call;
#   endif


The whole package is in a need of a deep overhaul. There's a lot of unf=
inished
code in it. And support for some really ancient libraries should probab=
ly just
be removed.=20

73 Thorsten

>=20
> ###########
> 73 de Paul G4APl
>=20
>=20
>=20

--=20
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de               =
       |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Ge=
rmany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130=
=2E8.19] |
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
