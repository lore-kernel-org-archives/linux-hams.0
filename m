From: =?iso-8859-1?q?G=FCnther=20Montag=20?= <dl4mge@darc.de>
Subject: Re:  f6fbb via telnet port, f6fbb mailing list?
Date: Mon, 3 May 2004 13:58:08 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200405031358.08880.dl4mge@darc.de>
References: <20040426163020.0c79a7af.john@jcoppens.com> <4091B615.25333.76512@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4091B615.25333.76512@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rodolfo Brasnarof <rodob@ciudad.com.ar>
Cc: linux hams <linux-hams@vger.kernel.org>

Am Freitag 30 April 2004 07:12 schrieben Sie:
> ---
>
> I don't understand very well, but you can default
> modem/telnet access enabled to new users by adding it's
> corresponding value in the mask in fbb.conf file as follows:
>
> # First connection mask :
> # 0  : Disable
> # 1  : Excluded
> # 2  : Local
> # 4  : Expert
> # 8  : Sysop
> # 16 : BBS
> # 32 : Pagination
> # 64 : Guest
> # 128: Modem
> # 256: See-all-messages
> # 1024: Liste des messages nouveaux.
> #mask =3D 3616
> mask =3D 3744
>
> So add 128 to your existing mask, and all new users will
> have modem access enabled. You still will have to edit old
> users I think.

Hallo  Rodolfo & friends
I tried this, sorry, no change! Still the message "Read only access... =
you can=20
only send a mail to the sysop".
Does anyone know where I can subscribe the f6fbb mailing list and read =
its=20
archive?
tnx!!!
=20

73 de
G=FCnther
dl4mge@darc.de
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
