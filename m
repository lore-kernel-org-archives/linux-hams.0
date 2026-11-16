Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826105;
	b=cnTrNkQAs1J/X/7Mq0ZkrroRcszWzp/AOY0aDP48qwliZBAbot4wnPpHHXcJ+EsisHej
	 ZkY8CaC5PpVRChq8hJMQx5w3vVwFMsgY3Uq7sDiKcZHzIMg/znOYVj81qcoV1Ni271c4t
	 b1evZRKQYPzMK0I2eobY2SrnLf5B4kG99gisgwAejsRcNIElcWerWnpADRfAwp46pZotr
	 HqCnG6k/eZ+djJSF7we1g25ZBMHcG9psPwBUPLZjGVlY88upxrahOp6o0NvS9LBdrfqoa
	 YJovrud2WpHoZH34alZPdXapk6pVxKHbu/xQ08zmMMfHWppu/2aYDM2v0nLymr8LkYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=WiKYEK8JrCKnqKngovHpCty9K5IXhcoX7HEK6YsvBNE=;
	b=1hlm+7EntXPqZp+gG/1kB7cZYpMUIE9pggMu+7pDOY7Co/CMeEt2Tpl9eLPIrgXM7wkd
	 t0s9VxJ+d+65aJMxye7aR1Gtr3zFNmSPSl+wCQIKu0pwtM54jL0gk/8UbTQCXRNSpfsVX
	 0DsNJbWdKkM8tngC80J+c4b3YvAGU2X9gOhHocuG9qMQdsVfKGCVtOdQCoOlUR8TDsdcP
	 +FviWlFiBjaE6vBiXGy0VpUZ64QZ0I/SpLB9H1XX2/qpBgCFaMh89CPuykBuuXRPgI4UY
	 NnFkb82CxcEWSOmzYSCo+erD1bUkQtebJ3tGM372mu8IpGhZuqj1WVr88Xc/QJojopw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEw7XD4T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB6606A31C
	for <linux-hams@vger.kernel.org>; Mon, 16 Nov 2026 10:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FB6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEw7XD4T
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b30cbfa628so25346877b3.0
        for <linux-hams@vger.kernel.org>; Mon, 16 Nov 2026 02:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794826104; cv=none;
        d=google.com; s=arc-20260327;
        b=QTrsV1xGm191YaKFW64y5m03P1EDyNKXZ3ZBHNMmprX0QG5oNn5e/OuLOcQD0ZZZRo
         Lbm745MiCGbAfagLUb7XSmrH18X+wOwlrbKLs62xbjRXa81n+uONvXRy6DWMsRLK4F9M
         HXU6LYoqH7bmao8F9nrZZT6ql7gg6HEXLFAUzfA6cVoaNXknV+dd6sZ1/0ikVDZnGA1t
         bxKPHv4vh34whzCuTXBa645QKN/18rsg9Ti8/vPZZpCOMW5iOcKeFbdd2cLRO8yLgEJV
         Xf0cou3GkAnX+WYVC9t7iKpoAwoinElnQ1N7OxmX86Ys2wDzNs3AbC4JRSxinVi+OByA
         GMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WiKYEK8JrCKnqKngovHpCty9K5IXhcoX7HEK6YsvBNE=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=hBnhafdvfX22lwD2hELl5cPtlrZ4Bkc3rneevepAzpU1/n8Ev9M0YLV1r2fvhPL3Vd
         sWiocJrcmfSOICKqaAWP6qxomXZkMvm1aWrzCKnCykMM6R545xmTb/1nOW6yT2jeI+vJ
         rs4L+iN9J1udqcg1rrNIAmS1eR9kXiHrJS/8yEuaV+JCPWxojYhk/duq/WZ9YHh6TSGP
         CL/mrTW39i2uNhmRF169iv0NArdCFmQu3GdrELxud1Fny7QCeJ1KtklmIolCfwiJoh/S
         /xFOIGwqBwLjlJ0XHLWFoOoob9E0M1v+om2O7NeJ1OO6WOLt7NtnmnU7/7qSYH0cCq9A
         Cs+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826104; x=1795430904; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WiKYEK8JrCKnqKngovHpCty9K5IXhcoX7HEK6YsvBNE=;
        b=WEw7XD4TNvnRQ90MEcQfby6YTmYxoYcOqj2TawTqwHYmpudWJ1115a79ahn76ricCh
         OVjdmVugSjD/77MZ3PIhqv7EjsyyY0ncvCLNo1J6qC86k1zj8adYWKDfadVR7lRhRBze
         xkEv92DW26dG9Cm94/hPFzV4Ejnap74KAQOpLAiErfb4DMEt5Ij3NUVqlMDZyMu06hj8
         GQ84yXLKR1o8L5Jg7JB6gjMCyW2UwC5xo5sTkLj4LSnOJhN5LEC0xrid8ftyK6kZPYQf
         al7eZh86R1ctBDI0urb1kRRcLmdM6vo7AjpDUoNU1+pzHs2DBCL1KcbKk6WnelwMJxnM
         aMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826104; x=1795430904;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiKYEK8JrCKnqKngovHpCty9K5IXhcoX7HEK6YsvBNE=;
        b=wMqTYYChI+9vL18vyfXitBb/wHacWiJdDPjpp3kpX6cuLYYHMP/hw1t7eauPe36crH
         U3S4N/x1WNMxa0ZX7Yl1QBm5oyNFZNqSNxznBT3LpL+kE1iq3y2tBZiFaCCImd/13pNt
         LKzFbPM6+5AJ5JrTNZOdnexBGMFA6DhySjLP3tBP1itHZLg7s8S1BZR4zXaxujnGduxE
         s7JtYK4CPdSY0juL/qBAolmFfIAojxboAS/Kmob6iTcDAwxk0YFulwP/iGLJ9iGiA1rU
         eGtj55adCaAEWAnVQHTot3iIE0flwtoPjPAkab65eXINyU1+zX0W+8ESGvzQ2YknBCXL
         ncrQ==
X-Gm-Message-State: APuU4Z9kL4nE1EBnTyGnlwB8XUXK1pDtoNWnutjbvK52wf1tkPS2WDmO
	faiw4O9DgwpOr7YPHtWmZk56+AtTvxew9ZuPsmh1p+xgPbi4iv+Rvs1URzLmhnbqu1qexd9k2mh
	DUUx3tvPMRa4fVzGc2Ng5Qg3jciV3NVvKAg==
X-Gm-Gg: AZFdTZfgUHGgpP1K/HSZNnoYW1HQK/EeOrMt3IYDpMNyGrrAL7fxyOytbycOnwJkYU2
	7TSL+5Vv4Q/eBxmKyaWWpfsYuQmMZwo3dvYcyvoB2O/g/6fGF5u7PPwlU2SgraXMMrmkSAVM0kN
	7/W6W8W+32PZsIoTV7Wzelx+d6+Ze8USQ4cw2JhtZwjI3lvjiNCnR+5evttNvJ9XRVA/FLZ+nAK
	/QWLdQtdBr8OuwBfesGxpUIEOLcUuywoZcdME90mFqHq+eZ4gjiG4Ro7j02ROMimPXmfItg/cBE
	P96GMfgMMo3g/lYGNz8UTkZJUXanZaRMCG8T1A+T/O+4L6eo6mabc7VpUUflCJJpxZby1T35yH7
	j0uqbxe7rbd2BdQ+2fYk5J1c4Nob6TFu/jC5Q
X-Received: by 2002:a05:690c:c0cd:10b0:8b3:35d2:c49e with SMTP id
 00721157ae682-8b4aa334701mr42689377b3.68.1794826104255; Mon, 16 Nov 2026
 02:48:24 -0800 (PST)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 16 Nov 2026 11:48:13 +0100
X-Gm-Features: Aa3M54rTKwDoGhdfIeUpq1KbRB2veGIgZzQLwlQypWWW-52R58ne35kX-p6B5a4
Message-ID: <CAFAa3YDxkM3BH74p37bjWm2p3faHkARvh3KS=ZsRCuDxo4Guqg@mail.gmail.com>
Subject: [mod-orphan] three bpqether fixes up for review (PR 87-89), testers wanted
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

Three bpqether fixes are up for review on GitHub, in
linux-netdev/mod-orphan, pull requests 87 to 89:

87 reserve the Ethernet device's own header room on transmit
(a UI frame with 8 digipeaters sent over a VLAN device without
hardware tag insertion and with reorder_hdr off ran out of
headroom and crashed the kernel with skb_under_panic; any local
user can open such a socket with the default ax25_uid_policy)
88 set both addresses or none in SIOCSBPQETHADDR
(when the ioctl failed half way, the destination was already
changed and the accepted address zeroed: the port silently stopped
receiving although the ioctl reported an error)
89 keep a bpq device in step with its Ethernet device
(a bpq port could be brought up while its card was down, and
stayed down after the card came back; it now refuses with ENETDOWN
and comes back up by itself, unless it was closed by hand)

87 and 88 fix defects present since the first git import. 89
changes behaviour, so it has no Fixes tag: please say on the pull
request if you would rather keep the current behaviour.

The crash fixed by 87 was first reported privately to the kernel
security team on 13 November; the answer was that the driver is
no longer in the kernel tree, so it is handled in public.

Each one applies on its own on the current main branch, and the
three merge together without conflict. They were tested in a QEMU
guest (6.12, KASAN) with bpq devices on plain Ethernet and on
VLANs: before, the crash and the deaf port were reproduced; after,
no kernel report.

None of the nodes of our network uses bpqether, so this is bench
testing only. Reports from anyone running bpqether, for instance
with BPQ32 or LinBPQ over Ethernet, are welcome, either on the
pull requests or here.

In other news, the 41 fixes queued by Sasha Levin on 9 November
are in 6.12.118-rc1 and 6.18.64-rc1, whose review closed on
15 November.

73 de Bernard, F6BVP
