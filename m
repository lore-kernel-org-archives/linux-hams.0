From: Patrick Ouellette <pouelle@debian.org>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 12:57:06 -0400
Message-ID: <20120504165706.GD24655@flying-gecko.net>
References: <20120504151424.GC24655@flying-gecko.net>
 <E1SQLMS-00025Q-Iq@mail.kostecke.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary=uAKRQypu60I7Lcqm
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <E1SQLMS-00025Q-Iq@mail.kostecke.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Steve Kostecke <steve@debian.org>, debian-ctte@lists.debian.org
Cc: Dan Smith <dsmith@danplanet.com>, linux-hams@vger.kernel.org, debian-hams@lists.debian.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 11:28:04AM -0500, Steve Kostecke wrote:
>=20
> I've not had time to read that entire thread, but it seems to me that
> renaming well known binaries violates the Principle Of Least
> Astonishment.
>=20
> Has anyone considered making nodejs and ax25 conflict? That would be an
> easy way of sidestepping this entire namespace issue.
>=20

FWIW, I'm fine with that.  Apparently either Node.js people are not
OR someone higher in the food chain is not.  They are trying to
make it so you can have Node.js AND node installed.  I suspect the
actual cases where this is really desired to be very close to zero.
"They" are determined to not introduce the conflicts field.

Policy again - from Section 7.4:
"Be aware that adding Conflicts is normally not the best solution when=20
two packages provide the same files. Depending on the reason for that=20
conflict, using alternatives or renaming the files is often a better=20
approach. See, for example, Binaries, Section 10.1.

Neither Breaks nor Conflicts should be used unless two packages cannot=20
be installed at the same time or installing them both causes one of=20
them to be broken or unusable. Having similar functionality or performing=
=20
the same tasks as another package is not sufficient reason to declare=20
Breaks or Conflicts with that package. Be aware that adding Conflicts=20
is normally not the best solution when two packages provide the same=20
files. Depending on the reason for that conflict, using alternatives=20
or renaming the files is often a better approach. See, for example,=20
Binaries, Section 10.1."

Clearly conflicts is a solution allowed by policy 7.4, and I don't know
*why* they continue to press the issue.  Apparently bug 611698 which
cites policy 10.1 claims "you can't do that."

Maybe the tech committee can explain why policy contradicts policy.


Pat=20

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+kCmIACgkQz9qdgganN263vQCeNWBidxorIx2tcb0377EbXkwI
z8MAnRMyiOQTQ7oxXcjnmYzAzyR5rJwy
=elDV
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
