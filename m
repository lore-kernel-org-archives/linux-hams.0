From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= New stable version Linux kernel 2.6.1 is out
Date: Sat, 10 Jan 2004 20:13:28 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040110191328.GE951@tangerine.coulon.evette>
References: <400045AB.4050403@geofizyka.pl> <20040110200607.I211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040110200607.I211@jeroen.pe1rxq.ampr.org> (from pe1rxq@amsat.org on sam, jan 10, 2004 at 20:06:07 +0100)
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 10.01.2004 20:06, Jeroen Vreeken a =E9crit=A0:
>On 2004.01.10 19:34:19 +0100 sp2ong@geofizyka.pl wrote:
>> Hi,
>>
>> I have download lastest stable linux kernel 2.6.1 if this version
>> contain all current patches for AX.25 stack?
>
>For the ax.25 stack yes, but the scc and mkiss patches are not yet in.
>

Well, I tried to apply the scc patch to the 2.6.1 and it does not apply ...

[root@tangerine] /usr/src/linux # patch < /home/jean-luc/scc-linux-2.6.0.rx=
q.=20
diff -p1
patching file drivers/net/hamradio/scc.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
3 out of 3 hunks ignored -- saving rejects to file drivers/net/hamradio/scc=
.=20
c.rej

--
Regards and 73
			- Jean-Luc
>Jeroen
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAAE7YUdGGXzzGnNARAiawAKCVnqZo2vK7iZuiXSiwzCc2MAPJcwCaA2Z/
hiTPlaxPNtpvVu9t0e5moDU=
=Wd4y
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
