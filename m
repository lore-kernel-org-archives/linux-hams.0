From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 21:26:43 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1097864803.1290.14.camel@oh2bns.ampr.org>
References: <620c9057041015095771b236e0@mail.gmail.com>
	 <620c9057041013094421cbf279@mail.gmail.com>
	 <20041014025505.66938.qmail@web40824.mail.yahoo.com>
	 <620c9057041014060070eeccf6@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
	 <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>
	 <4170100F.F5F43579@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4170100F.F5F43579@free.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Fri, 2004-10-15 at 20:59, G=E9rard / F6FGZ wrote:

> >         mkiss -c -l -s 19200 /dev/ttyS0 /dev/ptyz0 /dev/ptyz1
> >         kissattach /dev/ptyz0 hfport 44.135.96.242
> >         kissattach /dev/ptyz0 vhfport 44.135.96.243
>=20
> I correct your memory ;-)
> kissattach /dev/ttyz0 hfport 44.135.96.242
> kissattach /dev/ttyz1 vhfport 44.135.96.243
>=20
> It is important to have ptyxx from one side corresponding to ttyxx on=
 the other
> side.

True. Additionally I would recommend kissattaching the master side
(ptyxx) and putting mkiss on the slave side (ttyxx). Then, as the
master side always needs to be opened first, you need to first do=20
kissattach and mkiss after that.

--=20
Tomi Manninen / OH2BNS / KP20ME04

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
