From: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: Re: Compiling last node version.
Date: Fri, 5 Mar 2004 00:09:01 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403050009.02359@www.cabodesantapola.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: on1aad@amsat.org
Cc: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thank's for your answer.
Trying it:

$ apt-get -b source libax25
Reading Package Lists... Done
Building Dependency Tree... Done
Need to get 235kB of source archives.
Get:1 http://ftp.belnet.be unstable/main libax25 0.0.11-2 (dsc) [598B]
Get:2 http://ftp.belnet.be unstable/main libax25 0.0.11-2 (tar) [231kB]
Get:3 http://ftp.belnet.be unstable/main libax25 0.0.11-2 (diff) [2831B=
]
=46etched 235kB in 10s (21.6kB/s)
dpkg-source: extracting libax25 in libax25-0.0.11
dpkg-buildpackage: source package is libax25
dpkg-buildpackage: source version is 0.0.11-2
dpkg-buildpackage: source maintainer is Bruce Walker <w1bw@debian.org>
dpkg-buildpackage: host architecture is i386
dpkg-checkbuilddeps: Unmet build dependencies: debhelper (>=3D4)
dpkg-buildpackage: Build dependencies/conflicts unsatisfied; aborting.
dpkg-buildpackage: (Use -d flag to override.)
Build command 'cd libax25-0.0.11 && dpkg-buildpackage -b -uc' failed.
E: Child process failed
$ cd libax25.....
libax25-0.0.11 $ dpkg-buildpackage -b -uc -d
dpkg-buildpackage: source package is libax25
dpkg-buildpackage: source version is 0.0.11-2
dpkg-buildpackage: source maintainer is Bruce Walker <w1bw@debian.org>
dpkg-buildpackage: host architecture is i386
 debian/rules clean
dh_testdir
make: dh_testdir: No se encontr=F3 el programa
make: *** [clean] Error 127

Any help?

A lot of thank's.
- --=20
Ruben Navarro Huedo
eb5esx (arroba) eb5esx.ampr.org
http://www.cabodesantapola.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAR7cO0S5G8AO3zN8RArdAAJ9QLiARAFd3t2FZmn1EiQotTN0QdwCdGW5W
rqGNOu7C6U0Rf7iGXSdxvQo=3D
=3DQ5jv
-----END PGP SIGNATURE-----

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
