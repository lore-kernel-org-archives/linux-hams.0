From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/5] MAINTAINERS: remove linux-mips.org references
Date: Tue, 23 Feb 2021 10:48:26 +0100
Message-ID: <CAAdtpL4egZYCGS+2K5FQSFYcPKomosuvvrunpDskkiif5Ma5Uw@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-3-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <20210222161905.1153-3-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Mon, Feb 22, 2021 at 5:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> The domain lookup for linux-mips.org fails for quite some time now. Hence,
> webpages, the patchwork instance and Ralf Baechle's email there is not
> reachable anymore.
>
> Remove all references of webpages from linux-mips.org in MAINTAINERS, and
> refer to the kernel.org's linux-mips patchwork instance instead.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e949e561867d..703a50183301 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4980,7 +4980,6 @@ DECSTATION PLATFORM SUPPORT
>  M:     "Maciej W. Rozycki" <macro@orcam.me.uk>
>  L:     linux-mips@vger.kernel.org
>  S:     Maintained
> -W:     http://www.linux-mips.org/wiki/DECstation

Why not use the web archive? The information is still valuable.
https://web.archive.org/web/20190704000315/https://www.linux-mips.org/wiki/DECstation

>  F:     arch/mips/dec/
>  F:     arch/mips/include/asm/dec/
>  F:     arch/mips/include/asm/mach-dec/
...
