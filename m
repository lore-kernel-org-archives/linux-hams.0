From: =?iso-8859-1?q?G=FCnther=20Montag=20?= <dl4mge@darc.de>
Subject: Re: usage of f6fbb via telnet port
Date: Fri, 30 Apr 2004 14:27:41 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200404301427.41994.dl4mge@darc.de>
References: <20040426163020.0c79a7af.john@jcoppens.com> <4091B615.25333.76512@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4091B615.25333.76512@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rodolfo Brasnarof <rodob@ciudad.com.ar>
Cc: -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>, linux hams <linux-hams@vger.kernel.org>

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
>
> > > Entschuldigung f=FCrs schlechte Deutsch ;-)
>
> Yes, please, try to keep it in English. It's hard for me to
> understand German, as should be for you to understand
> Spanish.

Hasta la vista Rodolfo!
Tny very much for this info!
I think this is the solution, it will help me very much!
My vision is to make out of my hf pactor program a real automatic mailb=
ox,=20
like the existing pactor (winlink / airmail) mailboxes, with the help o=
f=20
f6fbb, so that new users can register and send mails immidiately withou=
t=20
having to wait for the sysop. Maybe new with linux, and without ptc, i =
do not=20
know. But now i am happily looking forward to the weekend in my shack..=
=2E
Tnx again
--=20
73 de
G=FCnther
dl4mge@darc.de
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
