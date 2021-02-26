From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 2/5] MAINTAINERS: remove linux-mips.org references
Date: Fri, 26 Feb 2021 09:29:34 +0100
Message-ID: <CAKXUXMygO2caTv9D1dMv9dxJSgC8=CpcT3hYsNm_ko4HXdNmeg@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
 <20210222161905.1153-3-lukas.bulwahn@gmail.com> <CAAdtpL4egZYCGS+2K5FQSFYcPKomosuvvrunpDskkiif5Ma5Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wv9SyvXPStH1HbSiyrd6dLJkIu8R0cmO6gcv4tLTSvQ=;
        b=Rhl08QI0pfGUZYq6eTciDwuN89KLIIALSh8uKopiHPcUrfyNcHVdR0Y6PGJQ1Aw1Xp
         vPXZjJhOIbKvkPRAco2v2VKNnyYBYI7anNnDxXs0xiSFo7fx91n4XiggVGMHNhhKvu4k
         VOo44XIZnSglXqVUOvLckvmbXB7NqIerp5578rZZ7Kkq5DtCOVgLsBTzfYkva3pS5MmR
         BAfHatL1uy5ftOMq0kGxA8XxXWQPdMPnpdScblfP9jVupdhUCn3EriJZ5//VUNid5wyo
         f/ATH0swlnaPmd0JLN4HAMbgaAspgJBsV4EsG8vx1D8YainfyvDQL/PiOgyXGYZppUzS
         m9qA==
In-Reply-To: <CAAdtpL4egZYCGS+2K5FQSFYcPKomosuvvrunpDskkiif5Ma5Uw@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Tue, Feb 23, 2021 at 10:48 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On Mon, Feb 22, 2021 at 5:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> w=
rote:
> >
> > The domain lookup for linux-mips.org fails for quite some time now. Hen=
ce,
> > webpages, the patchwork instance and Ralf Baechle's email there is not
> > reachable anymore.
> >
> > Remove all references of webpages from linux-mips.org in MAINTAINERS, a=
nd
> > refer to the kernel.org's linux-mips patchwork instance instead.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  MAINTAINERS | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e949e561867d..703a50183301 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4980,7 +4980,6 @@ DECSTATION PLATFORM SUPPORT
> >  M:     "Maciej W. Rozycki" <macro@orcam.me.uk>
> >  L:     linux-mips@vger.kernel.org
> >  S:     Maintained
> > -W:     http://www.linux-mips.org/wiki/DECstation
>
> Why not use the web archive? The information is still valuable.
> https://web.archive.org/web/20190704000315/https://www.linux-mips.org/wik=
i/DECstation
>

If that information is valuable, how about adding that into the kernel
documentation page?

If linux-mips.org wiki is back, we will keep this link; if not, we
should get a copy of that information into the documentation (where it
can survive some time) or we simply drop it.

Putting a web.archive.org link into MAINTAINERS sounds like a really
bad idea to me.

Lukas
