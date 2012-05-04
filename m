From: Dan Smith <dsmith@danplanet.com>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 08:35:30 -0700
Message-ID: <4FA3F742.1010506@danplanet.com>
References: <20120504013200.GB3489@flying-gecko.net> <4FA3E269.4060801@danplanet.com> <20120504151424.GC24655@flying-gecko.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4818A72427E4D7AFBEDE3A6B"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20120504151424.GC24655@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Patrick Ouellette <pat@flying-gecko.net>
Cc: linux-hams@vger.kernel.org, debian-hams@lists.debian.org, ralf@linux-mips.org, ax25@x-berg.in-berlin.de

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4818A72427E4D7AFBEDE3A6B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> You claim the existence of the packages in Debian encourages others to =

> try ax25, if this is so where are these people?

As you indicate, popcon isn't going to properly report all of the Linux
systems "out there" that are running in completely isolated RF islands
(much of network 44./8). Even the ones that do have a path to the
outside are likely going to be configured to minimize any extra traffic
over our extremely bandwidth-limited RF links.

However, if debian determines the priority of packages based on
popularity from internet-connected systems, and priority for names is
given to the highest scoring package, (instead of the first one to use
it), then it's unlikely we'll get to keep our place here.

Honestly, I can't say I'd fault debian for making such a decision, as
we're certainly in the minority of their users. However, to answer your
question, judging usage or the presence of "these people" by popcon is
probably significantly and atypically less accurate for us as a group :)

--=20
Dan Smith
www.danplanet.com
KK7DS


--------------enig4818A72427E4D7AFBEDE3A6B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJPo/dCAAoJEBeZxaMESjNVtWIIAMETsxBZvFeYnjbEWfLqJrA4
vVpNcyZcRuoTcvSwLisTpaWcM8QzfqJsoPCxvdSSxcfCHKXf0WAJcALjxPYNACeF
pwb759A5EMjFwwofEi6081VpUya1lDE3l9xjqO7eXIOBhcLwH6h26DHbAD6RKG0U
GFsGNODMsRC8vOusNvH87NT3vq34WO6KNt4W3w/FueyVotVk5J/oCTVmqV9uVqJO
qq7dGMwkkCLZh2/YTguVkrvCKGSZJ5XkBAJO1EYxRWSb4CNhviBn4z1DitBPWQLv
oW3oux/QHzbi4Fh5LIdo9/1x+rcSVn/AyUa3SdYbv9Ez03MmqMmpuc6mrisPjEE=
=SsQn
-----END PGP SIGNATURE-----

--------------enig4818A72427E4D7AFBEDE3A6B--
