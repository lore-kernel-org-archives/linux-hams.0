From: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Fri, 28 Jul 2023 09:35:36 +0200
Message-ID: <20230728073536.egpe6to3s3pndi6r@localhost>
References: <20230726140635.2059334-1-j.granados@samsung.com>
        <CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
        <20230726140635.2059334-10-j.granados@samsung.com>
        <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
        <20230727123112.yhgbxrhznrp6r3jt@localhost>
        <ZMKQ2OuFy1deZktP@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="qapdrkzqpsgeioz3"
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230728073539euoutp024ce08c88b937ef44594e48c547dec293~199dW91ly3106331063euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1690529739;
        bh=jUzBfACVBE6PRXtosK5veJt2pcwU2AhBbGaNBCP0R8M=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=biG7FzOrlqlayuOGUKkhLs3BBNP5YHjKHrq9ooM+zrk0GJXPK/CPusfD6PUt0dN6j
         /7dgKeZ9rgRyvumFU2WK3Z8qz8AKHt+oCXLg0iC17CBw26xOPT/e23Rs32SdwKSuNu
         q8C5scIIXExYnuSYwIn3pKM5+QNgGQ//+dweL7pk=
Content-Disposition: inline
In-Reply-To: <ZMKQ2OuFy1deZktP@bombadil.infradead.org>
List-ID: <linux-hams.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

--qapdrkzqpsgeioz3
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 08:44:24AM -0700, Luis Chamberlain wrote:
> On Thu, Jul 27, 2023 at 02:31:12PM +0200, Joel Granados wrote:
> > There are no deltas in this patch set. We start seeing the deltas when
> > we start removing with the next 6 chunks. I'll try to make that more
> > clear in the commit message.
>=20
> Indeed, even if no deltas are created it is importan then to say that.
> If there are no deltas the "why" becomes more important. If the why is
> to make it easier to apply subsequent patches, that must be said. When
yes. The why for this patch set in particular is to make it easier to
apply the sentinel removal patches.

I think the difficulty for me comes from having two whys: 1. The one for
this patch set which is to make it easier to apply sentinel removal patches=
=2E And 2.
The one for the "big" patch (that actually removes the sentinels) which is =
to
reduce build time size and run time memory bloat.

> you iterate your new series try to review the patches as if you were not
> the person submitting them, and try to think of ways to make it easier
> for the patch reviewer to do less work. The less work and easier patch
> review is the better for them.
Ack. For all these commits I'll try to weave in the two Whys to make the
review process a bit easier.

>=20
>   Luis

--=20

Joel Granados

--qapdrkzqpsgeioz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmTDb8YACgkQupfNUreW
QU+p5Qv+Ny6GD1gN48hVrnGHM/gw/gd6W0YawMBGaag+E9wch++MavDe3IrOjoGY
KUr3UrXl0hkqH2lCYK0jfELRuRzahODuBPAcsxZuyBAn+DdcxOevc40IIWCBl10r
TMrvkJeXEWCe///Jzj61eRQnG6XKCZ0CkoUS+jsA2Gnc9SqExhp1cxT/hqTcg+4G
O3lMTR13FxIO1yx1/qMWGMTm2lAJStVksJRhteW9oCKN3yIlp3dtSDi+OgzLYscN
4u2MtE5BEFDTRRCu4JNZ6AzmBA6IyyYDN5LxZ+gh1rIzWiJBzmfB3Jfayaff00ba
j9UmqKJmuMKTsJHJVKTNoeuXj/6kgdWO86NWbiA/wPenp8c7K/SFpQD9a7p33pPY
A3fQknP0dtjXjJk9oY7czXgsM+o9lfzp7RgeGwb0c44VC2npK4boBpvgW3106bbJ
gIuQgu+NyIgEKU2ugZxKXeJYa67pRuuuPde0zajzM/W9dzJP3n279THPrODfbN+q
S++x+6T7
=D9gN
-----END PGP SIGNATURE-----

--qapdrkzqpsgeioz3--
