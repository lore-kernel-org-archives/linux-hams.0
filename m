From: =?iso-8859-1?q?G=FCnther=20Montag=20?= <dl4mge@darc.de>
Subject: Re: usage of f6fbb via telnet port
Date: Mon, 26 Apr 2004 13:20:48 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200404261320.48683.dl4mge@darc.de>
References: <200404221549.53649.dl4mge@darc.de> <20040422123757.3d4249a9.john@jcoppens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040422123757.3d4249a9.john@jcoppens.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Coppens <john@jcoppens.com>
Cc: -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>, linux hams <linux-hams@vger.kernel.org>

Am Donnerstag 22 April 2004 17:37 schrieben Sie:
> On Thu, 22 Apr 2004 15:49:53 +0200
>
> G=FCnther Montag  <dl4mge@darc.de> wrote:
> > 3286
>
> Hi Gunter
>
> This is what I found out:
>
> That port (3286) is open normally, but it is formatted to be used wit=
h the
> xfbbC terminal program. The username and password are made into a key=
 to
> be sent to that port, to get actual access.
>
> According to 18.23 of the FBB manual:
>
> The address to use may be 189C (189C hex =3D 6300 decimal).
>
> But, it=B4s also possible to define another port address,
> for example if you want Telnet access to LinFBB on port 23,
> (port 23 is standard for Telnet, but 23 is also used by inetd in Linu=
x!)
> then change the =B4address=B4 of COM2 to 17 (hex 17 =3D 23 decimalt)
>
> Tip:
> You may put the R letter (Read only default access) which gives a
> read-only if the user is unknown or not authorized for Modem/Telnet (=
M
> Flag in EU command).
>
>
> <Image>Example of PORT.SYS for LinFBB
>
> Standard PORT.SYS with 1 TNC (COM1) with WA8DED-hostmode,
> 4 channels, 1 channel for outgoing forward,
> and one Telnet interface listening on port 6300,
> 8 channels, 1 channel for outgoing forward.
>
> #
> #Ports TNCs
> 2      2
> #
> #Com Interface Address (device)   Baud
> 1    9         /dev/cua0          9600
> 2    9         189C               0		<=3D=3D=3D the telnet port at 63=
00
> #
>
> 73,
> John
> ON6JC/LW3HAZ

tnx!
How it i do want that access is read/write?

--=20
73 de
G=FCnther
dl4mge@darc.de
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
