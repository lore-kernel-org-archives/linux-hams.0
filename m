From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re:  f6fbb via telnet port, f6fbb mailing list?
Date: Thu, 06 May 2004 01:13:39 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40999143.22988.14D94@localhost>
References: <4091B615.25333.76512@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <200405031358.08880.dl4mge@darc.de>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org



---
On 3 May 2004 at 13:58, G=FCnther Montag wrote:

> Am Freitag 30 April 2004 07:12 schrieben Sie:
> > ---
> >
> > I don't understand very well, but you can default
> > modem/telnet access enabled to new users by adding it's
> > corresponding value in the mask in fbb.conf file as follows:
> >
> > # First connection mask :
> > # 0  : Disable
> > # 1  : Excluded
> > # 2  : Local
> > # 4  : Expert
> > # 8  : Sysop
> > # 16 : BBS
> > # 32 : Pagination
> > # 64 : Guest
> > # 128: Modem
> > # 256: See-all-messages
> > # 1024: Liste des messages nouveaux.
> > #mask =3D 3616
> > mask =3D 3744
> >
> > So add 128 to your existing mask, and all new users will
> > have modem access enabled. You still will have to edit old
> > users I think.
>=20
> Hallo  Rodolfo & friends
> I tried this, sorry, no change! Still the message "Read only
> access... you can only send a mail to the sysop".

The mask set de default values for NEW user as the register.=20
You'll have to edit old (already registered) users'=20
configuration with EU command, and add the M to them, I=20
think one by one. Or perhaps just erase all the users.

If you only want to give access to some users, Add the M to=20
them, and you don't need the mask in this case.

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
