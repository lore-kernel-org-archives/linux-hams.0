From: Dan Smith <dsmith@danplanet.com>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 12:01:43 -0700
Message-ID: <4FA42797.2020406@danplanet.com>
References: <20120504151424.GC24655@flying-gecko.net> <E1SQLMS-00025Q-Iq@mail.kostecke.net> <20120504165706.GD24655@flying-gecko.net> <CAPSBm51RHEn7ch_A9CDrtUymZtnOJgnkCq_a=F3auq8A_6XFfg@mail.gmail.com> <20120504180621.GB6444@flying-gecko.net> <4FA420C2.2060308@danplanet.com> <20120504184934.GE6444@flying-gecko.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4224034C472F61DD418DEF3F"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20120504184934.GE6444@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Patrick Ouellette <pouelle@debian.org>
Cc: Bill Vodall <wa7nwp@gmail.com>, linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4224034C472F61DD418DEF3F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> There is not any particularly novel or new thing that you can do
> with Node.js that can't be done with another toolkit as far as I
> can tell.

Sure, but certainly you would not argue that someone shouldn't use the
toolkit of their choice because their distro couldn't or didn't decide
how they should coexist, right? :)

> Actually http is not the problem so much as the plethora of poorly
> written and implemented web sites and all the web 2.0 "interactive"
> user experience with mouse overs that send data back to the server
> automatically, triggering the server to send a response.
>=20
> Don't misunderstand me, I like the flashy Ajax web2.0 user experiences
> I get on my 25Mbps/25Mbps FiOS internet connection - I'm just really
> skeptical it will be as nice at 9600 baud or slower on an ax25 network.=


Whether it makes sense over a slow RF connection or whether people tend
to use it to write crap is really neither here nor there, IMHO. What if
I wanted to write something that provided a web (or web services)
interface to my AX.25 network? I wanted to put that box on the border
between my tens-of-megabits internet connection and my 9600 baud AX.25
network of course, so that new-to-amateur radio kids could poke at the
network with a web browser. I'm not using Node.js for the AX.25 side,
but for the public-facing one. If the resolution here is to make the two
mutually exclusive, then that becomes harder.

Now, I'm certainly not arguing that one should have to take the rename
penalty over the other mind you, I'm just saying I think making them
mutually exclusive to solve the problem is precisely the sort of thing
the guidelines are trying to avoid using Conflicts: for. I'd tend to
lean towards a "we were here first" state of mind, but I also don't want
to find out that debian said "fine, screw you _and_ your eighteen
friends" when I got my head out of the sand :)

--=20
Dan Smith
www.danplanet.com
KK7DS


--------------enig4224034C472F61DD418DEF3F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJPpCeXAAoJEBeZxaMESjNVb3YIAKiURjMnhc05xWTWr84mddVD
hmo+AdZqAHLo2itPkI4wQ5Od4Nwj0F/IThQFHsYyIYqkLz2yq/ikq57QciwZuoHw
IaKYy3NliGccHLkTQrI1NdY5p05W2s0UhRYhqwvchc5fBmAU49FjF6hqCpD9rYZV
Ap6H5+piisQL0mNV/ZxbWRz4vBZ36xJMYtbHyjZwSpRXWIn5aP4s1ZhJv+N9WJUR
b6XnRNZIgNPvgocLyZtLthiQbiI6wtoOJS4NVv/sg/thlujWppK8RGZQG0c5ab7O
Lxk9NJL/yGksbB2jGgc1LgMCWRp4953WFcG5bnL8ZilYXxTwhNzPEExKBc+hvg4=
=GECl
-----END PGP SIGNATURE-----

--------------enig4224034C472F61DD418DEF3F--
