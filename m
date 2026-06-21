Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC54368264
	for <linux-hams@vger.kernel.org>; Sun, 21 Jun 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782049875; cv=none; b=bYf89FWhh6q08eI4Een2p88B+r/WDy+K2e2TKAwtQ5ZrxkXmStrFOuLMih96osIHQGI50COWf+eTc8JnTESeMwNhot116cMlclJlmMKedCyYcq2jv1eskA4v4yCvdZN0025LjqCv3rd65n35zSCUPyrtylFLkhrSXR0QfoQR5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782049875; c=relaxed/simple;
	bh=zz0bHOzno6QJgKt1cjktY+Lghd8wxFc4ZRcQ0i3eJ8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCjiMoQP8vFUuYKp93BXtIwNl8B3cUjcGo5N9oLury+nIrVVQ9/qf3ck/VC9hChLlSSwmMx7xHGXGzxLU0tBauUMqN34DuFbEIdH8pY0PYMAn71vOvgihwDzzhpEm8ikweWRNIF5E23cUwMV1CXLmYrRxZjd79TyLexe5Q8fWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=ZFjaV4be; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="ZFjaV4be"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QGTANZHrlOhEj7C4hnDVAN/J2PEtFpP4yTgNPjby7QI=; b=ZFjaV4be5U+bAAJleQVIrwaonz
	7ihAcBw7hoxbgeoVChF8QqKR8ABJEiRBL05tl+kwMZDbCavyuaTXZ+ryMwGmdzJbR3iWvmlMSzjdf
	oOFqVjYklRfzGUwwMPu5Crf9CSnhOysOiXWTOJw6nfVhQ7JnR7lKDSfLQLGgP5Hu+vQ/zdOqFtzfJ
	1KCOi26SIZirSv4/4u/bQdrSo1VwpUaklQyRbVqqWceQh5/PLm8f38euDQFNBgudRp5O/PuA34JU0
	ZmvOfox4norxrotuhpJPvs2GYGa1+JMT/eOcqr5PFp0g2AQjBShoGxfPLkl1w0fuLSgtlGc6k/MAh
	LxKCCgvg==;
Received: from [68.234.117.163] (port=52402 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <n0nb@n0nb.us>)
	id 1wbIZr-00000006Qnt-3wRz;
	Sun, 21 Jun 2026 08:51:12 -0500
Received: from nate by merlin.lan with local (Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1wbIZr-000000002v2-0Ce5;
	Sun, 21 Jun 2026 08:51:11 -0500
Date: Sun, 21 Jun 2026 08:51:11 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: hamlib-developer@lists.sourceforge.net, 
	Linux Hams <linux-hams@vger.kernel.org>
Cc: Debian Hams <debian-hams@lists.debian.org>
Subject: Re: [Hamlib-developer] Hamlib 4.7.2 released
Message-ID: <qcise6hkrol5a2mmjgu3mqfhbnfbq4ge6yg5tg75oiopkuubbg@mq442qyozs4l>
Mail-Followup-To: hamlib-developer@lists.sourceforge.net, 
	Linux Hams <linux-hams@vger.kernel.org>, Debian Hams <debian-hams@lists.debian.org>
X-Operating-System: Linux 6.12.94+deb13-amd64 x86_64
Organization: Amateur Radio!
References: <nr43fkjxeireyppoo7fvxxed7puw4byv4cgd7n4be6ygpllbew@ejdk4xstki2t>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ydyklw3mcict5fv"
Content-Disposition: inline
In-Reply-To: <nr43fkjxeireyppoo7fvxxed7puw4byv4cgd7n4be6ygpllbew@ejdk4xstki2t>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www11.qth.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - n0nb.us
X-Get-Message-Sender-Via: www11.qth.com: authenticated_id: n0nb@n0nb.us
X-Authenticated-Sender: www11.qth.com: n0nb@n0nb.us
X-Source: 
X-Source-Args: 
X-Source-Dir: 


--3ydyklw3mcict5fv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Hamlib-developer] Hamlib 4.7.2 released
MIME-Version: 1.0

Forgot to the include the download links:

https://github.com/Hamlib/Hamlib/releases/tag/4.7.2
https://sourceforge.net/projects/hamlib/files/hamlib/4.7.2/

73, Nate, N0NB

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--3ydyklw3mcict5fv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCajfsTgAKCRD7LFEw1VqI
GSamAJ4oX09bPfSSjIoCHnxnhj8xSmDI+QCgt3+AdhYz/1RXe693qmFv0wikamw=
=Cnwg
-----END PGP SIGNATURE-----

--3ydyklw3mcict5fv--
