From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Gmfsk and Mandriva 2008
Date: Thu, 06 Dec 2007 13:07:46 +0100
Message-ID: <4757E612.7000908@ccr.jussieu.fr>
References: <000f01c837d2$f4351b00$4544a30a@MOTORHOME>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000f01c837d2$f4351b00$4544a30a@MOTORHOME>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

Hi Phil,

Do you use urpmi to install libgnome2-devel ?
It is supposed to install all dependencies at the same time.
This is what I get when doing urpmi libgnome2-devel

root@bernard ax25]# urpmi libgnome2-devel
Pour satisfaire les d=E9pendances, les paquetages suivants vont =EAtre =
install=E9s
indent-2.2.9-7mdv2007.1.i586
libGConf2_4-devel-2.18.0.1-1mdv2007.1.i586
libIDL2_0-devel-0.8.8-1mdv2007.1.i586
libORBit2_0-devel-2.14.7-1mdv2007.1.i586
libavahi-glib1-devel-0.6.17-1.1mdv2007.1.i586
libbonobo2_0-devel-2.18.0-1mdv2007.1.i586
libdbus-glib-1_2-devel-0.73-1mdv2007.1.i586
libesound0-devel-0.2.37-3mdv2007.1.i586
libgnome-vfs2_0-devel-2.18.1-2.1mdv2007.1.i586
libgnome2_0-devel-2.18.0-2mdv2007.1.i586
libpopt0-devel-1.10.6-21mdv2007.1.i586
Proc=E9der =E0 l'installation des 11 paquetages ? (17 Mo) (O/n)=20


I did not go further as I am not using gmfsk.

73 de bernard, f6bvp


Phil wrote:
> Thank you for reading this.
>=20
> During the process of compiling gmfsk I have come to the stage where =
I=20
> need to install libgnomeui2-devel. I've spent the past two weeks in=20
> dependency hell and I'm now at the point where I have to seek help.
>=20
> The final package, and surly it is near the end of the list, is=20
> libgnome2-devel. It won't install because it requires another package=
=20
> (libbonobo-devel, I think it was), which in turn requires=20
> libgnome2-devel; a circular dependency.
>=20
> I've been using gmfsk for many years and each time I upgrade Mandriva=
 I=20
> have to go through a fairly easy process of installing a short list o=
f=20
> packages, but not this time! The process is more difficult than it ne=
eds=20
> to be because I now have to connect to the Internet under Windows,=20
> download a package, restart Linux only to discover that I need anothe=
r=20
> package.
>=20
> Is there anyone on the list that uses gmfsk under Mandriva 2008?
>=20
> Regards,
> Phil.
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
