From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
Date: Wed, 13 Jul 2022 19:28:03 +0200
Message-ID: <CAH4uzPN+dUmuLVTdO6qHTiHbKUisxRpi94ydEh8Dtt7S2O9ujQ@mail.gmail.com>
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
 <YPlpLpL3Yrz/YE6R@linux-mips.org> <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
 <YPmo1cAlGdIkapxL@linux-mips.org> <CAH4uzPMXHnR+Z60iCA41FYsbDViQ5K2kMC_YWC1r4EaWMKiT8w@mail.gmail.com>
 <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=LqGYwLswQZBHJ6NDnaQidlEq158iOQOfcZlhJHuvTaw=;
        b=W8R7s8NX/x1dsv574sdRmDax7BqLuEsiHGpdnWQctj/P6Ko4+C2NS77K67RjMbelzS
         xJxxQC3QHEC3T9r9R4ozb1nIzJ3xWJOF3C5ortiovE0SI7GfmEhBszmqFRGl0/6rNtBT
         UHAp7AB5tVduA6daQjs8Nvvi180L2kCVCZCbYbg6CseIjL4xh6vcA6R8u8fuRRkbyty6
         fbXmgrwJFK608JE1HyZBYC5ILHVRuTzjpNy+CE/pLsjsMx/tnq6jvpE83zOPubIFfbRL
         EJnu7RLU8foze5ZIm+/V0evP8nUHrfUjW5VRNGDhk50tbb7mM71gxOJzCbJhyCVdfKyg
         jy+Q==
In-Reply-To: <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org

Hi,

Any updates on this one? I think we're still not able to use a 5.x
kernel with NETROM due too it's leaking all kinds of sensitive
information/data?

73! Dave

Op vr 15 okt. 2021 om 11:28 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> Hi,
>
> Any update on the security issue? It's a shame to be forced using an
> old kernel (4.19 or lower) to not being affected by this.
> Is anybody else able and willing to investigate and resolve this
> serious breach?
>
> 73! Dave
>
> Op do 22 jul. 2021 om 19:38 schreef Dave van der Locht
> <d.vanderlocht@gmail.com>:
> >
> > Ralf;
> >
> > This dump is from a 32-bit ARM system indeed. Same behaviour was seen
> > on 64-bit x64.
> >
> > I hope it can be found and fixed soon as it's 'leaking' sensitive information.
> >
> > Kind regards,
> > Dave van der Locht
> >
> >
> > Op do 22 jul. 2021 om 19:20 schreef Ralf Baechle <ralf@linux-mips.org>:
> > >
> > > On Thu, Jul 22, 2021 at 03:28:30PM +0200, Dave van der Locht wrote:
> > >
> > > > Some ELF binary data fragment in a NETROM frame (I think):
> > >
> > > [...]
> > > > 0090   80 00 ff ff ff ff 7f 45 4c 46 01 01 01 00 00 00   .......ELF......
> > > > 00a0   00 00 00 00 00 00 02 00 28 00 01 00 00 00 ac 17   ........(.......
> > >
> > > I took a closer look and decoded the ELF header manually.  This would be
> > > a 32-bit ARM system, is that right?
> > >
> > > Will do yet some more decoding on the packets.  My first working theory
> > > is that memory for ththe packets is allocated too large, not zeroed and
> > > so eventually gets sent out.
> > >
> > >   Ralf
