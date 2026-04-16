Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BAC39DBE2
	for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338555; cv=none; b=RH37BLnJsGVUi9KrqIBqeqGdu0ghWxcrGNTizvuYBng07+cUsGxUmeWw7uCJIIc3I4ErNmB4n8ITMbqTNX0fZ5mt+tQolWqhpkvMEtUwNd6YEg9NxawFqfaFgKfgeywbNA7wkWno04ow8LJH1631NKA/9jtsEWeWXxzm112izy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338555; c=relaxed/simple;
	bh=5RcGmn3E6IkK/4PLTUVN24XJ2jAiV11BodM4t9S5uGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzEM1PoYyLGNnarVuasCd9XKucHm0k4s59AASh6Pdys2JQXOT2F8RgFv+6FJaXEttT3Q3G72fULUWMMJcpKgdGoRSwFr4nmNa+PGnh0nFvvEXYy9IAfmuE6t1yGXXey4gtkMNiRRqJRCbGNFThu6itwUVWEAR1gyzE+JpOI5Lpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso7772200e0c.0
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 04:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338549; x=1776943349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=RZM6cA16+5IwAeVffP5sJ/sCPr/Ho2PYpMD4FYG8E10kBiz/QGgQVUY/TiWUeZaBQB
         c+fh+ZNM5G+wOPzdQ3OQHJADEeZxEuF5M504uoOCo09NwlsbR9sc0iSILPQhqCbeRXyj
         Zx4AwJ1KzRmVMljbOmcHbK4Z7JIisLR7o9wHIJnfFDmu9uq0xzFsfgMRRLlMdZUuNa6x
         JwFNbBGgiV5hNWIBMIei6jvJZHxp/JFF4b20OV2tTC8joSvG8bnIKINO+3pX9Fy2QIhE
         WFgal2BtV2yjP8MnulCjanDXIptB7aln+QwPgfrv+tZOdRmDZQ5gvatVvJ+gPCxIJ3FV
         05HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w7Q1kjvVnACv/QnrP+YOKyDT210inazc7rNxKAS0f4WHwY/XyOAJA5mUK8HVP6kLG/wkzrkPn4Eo+@vger.kernel.org
X-Gm-Message-State: AOJu0YwbLsCsV2AoS+ZTheeTQV6DSF2KYH+3V8zpuGWnS05LxhIf5p5F
	wl1mEI6WHZ8lXvBE+5cy9HuDhg6dn28MIUZVk4dzDAyvUE4ltpz4qherd05NHP1w
X-Gm-Gg: AeBDieskeEXKl0iu0HcJJPTyrmO9wj3MeAXUDccdPSza17ft3Ro/TboSz7DIPhrVSVA
	7kg3SeVbEtWvSFROGZUGSaHxLPxZFXsoVt7JTnlaBv5+SuTgGlQT0VRVqYHkZnSnK92j939ZW6P
	wYBugBht1fFtSNTb3fFC40qXmJqosS9a3jkacIi0VKeC324g9ImpY4aJTbhJ1J2bWbtfpMvZESd
	pC7aKTStfypo3xb35kySjCKrJ4uSBe+yQybHZpRt9Tw73DQAD9mWMC1LFiM/Kb95xfRk0kXw2QU
	7wvbbwCB5go+JU1DdXb0HOgxOVVrgxfeTOq62bwVaNmAHKx/A2e9DX/FrvanWxeq+ZzjyZLqb2n
	TK1BndDt/MKe1X3qE6LGtRGzYz+yWfvltTRCdDRIUHzZgLqX96stFeBQQ99WiYs8j0ECRBCguWN
	4gONm9XZnkcF0TdulmWHPERDZwc/HkoXh+xByfGOIr6LyEpRXlCSdK/VtrX+TtEEDCPlMxNsU=
X-Received: by 2002:a05:6122:1814:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56f3bd11383mr13244938e0c.13.1776338548700;
        Thu, 16 Apr 2026 04:22:28 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f8a007d0csm2864188e0c.16.2026.04.16.04.22.27
        for <linux-hams@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6137374b106so812559137.1
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8EpWRehfMFrOn65sVLOk86ge8nIVs0NFB1qCCmX/RnZK1EGtafVrdhOmz/u2gY6VKwLUOcnzCXKwKp@vger.kernel.org
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
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

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
