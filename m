From: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: Re: kernel 2.4.23 problem
Date: Thu, 1 Jan 2004 23:22:18 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200401012322.19813.eb5esx@eb5esx.ampr.org>
References: <3FF444C3.9040306@schonfeld.eu.org> <1072974983.1182.27.camel@tux.home.rpz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1072974983.1182.27.camel@tux.home.rpz>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: "Lars E. Pettersson" <sm6rpz@home.se>, Tony Schonfeld <tony@schonfeld.eu.org>
Cc: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

The same problem was here.
After apply the patch , we have now an uptime of 23 days.

Thank's 9a4gl :)

El Jueves, 1 de Enero de 2004 17:36, Lars E. Pettersson escribi=F3:
> On Thu, 2004-01-01 at 17:03, Tony Schonfeld wrote:
> > i' haven't check 2.4.23 without ax25 but 2.4.22 run fine here.
> > i've also look a currious swap problem with 2.4.23 and ax25.
>
> Running Fedora Core 1 here with the 2.4.23 kernel and the ax25-patche=
s
> from:
> ftp://ham2.cc.fer.hr/pub/users/9a4gl/9a4gl-ax25-2423-20031210.patch
>
> Without these patches netrom hanged the system frequently (on previou=
s
> versions of the 2.4-kernel.) So try to apply this patch and see if th=
at
> helps.
>
> 73 de Lars, sm6rpz

- --=20
Ruben Navarro Huedo
email: eb5esx@eb5esx.ampr.org
ax25: eb5esx@ea5rke.eaa.esp.eu
http://www.cabodesantapola.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/9J2a0S5G8AO3zN8RAifmAKCnCizX0k+L2hrWk6X+QSqKISbozQCeMhtC
G4FELZMCcn1qQ4z7bAKGpXc=3D
=3DnMF/
-----END PGP SIGNATURE-----

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
