From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= [PATCH] scc fix for 2.6.0
Date: Fri, 26 Dec 2003 11:28:26 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031226102826.GC1518@tangerine.coulon.evette>
References: <20031225195233.C3614@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: =?UTF-8?Q?=3C20031225195233=2EC3614=40jero?=
	=?UTF-8?Q?en=2Epe1rxq=2Eampr=2Eorg=3E_=28from_pe1rxq=40amsat=2Eorg_on_jeu?=
	=?UTF-8?B?LCBk6WM=?= 25, 2003 at 19:52:33 +0100)
List-Id: <linux-hams.vger.kernel.org>
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, jgarzik@pobox.com, ralf@linux-mips.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've tested this patch with 2.6.0 and a drsi card.
It works fine.

--
Regards and 73
			- f5ibh - Jean-Luc

Le 25.12.2003 19:52, Jeroen Vreeken a =E9crit=A0:
|Hi,
|
|This is a fix for the scc driver in 2.6.0
|It was calling register_netdev from within a ioctl and thus holding
|rtnl_lock()
|It now uses register_netdevice and calls rtnl_lock() itself if
|outside the
|ioctl.
|
|Jeroen
|

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/7A1KUdGGXzzGnNARAsU3AJ9xZWE73nblabtml20klDks3zDCyACdEAGa
lYxFjcYXZ4T2YHlIgo9SsYk=
=jLPV
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
