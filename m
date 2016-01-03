From: Stuart Longland <stuartl@longlandclan.id.au>
Subject: Re: [PATCH] daemon.c: Include <fcntl.h> for open()
Date: Sun, 3 Jan 2016 20:33:17 +1000
Message-ID: <5688F8ED.4070001@longlandclan.id.au>
References: <20160103102555.GA5031@nyan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="32VJkE4GsspW9TpvoEbar129OnkapEicT"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160103102555.GA5031@nyan>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Felix Janda <felix.janda@posteo.de>, linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--32VJkE4GsspW9TpvoEbar129OnkapEicT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/01/16 20:25, Felix Janda wrote:
> Fixes compilation with the musl c library
>=20
> Signed-off-by: Felix Janda <felix.janda@posteo.de>
> ---
>  daemon.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/daemon.c b/daemon.c

What repository did that 'daemon.c' come from?

--=20
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.


--32VJkE4GsspW9TpvoEbar129OnkapEicT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWiPjuAAoJEE36GRQQveO31i8P/jRloRaKJibvdIr9WcA8DQZd
7MldVVFW4LQfTjEUFQVi1kRTw562VaAU8GoFb1caJygLNz6b6HWCUHGgiregVFlQ
Qg1oRrP0vs5nwHRGzhaQPwpcuOKbVppWivy3UQHdGU/K+YnsumyQo4mbU8F3HUix
v9PnjpeD5L/fcUV4I0J3RwetoO1uzmFwM3IafiCRru/LCR00875brXja7LUKVCNN
HlhDOjuEEBSatnUPB6JToCPUIhk7OVbWeY3sV3tVsP0lP5m+ovt7RD/Ugk0FKnmC
CG41vfoDzkkHqmr/q+ZcUIIJXEWzbw1ynHETxGERL9VtwNsA31P4oN4Obzscg+ok
/+AbqUvHncl5MnfLHplQIv8j+sNXO/HUDj/FvSxz9qIEBfewL2nbVzlHz70871yf
vlnXY0+cjgFv1G86XM4bBz1mycQsZZHmxbMYVKz+xNd1Jv2JMf87VxHJNXs8TQVH
sFOWy13wtveWeog+XlSAPNRjBeYrOmA0DKY4luLwxtV7TrE/e+2+FbI5xgRaPedI
QuMTMXGjQltXsLQgvyNKqNvJ48IlXyE5rgtJOfJ43M4Jdr4nEwXqWXgd+oNcBKAA
VJnEUoMZ1hJ35plv4L4Js8cmievNpUwSplUrs073KXM2/EVRF5ttZHeWlk+gB5xv
WxMQ6Qet1aAOamcBhUPp
=v1v7
-----END PGP SIGNATURE-----

--32VJkE4GsspW9TpvoEbar129OnkapEicT--
