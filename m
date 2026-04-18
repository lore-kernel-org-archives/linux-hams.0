Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22728850E
	for <linux-hams@vger.kernel.org>; Sat, 18 Apr 2026 23:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776554654; cv=none; b=H0qBwvtCecz/Fn4Cg3eVXzsEGEpNTH4v33p32xOlU6FUJ4/g13cFrfy7aqAX2z0CG+BZQjQXBQNDntOrO1sw7nvDgypdgVCBEhZqlxQIyPz7sjKH8o6OrVFaAJ5JoxJJq+jWXNMzH3CoKQ9wawirvMaGKL5HQVxKkX/375QuW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776554654; c=relaxed/simple;
	bh=d2SYD5kX6BK7I3OxSeMm+a0hro0NfDpWdubTMf90/PY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH10DxU2INPxMU3yOZFzEi7ZXNqutJPoOXYLOmyWslELDjWfuoI1J8fcW+G80mHZhthodupE0VQF5lKmSNlHhLzlyzueq/Jq37NMkcXgQ7AbxHXEYMpVHd7ycohANDieQ221pr8ZucBfl45R/Lb0+mWHSBj8DqVkDtdthV2+DRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=m6Y3mpfJ; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="m6Y3mpfJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RooRHBphKHOPOMJrSf3h9UpO6Fx0AuimNQ+wzWLpXt0=; b=m6Y3mpfJGeTDPc2qreuz2ozZqs
	1hftDDAEYQ3Cb/nToj01YocsvHADFkL0vRyCpHb2kLUA5eWwRLG1pWQgKvqreREVANUt6r8g4PJTJ
	wrYhZwWYhx4a9DULl+tU9k5ZDfjJFBMmqr2zumvzpxnJKFw9SMfhr2oNVQb44ivBcSyuZ0nAXMmip
	IvlQtG1RqZSEd43Y+YoSIiiM+lqqo2XVpcB+JgLdcsbj0A4YHhc4vrRHEpu+5cPfzLpMRMSR4277W
	TzE8FQ8q2RwWMUk+djoJMQut7SFFqtg/KYzsoNSB65x7o65aKSpgU3VDXchYLIZ+qOv2hJzJ+NOLn
	I9aYUMdQ==;
Received: from [68.234.117.163] (port=48990 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <n0nb@n0nb.us>)
	id 1wEF1C-00000001MCJ-0zXr
	for linux-hams@vger.kernel.org;
	Sat, 18 Apr 2026 18:24:06 -0500
Received: from nate by merlin.lan with local (Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1wEF1B-0000000Cd2C-2fad
	for linux-hams@vger.kernel.org;
	Sat, 18 Apr 2026 18:24:05 -0500
Date: Sat, 18 Apr 2026 18:24:05 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: linux-hams@vger.kernel.org
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
Message-ID: <hsdnwdq2o2g26gbvm3wvychl5rp3eri7ggj7kkmple7yzm3kgz@u2pbkjyacqyw>
Mail-Followup-To: linux-hams@vger.kernel.org
X-Operating-System: Linux 6.12.74+deb13+1-amd64 x86_64
Organization: Amateur Radio!
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctmyeapxocso36u3"
Content-Disposition: inline
In-Reply-To: <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
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


--ctmyeapxocso36u3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
MIME-Version: 1.0

* On 2026 18 Apr 14:29 -0500, Dan Cross wrote:
> [Top-posting to make meta-commendary]
>=20
> I wonder if other folks have thoughts, here? It doesn't bode well that
> the discussion hasn't progressed. :-(

Your reply was so comprehensive, there isn't much to add!

A few years ago I had in mind to give using the kernel AX25 stack a go
but reading various reports kind of turned me away.  I had last done so
in the late '90s or so as I recall.  I did do some testing with Direwolf
at the time instead.

As a potential user it really makes no difference whether support is in
the kernel proper or user space.  From a maintainer's view, it's likely
that putting the AX25 code entirely in user space (option 3) is the best
practice these days.

Let's face it.  The kernel is no longer a niche hobby project but is
very much an enterprise project.  It makes sense to move the AX25 stack
entirely into user space.  Before doing so, what could the AX25 stack in
user space do that Direwolf cannot?  I know no one is suggesting this,
but should an option four be considered where the AX25 code is dropped
entirely from the kernel and potential users are directed to Direwolf or
some such existing project?

73, Nate, N0NB

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--ctmyeapxocso36u3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaeQSlQAKCRD7LFEw1VqI
GQlJAJ9yWS3RH+5qkXRlVzHLgaRxChbpDQCffVT78yFnuf8jhkJAIJTt6kLG5wk=
=yh5C
-----END PGP SIGNATURE-----

--ctmyeapxocso36u3--
