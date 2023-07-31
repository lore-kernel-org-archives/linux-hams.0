From: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Mon, 31 Jul 2023 09:09:54 +0200
Message-ID: <20230731070954.fb3tez2dsusikwn4@localhost>
References: <20230726140635.2059334-1-j.granados@samsung.com>
	<CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
	<20230726140635.2059334-10-j.granados@samsung.com>
	<ZMFfRR3PftnLHPlT@bombadil.infradead.org>
	<20230727123112.yhgbxrhznrp6r3jt@localhost>
	<ZMKQ2OuFy1deZktP@bombadil.infradead.org>
	<20230728073536.egpe6to3s3pndi6r@localhost>
	<ZMQF5mN7wWN2eax3@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="xj42hsy674mnn2ti"
Return-path: <netdev+bounces-22696-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230731070956euoutp0264de954025e344e8023c8d24a0917c29~24i3dUT0s1932919329euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1690787396;
	bh=qX81sDg++xdwGNh71jssIPoPVeEsZ1ZQdv8PBhFtj1w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ouvh6NB+6ieAx9TR0UowL+BAn1puroAicNMoBV/1sNkxmnbS4/GUT03IPjg8UwKc6
	 WWpREpMgL5v75eExVFDHng2fgaEUOJQl+sx35Abl0eT9vNiKsegctQaxIchsjTwwKr
	 WpMVZDW1v2acCCdPP4o3AEHqkrQELWGjKCKI/lVc=
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ZMQF5mN7wWN2eax3@bombadil.infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

--xj42hsy674mnn2ti
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 11:16:06AM -0700, Luis Chamberlain wrote:
> On Fri, Jul 28, 2023 at 09:35:36AM +0200, Joel Granados wrote:
> > On Thu, Jul 27, 2023 at 08:44:24AM -0700, Luis Chamberlain wrote:
> > > On Thu, Jul 27, 2023 at 02:31:12PM +0200, Joel Granados wrote:
> > > > There are no deltas in this patch set. We start seeing the deltas w=
hen
> > > > we start removing with the next 6 chunks. I'll try to make that more
> > > > clear in the commit message.
> > >=20
> > > Indeed, even if no deltas are created it is importan then to say that.
> > > If there are no deltas the "why" becomes more important. If the why is
> > > to make it easier to apply subsequent patches, that must be said. When
> > yes. The why for this patch set in particular is to make it easier to
> > apply the sentinel removal patches.
> >=20
> > I think the difficulty for me comes from having two whys: 1. The one for
> > this patch set which is to make it easier to apply sentinel removal pat=
ches. And 2.
> > The one for the "big" patch (that actually removes the sentinels) which=
 is to
> > reduce build time size and run time memory bloat.
>=20
> The 2) is part of the real why, 1) is more of how to do 2) cleanly. But
> the real why is the savings in memory because we are moving arrays out
> of kernel/sysctl.c so we don't want to incur a size penalty. The
> collateral to avoid increasing size in the moves also proves to save us
> more memory overall, on the ballpark of about 64 bytes per array in the
> kernel both at runtime and build time. The build time gain is mostly
> on the __init stuff and so gets freed right away, but since sysctl
> code always kzallocs the arrays passed we also save 64 bytes per array
> in the end at runtime.
Yes. In my new version I have tried to mention both 1 and 2 and
differentiate between them. I stuck with the "why" for this patch set is
to make it easier to reach 2.

I'll send it out today.
>=20
>   Luis

--=20

Joel Granados

--xj42hsy674mnn2ti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmTHXkIACgkQupfNUreW
QU+2Agv/Z16D0X3qBhPZAkn8ZBVq8+Mws95QU+VZQyb969rZ8jqAtsiVDgbyVdJm
dKzk9Ilvi217UQLNxkwlXoXtQeChp6nXFdiO6rgIDuFKQueqwtoKnMd7iCWv3DKR
wPtLV5j9d88jt/UkFeHvxqSOXtn4NN3/SYEHG6avS9JVCl4W6P6SHBKc/VLmDvu2
KfQZL/qSJAB+BRtWynu+BJEZlw0+TD6/2D5SBJeQdhuTSMkldbwVfYWdKhzPks83
8wypFtm2l3EqZstUtPC/ainbqzVBcfPXryG/ekJkBReSEH+CHrhCo9MCQYRylL9+
Tara17WEHsgTi2fR5MAFdmAOx5QmpYtf/Swdu5u2Ytu4PkkPqtqeqFrWyvBQDQlJ
RuC/ofKYKFrmxmY4EQ9vvTV7fnoMGHPyJbS+KBeO0NsrfV5qKCXGPufaypTgruK9
9mhbJhg4++EBHT1sy7Mf1o2oxJb/ZjeVMrBkAOm0qjhw7TMSnXKmD9k6/le4qn8l
RA39uFUH
=vkUq
-----END PGP SIGNATURE-----

--xj42hsy674mnn2ti--

