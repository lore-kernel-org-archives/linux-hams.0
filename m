From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 3.2 released
Date: Sat, 31 Mar 2018 12:05:54 -0500
Message-ID: <20180331170554.jn4vutkvkl6sresv@n0nb.us>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5466651128463399585=="
Return-path: <hamlib-developer-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXOWWJLU32HFZ17uAtjIkU4hHnUUVnOzc4FF3FiV9pM=; b=kGbLdVDD91+wc5KBxUvNTm48vT
 KP1g7Wp1aNJ5qZvr7EreBNFCzUP3E+bYcnTJ+z+VK9Lyt/AYjL3qyVLDtzdTjK8JQQM2jUizaoq8m
 NhH2LbGs9QW4xs4jccan7LNrPSd+Agh33fPsOfazT1NnPSQO+xdF02ika8A28wylWTmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lXOWWJLU32HFZ17uAtjIkU4hHnUUVnOzc4FF3FiV9pM=; b=e
 i5S4sI3WnGy9t+PMWdPHPli4lydVWM22Hc0U7aBu4UwJyJl0T2VzP7PJqhN/ca8UWsbUmDmlaWNel
 fNFmISD0T0aEVWWx9UELL2ra78p1fr7T624s5rpY3ROeYbLbdKcVol5XpqiQ+x/36/EAGlVYyqd1p
 PLwHpoHPNYVkic/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
 s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
 :Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lXOWWJLU32HFZ17uAtjIkU4hHnUUVnOzc4FF3FiV9pM=; b=ICWmDkCqTaQmo99WD0psRUpUzr
 uhMduEXX3rW6nx0cId57ketBy8EG4b3s6C2jCy3kDG8bTncMDR5ZukfrDWBayr/7Zyu5NpNsPNAkO
 e5p0n0FwlczDSS11GKdDyy7Pk06iHf35O0Yu8S8cZ5C1e4jgvLA03Kf348iWiObH2REE=;
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/hamlib-developer>, 
 <mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=hamlib-developer>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>, 
 <mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: hamlib-developer-bounces@lists.sourceforge.net
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, Linux Hams <linux-hams@vger.kernel.org>


--===============5466651128463399585==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6btitpyd2qtj2syp"
Content-Disposition: inline


--6btitpyd2qtj2syp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

After far too long, Hamlib 3.2 is finally here!

The source tarball and Windows 32 and 64 binary builds can be downloaded
=66rom:

https://sourceforge.net/projects/hamlib/files/hamlib/3.2/

or

https://github.com/Hamlib/Hamlib/releases/tag/3.2

Along with MD5SUM and SHA1SUM signatures, all files have been signed by
my GPG key as a detached signature in the respective .asc files.

Major changes since Hamlib 3.1:

Version 3.2
        2018-03-31
        * New models, IC-7850/IC-7851 in IC-785x.  Mike, W9MDB
        * Fix ft991_get_mode, Mike, W9MDB
        * New model, FT-891.  Mike, W9MDB
        * New Barrett 2050 backend, Mike, W9MDB
        * New Flrig backend, Mike, W9MDB
        * New model, IC-M710, Mike, W9MDB
        * Build instructions and test script for Python3
        * Rename autogen.sh to bootsrap and don't call configure
        * micro-ham support. Christoph, DL1YCF
        * New rotator, SPID MD-01/02 in ROT2 mode, Norvald Ryeng, LA6YKA
        * New model, Flex 6400/6600, Mike, W9MDB
        * New model, IC-7610, Mike, W9MDB
        * Add support for CM108B PTT, Max Lock
        * New model, Rohde & Schwarz XK2100, Mike, W9MDB
        * Many other bug fixes and enhancements

Many thanks to all of the contributors to Hamlib over the years.  Your
contributions have resulted in our most comprehensive release ever.
Thank you!

The above is a very short summary of the contributions to Hamlib 3.2 as
the commit log provides the full picture:

https://github.com/Hamlib/Hamlib/commits/Hamlib-3.2

73, Nate

--=20

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Web: http://www.n0nb.us  GPG key: D55A8819  GitHub: N0NB

--6btitpyd2qtj2syp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlq/v/IACgkQ+yxRMNVaiBnALwCgrM9WENN/BgBHxXIhzQEv6rPO
NmEAn2sx7pUSmv3f+TakkwHGHXY4H7PD
=YvKg
-----END PGP SIGNATURE-----

--6btitpyd2qtj2syp--


--===============5466651128463399585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
--===============5466651128463399585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Hamlib-developer mailing list
Hamlib-developer@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/hamlib-developer

--===============5466651128463399585==--

