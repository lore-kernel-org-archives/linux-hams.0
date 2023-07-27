From: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Thu, 27 Jul 2023 14:31:12 +0200
Message-ID: <20230727123112.yhgbxrhznrp6r3jt@localhost>
References: <20230726140635.2059334-1-j.granados@samsung.com>
        <CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
        <20230726140635.2059334-10-j.granados@samsung.com>
        <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="4vknydsdvtpt7ldd"
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230727123115euoutp02efe56ab69c0f6d93bf5e44daa135fa62~1uWRJ0u2b0676306763euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1690461075;
        bh=XLMM8OV6uWDkuXMdbW6WQEC+PZrDreWRKnf1tR2c17M=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=GGMFwmrg36OOUx5Yl2h9yXEBL+aHfrnF8DTSjp+nHkmqf5IKTjc9x7HupuUMKTTM8
         Z0WDlY0b5f0e/3Hd09Wjrz0y55xIAUvgvNKLoTo0RDrfq49rxNwdicBe3N44V3DC2b
         7NSSK1EZM8OUSh52ksQyFpLuTfdJCvE2j8/iSKPU=
Content-Disposition: inline
In-Reply-To: <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
List-ID: <linux-hams.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

--4vknydsdvtpt7ldd
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
I'll add the "why".

> is any delta on size at compile or runtime.
There are no deltas in this patch set. We start seeing the deltas when
we start removing with the next 6 chunks. I'll try to make that more
clear in the commit message.

>=20
>   Luis

thx for the feedback

--=20

Joel Granados

--4vknydsdvtpt7ldd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmTCY5AACgkQupfNUreW
QU+yAgv+NSm02fMf1oKbi5C+jAFBaaqaXxpYTOSvT3lz6av99sRRWxz3CucBCZat
6mDgSSacaT2HmqZF40ZlcnLfEsLKUEQWHe8Y1ipMmSfqW8egaRy7UlLeRBSXxAYR
kIPpWJlWeAqA6dtfRYD2/5dmo+j7TuPvMhCfh8z8Qa6i+AEph2nMEVaCeav+09ml
j8Q14ppd0sIJrmyFGRRSFX6NSaVyKmGAPfnPheZl+vcxXjtgXuezt77MDpvL5Q0A
NC2U/n5+Wjb92sSEfzT5wU4qgD8R9UIadz32Pk5L6Gh3iaWtsWkfoj+3/9Dz6zix
Q051sYTq+FprW+WQHKXl52Ok45mG9HzmxPqvA/vtZrPHV7BEeNHwnx6gwin0OxZX
XrKIc+NywsGsMaPPB6nrUm9f4JwHYALCMfj2cwKaURUlIdIAwyQZiJGz30vnyYIj
G6859Eas2Y8X32Pk1sA8rrLNJcKzHw0Zs+45d15kH/PF5SdFORQeqz14fpEuXKH9
KWyogJY0
=P4Vs
-----END PGP SIGNATURE-----

--4vknydsdvtpt7ldd--
