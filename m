From: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: Re: [PATCH] FBB & linux 2.6
Date: Fri, 13 Feb 2004 23:36:09 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200402132336.10230.eb5esx@eb5esx.ampr.org>
References: <20040213202807.F220@jeroen.pe1rxq.ampr.org> <20040213215430.H220@jeroen.pe1rxq.ampr.org> <1076705415.1298.68.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1076705415.1298.68.camel@oh2bns.ampr.org>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: Linux-hams List <linux-hams@vger.kernel.org>, Linux FBB List <xfbb@f6fbb.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Trying to apli the patch here:

linux:/usr/src# patch -p0 <./fbb703.linux2.6.diff
patching file fbbsrc.703c/src/console.c
Hunk #1 FAILED at 893.
Hunk #2 FAILED at 929.
2 out of 2 hunks FAILED -- saving rejects to file=20
fbbsrc.703c/src/console.c.rej
linux:/usr/src# ls -l fbbsrc.70
fbbsrc.703c  fbbsrc.704j
linux:/usr/src# ls -l fbbsrc.703c
lrwxr-xr-x    1 root     src            13 feb 13 20:54 fbbsrc.703c ->=20
=2E/fbbsrc.704j
linux:/usr/src#

How have you applied it?

Thank's.

El Viernes, 13 de Febrero de 2004 21:50, Tomi Manninen escribi=F3:
> On Fri, 2004-02-13 at 22:54, Jeroen Vreeken wrote:
> > I didn't see that version on the fbb homepage....
>
> It's for example in
>
>  ftp://ftp.funet.fi/pub/ham/packet/bbs/f6fbb/linux/src/xd704j-src.tgz
>
> > Won't this patch apply against that version to?
> > Its not much, just a small new piece of code..
>
> Seems to apply just fine (with an offset of 18 lines).
> I haven't tested it but I'd guess the code hasn't changed
> since 7.03c.

- --=20
Ruben Navarro Huedo
eb5esx (arroba) eb5esx.ampr.org
http://www.cabodesantapola.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFALVFZ0S5G8AO3zN8RAichAJ9N+We9diAb8crv8zjTwZrfgOfaHwCfbFO1
w3K7w07Dmw/JXCcZJn8/inI=3D
=3DEN6o
-----END PGP SIGNATURE-----

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
