Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2132F1FE4
	for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 02:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.109.42.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117026; cv=none; b=snXc8302Cqi7xObkCMYuKv8Htk0XH6xZo170vP7tcsnrLbcZUkOLXwfeWurXIlacmK7lA/udWoPUV6HTTktl8GiqeUH1zVTV3wr0D0A1D2+i5QPFqjQzM8+wdxT0ePjGsLKIS4MgcgYzuuIDVDjOQQbiWIu2fqdq78waT5vGVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117026; c=relaxed/simple;
	bh=9GXX/M6Of6E1vfnNXu9/Wu6+VeclAlu7FFC5rYPBzks=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ak8Agf0bXiUoXijr56zj6rNI7rMfj6XPhirT3UrBs4WF9kBv7asuA211yvgp3NoLqddAMYN/UWzqouvUWGQvYhI77lRz8CJ1ZoC9uzhr0pyn3u+lzlMK8Un/SY47Vz6dpkSWrLC4/rkmi0HxHro6w5whq5uXLlO9Y14qhfDXTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de; spf=pass smtp.mailfrom=osterried.de; arc=none smtp.client-ip=192.109.42.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=osterried.de
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de ([IPv6:2a0a:4580:1018:0:5054:ff:feb2:aa6a])
        by einhorn.in-berlin.de  with ESMTPS id 69G2Gugn2662215
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 04:16:56 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
	by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
	(envelope-from <thomas@osterried.de>)
	id 1xHXV9-000692-Tn; Fri, 16 Oct 2026 04:16:55 +0200
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [ax25-tools/ax25-apps] security and robustness fixes for the
 user-space AX.25 utilities
From: Thomas Osterried <thomas@osterried.de>
In-Reply-To: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
Date: Fri, 16 Oct 2026 04:16:45 +0200
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C19C830A-1408-4727-8303-2327AF08CE91@osterried.de>
References: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

fyi:

all patches #28-#33 from https://github.com/ve7fet/linuxax25/pulls are =
now added or ported to https://github.com/unix-ax25-stack .

Old repo at linux-ax25.in <http://linux-ax25.in/>-berlin.de: still =
working on it. Needs about 30 hours until finished.

vy 73,
	- Thomas  dl9sau

> Am 15.10.2026 um 19:27 schrieb Bernard Pidoux =
<bernard.f6bvp@gmail.com>:
>=20
> Hello,
>=20
> Over the past weeks I have been reviewing the user-space AX.25 =
utilities
> (libax25 / ax25-apps / ax25-tools, ve7fet tree) for robustness, and in =
the
> process found a number of memory-safety bugs. Several of them are =
reachable
> from a remote peer, or simply from any station on the air, without any
> authentication, so I think they are worth flagging here beyond the =
pull
> requests themselves.
>=20
> Each defect below was reproduced with an AddressSanitizer test harness =
that
> reuses the upstream parsing logic verbatim, in isolation, before being =
fixed;
> none of the fixes changes behaviour on well-formed traffic.
>=20
> Pull requests opened against ve7fet/linuxax25:
>=20
> #28 ax25ipd - unbounded address-field walk, detached DNS thread leak,
> SIGHUP handling, signal-safe main loop
> #30 ax25d - single-instance lock, signal-safe reload, safer argument
> and virtual-circuit handling
> #31 ax25apps - ax25mond, ax25rtd, call/yapp
> #32 ax25tools - axspawn, mheardd, axgetput
>=20
> The security-relevant items, by how exposed they are:
>=20
> * mheardd (unauthenticated, any station on the air)
> mheardd listens to all AX.25 traffic via PF_PACKET and copies the
> digipeater addresses of each frame into a fixed digis[AX25_MAX_DIGIS]
> array. The copy loop had no bound - it ran as long as the HDLC
> address-extension bit was clear - so a frame whose address field never
> sets that bit overruns the array and reads past the receive buffer.
> ASan: global-buffer-overflow. (The same unbounded-digipeater pattern
> exists in the listen/monitor decoders in ax25dump.c, which I am fixing
> separately.)
>=20
> * axspawn (runs as root, reachable by a connecting user)
> axspawn is started as root by ax25d and, after a "//COMP ON" =
handshake,
> decompresses the frames a peer sends. The decoder read the claimed =
length
> from the first byte as a signed char; where char is unsigned (ARM, =
i.e.
> the Raspberry Pi nodes a lot of us run) a first byte of 0xFF selected =
a
> "no compression" path that memcpy()s the peer-controlled frame length =
into
> a 260-byte stack buffer. ASan (built -funsigned-char to model ARM) =
shows a
> ~2 KiB stack overflow. As a side effect the same path was simply dead =
on
> signed-char platforms, so "no compression" never worked there.
>=20
> * call / yapp (reachable by the connected peer)
> The AutoBin / 7plus / YAPP receivers are driven by peer-supplied data =
and
> had several unbounded parses: a YAPP SOH header with four or more =
fields
> overran a 3-element pointer array; Send_HD() overran a 257-byte buffer =
with
> a long filename; the 7plus header parser read past its buffer; and an
> unterminated command line longer than the compare buffer overran a =
static
> buffer. All confirmed with ASan.
>=20
> * ax25mond (reachable over the network if a TCP socket is configured)
> The accept() loop wrote into the connection tables without checking =
the
> MAX_CONNECTS bound; the 51st simultaneous client overran them
> (global-buffer-overflow).
>=20
> * axgetput, ax25rtd, netromd - smaller length/strcpy/sprintf hardening =
along
> the same lines (details in the PRs).
>=20
> I would appreciate review, and of course correction if I got any of =
the
> protocol details wrong. I have been running the ax25ipd fix in service =
on a
> 32-bit Pi node without regression; the rest is not yet deployed.
>=20
> 73,
> Bernard, F6BVP


