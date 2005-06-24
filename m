From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Kissattach after change to 2.6.12
Date: Fri, 24 Jun 2005 16:33:32 +0200
Message-ID: <42BC19BC.3090102@ccr.jussieu.fr>
References: <4C3202C2-0B97-4486-9DE7-D01C3F95C449@eb5esx.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C3202C2-0B97-4486-9DE7-D01C3F95C449@eb5esx.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Rub=E9n_Navarro_Huedo?= <eb5esx@eb5esx.ampr.org>
Cc: linux-hams@vger.kernel.org

Rub=E9n Navarro Huedo wrote :
> Hello friends:
> After change from 2.6.11 to 2.6.12:
>=20
> linux:/etc/init.d# kissattach /dev/ptyt1 xnet 44.133.3.31
> kissattach: Error setting line discipline: TIOCSETD: No such device

Just in case, look here to see if /dev/ptyt1 is present in your system =
?

On the same line, is devfs installed or are you running the new user=20
space udev system ?
Udev will sooner or later replace devfs system and thus all pty/tty=20
pseudo devices.
In that case, there is only one master device /dev/ptmx that creates=20
automatically a slave device (/dev/pts/xx) when openned.
However, there is no official mkiss and kissattach update for udev.
I have been experimenting a personnal patch that works quite well,=20
including a patch for ax25ipd based on the same /dev/ptmx /dev/pts
pseudo terminals.

> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?
> linux:/etc/init.d# modprobe mkiss
> linux:/etc/init.d# kissattach /dev/ptyt1 xnet 44.133.3.31
> kissattach: Error setting line discipline: TIOCSETD: No such device
> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?
>=20
> Any help?
> A lot of thank's
>=20
> ----------
> Rub=E9n Navarro Huedo
> eb5esx@eb5esx.ampr.org
>=20
73 de Bernard, f6bvp
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
