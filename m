Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7E37C923
	for <linux-hams@vger.kernel.org>; Sun, 12 Apr 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000188; cv=pass; b=ZaC4c9iUDmoHGzoQXDpgYtdYwj7CIHgFkKbHuP+v9yi86V93Z78BXASHv3/cQkqmgLLDPcFyB9IXE/Z0SFRwoYRL5h89cayQHPtwlgMD1FPw8dyNV5jvYwEOxMHfofSnKvlJ3u6q7N4xr3lPbJG9Qr63aW+N8heUh6WYMwI6yh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000188; c=relaxed/simple;
	bh=1p6x7PvyQL+5PGqdAnx23TY8v0cVXdqCOnUZdmPD2Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3G1bkxJCBx6Jzb5/KUJVDWxGskEy49ReyW5OARjycUHa9TI+PRt+rVvwFGsDxrvbZgS59LspWYDk/aKxaBwsZqxUvCTT8TCDoY7Pq36P2OmcP+RrWmDqyDxYz72spiDMJYXbhu777txFnUsdbkqdDRC6QRHrJh1TvRqg1W35pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dccArJm9; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dccArJm9"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so4495937a12.3
        for <linux-hams@vger.kernel.org>; Sun, 12 Apr 2026 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776000183; cv=none;
        d=google.com; s=arc-20240605;
        b=G9G5OrKkqvPnWkjk3iR/+tCtqEsvJ0PHqhKkPPHderbCx6rQ1cIVnegMs0DYHM9U6y
         NkzLebp0n8ksM5jzxeWUDexJDxzVpAKBgWPTh2maazI5vVpTEwKIwFaK+jFMUxUsp4H6
         2n3nizn12ukMUsqbtT0zPujgUp3WlV5kanx/MSn9pvLc1NjtH2too6wvrP44BnPozKIt
         YG3YA+VUAYOXnSM1MAC+KIlZjHWEnihLKI6b9HNJIozvAodrYYXyoDZz/wAvhUPpPPqK
         7mfFWGXlqPzbWYzFzzssip3+VBKS7/yFPmgDVhp8Qtgl0Ai71giVOxx44cuu9EB+VULJ
         6DVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        fh=+E3KZj8bLK3sgf/cMhh3PKkXvBdzWAPQZoCnPnoceDY=;
        b=bW888FhNitRo5G3U2YgzwMkJ0NoYAL0OJPAv/ZasjyR+BQZ5mVz5PIr+QTUYBr5LfD
         /HPBjmXauSlg2yxHL92Dz0OT5lA0F3BH/6hbVxP3L0zst1hXkSyGCv1BtcNSzI4Nninc
         rzq2WU3LQ0YwjPoS74uIwluDdjFzPC0q9lUrZG9csqy+5ED8gkJ9zLQ1kCqd2llLYmhm
         3792FR1GAOoMa9cQcza3IJ3IoY1LYg/fp9G9m6BOsMc1jxHJPBP7JzodyDvrUZsw9WR0
         +2Pb3R8IfIupNGDTtZ1NCfU6YiBSEpIx9eOR2hz0MiYmotXIVMcEUg/s07bUb4EIGE9q
         8trw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000183; x=1776604983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=dccArJm9v6h9Fdk8lDGNWZnQG14AQ9ZokHDnv7DAL1GW0R6BDoMR0waR0wHnO++sNY
         YJPJSDf/Eo4Jqw4GQ8Gz/T/rsLkNap5uTZ+EpwANfeQ1dFGXyG88+fN/49+h4JvC9C7c
         2+asFn0yzVsL4n2hJqrH+GINWtCINsNrMCDz6yHqeLWKks0EsNy7ssNes4vhdFLCd+tg
         k2Ys2/EuxonOOeyCkSNs/L20e6zSdmHhXIY25hzHxXat+VjZowRiCo0VNk9bdjlPvxYt
         DV9owUMCQ8VWv/4Ldm8HtUCj9QQlhYJyZr8JnJBv87EbzYIfO7KpnQu2sRPezsHrfV9J
         1U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000183; x=1776604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=WHxFyPByFMg5YgpjNmzDEyXW4rKNrTtDNgvBmK3c4RUWVGk9Rb9duMz6enUvMYNSlx
         buDxqnhYoRM9aVlqIaFLjdPMHbeEbOhIyVKGueHsIj2rfSr+9u+jtP9KPvrsw+zuhaPa
         k4T0EKwkINb2SpdJwwcZiWHb2zfViYztiXP5d1sl/eqKSmz2aNNDOebSIgJC3fSVVIDu
         F8CC5FSxFRpfX0pqPNhSn7QUf63RXPyiDBM7wxLG92bpk9ecnn+1vAYtWBV5O6KG7AU+
         IxljkY5t8M1yafbNm6iwBIWw0mhNtxIdllC9eqTBNVuVpMH6FEm/WhvplC4gQ/VgPh4P
         RMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoF1NkXy0drX8+4eLM45mJK04ZCrdTyrg5GJDPG+W5KsrBkUxS+GUt0twib6KqJUKWM9IZkRVoEo7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzgSGeLikhipClaB2JzTEGAMANayh4ZvnVuZ7xPl/vXpJjuE7
	i9GJR8PsfFKi49r8sCgE0Xo4Eb4onpvADW7baKUHYp04NXUiJD7S++Rf5WRNAz5QzCNETdvv+t7
	jo+Sqr4iLjhmxDftIKsNnc0aH4tyXIH4=
X-Gm-Gg: AeBDievTBGxtR9biP01F+6s3jpOtWPYexWn2pcD+sllgNCsFiB2wVewtEDL2X+PA36l
	tfhk6hWvDbyIRdIWdYaNfoInp/EcOU2J+BzY9YNFBMZ+zz3yUt4iFlJDxm6zhOZDpSatL7AR4Gx
	WLzU/Xx9CsufkaWczKxyfNBmg0vjxwvGENIZVe5uP/YD+yTKqxNFEUVbsqSNXmIi8SjsNI94IWb
	eiBE4jaDEF3w4abb2DfUR/chFy0uXDhfI+p0iD5DqZHN+wPQt2SZFLIXuxUc23Ph+du1DXPN6iZ
	yQ4qqyEUbFjyRKbeMXlOJkUiWLNsbmvIJEVHJm7K
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9d727aa4fdmr352963766b.25.1776000183133; Sun, 12 Apr 2026
 06:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.131582521@kernel.org>
In-Reply-To: <20260410120319.131582521@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 15:22:51 +0200
X-Gm-Features: AQROBzAeMsaeSVePCJ__tEd4f2rWAY6MixXzp_fii2b8vyUpLt4xjSbtYzENFaw
Message-ID: <CA+=Fv5S68wZQapeaYTspOfsuGk=nBj60sx-ojHBSqrxV59Q+ZA@mail.gmail.com>
Subject: Re: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 2:36=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch alpha over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/Kconfig              |    1 +
>  arch/alpha/include/asm/random.h |   14 ++++++++++++++
>  arch/alpha/include/asm/timex.h  |   26 --------------------------
>  3 files changed, 15 insertions(+), 26 deletions(-)

Hi,

The Alpha side looks fine to me.

I've applied this patch on top of v7.0-rc7, built a kernel successfully,
boot-tested it on an Alpha UP2000+ (SMP) without issues.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
