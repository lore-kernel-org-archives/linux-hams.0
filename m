From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re:  f6fbb via telnet port, f6fbb mailing list?
Date: Fri, 07 May 2004 17:35:48 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <409BC8F4.3071.251CF@localhost>
References: <200405031358.08880.dl4mge@darc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <40999143.22988.14D94@localhost>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org


Sorry, my last message has too many typos and is not clear,=20
even for me. (Correction included this time).

---
On 6 May 2004 at 1:13, Rodolfo Brasnarof wrote:

>=20
>=20
> ---
> On 3 May 2004 at 13:58, G=FCnther Montag wrote:
>=20
> > Am Freitag 30 April 2004 07:12 schrieben Sie:
> > > ---
> > >
> > > I don't understand very well, but you can default
> > > modem/telnet access enabled to new users by adding it's
> > > corresponding value in the mask in fbb.conf file as follows:
> > >
> > > # First connection mask :
> > > # 0  : Disable
> > > # 1  : Excluded
> > > # 2  : Local
> > > # 4  : Expert
> > > # 8  : Sysop
> > > # 16 : BBS
> > > # 32 : Pagination
> > > # 64 : Guest
> > > # 128: Modem
> > > # 256: See-all-messages
> > > # 1024: Liste des messages nouveaux.
> > > #mask =3D 3616
> > > mask =3D 3744
> > >
> > > So add 128 to your existing mask, and all new users will have
> > > modem access enabled. You still will have to edit old users I
> > > think.
> >=20
> > Hallo  Rodolfo & friends
> > I tried this, sorry, no change! Still the message "Read only
> > access... you can only send a mail to the sysop".
>=20
> The mask set de default values for NEW user as the register.
> You'll have to edit old (already registered) users' configuration
> with EU command, and add the M to them, I think one by one. Or
> perhaps just erase all the users.

(should be)

The mask sets de default values for NEW users as they=20
register. You'll have to edit old (already registered)=20
users' configuration with EU command, and add the M to them,=20
I think one by one. Or perhaps just erase all the users.


> If you only want to give access to some users, Add the M to them,
> and you don't need the mask in this case.

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
