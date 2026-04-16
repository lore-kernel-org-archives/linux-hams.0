Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269D346E44
	for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338979; cv=none; b=eeFmAlYPnRO6Ft+sptDH2gZZZ4Ld0taKFEgZklu1kuJZ9oEXhaAetVJK6aeh8S87Y2D3GhfV90JrwovOGFXCya7jNFRGLKkRZ52QN2AHyInmi6Akg3WW8HV1JXXuJK8nekHxG/rSleFoUoPw119eDXPz9VhJ4oMXaE4FHt2l3ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338979; c=relaxed/simple;
	bh=FSgVIzpnraycKQsxAztrNgNSM9On/XU1ftEj+pCL/gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3o7QaZMIhUOnrpeSg0kmBBICc9M/ZGmF88ada/QPV8fhZeUokCV9JpQblN5xnEQgilutU/0Y4YymaEF9WXV9KLgrV4CABGsXDTMzwteo2oVmux+ndkvDzoKa6c9SuWSjTSUNYGf4BH2hlcXII2KFCRAdR3OCvWoK2DFtEfK6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbdcb85067so6591536a34.1
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 04:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338977; x=1776943777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=p3y3WJ4Qb5swedkydlo/PEUA9DoJrLl6CsmrBk78p8UblJEnZpkVowXBathOoJnGHT
         UKxv4i2a+p83b/U/ht5icQLpMqfURobxqcGEFveLQT3u8kOrF9FPRIQsV213ySJ1Acvi
         g9pnW0ELfjlyOcPS/u25lRXyA1CHhMMP2MvPEu0qUUobe6bHzhFTSza94gt/53VOqRie
         PisDher8G+mN9zXBlhk0PaSM9PPJED9OP8zLNjSuVD1Z7MEnKfRMrZ/OzExZBvdtXiNy
         qV+yBfMKDPAM9p1By3TFflVsv32gg0oTEN+K0i2dHiXtyhbnHISPJHaLJYSpNwE/4RmB
         BqKg==
X-Forwarded-Encrypted: i=1; AFNElJ+8e76Sd7nIjGIM2rarEjBPgtkkQ+rHDujmzBPzchLCELfYNzH05EShA2FXeQy7EL3NB3J0mCj8XU6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+paWb6iGSmgyO0fxpN8Zqzo+A1ZR7YdOeOKbPCN5vzxdq6YC4
	ULw96+5LNflJXMyMVPn+a/eTgVhtM4MPo2DTi5z3kWWHno1SCa+YtUdHxkEqWvgn
X-Gm-Gg: AeBDieto7HBNKcXbM1NfAhIZl2TCRpUCBJ6S+9RIWWHuclSEtlbZe/dEM4dURtsgfJH
	qDIYN14FxKIX9GCyNCOwfe7+I6ffu8R1Kq/93rRemJNhu7vPlYZMEzFz7805GvGavG37OkbebhD
	lhZMX/tHXP9V015sWYzl75P16aA3rm2TGs84R8+gltkUNWbMDeEh4bo3Gl6PDhaj2oEOu9KdQQU
	dOequTiAsQvEoMbxm05SMLpREPkaJmoDNOhSsdY5XMCoX2zQJ01gjq3zeC1tgYWAoneJOBZjgWF
	cG4Ozybn4a9Edl9ZKT68Vupf8yZyVReWZS9TGNHPSGyMGXqQOGYK3zMfe2oJooF0rUCJbo8+MAV
	3avxTzNI76ZbX85namNaWvmbT3R+WJFX9grrffD/hWswREgLa6p8JSuoEf6NpjSYN2/XfCpBxtU
	klGXXGKHy8203hWBzwNk8OxdF9RcnXDbgDjfF5+4r4Ng24Yi4x37trsOSKupLCbEUDn8AjeXeIW
	WE=
X-Received: by 2002:a05:6820:4c14:b0:67e:1e52:6e05 with SMTP id 006d021491bc7-68be86e246fmr13908858eaf.48.1776338976646;
        Thu, 16 Apr 2026 04:29:36 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-693278545b6sm2555275eaf.0.2026.04.16.04.29.36
        for <linux-hams@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:36 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-471618e20a5so4055045b6e.1
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 04:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YnXP8YLEzsFSirTX5E9oWEBMboFB5uLEhdz/rkR5Fzr1Cr7z3MoliCTonCoWBT/P2zrmJfBj/KVdn@vger.kernel.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
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
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
