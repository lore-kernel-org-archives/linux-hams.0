From: F8arr <f8arr@f8arr.org>
Subject: Re: QSSTV Compilation Issues...
Date: Fri, 30 Apr 2010 22:21:32 +0200
Message-ID: <BC9FE897-F133-47E2-A5E7-6D3E19216C64@f8arr.org>
References: <688897.8364.qm@web37601.mail.mud.yahoo.com> <4BDB37F4.5060808@rns-stearn.demon.co.uk>
Mime-Version: 1.0 (iPhone Mail 7E18)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BDB37F4.5060808@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hi

It can also be a problem of version of qt. The qsstv script try  to =20
find a version of qt or upper but the matching patern doesn't work =20
properly... I had the problem:

Just a case to illustrate:
It looks for a version of 1.2.x  and the two first digits are fixed in =
=20
the code but you are in 1.3.x... It exit on error :-) Check the code =20
of the makefile.

Regard, f8arr

Envoy=C3=A9 de mon t=C3=A9l=C3=A9phone.

Le 30 avr. 2010 =C3=A0 22:05, Richard Stearn <richard@rns-=20
stearn.demon.co.uk> a =C3=A9crit :

> I had/have a similar issue when building mythtv for Slackware.
>
> The QT'ish bits from my mythtv.SlackBuild script:
>
> -------------------------------------------------
> QTDIR=3D/usr/lib/qt
> export QTDIR
>
> LD_LIBRARY_PATH=3D${QTDIR}/lib:${LD_LIBRARY_PATH}
> export LD_LIBRARY_PATH
>
> PATH=3D${PATH}:${QTDIR}/bin
> export PATH
> -------------------------------------------------
>
> Obviously fix QTDIR for to suit you system.
>
> Probably what you have done anyway, if so then apologies for the =20
> noise.
>
> I gave up on using ldconfig for the QT libs when compiling.
>
> --=20
> 73 de g1sog
>    Richard
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-=20
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
