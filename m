From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: AX25 disconnect patch and ROSE socket failure
Date: Sun, 19 Sep 2021 20:07:35 +0200
Message-ID: <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com>
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr> <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr> <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net> <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJsRc61ZbN63c/hDW4uZRBA+KADemCNd47czjQr32qg=;
        b=EbqwHcZlK+jf0kGrti/cPSoguKtavdardG0Ho1Btl/l4kTFQ5zQWwVLTjDQjs8u0c5
         +VCjmEJhPjfXPhCO/kGcN/M8rOCCiCtOoNP4ijXi0WYgIEj60dMOUmqamKRSR313enPc
         2J1txpJ0TtNAAGPqJV2pBs2DmyekzbO5AGgRrgJDItw3WYDJLAdb1VdCtesK0D/vrbJD
         TDG4H2QNp/ZH8hadZbwCUYVxKUpt6PyOLVU3RWOlA0oSJrsG507EZW79l+99OlQygrsp
         Y56xXLEAzzI22N5LTbuPpSNdT8iE2b4wwTRh0HS5KfdZbKEPcG5a/GbB7L3MI6swtR6V
         TrZA==
In-Reply-To: <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Schwarz <roland.schwarz@blackspace.at>
Cc: linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>

Hi Roland,

>
> Hallo David,
>
> On 19.09.21 at 17:22 wrote David Ranch:
> >
> > ... I'm talking about bugs like the
> > hung-after-disconnect AX.25 connections issue, minor AX.25 packet loss
> > issues, etc.  I think all of us want to see those get fixed first.
>
> It seems like the proposed solution will not fix the root cause of the
> problem. I didn't quite understand, but under certain circumstances it
> seems to be possible to get up to a quadruple call of the function.
> Anyway, Ralf told me that he will take another look at the proposed fix.
>

Well... That problem is there for quite some years now and there still
isn't a solution. The proposed solution might not fix the root cause,
but it sure helps keeping things working. Personaly I haven't seen ANY
problems or side-effects with using that proposed solution since
kernel 4.9.
And if there are any, I think they're having way less impact than it
currently has. Currently it's pretty useless without patching to be
honoust.

Although that proposed solution might not be the root cause I'm
wondering what the real root cause is and why it's still not
researched and fixed after years with everyone complaining about it.
In the mean time it still seems better to have a good work-around than
a pretty useless AX.25 stack.

73! Dave
