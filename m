From: Stef VK5HSX <sdaniels@airnet.com.au>
Subject: PCI SCC Card - Debian Sarge
Date: Mon, 13 Dec 2004 23:39:00 +1030
Message-ID: <200412132339.05169.sdaniels@airnet.com.au>
Reply-To: vk5hsx@wia.org.au
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_xRZvB74o8uwSfpk";
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams List <linux-hams@vger.kernel.org>


--Boundary-02=_xRZvB74o8uwSfpk
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi there..

	After our Z8530 ISA DRSI cards died, we had to purchased a new PCI SCC car=
d.=20
The following spec's of the card:
	2 port PCI serial card,  I/O ports re-mapped to 3F8, 2F8, 3E8, 2E8
	16750 UART with 64byte FIFO buffer.
	They will operate at a baud rate up to 921.6 KBs. COM1-4 etc. Sunix 4038D

I wish to configure ax25 for packet bbs. Currently we used z8530drv, howeve=
r,=20
I am wondering the best way to go about drivers and setup under Debian sarg=
e,=20
using 2.4.27 kernel, with machine running- Pen II-266MHZ, 200MB RAM.

Any info would be much appreciated..
=2D-=20
Regards - Stef VK5HSX
          Adelaide, Sth Australia=20
	  -=3D Support Open Source =3D-

--Boundary-02=_xRZvB74o8uwSfpk
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBvZRxH/+qRJ7D8UsRAtQCAJ9o724drwO8LUpcdlU+S2kBBTPZwgCZASKr
v2Ty7NRWrS2huq1U9SQGnDI=
=IAJE
-----END PGP SIGNATURE-----

--Boundary-02=_xRZvB74o8uwSfpk--
