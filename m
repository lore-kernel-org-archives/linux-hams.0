From: Ken Koster <n7ipb@wetnet.net>
Subject: Re: AX25 tools and packages
Date: Thu, 2 Aug 2007 17:20:51 -0700
Message-ID: <200708021720.56251.n7ipb@wetnet.net>
References: <5abd436b0707261023nada8cf5n90532459745cd2ac@mail.gmail.com> <20070802012451.GA1238@cloud.net.au> <20070802112715.GB25597@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3919219.0Cfo8e9mkj";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070802112715.GB25597@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

--nextPart3919219.0Cfo8e9mkj
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 02 August 2007, Ralf Baechle DL5RB wrote:
> On Thu, Aug 02, 2007 at 11:24:51AM +1000, Hamish Moffatt wrote:
>=20
> > > I'm using the latest patches from Debian since that seemed to be the =
latest=20
> > > I could find.  Because my current builds are targeted at a 2.4 series=
 kernel in
> > > an embedded system they work with a few small patches but I'm planning
> > > on switching to 2.6 as soon as possible.
> >=20
> > There appears to be a misconception that 2.6 requires new tools. Notice
> > that Ralf said newer Linux distributions (meaning newer libc, gcc etc)
> > rather than newer kernels.
>=20
> Correct.  Binary compatibility across kernels is one of the holy grails
> in Linux and AX.25 is not exception to that.  Unfortunately that's a
> little different for source code of the tools which at times may need a
> little update to compile on a more recent system.

Thanks, I figured that out last night when I discovered my cross-compile=20
issues were environment related :-)

Still it would be nice to have a release with any bug-fixes.

Ken,  N7IPB =20
(running openwrt kamikaze, ax25, and kiss to multiple tnc7multi's
on a linksys wrtsl54g,   :-) )

--nextPart3919219.0Cfo8e9mkj
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBGsnTomTp7LlE4xCoRAv6AAJ9K4Pa8/tJ00+tdz6kmgM2h74aamgCfWVd2
1S0pMCHoAHJvBdolXMtYa2I=
=x1Ac
-----END PGP SIGNATURE-----

--nextPart3919219.0Cfo8e9mkj--
