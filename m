From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= Problems with uscc and kernel 2.6.0-test11
Date: Thu, 11 Dec 2003 17:00:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031211160025.GC1758@tangerine.coulon.evette>
References: <3FD8909E.7090906@iol.pt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3FD8909E.7090906@iol.pt> =?UTF-8?Q?=28fro?=
	=?UTF-8?Q?m_ct1drb=40iol=2Ept_on_jeu=2C_d=E9c?= 11, 2003 at 16:43:26 +0100)
List-Id: <linux-hams.vger.kernel.org>
To: David Quental <ct1drb@iol.pt>
Cc: LINUXHams <linux-hams@vger.kernel.org>


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I've the same problem with a DRSI ISA card. it uses the scc driver.
With previous versions (I've tried -test2), sccinit was unable to =20
found the control ports of the card (was telling "Missing"). With =20
test 11, the driver seems to initialise fine

kernel: NET: Registered protocol family 3
kernel: AX.25: Z8530 SCC driver version 3.0.dl1bke
kernel: scc0: data port =3D 0x303  control port =3D 0x302 -- found
kernel: scc1: data port =3D 0x301  control port =3D 0x300 -- found

The the shell is dead. An other shell where I start listen dies too.
The related process are not killable...

I'm running DEbian sid.
--
Ragards and 73
			- Jean-Luc

Le 11.12.2003 16:43, David Quental a =E9crit=A0:
> Hello to all.
>=20
> I have on uscc at address 320 and irq 5, it works fine under kernel =20
> 2.4.21-144 from SuSE 9.0. But under kernel 2.6.0-test11 i have =20
> problem when try to load it, shell freezes and if i do command =20
> 'ifconfig' in another shell it freezes as well. Since first kernel =20
> 2.6.0 i have problems with my uscc, never worked because of those =20
> freezes.
> Any help will be fine.
> Another thing:
> in kernel 2.6.0-test11 i use same .config than in SuSE.
>=20
> Best 73 till then.
>=20
> CT1DRB
> David Quental
>=20
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-=20
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/2JSZUdGGXzzGnNARAowFAJ4rtdxp+R+HCHYn3FdcWdDobifymACaAwUR
l1GzvcpEWmRrowB4zBx5ADA=
=gdno
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
