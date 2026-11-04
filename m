Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793793865;
	b=m6sZmElBOoBu67U0xxcDvLeN4pwXOxdpbdVSnE11RNiazHXAMJLcBzF3B5y2c30UEG/w
	 o9UT5Xk0+HrAJQHQluBFGinnkX5HmvrbXzStrhZzhhBEwgyH7HurAaT08d5FGfxeJG3N7
	 PZ9HItcOlGrOny9YtSwAskv/hEUzAN8KloTz30aX0AidJSPweTZbPJbIRCXhledV14cyk
	 YEVe1pLMFSM9/iXsbSrGzC/dttg5XuquxXQi6Zja/eFVnCuyu+bVOOxddtpozmT+UYGIX
	 OHJKsivuG15srcc7O9cI/4tzs++rIbll6BaeTREu2zmc1TY1H0NT/VHuJFR633PiiXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=FxAdptYEjzoKg/hpYAM0U9RPCFyPbeDNqAQMkpW9HZg=;
	b=hUciCQ8P/J7/hYfYd4uElyJzIaQB3nqf0IsA4n7aoUFX8ZOn7xMZnfsqZ7dAdU9yj5tx
	 4AdD7DWvebrL/3lKlBAQM6Dkxi3y77+N5yRyw5y1LzHzGOrvFgrvK2YyWIderTDD4UFjn
	 EqTnTFdUjhRH+s2GcyJRqin/EfGx5ajLMZVVtT6KiZaEkV7suksrIPhxlqMnZ1UCBVhhw
	 Ycszd5RpF17MmKUZzWSR8HN+YGO9Lb7rGfH4hbWSgKBvhZjMGqqgYwmvxrCPnY+SHf6Mc
	 KGbuEuNg58ITrCgnNa7Es5A9/G3zkA3MTs9rb0o4GfusA3g9O93YtbB/bukg5eE06mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnEw4Gwo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB7606A328
	for <linux-hams@vger.kernel.org>; Wed,  4 Nov 2026 12:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DB7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnEw4Gwo
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67990a45e02so638834d50.3
        for <linux-hams@vger.kernel.org>; Wed, 04 Nov 2026 04:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793793864; cv=none;
        d=google.com; s=arc-20260327;
        b=qrTM0ytB5j5Jmhtt5YTXl8JexGBJprsRVheYLVnDmdpuJFLgeI0/cJ19LRTA6plzMc
         ZLysj0j4NvYWiyhJjy/qetOH0NzQqSMEU4iX1HSrfs6x1c9L+OoVOT6FUUodQCcrrxCr
         g4p6QO4iRsnWZpZKbY5dJ58zyTFoPaCsZdugoNSQDtrJ/tgsePTMp0Py6tS6hvP0kSan
         f1savdEqqek6MLOVo+z2bkPsIvA8ZbV2lNGht/xarhUEwZ7lQppckjF0NkWeLbvNRZ73
         wHVmp47VKhtGRX66NkZtwZlG/1yCf+qwnfuoldL6XhPpdmYI05xI6I32bAiJlYuzWwIu
         WNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FxAdptYEjzoKg/hpYAM0U9RPCFyPbeDNqAQMkpW9HZg=;
        fh=/5cu/q82zoIJBVUIQJBeUgDcZ3wscItBEMV850ZQz6E=;
        b=anH70AhhNUPcWjqDX++us+Qi8hrRBb2caeTM7GuvDDpRieyPcHNrY4IyrBoAzyTRIx
         bbDXVURevcmj2xt/0B1ixC4CZOkGNzV0GicaKZHG+Uni/4CClkHv67Z7YsqfgCJzooVX
         sSd7uw93Wy/GPS/shK2x7Hf0y/Tc+nKqwEn/b0v3jT5z60GYxpe3W54FFqf1nOleM62Q
         zI/LpvQJsKdwkKyEa4uAOwSemRdR6vEaf9daYMZnrDt7YwnaUSrNPT1/+EnvOvXEWuSN
         EgqInror1oWjDJh7I0utqZbTkp4yTxTJVfEDHvrXubROOlTsV1N9FHTC4Koj1t0B8I+t
         0bNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793793864; x=1794398664; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxAdptYEjzoKg/hpYAM0U9RPCFyPbeDNqAQMkpW9HZg=;
        b=hnEw4GwoDxfDN0RjUCDhHCpOHpNNW6Ar+RxguRgQiqOz7L01bzjMr2oFNK6Go4YAE2
         DQiNRc17OxjNdDCEL+aIPH+jlPnWriMP4qlvxQ+sDsdR6INEWATzQk2yZ73C42JH0xpe
         OXymYaNK6A2xUlpj8cuSJw6MpAJBRMBTbwKZFkW7PmdKgOYpz1NpOri/OhzcwHwW+JbD
         WG/UhWkU7uNwpFmX0iptFuYmbz+CqHNcfZ0Rl5E34vrkn4tBmjmvYEsritqfhGVtL5rO
         UteCw3nU8Tz8WjWs/BdB80kZ0cg3ncMdvDefuPZ/ZJ4gzNOKOVDMNmrLwaxdeHkABRVI
         cpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793864; x=1794398664;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FxAdptYEjzoKg/hpYAM0U9RPCFyPbeDNqAQMkpW9HZg=;
        b=CibB+X2lrH+6igNykXTVcQ20Z0qbTJYi7HDUpmsWSBnktMQd7xHojGmCHUcqgR+BR3
         kdG0yHR24uArhOxXRAjcPIH/x/ID91MXif8UHfWvSl+hW07lxuEpX2vAsQBWEA3DemHx
         2RDblbu1iA4QvfXi5KRrSn3FgAKSKtJOd948f5aHMrc2EM0w7veZgVRfG6Ux0Ds7EROQ
         OsFvUs0zBPgmMAT2n1+FTfmgV3Tfi0+4ds87c6TdrtTTK1oDvde4AHrEBQjKlYJ8ahsl
         SjMkS526/CDxulXN907toJGhQ/msXjJHGjFNBp8gHSPCAKUHiVFRoW4wkqIyw0wBqjT4
         1FOQ==
X-Gm-Message-State: APuU4Z84Olxsst8v7CfNB4RaXBaM7JSjGOy8kspsX3wSqJmlpTLHEXme
	znvaBiUe9TM/EFfGtVDY7K2FVxRSmNSjKpJK6pT9IGohI29/rxKD95si1OHwdBv8+J114YrzQKu
	wqg7zNzy9ZLYQ8NX3UhKuH5C1I5O27jGFtQ==
X-Gm-Gg: AYBFou3u+bebgZpGPsN25GsQtHjeCWyCgqAuljiGpLrYMJuurq9krT26GkPE0GpSSI7
	Uadc3/xUWdIWSbhsV6bu6+yFZE5+Fp5ssM1rP7Y8IAAtKAqjFNUfxZADe0Nv4hnzZc+aw+yp99T
	kVcg+5Z/AKw4LOrXeiZsi1NhfLL+m9xMsN5UGgRv/zuq9OTTgirzIN3HL4yG/GVk5y1oHgxNj+U
	NRD2vdjj83Oej46zxO6WtIK0FFtuFRtHTMhWQIQ8yMzGmDm96KwfxW6I+ugniG4HPzv7S11X440
	Gas1w9zSdbCv/wE+NpMDnuDSeg5NjA/UKfU/CzFGtW3EYH580lbalyY6oT9EMifPs6OX+eGuQ5S
	Ea36EHu5SwhBSekTzgSoNS29iiIo79iWf8LlY
X-Received: by 2002:a05:690e:14c3:b0:679:9d3b:7f54 with SMTP id
 956f58d0204a3-67ba4edd3f2mr11328966d50.25.1793793864209; Wed, 04 Nov 2026
 04:04:24 -0800 (PST)
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
Date: Wed, 4 Nov 2026 13:04:13 +0100
X-Gm-Features: AclHuK8vtNUz6D82DOs0NXtJh5dVSvJZ90rHAcRgs_zJWh6SuZLSTr85C-o1W64
Message-ID: <CAFAa3YDaoMxu9-ZOhdCV8VjURe5h0usMgyW+VqXMF-DO2oEWWQ@mail.gmail.com>
Subject: [ax25-tools] NET/ROM tools: eleven fixes in netromd, nrsdrv, nrparms,
 nodesave (ve7fet PRs 34 to 38)
To: linux-hams@vger.kernel.org
Cc: Thomas Osterried <thomas@osterried.de>
Content-Type: text/plain; charset="UTF-8"

Hello,

I have read the NET/ROM tools of ax25-tools (netromd, nodesave,
nrparms, nrattach, nrsdrv) and the NET/ROM parts of libax25.
I found eleven defects and opened five pull requests on
ve7fet/linuxax25 on GitHub, numbers 34 to 38.
They are independent of each other and merge in any order.

The two that matter most for node operators:

1. netromd drops the rest of a NODES broadcast after one bad entry (PR 34).
When netromd refused one entry, it discarded every entry after it in
the same frame.
This happens on real networks in two ways.
A node with several NET/ROM callsigns receives an entry for one of its
secondary callsigns: netromd only knows the first callsign of nrports,
so the route reaches the kernel, which refuses it with EINVAL.
Or an alias contains a character that netromd does not accept, such as
"$RSACH" sent by a BPQ node.
On our network, one node never learned two nodes because of this, and
some nodes logged thousands of refusals per week.
If your log shows "netromr: SIOCADDRT: Invalid argument", your node is affected.

2. netromd crashes on a long line of /proc/net/nr_neigh (PR 37).
With a neighbour that has about five digipeaters or more, its line no
longer fits in the 90-byte buffer.
netromd then crashes at the first NODES broadcast received from a
neighbour that is not locked.
PR 37 also rejects a broadcast too short to hold an alias, which gave
an alias taken from an earlier frame.

The others:

- PR 35: netromd stops hearing a port, silently, when its device is
created again, for instance when kissattach is restarted on its own.
- PR 36: nrsdrv overflows its escape buffers with a frame full of
bytes to escape.
A station on the air can trigger it.
- PR 38: smaller fixes in the reading of nrbroadcast and in the
broadcast of our own ports (netromd), in nrparms, nodesave, nrattach
and libax25.

Each PR describes the defect and gives the results of a test bench
under AddressSanitizer, before and after the fix.
The first fix runs on one of our nodes from tonight.

Reviews and testers are welcome.

73 de Bernard, F6BVP
