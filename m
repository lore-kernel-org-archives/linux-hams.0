From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Compiling last node version.
Date: Fri, 5 Mar 2004 11:29:12 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040305002912.GA6825@cloud.net.au>
References: <200403050009.02359@www.cabodesantapola.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200403050009.02359@www.cabodesantapola.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On Fri, Mar 05, 2004 at 12:09:01AM +0100, Ruben Navarro Huedo wrote:
> dpkg-checkbuilddeps: Unmet build dependencies: debhelper (>=3D4)

> libax25-0.0.11 $ dpkg-buildpackage -b -uc -d
> dpkg-buildpackage: source package is libax25
> dpkg-buildpackage: source version is 0.0.11-2
> dpkg-buildpackage: source maintainer is Bruce Walker <w1bw@debian.org=
>
> dpkg-buildpackage: host architecture is i386
>  debian/rules clean
> dh_testdir
> make: dh_testdir: No se encontr=F3 el programa
> make: *** [clean] Error 127
>=20
> Any help?

Install the missing build dependencies ie debhelper >=3D 4.


Hamish
--=20
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
