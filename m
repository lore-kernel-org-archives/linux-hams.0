Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793471420;
	b=WPxvfA9vh7s25cx26KnFH3cXUZxdKX+TA8dzbM7P3AwwrJ04IFtkxLgv8CQynCPrPq29
	 AFBKfWv6i30qvnpOSO2VihjlFMr1jXIHHf5baajAwbTnhxViGR7k6ouLi9kdCfLymHk2a
	 a+RH2lEqXvWRLagBbMgk6lJtMJ9VtY1tZXs3lU64+BjUxmuD+EQaLjcfOHbyy7HDd5v8T
	 5YHDHF0dfokQWa72Ap+Ep5EzeqkdNoOs1j9Uu1Q9c2++CCZYPl0dcBrm1HUMMuLvgTIOX
	 quV4lI43p4pGfE8CJF6O4AWzmJl1x+egJeNW4rPQl9mIlKm0usbrNp7wx/sTxfNOd3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v2W5F0ErUkfxpna/m1ByXDfGbENRn7nk7Wnwpi6wuPA=;
	b=KJB7/k8L7UsS2i6j+AeyHj/JKShnstvOQliMntOp3BXdZjD/w0Y/S3nDzuU00bxfO9EG
	 pbORk8qC8t9fZn+rDZCYOrasBLaeSyNq4P5QRlboeVHMyQodV+/mWfStiS8E5MO+OCl2K
	 yv/Q/sNJA7f0Jp4TqxpNf53hnH90mBU+ng0GyD8lypTd1FsIEizOLJde/tmk7VrMh7rT0
	 H9KDk2LZHfXAbPLaNpX6OO6erS0hM2m2Iyri8MydYK7PHLFIA0SwX18vBLKNaB/2gDN0q
	 wwcU9zv3E5QK7QkRkvLcdTLtR4LObfJOsKcb1FNw2D+bjlLEKLUCyz8YvbFw+JGAjeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtOp7XlM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC89606A31A
	for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 18:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtOp7XlM
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab3d3c5761so17037857b3.1
        for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 11:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793471419; cv=none;
        d=google.com; s=arc-20260327;
        b=PrFc0U4h4FKxHATvZFXEbnaSkVr5T+0gzqFwmguxVZJLb5M2B2Re2EdgXyi8LIQ8aB
         /1e5Qa8cTk945dBEjcmKvhRBUsqxGBjGiCQJB2Ic+e806KFwL+1kAoY7eXL5nyzeuhfJ
         iJNmB6yiMZ5/TVsk7JamusLW65IPiVnPp40/RwXZJtXNgPG+3Gisv9FLaVXs5b+Ac1wl
         Y5KbzlP++IXHuRH6+vVtF6Sy5qKbie65SXsSzlB8+obHPVPlm8j0eS2CddQ+7S3+Fo9N
         Ish1WGiyy5TxismeHiLyTe7OE0Tp2hjdF9hxkfREOp4MTVW77WmQXSx5S8VDjSYdxWIX
         ijBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v2W5F0ErUkfxpna/m1ByXDfGbENRn7nk7Wnwpi6wuPA=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=qB8wA+06jJ35UiCV8qoP2vjGCXQsqL7Jyv4negFRQVwlsqr0HxScRQ4Y5FOuDxBNzt
         cmR3mSyQ1PHWp2RGfo6hN5FCbHrV5ASyVBoxynvxHQ3sJDMojDTd4VUpiLdiCKQOi2KZ
         6V3vOFB2MXb++FrA2m8MA+A8tmhFas7JPG5s8tTe1Np1Pot+N8OB3yoasUjtuq3Jd3W0
         O1hqXdH/XiHmXAavakuKbZUIQyCyMYw8TxVJaTPP83ijCvMuavsng+ZlYwchQMkQO2wP
         wW8sX8PwaDPzDa4A2L4f1KT/G5f8zqQLlo0Jk92hwde+vWqAm6wLNLXQzG9C/+6qnQVY
         mLdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471419; x=1794076219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2W5F0ErUkfxpna/m1ByXDfGbENRn7nk7Wnwpi6wuPA=;
        b=WtOp7XlMiiVkZEnQLPFRfvPpYNfrLYpBthqJQiUoWNDAk+5PJE8A6v6+Kc2RA2rDjL
         Bq249Mfu51YVaCFE1GoRT+FU2aV5neiEtogj4cDnz3RcoQeVcEpDNs863jTnbMqMpBtS
         X8pM74mp2+8dfT/UBP/+iBomczhIuGdwOopYLrYd0OwZCQ/w3DuPjI7zyiet3loCg5Yl
         LpSR7HeTbdhcX9YzFBCx5MD74FY9+XNvSLeaNZs50oacDP93N1bseHZ9mursnNRn2WO/
         DfCBCD3+jdaneiZm/qStmkM1RUwMzC9b96jbnG1IjDQ87TeejHevrMs5YI7/UvkC9eom
         Dy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471419; x=1794076219;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2W5F0ErUkfxpna/m1ByXDfGbENRn7nk7Wnwpi6wuPA=;
        b=BLLTDdjiJ3qRKtPSk5meMFTgn3In/UWjQDwxHM+7bhOMwx5qp9xYUNy91VuzvbNAU3
         M/JF6+rqmb4Pfs6mAE1HYbBFnc6Td4q/0iYE7SA0jbTouoXZYUQoq+tHsSAynbIsKLz/
         ZmVY+xKrkic4aKCnAB6FiQD0UAZbBSvl76T0sdXsHRckKhUQqQjGEPmHub/PaGHrGnYO
         fElSdfKp4pFfeRmRw7MioUj0vgLbCG8HiqbZapLVOXYlZ3a4AVT9Pn3NLQyNtd/b+LTm
         jGvdZAaDYjF3cH/YzVzVx3Nq45jwUpAzn8pLk19314F6SnwZecFyWOBhTz3TschwZLnL
         NjCQ==
X-Gm-Message-State: APuU4Z86ynjdsrafTuyrL/Ap9QCVz55gvOZFEV9qafPlL2HusXnZFevn
	piaXJ4i4hlURwbDBmDvK+pJVXq9J3f3rt4Yuq+lB/aYkcop9C2hxVakYzFI/BPH/6jiirxh5jH2
	LLZoKEJROPiByEKpIWzQqN7cM9M39+l3jdTwY
X-Gm-Gg: AYBFou1CNRzmMZFWbzbkcj4sCYPCg/RzqsTsUBtD06QzVhgkRf91MpCej8NXBPjZSjr
	j3KB2UZ3rgkF/nkE17RbV/xsnYxDomNYPy1onNOa/H93UblQ9uONgwkEdr2VXe/sPH+K8rcZAyF
	h/h4E4UAduiPybWmz/bLvStsEqMxJgSHTay33tdvwQZs76Jo8GzHSVFQOFwL0SDCDguWZdaLZFu
	5SOwrw0mX6C9xfmjpfsqex6ClglXhfwSy+GH/5pg9jZZ02tnCqt+3BhEL03CxTb9aH1h0Tvs8TO
	owzp5z/q5qLhuj6wg7vio3o55vplMaG3sTLOYiXlHzopzdb8JgHPIVtsw4FGQnd9+2P/cGrmLtN
	Lt1/uMN+sJfYZnoJWXqwYBQ5vc5bY9gR6+Xb7
X-Received: by 2002:a05:690e:2c5:b0:677:dae6:51d4 with SMTP id
 956f58d0204a3-67ba507bd30mr2936348d50.106.1793471419526; Sat, 31 Oct 2026
 11:30:19 -0700 (PDT)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFAa3YB_FCtSZThMs5vYpDJWVXEvsiWEQZMwSqhAp7TX5cdzDA@mail.gmail.com>
In-Reply-To: <CAFAa3YB_FCtSZThMs5vYpDJWVXEvsiWEQZMwSqhAp7TX5cdzDA@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sat, 31 Oct 2026 19:30:08 +0100
X-Gm-Features: AclHuK-SyorH2ZxwWZLRHbcVo84nddqmIASf30yS4OHEQ-FY8ZcADfIBiVYksAY
Message-ID: <CAFAa3YBHYPOpT32=oQe99+7BVRX2PVn2perF89D4BrZKioJ40A@mail.gmail.com>
Subject: Re: mod-orphan: mkiss, NET/ROM and AX.25 fixes merged after field testing
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

A short addition, for Winlink users on VHF/UHF packet.

These fixes are not only for node operators.
On Linux, Winlink packet often goes through the kernel AX.25 stack:
- the Pat client, with its "ax25" transport (axports, kissattach, mkiss);
- the Linux RMS Gateway (rmsgw), started by ax25d;
- a TNC, or Dire Wolf in KISS mode, attached with kissattach, which uses mk=
iss.

So the mkiss fixes (#40, and #48 still open) and the AX.25 fix (#42)
apply to these stations as well.
Reports from Winlink users who build the modules from mod-orphan would
be most welcome.

73,
Bernard F6BVP


Le sam. 31 oct. 2026 =C3=A0 12:07, Bernard Pidoux <bernard.f6bvp@gmail.com>=
 a =C3=A9crit :
>
> Hello,
>
> Three pull requests were merged today in the linux-netdev/mod-orphan
> repository on GitHub.
> Each one ran on live nodes before the merge.
>
> 1. mkiss (pull request #40, two commits)
>
> - The transmit buffer is now sized for worst-case KISS escaping, and
> the MTU has an upper bound.
> Before, a maximum length frame made of END or ESC bytes could write
> past the end of the buffer with an MTU above 502.
> - A negative return from the tty write() is no longer used as a byte coun=
t.
>
> In service since 21-25 October on six nodes (kernel 7.0 on x86_64,
> 6.18 on Raspberry Pi in 32 and 64 bit), one mkiss port each to
> ax25ipd.
> About 272,000 frames sent and 625,000 received, with no error and no
> kernel message.
> A station in Hobart also ran it from 24 October on a real VHF port, a
> TNC-Pi on a serial line, with no error.
>
> 2. NET/ROM (pull request #41)
>
> - nr_rx_frame() no longer drops a connect acknowledgement that carries
> the CHOKE flag.
>
> 3. AX.25 (pull request #42)
>
> - ax25_frames_acked() no longer queues a NULL skb.
>
> These two have run together since 25 October on seven live AX.25,
> NET/ROM and ROSE nodes, six nights without a kernel warning.
> Sasha Levin had already queued the matching stable fixes for 6.18.y and 6=
.12.y.
>
> How to get them
>
> If you build the modules from mod-orphan, pull the main branch, then
> rebuild and reinstall as usual:
>
> git pull
> make
> sudo make install
> sudo depmod -a
>
> Build on the machine that will load the modules.
>
> Still open and still looking for testers: bpqether (#38) and hdlcdrv (#39=
).
> I will follow up on them in the "testers wanted" thread of 23 October.
>
> 73,
> Bernard F6BVP
