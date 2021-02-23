From: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 5/5] MIPS: SGI-IP27: fix spelling in Copyright
Date: Tue, 23 Feb 2021 09:20:04 +0800
Message-ID: <CAAhV-H5rmym9_5X9uxAHvAJasNrVCgQSE23tv3XULE60iwMnUw@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-6-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614043217;
        bh=DrhhhxquQa9mMMAlVDZt621WhowL2G0QRwZ1oprjFoY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n0L7HNxZpkuc4vsHzjuYh7yIaejq5QIw6JuRdXjNKD0/Gn64F21CXixIszhcuYx9y
         ED1+P/xk5eOPdiGNKServB7o6OGs4Vint0c1D2M0rYi/ssdYNQsz5DsM+bShMlJx9x
         YOIOhGkTkNs/ygf+H06eHctMm2t0Saw0axjPJ/J9KHcM9j2YqzuL8b61dasurDDAnd
         xI9snoLrknDGPxkBtAkNy605tiJeidtTsOujz4Mt2hepw+usuCUzx+tgbcQ35jw0Z4
         fCSx4hKrSVbRkrwMZ0D/GNq9ADPx3l0S865ekxn065Xv8BitJX2EfuB4moYa5zCSbi
         h8+peInvB92/A==
In-Reply-To: <20210222161905.1153-6-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:MIPS" <linux-mips@vger.kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Feb 23, 2021 at 12:22 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> This is a Copyright line, and just a typo slipped through.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/mips/sgi-ip27/ip27-timer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
> index 79c434fece52..444b5e0e935f 100644
> --- a/arch/mips/sgi-ip27/ip27-timer.c
> +++ b/arch/mips/sgi-ip27/ip27-timer.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copytight (C) 1999, 2000, 05, 06 Ralf Baechle (ralf@linux-mips.org)
> - * Copytight (C) 1999, 2000 Silicon Graphics, Inc.
> + * Copyright (C) 1999, 2000, 05, 06 Ralf Baechle (ralf@linux-mips.org)
> + * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
>   */
>  #include <linux/bcd.h>
>  #include <linux/clockchips.h>
> --
> 2.17.1
>
