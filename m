From: Robert =?iso-8859-1?q?Steinh=E4u=DFer?= <robert@steinhaeusser.com>
Subject: ham radio RPMs for SUSE [was: Re: AX-25 software that works on Fedora Core 4?]
Date: Sun, 21 Aug 2005 19:37:26 +0200
Message-ID: <200508211937.31232.robert@steinhaeusser.com>
References: <001701c5a4ef$996db510$a4011fac@kb2ear1> <33093.83.73.68.20.1124569837.squirrel@www.amsat.dk> <200508210844.39309.n7bfs@qwest.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5731092.p9qt8h95C8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200508210844.39309.n7bfs@qwest.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

--nextPart5731092.p9qt8h95C8
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

Douglas Cole wrote:
> I also noticed that version 10 seems to be ignoring amateur radio as well,
> and was wondering if anyone on the list knows why SuSE dropped the "Ham
> Radio" package group?

Joerg Reuter, DL1BKE <jreuter@suse.de> gave some information about the ham=
=20
radio packages in the SUSE LINUX distribution on the (German) "suse-ham"=20
mailing list. You can find his original message in the archives or ask me; =
I=20
can send you a copy. Here is a rough translation from German.

You can find RPMs for SUSE 9.3 here:

	ftp://ftp.suse.com/pub/projects/ham/9.3-i386

(or a SUSE mirror of your choice). You can add this directory as an=20
installation source (command line: "yast install_source") and then install=
=20
using YaST. =20

Joerg can only update these packages in his spare time. He has no time for=
=20
testing and calls them "highly inofficial".

The main reason for no longer including ham radio programs in the distribut=
ion=20
is that many of these programs aren't under active development and it is=20
getting more and more difficult to let them work under a new distribution.=
=20
Package maintanance is simply costing too much effort, and many programs on=
ly=20
compile on the PC architecture and thus require even more effort from Joerg=
=20
as packager and from the autobuild team. Additionally, the potential costs=
=20
for quick and effective handling of security problems are quite high.

Joerg also sees an advantage for himself by continuing these packages on hi=
s=20
own: During the last weeks of a new release's beta phase he only has to che=
ck=20
once that these packages compile -- and no longer (in extreme cases) weekly=
,=20
every time somebody checks in a new compiler, GLIBC, QT oder KDE update.

73, Robert DL1NC/N9KBK

--nextPart5731092.p9qt8h95C8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDCLvbo4a8ramwUd8RAg4sAKCpqziMkFEZMyHO/cyP98/X/CcaTACgk2Jc
ThYYIJOI8zk51r2+KMyfUqo=
=9/f7
-----END PGP SIGNATURE-----

--nextPart5731092.p9qt8h95C8--
