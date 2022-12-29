From: Nate Bargmann <n0nb@n0nb.us>
Subject: Re: [PATCH] libax25: ttyutils.c: Correct suspected typo in
 speed_struct
Date: Thu, 29 Dec 2022 12:48:54 -0600
Message-ID: <20221229184854.vbscngn5qu2hhcqi@n0nb.us>
References: <20221229181420.998996-1-n0nb@n0nb.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yut2l5qrriejf5ys"
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ftQM0a7hjhjh1/vbTbQy0p8EMfLeTXnRio2GWmH5D7c=; b=LlOT9c5M8yYfDtglLmXpEP253L
        G/KE/i0+FP7ITfLmoiwCJhddMBzderMfrsu4XIAc401vfvN5NYLnxNgOUjpiVw7v9bXtswwBcuZRS
        a9YTSxdrPhw1hlsEA+wXbkLK1LAnxLJlzZd5n3kxndsDOMUoICCyuMCFeAWAx9jXKukI=;
Content-Disposition: inline
In-Reply-To: <20221229181420.998996-1-n0nb@n0nb.us>
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: Thomas Osterried <thomas@osterried.de>


--yut2l5qrriejf5ys
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* On 2022 29 Dec 12:38 -0600, Nate Bargmann wrote:
> Looking over recent commits I noticed what looks to be a typo where
> user_speed did not match termios_speed for the B3500000 declaration.

My apologies.  This applies to the libax25 repository:
linux-ax25.in-berlin.de/pub/scm/libax25

- Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--yut2l5qrriejf5ys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCY63hFgAKCRD7LFEw1VqI
GSYSAKCU1mhimCE122JhKGgvbRiyfvr+VwCfaCwgFZ4UfrR1uyQjePN7TyJMg20=
=T1cu
-----END PGP SIGNATURE-----

--yut2l5qrriejf5ys--
