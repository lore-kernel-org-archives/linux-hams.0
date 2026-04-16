Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614B1A0BF1
	for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 02:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308060; cv=none; b=OEAW6n2zCTK+f1KfvXMPf84KSRt+nuPkAiZnkMrWPy161eBRsVLpzkfLA35TG4k8NAMWusBA582ZN8rjLfG5vPaquy35Ouuyz3hLis1iq7u628KcZ2jFc9baYeojEDuBrCE2cVp0BhzeebtgYAq5/z7KIV+OAaktDSlnyKzLoGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308060; c=relaxed/simple;
	bh=OGXCnE9nCoZgiUiALOPDoI00W8CWeJkq/s1gh5Wt1/0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rR2FRScdfp+NgtzIU5fFglDX6JkCDmM89HQo/wZGaEFTJPSjslWqh2YwTjY0qoKg13KTCpjvGQWESC9wlnNTfuByKEinN6sIZnBo6x9f/Mh5c5WkcW5zDnGENJwpHnK26pxC///x5L3l8Mj5qSglb7B0FnMzGA4GjqhtT3ZqLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=lOn3rEox; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="lOn3rEox"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+ZEOXIoiTLwFeJLiKBhS8coc14reJtM9fdG2r+PIjKc=; b=lOn3rEoxiWxRuDMprWLvLVFW7B
	mIjqkcLO9ftkNSHo+MHKsQ92XRroOogpqWYE3s+XzV9dGnl2Amc0yAuS+2149XIBkQExlj+11rSjF
	ZegbU9P7YIBSW9uol64No4bqBOEW+1iZpmwCh8R+TQi2+dgIP4j0BSn7DwVIcyiPacp2IbtM3/fcx
	/5VtTWrJx3qV133HxgBji8jSXYSzFXelhO6bgvJPKYXmO5VroUKsuU67cW6ZL/I/iQdfwlgy1mRMI
	eSGpflD7Dx12pa1LUHzDPUL0+2Yz9lN9Ev8KBTHlT6PRRcR+rV5R+ARBqbU81WTNS6T56jsX5XiEX
	5Keg1UXw==;
Received: from [68.234.117.163] (port=52658 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <n0nb@n0nb.us>)
	id 1wDCZA-00000001b7F-1lFo;
	Wed, 15 Apr 2026 21:34:51 -0500
Received: from nate by merlin.lan with local (Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1wDCZ9-0000000ABvp-0QEq;
	Wed, 15 Apr 2026 21:34:51 -0500
Date: Wed, 15 Apr 2026 21:34:51 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Linux Hams <linux-hams@vger.kernel.org>, Debian Hams <debian-hams@lists.debian.org>
Subject: Hamlib 4.7.1 released
Message-ID: <znr2vbix26xkiru7turlnpy2yrvdbssv5ctqjvamy7mw3atbyy@5bdcjqg3iroq>
Mail-Followup-To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Linux Hams <linux-hams@vger.kernel.org>, Debian Hams <debian-hams@lists.debian.org>
X-Operating-System: Linux 6.12.74+deb13+1-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cozekd5walgh7trq"
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


--cozekd5walgh7trq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Hamlib 4.7.1 released
MIME-Version: 1.0

The Hamlib Project is pleased to announce the release of Hamlib 4.7.1.

This release includes two new radio models, many fixes and improvements to
various radio models.

Here is a short changelog for this release:

Version 4.7.1
 * 2026-04-15
 * Fix unknown type compilation errors on Alpine Linux.  (TNX Bradfor Boyle)
 * Fix rig port timeout.  (TNX Matthias Moelller)
 * Update ReleaseNotes*.md.  (TNX George Baltz)
 * Fix various FTX-1 meter, level and CTCSS table.  (TNX KJ5HST)
 * Add power off capability to Flrig backend.  (TNX Philip Rose)
 * Replace strncpy with memcpy to quell GCC 16 warning.  (TNX George Baltz)
 * Add SWR to supported 'get levels' for K3/K4.  (TNX Tom Crayner (reporter=
))
 * Add get_split_vfo to TS-850 backend.  (TNX Elisamuel Resto)
 * New simplecat backend.  Supports Bunzee Labs DDX.  (TNX Dhiru Kholia)
 * Fix and generalize clock handling for Icom radios.  (TNX George Baltz)
 * Fix Yaesu attenuator levels and LVL_KEYSPD reinitialization.  (TNX Georg=
e Baltz)
 * Add new rig model Harris PRC-138.  (TNX Antonio Regazzoni)
 * Various FT-710 fixes, especially handling SH format and RX bandwidth.
   Ensure FT-710 simulator rejects RF command.  (TNX George Baltz)
 * Fix low power calculation for K3/K3S.  (N0NB)
 * Fix FTX-1 SH bandwidth command in set/get_mode.  (TNX Terrell Deppe)
 * Quell initializer overrides prior initialzation clang warning in ftx1.c
   and fix compiler warning in hd1780.c.  (TNX George Baltz)

Source archive and MS Windows binaries may be downloaded from:

https://github.com/Hamlib/Hamlib/releases/tag/4.7.1
https://sourceforge.net/projects/hamlib/files/hamlib/4.7.1/

73, Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--cozekd5walgh7trq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaeBKygAKCRD7LFEw1VqI
GaEbAJ9i3eZISu80fmNHuoxF1Off4cdriACggTay5D9pV43RJGT4hHEz6WC+jqc=
=4OMy
-----END PGP SIGNATURE-----

--cozekd5walgh7trq--
