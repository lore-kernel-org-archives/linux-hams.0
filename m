Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8965632A5
	for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085648; cv=pass; b=EB08IygayX4mGafqgPkUr08Ww2/dErzn5fD08Jk+uwGSVC3YG9PKTgMUq0YC/sRa6ubaTi/MhZBgFPlyFaWSNZEuj8uAbWG42uMHaRS/6GO09Tw36vcn/On/7C8pR62d9wJZFTidKfzJBZgQK81D7EZnxbUm9juoII1XHAFOeu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085648; c=relaxed/simple;
	bh=hgb/DydVm5Rx00wMLCs8yXgb8W+5ugoswduqnuvvWDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NFn+NsXjh2j1gw/BS9m5TjJOd8UDPZiI2W8CH+uNXcKq56Y6LgYnnQcVJv1Hh9e65lFBQo2k11+JbTgC1Eb15csdzLWov0Em9O8FxgsV5jWiml2OYUtsTwJRiAqaZxZagvWLXCPPfPPRLS/xM5X3Yo99TZe4QPaWpcfSGYWr1ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgVR8E4r; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgVR8E4r"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67921b515a7so5655700d50.2
        for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 10:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085638; cv=none;
        d=google.com; s=arc-20260327;
        b=rIYLDIPHDJueiRWZVVGmLqvC4Zp6BUwXcV+swTnT5hhlLyYoFO8no5Ft+fkER00YPe
         t7tJKdp4FvEf9sijosUXz6zn9K1X7tbZT87lhnKgXayVIv+UmZOmNS6008tBxe/PObQd
         8IGm/hiQRZCLtKEbpVHFUj3QAKw3z7O6utiNAIB1EBTepb6EqEsu7lO3F7WUmKxYrks4
         LEAzjs+U1VLM5a4ZsMYh6WTIQlyd+2zrSujSqi9GrudItkrcqqv8iSwINZKEPeMtuTvo
         M66goo5oaLV+/nP2PJZQWEcPD4eiW9X3u/eQVKybi28TLOeGRgN53B2oa5SmjcgHddxq
         5VtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgb/DydVm5Rx00wMLCs8yXgb8W+5ugoswduqnuvvWDQ=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=O+rjarHZRBBPt1sgkrz207TSbTcd9ROMCyVrJWKhpJfYibTc3NF6zrVKj8jexuk+p0
         +Ru3MB3pr3F0z6UvEX5wHvK8phk4r6TLI3lKJhr7emShG8h4tPj8vSDt5oNqfF/5k8ps
         mGN1KVRBv9v3wwsOhkUs7zCYlVeL7YgAViApUlo8IlGV6SrrDr+1poMsvDHFSXYWaEXY
         qnKyekwcvfN+HbB+J4qQxdbvANboGeXYib3wc1XLQnntsnT59vSqJVn6jyqic6inoG2J
         e/XtdJOd9Cu2+78F5f9hb+g6YuUAbTqBBgJ76hGmOyc73sF6Ynx259/Vv2Nu76QyLiXn
         tjQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085638; x=1792690438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgb/DydVm5Rx00wMLCs8yXgb8W+5ugoswduqnuvvWDQ=;
        b=SgVR8E4rjaVw9Nw1AKAjMCioibQj2WDMVjEgsdF8so4YhIY/Qy9Z/4l9vWm1Z56r+7
         NM23DgUFYxf0HjjAtmCXol0NDQzQMxbmb0sXoFfnZWQnXBUGElRSqsKLMfr0zpiPzNTD
         wEZXJTaFTG1WqzLUPD7O5Wx8cv0+ktQx3epohIuAMI/A1bQo+d2h8vGt8EyIYFE9GaSD
         MZCBLvXy3kr1rWf2Y2uicD3Sk2zMD25SCP96oiZbEU8SrkMWOxQX9f5FM05MMzy5bRf4
         wuqTpCM+NK+Z9RIGqBCCXbCqvyaNuHCZdWvWknRa+m9Ccbi10DjaxSAYa3PMv8oJ4/35
         /j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085638; x=1792690438;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgb/DydVm5Rx00wMLCs8yXgb8W+5ugoswduqnuvvWDQ=;
        b=KFIF5285JION+Y23aGgaWp4de0/4Tieyr9hbv3/Rmty8gyw0/gZsRHyM8TQGCoeS+5
         DScfRLrqNOoKeMu7Of6VbqTEgc2Fcdg0wr19agxgd2zoF8PNGVfijspKu/jxeeSr4d1R
         zZTsntrM66ohdSquPWxV2wWKK+EWM80uG9A0NcWDcjyxauiOQQ/bGWjlv0m8miw6oDey
         Or9aVwj4a46bPYnnluOMf8yS+Z3oUu2g5SHxecq2NpPDBjtYR4h+VvO4hqLp161DK0Tn
         85dDbA3y0gkorDaYEUeE6T6Ddx58OezdDBApeCCAQZpbW3bE69F69NsWz/Agn15nPzRc
         DO6A==
X-Gm-Message-State: AFq9FYJSWU9QafZEy0zYo28dkTlgdlw6IcC+ZEzInMT/bRWDEVa1qKBy
	B5B0aDnmvUs1q1a7ZmU9MQrFVEnXsWKI2TPAgNCNeIa9eAbgcYCrhFtPHyhoJ7wlNxbthwIWN00
	v3UhFu+5JacXo7lYGw7nDKoLnXzboa3O3Kh/6
X-Gm-Gg: AYBFou3XLboWiEi4z7a3ejwmPSir6RnMCFpNCSOVQo12xIxgGKGfnNLM4bqNr92YG6L
	8MJrSd7cbBDYbEewbVsWNyol5poA8MvEsuR6OQ7JbxBu3cYXZ343moKj1+w0GOD6KJUUeckOND/
	xNkqN3qbVwxUFaMEnFgyFpsd0Nv9fcyCaU/4fIPYzjkHpMXirVz6i0VzwavvS3AAMgR/DpXcphT
	dUstPY1GCQYzbVUTY2j67fGcn3puAk6kLiC3mHG8OGZZcTzt21GCRxv7UkSJrSUSTcIsiGTswow
	9933z9UQ7A73J7cukoCcHcNb17FMiv/gkbgGGasD8zPH/B1U5WjYxn8=
X-Received: by 2002:a05:690e:806:20b0:673:2e60:9eee with SMTP id
 956f58d0204a3-6793629ee49mr4624484d50.63.1792085638098; Thu, 15 Oct 2026
 10:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
In-Reply-To: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Thu, 15 Oct 2026 19:33:46 +0200
X-Gm-Features: AclHuK8cg1Me59u0JLPHx9uD5tiK4WdcWE3F_JC61SlWpcfSkKtiA-5wzQua9vM
Message-ID: <CAFAa3YAuAUutR-h-gMFCOOSFMJqf30R_p=Kv_BaMWQGpkbBdwA@mail.gmail.com>
Subject: Re: [ax25-tools/ax25-apps] security and robustness fixes for the
 user-space AX.25 utilities
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Two updates to my message above, which was written this morning and
reached the list only now:

* listen: the unbounded digipeater walk in ax25dump.c is now fixed in
pull request #33 against ve7fet/linuxax25. A second commit in the
same PR hardens the other listen decoders along the same lines.
Random-input testing under AddressSanitizer and UBSan (about 26
million inputs) showed no error.

* Deployment: the fixes from #30 (ax25d, since 14 October) and from
#31, #32 and #33 (since today) are now installed on the eight nodes
of our network: Debian 11, 12 and 13, Raspberry Pi OS and Ubuntu, on
x86_64, i386, armhf and arm64. Each was built on the node itself. It
is too early for a verdict on the most recent ones; I will report
back after a reasonable period in service.

73,
Bernard, F6BVP


Le jeu. 15 oct. 2026 =C3=A0 19:27, Bernard Pidoux <bernard.f6bvp@gmail.com>=
 a =C3=A9crit :
>
> Hello,
>
> Over the past weeks I have been reviewing the user-space AX.25 utilities
> (libax25 / ax25-apps / ax25-tools, ve7fet tree) for robustness, and in th=
e
> process found a number of memory-safety bugs. Several of them are reachab=
le
> from a remote peer, or simply from any station on the air, without any
> authentication, so I think they are worth flagging here beyond the pull
> requests themselves.
>
> Each defect below was reproduced with an AddressSanitizer test harness th=
at
> reuses the upstream parsing logic verbatim, in isolation, before being fi=
xed;
> none of the fixes changes behaviour on well-formed traffic.
>
> Pull requests opened against ve7fet/linuxax25:
>
> #28 ax25ipd - unbounded address-field walk, detached DNS thread leak,
> SIGHUP handling, signal-safe main loop
> #30 ax25d - single-instance lock, signal-safe reload, safer argument
> and virtual-circuit handling
> #31 ax25apps - ax25mond, ax25rtd, call/yapp
> #32 ax25tools - axspawn, mheardd, axgetput
>
> The security-relevant items, by how exposed they are:
>
> * mheardd (unauthenticated, any station on the air)
> mheardd listens to all AX.25 traffic via PF_PACKET and copies the
> digipeater addresses of each frame into a fixed digis[AX25_MAX_DIGIS]
> array. The copy loop had no bound - it ran as long as the HDLC
> address-extension bit was clear - so a frame whose address field never
> sets that bit overruns the array and reads past the receive buffer.
> ASan: global-buffer-overflow. (The same unbounded-digipeater pattern
> exists in the listen/monitor decoders in ax25dump.c, which I am fixing
> separately.)
>
> * axspawn (runs as root, reachable by a connecting user)
> axspawn is started as root by ax25d and, after a "//COMP ON" handshake,
> decompresses the frames a peer sends. The decoder read the claimed length
> from the first byte as a signed char; where char is unsigned (ARM, i.e.
> the Raspberry Pi nodes a lot of us run) a first byte of 0xFF selected a
> "no compression" path that memcpy()s the peer-controlled frame length int=
o
> a 260-byte stack buffer. ASan (built -funsigned-char to model ARM) shows =
a
> ~2 KiB stack overflow. As a side effect the same path was simply dead on
> signed-char platforms, so "no compression" never worked there.
>
> * call / yapp (reachable by the connected peer)
> The AutoBin / 7plus / YAPP receivers are driven by peer-supplied data and
> had several unbounded parses: a YAPP SOH header with four or more fields
> overran a 3-element pointer array; Send_HD() overran a 257-byte buffer wi=
th
> a long filename; the 7plus header parser read past its buffer; and an
> unterminated command line longer than the compare buffer overran a static
> buffer. All confirmed with ASan.
>
> * ax25mond (reachable over the network if a TCP socket is configured)
> The accept() loop wrote into the connection tables without checking the
> MAX_CONNECTS bound; the 51st simultaneous client overran them
> (global-buffer-overflow).
>
> * axgetput, ax25rtd, netromd - smaller length/strcpy/sprintf hardening al=
ong
> the same lines (details in the PRs).
>
> I would appreciate review, and of course correction if I got any of the
> protocol details wrong. I have been running the ax25ipd fix in service on=
 a
> 32-bit Pi node without regression; the rest is not yet deployed.
>
> 73,
> Bernard, F6BVP
