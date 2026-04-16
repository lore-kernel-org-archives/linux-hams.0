Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206543A6F16
	for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338881; cv=none; b=HIwK1KQQZgSdLVHwGhkQYEsDUAwow5jjW7//+HLEV6LnktAdlF0rJapFYDteup0BIK/TXmFIsnKZUlV0OGYmnlwIzlSXZgD4G3Uz7IWvAsxiVZx8rEAy/DeBP1fF8eQF7Rth5Sp5d8oXskKHU6+z13Hv00sEHS90XmBGkbGXw3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338881; c=relaxed/simple;
	bh=onL90hyVAUlPY0ASaWQwK2lX8QEYr5m106IAfPoIE0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKgZ/AN9h9yy3bCyxyPqG9X6D3FZVLcN+wUdRmgmEoyyp1O2ffNgzB2wbVUDY7RaPchESuk6pqMLTpF+q1/arYSK0ibTMfGIcuASXyuzqEsD3wzzUIAi9zxQakSVq5ZjouVaikPJSVIfKm9FHyhG+FZsNxXaxXIig9tFD//b3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8d560ede296so924481085a.0
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 04:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338878; x=1776943678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=;
        b=FgUQfR4GdAl7sFb23R4p9SNPrF+RwJneh2nCTuOmkGkNgCuXDUJ8fIWBMfIlzxaVo2
         dKH/JtWwPKOrgxvPkYB4XJycwBsm2kfSNcUg2bCua44FUHzZO0YDekKx8yIZZSiSlmJq
         PSWtQtFNEn342Gnjw4bBh1sl0eE5BfjfR89txdnw+Ko6VzQzDkS28X3TgVS9ZjoJqwC5
         dmIaLF1sPqyWNiZrJIeEkPCDePB9OYKysr0t0XCL/LCSSEYiE9DxpQ3Av7Oa2ZAC4Rcg
         7rNB+MB8ZgSZQ3baNxzcTaU6UTezf4hzxq/kh8lY0xPCJUf81ezq3YeQhZIoOfqLevM+
         c6Dg==
X-Forwarded-Encrypted: i=1; AFNElJ8vSzItmJFUiuK6AsAKfHbhRtI0sOXHCPot2EDqgxFFRFcD5YaieVA/lbK5bnSaBVG1RqqhCTc9O/zm@vger.kernel.org
X-Gm-Message-State: AOJu0YyuG4dn8PXoz6it9/TTzNlrZ4ZFsfXIrx39/aPreZnkcQybpi/e
	ezNCbzprOlUBe7v9KIaY7XLdocn4915K1jqqeRbxCng2X8bwmz+6gGuvyJW8S+Hz
X-Gm-Gg: AeBDietmgajeSp7bxKeUN5oVRMqMjkGLNglx1G4ftgx1YWe+n2Hj78Ydq3/PPy0WE3W
	/7NHbQcp12mddXuUAmY88HO9VZGdvLyjx5gu+t63XFj5Ai8naJhxHejlFGMsSedHXuoLcEnSsea
	NHSFoDwUZX0UAG2iJdZ172FpT3vWYCAsMhWXF56K6icN/8SCTXWmrY9FeejmvJm1q9D3gYfHEY3
	VCIP4lH9xokexGswEnLsn+j396N0fyHAWgSImoKUk+j1mdkgrmTrHEHLlknpjc1YdudrKocttlx
	zAyhDouQFIphG9C3qFi7KaWd5n13eS+09Uwoi5J9/q817eG3O5WADFXSUL8kqwojbzrofgoGuSK
	jzyVUdJmqVJXm4B87bKL2XLojyECVHO0rkTReZhjFopIaxL+MJUgWmHo2XRknaWgOmS/ko50oXn
	LoZHa3dmLb+vrq8KlG38XvSC1u091ALYu3S6UZEsj3uqq8vnxersoBU10QbpLmPwWN5r+uS+AkT
	ck=
X-Received: by 2002:a05:620a:2683:b0:8cd:b90f:fc14 with SMTP id af79cd13be357-8ddd06978e0mr3883236985a.61.1776338878042;
        Thu, 16 Apr 2026 04:27:58 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4eed6eef3sm373675085a.2.2026.04.16.04.27.57
        for <linux-hams@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:27:57 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d6d5e45c43so950301285a.3
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 04:27:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UkBi+1g4YX88fP1f9l/vRZDgVB6jp/X6MyoFo602ZOZgh9aPsyrkr4j1qgvdNWLM4p1RM4Vr+66Vu@vger.kernel.org
X-Received: by 2002:a05:6102:3fa2:b0:608:1b6e:f4dc with SMTP id
 ada2fe7eead31-609ff0c50e9mr11028119137.11.1776338540828; Thu, 16 Apr 2026
 04:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.045532623@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
X-Gm-Features: AQROBzCyA8BqoTVnHFn7fWQMKVWyMF2wrQlYn44P8f0X0RsdCOwGnnxui8decDA
Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:19, Thomas Gleixner <tglx@kernel.org> wrote:
> Most architectures define cycles_t as unsigned long execpt:
>
>  - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
>
>  - parisc and mips define it as unsigned int
>
>    parisc has no real reason to do so as there are only a few usage sites
>    which either expand it to a 64-bit value or utilize only the lower
>    32bits.
>
>    mips has no real requirement either.
>
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h      |    2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
