From: Robert =?iso-8859-1?q?Steinh=E4u=DFer?= <robert@steinhaeusser.com>
Subject: Re: Hamlib question
Date: Mon, 7 Apr 2003 13:06:17 +0200
Sender: linux-hams-owner@localhost
Message-ID: <200304071306.18107.robert@steinhaeusser.com>
References: <200304071056.10318.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_puVk+fc2LP/KvZ9";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304071056.10318.phil@spiderweb.com.au>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org


--Boundary-02=_puVk+fc2LP/KvZ9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Hi Phil,

> I have attempted to have this question answered through the hamlib list
> but, not being a list member, my question was rejected.

Yes, you have to subscribe first. We've had to much spam there lately.=20
Otherwise your postings have to be ack'd by Stephane F8CFE first.

> I have also tried
> to contact a list member who also has used this list but his e-mail addre=
ss
> is no longer valid. Anyway, onto the question.

Have you checked the list of project admins/developers on=20
http://sourceforge.net/projects/hamlib ?

> During the compiling process I get a lot of "given / after" errors, such =
as
> the following. How might I best correct this?

You probably are using GCC3. Add the --without-cxx-binding flag to your=20
=2E/configure call. You'll lose libhamlib++ (the C++-wrapper for the C-lib=
=20
libhamlib) though.

73, Robert DL1NC

--Boundary-02=_puVk+fc2LP/KvZ9
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+kVupo4a8ramwUd8RAoYAAKCujdkW94ExdHxrTAaeEWODeEohrwCbBrEk
Er43F3c8iAWDkiIgPKpYiUI=
=KsRA
-----END PGP SIGNATURE-----

--Boundary-02=_puVk+fc2LP/KvZ9--

