Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C21367F4A
	for <linux-hams@vger.kernel.org>; Sun, 21 Jun 2026 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782050274; cv=none; b=DyV6m4EL35XyTiGhNimNyLHoXM6v1RphzqQNzxO7jXTGDhdssaeGwWLqgG0DfCZHF7JNbm9dCJlphUrGbh/9K2+rkjwQEyd7pKLjwGBtHV6C0CdjtyDeBqxkSsk+c8IDqegz1x4ldEX+ogrUavFdniDzS9W3xqvMitKaWjAcxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782050274; c=relaxed/simple;
	bh=Jt0uVsEvVUyKkwtymr1ZzdyRwWKeiGelYHT9Bd7UDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KwAn63EoY5nMZKuZMGMiE0r4lF73yabvoMj/GAFWsWhPDoSUyA9+Oxyw0UxGa38J0csFg6LdThRtsnXBOGmlryGanb+ear3JbF4C6q0foIl8MV802hXxJMyTSiVzpdmxnV9Et6pxDNTUuuIIXYYw9IGnWN1tszlo3WwuYvsa/8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=UdVHmJsJ; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="UdVHmJsJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gExVoSx/Z0PTokPoFAwC9u9tV1kM1DjDGDatyt5j8+w=; b=UdVHmJsJp8mlWWjZxYUizGSDXt
	2TqfxK0w+lAorol1E8Ah6vIztCbqEJJU7O0P2OpikpUCVBz5guQEwaLhyg5aq8Uea7/Bw4tpIqaU2
	ABDciyN0T5SogI/g8JDb8IMb2aFt2OdDI4txSDo+OIrIbMIa+NYULnFHywqwYpJIG1Q4iWpM1C32F
	4cfRHVW/u8/4luzsUcK4TiCPYPVOzPzRODTf2847VrRGK7+xHyqgoHLBB1glgL7tho84ZAlUJBYz7
	3trGvqaozMwI2SbsWRxcQFebVmBoA84+urLvJsKO3VBj0HDEwQnrGJPoX6TJxQIY27AGfFvnrYxJX
	WpM/XGkw==;
Received: from [68.234.117.163] (port=36012 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <n0nb@n0nb.us>)
	id 1wbIWI-00000006P1B-29cf;
	Sun, 21 Jun 2026 08:47:30 -0500
Received: from nate by merlin.lan with local (Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1wbIWH-000000002lK-3DZt;
	Sun, 21 Jun 2026 08:47:29 -0500
Date: Sun, 21 Jun 2026 08:47:29 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>
Cc: Debian Hams <debian-hams@lists.debian.org>, 
	Linux Hams <linux-hams@vger.kernel.org>
Subject: Hamlib 4.7.2 released
Message-ID: <nr43fkjxeireyppoo7fvxxed7puw4byv4cgd7n4be6ygpllbew@ejdk4xstki2t>
Mail-Followup-To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 6.12.94+deb13-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5lf6itnmuhhyaj6e"
Content-Disposition: inline
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


--5lf6itnmuhhyaj6e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Hamlib 4.7.2 released
MIME-Version: 1.0

The Hamlib Project is pleased to announce the release and general
availability of version 4.7.2.  This release includes two important
security fixes in rigctld:

- CVE-2026-54634/GitHub GHSA-gpcq-c37x-pr4
- GitHub GHSA-f72v-7gmh-m9mj

All users and distributors of Hamlib are encouraged to upgrade to 4.7.2
as the project considers this a high priority release.

The following changes have been made since 4.7.1:

Version 4.7.2
        * 2026-06-21
        * FTX-1: Rewrite set_channel using VFO-B + BM workaround, also fix
          the get_channel side, auto-exit Memory mode before VFO-state
          setters, and MC cursor targeting in ftx1_set_channel.  GitHub
          PR # 2035.  (TNX Terrell Deppe)
        * IC-7600/IC-7610: Update clock routines; fix IC-7610 clock command=
s.
          GitHub PR #2040 (TNX George Baltz)
        * Icom: Add CWR to modes eligible for DSP filtering.  GitHub PR #20=
41.
          (TNX George Baltz)
        * Kenwood: New model Hamgeek uSGX.  GitHub PR #2043  (TNX Leo Pizzo=
lante)
        * Skywatcher: Now initialize motors on rot_open.  GitHub PR #2046
          (TNX Mario Haustein)
        * C23:  Fix errors when compiling with C23 support.  GitHub PR #2048
          (TNX George Baltz)
        * DX-SR8:  Fix serial configuration, timing, and control bugs.  Git=
Hub
          PR #2052  (TNX Jeff Sheldon)
        * FT-710:  Fix FT-710 VFO swap after cross-band tune.  GiHub PR #20=
63
          (TNX Mike Del Tito)
        * Android:  Replace legacy Android build with NDK SDK in the GNU bu=
ild
          system.  GitHub PR #2061 (TNX William Goodspeed)
        * src/settings.c: Directly open the file descriptor from mkstemp.  =
GitHub
          PR #2067.  (TNX Kai Pastor)
        * IC-705:  Fix power2mW for Icom IC-705 on PKT* modes.  GitHub PR
          #2069.  (TNX Daniele Forsi, Brian Coxi (reporter))
        * X6100: Fix power2mW for Xiegu X6100,  GitHub PR #2070.  (TNX Joha=
nnes
          Schwab)
        * rigctld:  Fix send_raw stack out-of-bounds write and uninitialize=
d memory;
          CVE-2026-54634/GitHub GHSA-gpcq-c37x-pr4.  (TNX George Baltz)
        * rigctld:  Fix stack/heap overflow primitive in read_string_generi=
c +
          auth bypass in rigctld + weak password handling; GitHub GHSA-f72v=
-7gmh-m9mj.
          (TNX George Baltz)
        * X6100:  Adjust X6100 S-meter Look Up Table.  GitHub PR $2074.  (T=
NX Nannk)

On behalf of the Hamlib project, thank you to all contributors!

73, Nate, N0NB

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--5lf6itnmuhhyaj6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCajfrcQAKCRD7LFEw1VqI
GfL6AJ9VR6lk8JdJql9wXVckJCOeWmFuJgCfURCvFwgVedq5QC2hayVuAfLjh/k=
=VW/u
-----END PGP SIGNATURE-----

--5lf6itnmuhhyaj6e--
