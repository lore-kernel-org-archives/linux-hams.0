From: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Thu, 27 Jul 2023 17:38:04 +0200
Message-ID: <20230727153804.vjsofabjbkkfat25@localhost>
References: <20230726140635.2059334-1-j.granados@samsung.com>
        <CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
        <20230726140635.2059334-10-j.granados@samsung.com>
        <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="xbxmoit7mrudyotx"
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230727153807euoutp019c33f5ec5929d6bfef6d3725ee255188~1w5au0E4A3207632076euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1690472287;
        bh=STUlWAOlDIA06osjrSwDwcVK8v733Fr4i1T10ZqvEWA=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=SSINP7uzaRxKDkhWPSy6RDQk9D436+tDoi75XZwGm00gWj1Q5CcOzN3Su3RrYwpuL
         LjACgNON6I5jWY2pJKnMSTDGVZl93rTdm63ruXHjLQR7jW0UmwxDWZCPKf43eu4CIL
         gI173oU9pIVbfZNXkLGWLyWSDyvEj3bDrVlJoZ+U=
Content-Disposition: inline
In-Reply-To: <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
List-ID: <linux-hams.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

--xbxmoit7mrudyotx
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 11:00:37AM -0700, Luis Chamberlain wrote:
> On Wed, Jul 26, 2023 at 04:06:29PM +0200, Joel Granados wrote:
> > This is part of the effort to remove the sentinel (last empty) element
> > from the ctl_table arrays. We update to the new function and pass it the
> > array size.
>=20
> The commit log does not explain why. It also does not explain if there
> is any delta on size at compile or runtime.
Just to be on the same page:
You mean the specific why for this commit. like for example:
"
We update to register_net_sysctl_sz to prepare for when the ctl_table
array sentinels are removed.
"

right?


>=20
>   Luis

--=20

Joel Granados

--xbxmoit7mrudyotx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmTCj1oACgkQupfNUreW
QU/6Wgv/boBnYKcKv0VodcQJqgAMPYJRtOq0N1zq3xjIc3RF64wyLuvxJeS3mouM
FUSKJeEGjApvCTmxWpQ7tqdRjkAh0q3UllWuryh0OhcUmHt5SPlqrA40tv2wIpBk
nWmrjkLCRRdm4sxGdR128kNUGLaeexEYZirEf7I2QzDWkX5Y89eMwlCJ9JETyZ/Y
MsMXPM1/US71pbEuM8GKcWTNKw1Q0yB5TEyjNOfj2W3wjtC1rq7hgMMlE5FcU44a
eCd6TUO8uJ9DaIbHpIysKrMhz7kvgQLZpsaUWaJX/0AZK0T/JETQ+oIkt39CeAfU
w+6xEJsCPqPYZmkYmw508U4rxNgTMvLRjAIJEqkxNeW8tMQ1qtacTcIfNSTpw9Ju
Hb2LamLSN8O0lmOMg1eO/ndyxixv2vg08zpPemlgzYtctC2D5rtIa7j0Jo4QZ1Ia
ZuXaO5oKHr/nU+XR+qpvYSe45gM++EkGdvLcNaE9HPm7ejXgjQ1ZPTKWLtvR6sap
FJTVfQmF
=ZZUn
-----END PGP SIGNATURE-----

--xbxmoit7mrudyotx--
