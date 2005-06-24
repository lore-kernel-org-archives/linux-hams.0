From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: Kissattach after change to 2.6.12
Date: Fri, 24 Jun 2005 12:19:38 -0700
Message-ID: <d5d4185b050624121921fe684d@mail.gmail.com>
References: <4C3202C2-0B97-4486-9DE7-D01C3F95C449@eb5esx.ampr.org>
	 <42BC19BC.3090102@ccr.jussieu.fr>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42BC19BC.3090102@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On 6/24/05, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
> Rub=E9n Navarro Huedo wrote :
> > Hello friends:
> > After change from 2.6.11 to 2.6.12:
> >
> > linux:/etc/init.d# kissattach /dev/ptyt1 xnet 44.133.3.31
> > kissattach: Error setting line discipline: TIOCSETD: No such device
>=20
> Just in case, look here to see if /dev/ptyt1 is present in your syste=
m ?
>=20
> On the same line, is devfs installed or are you running the new user
> space udev system ?
> Udev will sooner or later replace devfs system and thus all pty/tty
> pseudo devices.
> In that case, there is only one master device /dev/ptmx that creates
> automatically a slave device (/dev/pts/xx) when openned.
> However, there is no official mkiss and kissattach update for udev.
> I have been experimenting a personnal patch that works quite well,
> including a patch for ax25ipd based on the same /dev/ptmx /dev/pts
> pseudo terminals.
>=20
> > Are you sure you have enabled MKISS support in the kernel
> > or, if you made it a module, that the module is loaded?
> > linux:/etc/init.d# modprobe mkiss
> > linux:/etc/init.d# kissattach /dev/ptyt1 xnet 44.133.3.31
> > kissattach: Error setting line discipline: TIOCSETD: No such device
> > Are you sure you have enabled MKISS support in the kernel
> > or, if you made it a module, that the module is loaded?
> >
> > Any help?
> > A lot of thank's
> >
> > ----------
> > Rub=E9n Navarro Huedo
> > eb5esx@eb5esx.ampr.org
> >
> 73 de Bernard, f6bvp
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

Udev will also create the /dev/tty?? and /dev/pty?? device nodes
automatically, if you use a sufficiently new kernel and udev version,
and the kernel is compiled with BSD PTY support.  I suspect the OP
didn't enable BSD PTY support in his 2.6.12 kernel.

Jeremy, NW7JU
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
