From: Dan Cross <crossd@gmail.com>
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
Date: Fri, 15 Jul 2022 08:18:30 -0400
Message-ID: <CAEoi9W6wSAG3FHvqVB6p6GdFp44=d=NjFAL6c2JfWHyCjenqWA@mail.gmail.com>
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
 <YPlpLpL3Yrz/YE6R@linux-mips.org> <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
 <YPmo1cAlGdIkapxL@linux-mips.org> <CAH4uzPMXHnR+Z60iCA41FYsbDViQ5K2kMC_YWC1r4EaWMKiT8w@mail.gmail.com>
 <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com> <CAH4uzPN+dUmuLVTdO6qHTiHbKUisxRpi94ydEh8Dtt7S2O9ujQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jSvYAeAIJFf07uogcZKXr9ZzPPjkyHH1o/p7a6UG+M0=;
        b=T6l27ZZONIelTb3PKz5nGr/eOws1rQ3BPYy1xDDrfNWui7MS7+Dbhh2900AbiiLq0q
         cAFhCVtuTuMUQMirm+1oZmpoI6UUz46ckDjL17q77BWEQJ03nSC3F5EPmu/oM1mIFMw2
         OBDROJ71SgOMldwwiUOlIWmfv57+ElQmVuz/CeMggUqkloR2UCZ3PDzPTYNj6m0dF8h0
         OLsrz0zVYnMLY9S9j5lVZtMneYURNTI+qPUGpj5L3Bf1oOyUvZm29fe2sf/LKPmmfNxX
         Bz0DIrhr6CO7ihfy+UkjC2oYY8Hp+4+7rYoYW3Qlhrz9AHZ6FLLUP4Lkn0ABkr13kHId
         uN8A==
In-Reply-To: <CAH4uzPN+dUmuLVTdO6qHTiHbKUisxRpi94ydEh8Dtt7S2O9ujQ@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave van der Locht <d.vanderlocht@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org

On Wed, Jul 13, 2022 at 1:38 PM Dave van der Locht
<d.vanderlocht@gmail.com> wrote:
> Any updates on this one? I think we're still not able to use a 5.x
> kernel with NETROM due too it's leaking all kinds of sensitive
> information/data?

I'll note that NETROM seems to have other problems, particularly
when used in conjunction with AXIP/AXUDP. I have observed it
getting into "loops" when communicating with distant systems, in
which the distant end continues sending my machine traffic that
is acked, but the acks never never move the session along.

I'm afraid this is a bit handwavey, but I can provide packet traces
for anyone who's interested in looking into what may be going on,
as I have found the errant behavior trivial to induce.

        - Dan C.
