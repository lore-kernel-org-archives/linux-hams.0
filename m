From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 3.3 released
Date: Mon, 20 Aug 2018 11:29:33 -0500
Message-ID: <20180820162933.ybic6bdww2dgl6xl@n0nb.us>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0713726666610959477=="
Return-path: <hamlib-developer-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mNdnbvT7on9s+jDEZ2UNy2gCJ15TKWlKsbGQlu1tzQQ=; b=mcunOGvYi8WR+KEdLad6W+n2Mc
 VvH49lxhCM5IUNRYMAhuW58TEVNSOJDzoQ3Frn0wtvnKy6jX6DrprEEOthDYXYS94QpjJz+UUzPgY
 ppyp86RT+ZTUGJwbWgG9z9h3UtBgo6VZ40tTtrs4EvFzr4x3XerQieN1m4SfqbSyFQus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mNdnbvT7on9s+jDEZ2UNy2gCJ15TKWlKsbGQlu1tzQQ=; b=Y
 lWhUIK9qGEWQF9+8UqL0GP94fiXCvoB3NQVzUftumSaLhaHLpDCrD8MTrk9zg36U6jZe9MTYuIUft
 oAwWMiG8ctnnKeT2OXQBT+pEf1DLH8gBxqrF1Cz6DfpikpdQmUJKcPNy+Znp+rmeX6ha86f0oQULR
 NNFCEIGZIqC4D2e8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
 s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
 :Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mNdnbvT7on9s+jDEZ2UNy2gCJ15TKWlKsbGQlu1tzQQ=; b=VdBIHKXBkfWkYK4isYDPfBbiQ7
 Z+29Eyqs9vJ4Y5QAnrl+77GFUn6UFN01MFcK+G8RWCI1cSXZ94t4G2E49vTT42UnQxLpK+bAqQ+8d
 O/6qsBr8p7bpqsca154nz2q3iKrAxocczY/QrW+iXxJJ0QwGJ+/U+ZfQoFsMh7IEMxWM=;
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


--===============0713726666610959477==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pfht7jgcudu5es53"
Content-Disposition: inline


--pfht7jgcudu5es53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hamlib 3.3 is released!

This release represents the last of the current ABI and API that has
been in place since the early releases of the 1.2.x series.  While a
point release might be made in the future to fix any serious bug, work
will continue for Hamlib 4.0 which will have an incompatible ABI and
some changes to the API, requiring a recompilation of C linked programs
at a minimum.

The source tarball and Windows 32 and 64 binary builds can be downloaded
=66rom:

https://sourceforge.net/projects/hamlib/files/hamlib/3.3/

or

https://github.com/Hamlib/Hamlib/releases/tag/3.3

Along with MD5SUM and SHA1SUM signatures, all files have been signed by
my GPG key as a detached signature in the respective .asc files.

Major changes since Hamlib 3.2:

Version 3.3
        2018-08-20
        * New models, R&S xk2100, TRXMAnager, Meade LX200
        * HTML manual is now generated at 'make dist' so users don't
          need GNU Info tools installed.  TNX Greg, N1DAM for the suggestio=
n.
        * Handle longer udev generated file names up to 512 characters
        * Add debug time stamps with new '-Z' option and '--debug-time-stam=
ps'
          options to rigctl, rotctl, rigctld, and rotctld utilities.
        * rigctld/rotctld continue working after serial or TCP device
          disappears.
        * Updates and fixes to FT-817, K3, IC-7300, AOR 3030, TM-D710,
          OMNI VII, TH-D72, Flrig, TS-590, piHPSDR, TS-2000, and netrigctl.
        * Update utility manual pages (section 1) and remove their reference
          material from the Info manual so it only needs to be update in one
          file.
        * Add new general project manual pages (section 7) and edit the Info
          manual to match.  These should not change much so keeping them in
          sync should not be too much of a burden.  The Info manual may be
          removed at some point in the future.
        * Last planned release of the present API/ABI.  Future releases will
          require recompilation and relinking by client programs using the C
          library interface (programs that only use the network daemons sho=
uld
          be unaffected).

73, Nate, N0NB

--=20

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Web: http://www.n0nb.us  GPG key: D55A8819  GitHub: N0NB

--pfht7jgcudu5es53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEABECAAYFAlt67G0ACgkQ+yxRMNVaiBkkdACdEzqa13M/q1UcudcJsV1C1Snx
bp4Ani9I7hq3ZnnB/sxYOMb5FQrXjSLm
=15vZ
-----END PGP SIGNATURE-----

--pfht7jgcudu5es53--


--===============0713726666610959477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
--===============0713726666610959477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Hamlib-developer mailing list
Hamlib-developer@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/hamlib-developer

--===============0713726666610959477==--

