From: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 2/5] MAINTAINERS: remove linux-mips.org references
Date: Tue, 23 Feb 2021 09:16:37 +0800
Message-ID: <CAAhV-H5aKEOFr32G3BZJofUQaRtqM7zsy6fX-gPCwxFhKBqa2w@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-3-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614043009;
        bh=kDwba0vVgoevzJZ1ejp9aIx55kGXux65+VE5+XPArvQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dA0KMovrh4BCRgSKtyWZoXGvYaCHiHdqidrfcXpCsgCrKKGraOYgOGjlR87xeK9qV
         w9kDmHR0Wgs1Hclsrb0kvsQTHtLGB/XGkgZF5cKW07ejaibXyE6Kgif5hGJvZrmhht
         rUpJ8+IJBD8cBEYpwp472yOW71w9lomxM4kSoBttML7MiRDODkvV1/YFVPQSn9I5Pw
         YHY3tJPjXtMI2DObywS+ZHRVjMQ5NT5CD5eVKOwZA9DaZYcPJD6g+KQ0v87UdsXxBW
         jBaQIxpw6JKXvG9iEVtPlMxMCW+ljIV3M0v1IgOxIv7hdzYaol45Fy8YhZtyZNooLK
         pjtKMQW08QPSg==
In-Reply-To: <20210222161905.1153-3-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:MIPS" <linux-mips@vger.kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Feb 23, 2021 at 12:22 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
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
>  F:     arch/mips/dec/
>  F:     arch/mips/include/asm/dec/
>  F:     arch/mips/include/asm/mach-dec/
> @@ -11932,7 +11931,6 @@ MIPS
>  M:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>  L:     linux-mips@vger.kernel.org
>  S:     Maintained
> -W:     http://www.linux-mips.org/
>  Q:     https://patchwork.kernel.org/project/linux-mips/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
>  F:     Documentation/devicetree/bindings/mips/
> @@ -18248,10 +18246,9 @@ F:     arch/um/os-Linux/drivers/
>
>  TURBOCHANNEL SUBSYSTEM
>  M:     "Maciej W. Rozycki" <macro@orcam.me.uk>
> -M:     Ralf Baechle <ralf@linux-mips.org>
>  L:     linux-mips@vger.kernel.org
>  S:     Maintained
> -Q:     http://patchwork.linux-mips.org/project/linux-mips/list/
> +Q:     https://patchwork.kernel.org/project/linux-mips/list/
>  F:     drivers/tc/
>  F:     include/linux/tc.h
>
> --
> 2.17.1
>
