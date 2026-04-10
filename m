Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7603D9DBB
	for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835135; cv=pass; b=uo5+6kLEjQP6JohVOQPE2W9XxeXSRl3JN3ZG/zs+GQFklLfE4Aqn8QgO6STN/5asZ91eRJk7sZNsQHuI5ayP+dPO+aijg2oYpU1QyISdBm9TXuvvi8h1bh5nKpc18iMAdMpKxdqSGMfF5znHaL+7N++GTSbQ4qwRmrc9YdwxvBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835135; c=relaxed/simple;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bebExFI3ORs/Ofw/HmQymKodmf8Ep7or3NjZq7L8zRvt0ZM0+WtB4fviVzFl+AP2j+6VO6yox0xQLgkwVVA/mM+2i2gYGQX/GqvJ7Rz/SkM0kNhRHQXUoWVaR9b8HxIvWqgN73X1ESz7Vjnq8uCMXECumDJfhv3kbFpdE8VCBV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=cs+zJ0r8; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="cs+zJ0r8"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c1a170a50so2014868c88.0
        for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=d68Y7dIWjqjsfesX99Ud53jdICOA5I2872+1kbHAaAoySCOyifx07a+J2iKwbzA76b
         0sjGJDjID4fCGHkvI7yTAcEN1XBkeOkg+M6F6FynZE8iSFj0OJJuk6YJuKBm0NMvuCue
         x+6APtVeAYTtRNb8NMYpNA0AFBl9+CBu+gPv8UQVDOfdUmsgxkp/+PeIk3XKl7tgsBT0
         0VAe5e9vgl6td67L7x8shq5t40rwXYxitpiqytkGYDj52SHCfTSExQffVJvQOM9JsMOo
         OHQhjM2//1aexNqIiusGW9OdbIZ0+AtW58///5n05nafoynxHS3ywehGmq8/cNkVYViR
         SsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=6OViIbRNZkihiNQ47xv3hKJO645pwCJQTpwtkxYkjew=;
        b=NPYU/2e1QkCnljOSucV1Lo7pgv5BHwJlYxsHPpbhZZgoIaht8rvYiitG+b/CMV1dmp
         remi2fokv1JJ+LqAXUSNE5qK5o/VNnXZxpPT480GXKLeIdXfoVuuehVr9YGmVgoZ50ey
         RkSBlJPjgw86l9//QDmcORcImC/ctD5iLamU0+1Ydl+UeHwR/xQk/IXAapgEvJaPR20P
         iWGD+esHjgrmK1CRLUAXe7b/+kSy0rw6u1hxwjLt3iSOPy9ThhmGKJFjkglfE5zLDzmm
         AzRQZSVF6HMSrx4Wdnp6kC+HKzgU96D6LtWkmsnoPyrIGIwJXGzU3+g4c7kb8saS14g/
         Vk/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=cs+zJ0r8E1VxbeERL/6orYDfRzBNN0xV+FBDuuOmam2/EuHZ7scxaUctzZ3REo2LBr
         KdQSu4tLtUeUQ/Am7PGmtjXBLQ/7knpdVClf5erC+tpkhYxe59BfVvuW88STHDIDr49T
         TpKPrBeobAalm+DfnxseCj+mCeyPg4AFXq4Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=svDk+kaiYAAL2ByrDGq/f1RhJq1rmt3TsAkvvwZJ8IMAGizLEodwcxBfixnm9/oh4i
         9czASHDCiIiV4orZzwL4klBM2wmDzYBoL4wqEXDgOH7vdGZO8P44lu3bR0DJ9LmCekr7
         SSLmW6WaJR7cDGzrqqPF71MIoUsnbjCqvTNQKosMPCdjEN2/hPAt35Id237w54IYKwy7
         mvT6Tpu5aCWSkqXVXC1Yq3BjBlebwd1rU2PXz+H59iGmw4WhB9QD81BNnu9ILvRVymZT
         nuacD01LDWpXzxUD5HIpDynvf7XQO8J2zELkcWNMBFTdBofU+oXo+5tFT69i6GZqU0To
         e8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWneNVBOXzhEhY9OXQ65btLJXraQHekaKDhYLZjXnDoqugoNmA1gfEjcb6ZBuPzxS04ZE+A/vvYEvSR@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhNmRnhiJ/UKQyv2sKAJFX8yyuy3HGjpMVCglWGEv/w3Ut74L
	XNfadrEM3nS1Xf04quckTbLyCHhgFsIPsOI2GuOH/AxFPBBTJvW8xdSQYwBM2yxuAwI7LFIVBzH
	AeFnw4QQrO693S9nRcbWi+0IkbvVXahNcJLiSSENgDg==
X-Gm-Gg: AeBDietUeBngvq5cierG5zSRpy3VdY3PZqAdkeir9h9ZrsRSyaOc8p0GKYATz91Pzcd
	OSNJoFoh6c2yhGAN1p9ViwaWm+kOdQBSNQ20gBqYT6HI35j90SYSgEh9chHCIvXeMVdiYH3RmVR
	zpK06l1Cc/lUI4ffYOAvB5HYOBZIYGGLXVFvq9937Q7/KmBrbJoJz0/P48vmYytdrMpHu/ORWAY
	birgORDlJQycN0liOt6amm5mF1cHdbYkDJtB6xB1W1e3SRzGNPRY7UdKL4l0oS2moWvnCE9T9Or
	6bH4
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
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

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
