Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A36E1E1DE9
	for <linux-hams@vger.kernel.org>; Mon, 16 Feb 2026 03:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771214228; cv=none; b=Hr1mqDscdoeyDH/7MXbCGKyA8Nn8hK9M5hUmWpRTfYfbgRBXCu9ScfaHGdmfHFVVa1T1R60uYJ1AFB3mBegLMaSaXCkIi6LHmAl30s58pTfCk37le7otGg8OMMHv16F37sshMoNyFkKmpGXKOMOwZmW7NKRmDcWiFtNnJgu/QkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771214228; c=relaxed/simple;
	bh=19eWW3In5/kv3syNB2r5r957DaHHWHTCeY27Q55ObuM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lA9kh03dikMJohuuBf8bpeqoU1ALF0BSarPMDlmtAsI/Cb3gpsA3z1qZfb0zp4xtzKZzuXBsoYdLB9awbd7oqXl+TQye8qtOwwqz63LMrKwVt3b95F1F0z+HWfoM8mfWhjiWAYXbBhXRYQHFTLhnFXa/sana4HwMUfhi7u+APBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=eoD15Z4J; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="eoD15Z4J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xJDLeo/Qtv3N3qGnh9Rz5kGkD2jbOyJVMg6s6d92b2w=; b=eoD15Z4Js6WphmMwfD3Fkr2j04
	U3SKhqNDFbb+kf36pH66plaXd8zjxbbjKilSWBEADQa9hLwRNDpTlaubVMzqmpW5vTJDuSK2Hq3ze
	/cqyJuD9TYTxDmWYcyVGZEI+PkcZ4jaq2ElWdL4PvUwwl2LR9ftWRJnu8yCr8pmMsf9/T2NiTRQ6L
	/bjEVEMJmSTM7xOS3EqBAOY6W3V1ZXVOw2l59D8k3q2PJhGwOOZo4s6eZd2C9GB3/o3SG39g4AnoH
	CmE1HKcT0eCH9hOLe4XRHTYqh54opBKoP0XECVUnqkqmvR3gIDdjlp9jW8GZpU4HmZOgyLb0ixpI2
	T60ckffg==;
Received: from [68.234.117.130] (port=57488 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <n0nb@n0nb.us>)
	id 1vrpTH-00000002sQR-31pp;
	Sun, 15 Feb 2026 21:40:27 -0600
Received: from nate by merlin.lan with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1vrpTH-005vqh-0M;
	Sun, 15 Feb 2026 21:40:27 -0600
Date: Sun, 15 Feb 2026 21:40:27 -0600
From: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>
Subject: Hamlib 4.7.0 released
Message-ID: <rv4w6l27edbwjmdw54mo5p37zfrqul7pfivh6qjpx2mxtkuchk@b3lciyhi763b>
Mail-Followup-To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 6.1.0-43-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6pva3yqpfg3po6f6"
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


--6pva3yqpfg3po6f6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Hamlib 4.7.0 released
MIME-Version: 1.0

On behalf of all contributors and testers to the Hamlib project I am
pleased to announce the release of Hamlib 4.7.0.  This release includes
the following changes:

Version 4.7.0
        * 2026-02-15
        * Revamp Kenwood voice memory handler - Fixes TS-890S & TS-990S (n3=
gb)
        * libusb is now detected using the pkg-config facility.
        * Some internal functions change names to avoid conflicts with apps.
        * POSIX threads are required to build and run Hamlib. Note that it =
was
          actually the case for 4.6.x, but now the configuration step will
          fail instead of the compilation. (n3gb)
        * Functions rig_get_conf, rot_get_conf, amp_get_conf deprecated;
          use *_get_conf2() instead. Also rig_set_trn and rig_get_trn depre=
cated.
        * Reduce/repair excess output from cppcheck.sh - mostly cosmetic ch=
anges (WIP)
          Output from `wc -l cppcheck.log` - 4.6.2: 981  now: 581
        * Remove dead getopt code.  GitHub PR #1709. (TNX Daniele Forsi)
        * Move rig_cache to separate(calloc) storage. Prepare for other mov=
es.
          Issue #1420
        * Many fixes for SWIG binding generation and improved Python support
          and testing.  (TNX Daniele Forsi).
        * Fix AGC for IC-R75, fix AGC for all Icom rigs.  (TNX Mark Fine).
        * Separate PMR-171 and Q900 into new the GUOHETEC backend, add
          additional support add clean up code.  (TNX FVsonar).
        * New Drake R8 backend.  (TNX Mark Fine)
        * New AF6SA WRC rotator backend.  (TNX Michael Morgan)
        * New Yaesu FTX-1 model support (alpha).  (TNX Jeremy Miller).
        * Update QRPLabs QMX backend for max serial rate of 230400 bps.  (T=
NX Mooneer Salem)
        * Updates to Icom IC-F8101.  (TNX Mitchell Winkle and George Baltz)
        * New rig model Icom ID-52A/W Plus.  (TNX Martin Andrich)
        * Fix memory leaks in rigctld and rigctltcp.  (TNX Geroge Baltz)
        * Fix Skywatcher backend for firmware that doesn't echo commands.  =
(TNX Daniel Forsi)
        * Various manual page updates.  (TNX Daniel Forsi)
        * Additional Yaesu FTX-1 capabilities.  (TNX KJ5HST)
        * Refactor repeater offset and ANTIVOX with lookup tables in newcat=
=2Ec (TNX KJ5HST)
        * Fix unbounded string usage in tests/*ctl_parse.c. May cause crash=
es or worse.
          Reported by Vlatko Kosturjak with Marlink Cyber.  (TNX George Bal=
tz for the fix)
        * Add extended commands for the IC-7300MK2--closes GitHub #1985.  (=
TNX George Baltz)
        * Revert updating FLRig model name.  (TNX Peter Sumner & Philip Ros=
e)
        * Add manual pages for rigctltcp, rigtestlibusb, rigtestmcast, and =
rigtestmcastrx.
          Pause building rigfreqwalk as the code does not align with the re=
quired
          commandline parameters.

The source tarball and binary releases for both 32 and 64 bit MS Windows
systems can be found at:

https://github.com/Hamlib/Hamlib/releases/tag/4.7.0
https://sourceforge.net/projects/hamlib/files/hamlib/4.7.0/

As many changes are planned for Hamlib in the future leading to 5.0.0
(no planned release date at this time), the 4.7.x series is planned to
be a sort of long term support release and will receive updates in the
form of new models and backends as they are developed.  If all goes well
such updates will be in parallel with 5.0.0 development.

This will place a burden on contributors who are asked to submit such
code to both the master and Hamlib-4.7 branches.  Hopefully this period
will not last overly long and development can concentrate solely on the
Hamlib 5 series at some point in the future.

On behalf of the Hamlib project,

73, Nate, N0NB

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--6pva3yqpfg3po6f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaZKRqgAKCRD7LFEw1VqI
GcnYAJwKOmvvtkmKCgqf+DDmlXtXDwgjbgCeIL98pug6fsDJ5F2oL/gKWn9DlII=
=O2y2
-----END PGP SIGNATURE-----

--6pva3yqpfg3po6f6--
