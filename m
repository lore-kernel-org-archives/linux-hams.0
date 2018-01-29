From: Nate Bargmann <n0nb@n0nb.us>
Subject: winkeydaemon updated to v1.0.5
Date: Sun, 28 Jan 2018 18:00:57 -0600
Message-ID: <20180129000057.GC3615@n0nb.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WHG05yakhlzm8Hk1"
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
        :Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=4H0P8GgKn0P18jEjVnv3wEe+1MHPXe1z/1jlEy+dtlY=; b=imDwMtB9tNBRuHKhvDfiQPVHwY
        HcCRFwGEJXAzCFBDpakH7g8YiEFC/cVrdWhXUzQ0epEF67CuXRIW/dLllvTQViExHnp6UIe5tSXSY
        2PSz0UxRBpC+x3H1VYtYz/iXeOUbw/YGF3dL9GdE8y5hE+xVAeH/H1lhqYSdIVRGu8qk=;
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Tlf list <tlf-devel@nongnu.org>, Linux Hams <linux-hams@vger.kernel.org>


--WHG05yakhlzm8Hk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

As an FYI, for those who may use it, winkeydaemon has been updated to
version 1.0.5 thanks to patches from Wilbert, PE7T.  Here is the commit
message:


This patch adds the '-e' and '-m' switches.

Using '-e' turns on 'paddle echo' on the winkeyer3.  Also, it makes the
daemon retransmit the received echo characters as UDP datagrams to the
host and port of your choice (default: localhost:6790).

Using the '-m' switch turns off the (annoying) side tone.

Tested and and found to be working with WK3SMT 3.0.9.
Works supposedly on WK2, too.

On suggestion of Wilbert, README and INSTALL have been edited to remove
some references that were no longer valid.


The code is hosted at GitHub:

https://github.com/N0NB/winkeydaemon

and the release may be downloaded from:

https://github.com/N0NB/winkeydaemon/archive/v1.0.5.tar.gz

73, Nate

--=20

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us

--WHG05yakhlzm8Hk1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpuZDkACgkQ+yxRMNVaiBkseACgpGHmZVvYhS4NEAhxm+TM7S4U
bkwAniKGqGFJe2eY+kCUkztBtuWiXH8L
=bmKg
-----END PGP SIGNATURE-----

--WHG05yakhlzm8Hk1--
