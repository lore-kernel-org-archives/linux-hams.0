From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 5/5] MIPS: SGI-IP27: fix spelling in Copyright
Date: Tue, 23 Feb 2021 10:50:41 +0100
Message-ID: <CAAdtpL5yU0-0hR76zV5hDHWd7NOxa1E0g5=eteHvman1f7cWhQ@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-6-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <20210222161905.1153-6-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Mon, Feb 22, 2021 at 5:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
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

If the email isn't valid anymore, why keep it?

> + * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
>   */
>  #include <linux/bcd.h>
>  #include <linux/clockchips.h>
> --
> 2.17.1
>
