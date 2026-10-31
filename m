Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793444734;
	b=T+XI6d9kEb37XE2IxnSi59ddlpthLmvkl/MHksX1JI7A5AvMujPXWp/Ry1MrD1CsC3ua
	 6xqD6nezLHosCizVFiaYjev0W3xKtOE+LoLo0tUTlcMkpnvPnSrIZsECGCT4J/nq49U5m
	 VNlklT8d9uzupFc43CjGZvOK62gxDO5cKyLHLarVhmsmeWNSjdOCtDRCxo5MW81LVwRJc
	 KQBbik3/T1fp4GIRuNUNJ0kIaK+O0G9kzWhalB/Y6ehDdPhY+PdLpCG3yKgUbEJykwbe/
	 GLrrU+EcXQnCu78kaQ4ZSHzRuUkZ05iQXMF0M2ndMGv/Uy3kUPNYKw6ZqtBuJDLF+mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=408dL54i5bVGxSp+B6Je3bwDOKxmbOxNhW7wT5RMZo0=;
	b=ljZ/rWfGzRaLXoFJ8mFYwygIjAV0txUoW2gqyzJDLyz2pO/goj4+uXcQbesYOisfYqiW
	 /eigrb97+C32jqKVkb+JvSf2VnodNGD0ngMgzPmu5K3rllzz7mxU/FhlsSiHcrC/TWCmM
	 Lg1EqIvmo1ui+d/qak/ThVXXo3Ml1hylhgZjR1V+p94pK/9QPf/zkGmNwwkoZXeAmBd2q
	 Vdkv3Q2HSqA8snV6wtXmbKf5NohaesJygFuWMgtOieJzcmHlxiFxmJ/ya1GnJYH31BUdI
	 bV8tGS+nUAln2cYvZHOcpSfKFWGBBcGkrTSk4YXsWAMh0Vde27v/4a7O9suT4Y/m/4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b74t50B0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF0606A31A
	for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 11:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFEF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b74t50B0
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679e6ab6471so2351837d50.0
        for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 04:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793444733; cv=none;
        d=google.com; s=arc-20260327;
        b=T0LONA7gah9kFHZ6XxKfENVwruxE89Z7SFQlEysu9biR9rCpU0EvqInCnBp3fuhrXN
         8mQZA1GSYdAceLEUWXN0wc8RpyTqozlRKrj6/FoudYPPk0JP0NHg2Cmq65kDUIPdEV7Y
         4qtUsKuum/wlwLpn1KdrkjlQ8bmtGE7YWM9VYMPo3cpbdYTQ79wK2cUwR0HuF3Kje6UZ
         XARGyOvAL8t66XLEdC8/AVGy6x/KWD2/Y2DswABppPeme4PboN2V6iYsqhPTOs0npdXX
         TrZ17BXiXyvUTzgbcvvtsiTewgTZWkQG7djJ/duTWgIvcNZFGuNDCccTI0bshDoYetyZ
         /BuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=408dL54i5bVGxSp+B6Je3bwDOKxmbOxNhW7wT5RMZo0=;
        fh=i+/a9EEeca38JzKwk9X22Ngci9Bv/0PhHHM2P0y5saI=;
        b=mUfyhOqDrPl84YGF0xvPvqmfvkG9bCxGX+O9DBdQGVkMpon8G912oZtxA0UmReObuC
         Rfzj37eCuvGKLPdTnHdaDHoKNBSf1iuxfMG552xKA7dm1blO+fTaaJ9weWYesaEJJeB0
         FjdAa77oduqgEIC5vb+Dth+hBx17Tqy5ZKlbzk8muCuQGKqUnufBAj0z/IdI6KlneqJV
         Hi0DXJsiXreGmlcoADc8dYPIJLeIFw4eONSLsRx+HcbD7ofu5436P6BIbOVgq6Uq6qbr
         3osYzqL4VfyplfOnMf8nL/Cq88Gv0oMKUTkMcrQXlciEfw10NryYgpl/TXmMY1nJYoRI
         yGIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793444733; x=1794049533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=408dL54i5bVGxSp+B6Je3bwDOKxmbOxNhW7wT5RMZo0=;
        b=b74t50B0wotSjjSX5X5Ri6nXuolNuGNy6nMglXe0hnAgtPDvb4inQuM0+ciKCJT/sj
         MfE6rOZ6G541HaQnlLoAjJCuDmFilDyf/YwU8MtkJaXfiqGjMXQPF7/0Ly06AHkFEIj6
         v3OmSRccTRg2iFrzJ0hpH5cSBQxleoTC7Hxcoxgo8JCxKLu2sBD0SzxJoTuQo1uy3/Wc
         HMzrgeb+lkkgTixQSTwNh05zYZu/UJN1cVSnAhdzX+SYyTFumVzoQsQmI/gGq2TvRShC
         usgBuuvWtzQEFY9uW28ZI07kRn1GJc1YUDFmsnLD/Q7fJWekwRDoZo8bdB5USv9IQFJ1
         zmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793444733; x=1794049533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=408dL54i5bVGxSp+B6Je3bwDOKxmbOxNhW7wT5RMZo0=;
        b=smknTMWHehKXC8kgrBmH5GkbgRJW/bEaz2nzEDMPMIwue72dWisHlmOT3Iovs1MxM+
         FCuIog9VrZ8X2irmKq78+/OVEmGoGRgRvYm1+HTsRsOPyjzY/PKbek85VituCXlXLfdI
         etk2nsUERy99AYx7OWFRHwv/9t5j4YDknAfYEVWAHbZbEf7e0cREGIgETS59yPcQy2R3
         Isl4R151ODwCuJEeIUgNAF8AMZxoxk5WLWiC/v+qFJj6soA0YdVLAEjz7ybx5uOLflHN
         dLjM0Ym/TZYM+BixKOrWIZZeNCCA2z4Jyhl3pIXpMtGsR+ha8ymmloh9vy/0r18QK+Bt
         Z3ew==
X-Gm-Message-State: AFq9FYIJgyYwyhVkLnDQUEwietdolzHT105WTMcKiMnyjWFw1Vw7trXi
	aLe60Zibx2Uy4PCB368LUOWT/KqaeAGzfVzpdA5vN9HldJihtG4q1s5PpO6K1Ay2EY+U0/tjwcq
	oMo+qvFpGRQ6nS6SB8LFXobctPT56FloYPxVo
X-Gm-Gg: AYBFou0pcxSXYEXpj4QUFoCizUYr+NifAym+P7z1nwcRDQwCI/1r+a0+KzhL7yEETcq
	Ks7uvgq3SEHnifAB1TM6dSv8AcoNjBnutEjDhIyJCohOMgwChBYclGDc3uPtqd6P6Cx1C1MCrMW
	cTRxBd7zOnmFWESLK+/Kv5T9mOyXr1tHqUJQmamybrQjl1AaJ3eM2Q6Eu0eYPV2zQ3+0tGFfDDq
	cKW71h1CaQtOrAIdvYxRTsORXtxTP7//o3Vaut/5l2YBBiEslYf3qLOjihTzgbJIC+yigTa4dT4
	PIED77RaYOQZRQpRuMWJSM+hrjKxwu0/6EMjMUqb6PzjdHx6p/RNghCRCHIj8yghoqPWh9Pcxo1
	MlxlAqiL1zQXR/Ku9RmYf2vJHWSWS/UqbsR6I
X-Received: by 2002:a05:690e:2014:b0:679:b8fe:a711 with SMTP id
 956f58d0204a3-67ba4f8707dmr2576304d50.25.1793444732829; Sat, 31 Oct 2026
 04:05:32 -0700 (PDT)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFAa3YAZ_pBe_fn0+cyszOAvbc6FExzSmRUWh+uTdQkEB05M_Q@mail.gmail.com>
In-Reply-To: <CAFAa3YAZ_pBe_fn0+cyszOAvbc6FExzSmRUWh+uTdQkEB05M_Q@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sat, 31 Oct 2026 12:05:21 +0100
X-Gm-Features: AclHuK9v4e-dBuDdFRsvgVCWgnitPt0Z5UkKd-UEPUu9qGgomd5zdO1cHBJQfGw
Message-ID: <CAFAa3YCUH8XBwnrq2UQ624F+ogX8ft-RPYZ=s-Qid5yHBK7yOA@mail.gmail.com>
Subject: Re: mkiss, bpqether, hdlcdrv: three pull requests open in mod-orphan,
 testers wanted
To: linux-hams@vger.kernel.org
Cc: thomas@osterried.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

A short update on this thread.

The mkiss fixes (#40) were merged today, after about eight days on my
nodes and a week on a real VHF port in Hobart.

The other two are still waiting, because none of my nodes uses these driver=
s:

- bpqether (pull request #38): frame counters and queue restart on the
wrong device, and /proc/net/bpqether truncated on partial reads.
Anyone running BPQ over Ethernet, with LinBPQ or BPQ32 on the other
side, could tell whether traffic and counters look right.

- hdlcdrv (pull request #39): the hardware driver closed twice on unregiste=
r.
With the baycom drivers this frees an IRQ and an I/O region they do
not hold, and baycom_par can dereference a NULL pointer.
A test with a Baycom ser12 or par96 modem, even only loading and
unloading the module, would help.

Both pass on the QEMU bench, but I would rather not merge them on that alon=
e.
How to try them is in my first message above: fetch pull/38/head or
pull/39/head, then make and make install.

Any report helps, even a short "loads and works here on kernel 6.12".

73,
Bernard F6BVP


Le ven. 23 oct. 2026 =C3=A0 11:29, Bernard Pidoux <bernard.f6bvp@gmail.com>=
 a =C3=A9crit :
>
> Hello,
>
> On 5 October I posted fixes for three hamradio drivers here, in the
> thread "mkiss: two fixes looking for testers (transmit buffer overflow
> with a large MTU)".
> There was no comment, so I have opened them as pull requests in the
> linux-netdev/mod-orphan repository on GitHub, where the AX.25, NET/ROM
> and ROSE fixes are already collected.
> They are waiting for review, and above all for testing by people who
> use these drivers.
>
> 1. mkiss (pull request #40, opened today)
>
> Two fixes in the transmit path:
> - The transmit buffer is too small for worst-case KISS escaping. With
> an MTU above 502, a maximum length frame made of END or ESC bytes
> writes up to 148 bytes past the end of the buffer (shown under KASAN).
> The MTU also had no upper bound.
> - A negative return from the tty write() was used as a byte count,
> after which the driver could send memory outside the buffer.
>
> Unlike the two others, this one already runs in service.
> Since 21-22 October it has been loaded on my six nodes (kernel 7.0 on
> x86_64, 6.18 on Raspberry Pi in 32 and 64 bit), each with one mkiss
> port to ax25ipd, MTU 253.
> About 76,000 frames sent and 204,000 received so far, with no error.
> What it still needs: real KISS TNCs on serial and USB serial ports,
> with other MTUs, and with SMACK or FlexNet CRC.
>
> 2. bpqether (pull request #38, open since 18 October)
>
> - bpq_xmit() counted transmitted frames on the Ethernet device instead
> of the bpq device, and restarted the transmit queue of the Ethernet
> device.
> - /proc/net/bpqether was truncated on partial reads.
>
> Tested in QEMU only: none of my nodes uses bpqether.
> Anyone running BPQ over Ethernet (with BPQ32 or LinBPQ, for instance)
> could check that traffic and counters are right.
>
> 3. hdlcdrv (pull request #39, open since 18 October)
>
> - hdlcdrv_unregister() closed the hardware driver twice. The baycom
> drivers then free an IRQ and an I/O region they do not hold, and
> baycom_par can dereference a NULL pointer.
>
> Tested in QEMU only, without traffic.
> Testers with a Baycom ser12 modem (baycom_ser_fdx, baycom_ser_hdx) or
> par96 modem (baycom_par) would be very welcome.
>
> How to try them
>
> The repository builds the AX.25 modules and the drivers out of tree,
> against the running kernel (the README lists 6.12.y, 6.18.y and 7.0).
> Clone linux-netdev/mod-orphan from GitHub, then for instance:
>
> git fetch origin pull/40/head:pr40
> git checkout pr40
> make
> sudo make install
> sudo depmod -a
>
> Replace 40 with 38 or 39 for the other two.
> Note that "make install" also replaces the in-tree AX.25, NET/ROM and
> ROSE modules with those of the repository, which carry all the fixes
> merged so far.
> Build on the machine that will load the modules.
> To go back, remove the modules installed by "make install", run "sudo
> depmod -a" and reboot.
>
> Any report helps, even "it works here with this TNC on kernel x.y".
> You can reply on the list or comment on the pull request.
>
> 73,
> Bernard F6BVP
