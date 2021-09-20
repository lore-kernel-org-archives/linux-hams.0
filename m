From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: AX25 disconnect patch and ROSE socket failure
Date: Mon, 20 Sep 2021 14:17:57 +0200
Message-ID: <CAH4uzPOF9Gj4he+ZpQ93rtPuTei43LoJAmrKpHBPt8OokFzgAg@mail.gmail.com>
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr> <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr> <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net> <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
 <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com> <3345fdf3-26e7-5f2c-cbf0-53026a76399a@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iDmSRXxV/4NC5Np3GCK1I6Wb2BD3eKB1qP7dPjMtRaQ=;
        b=U2Rfn4bdrm+/vlusqwXJxKZoJaIoN1jQgbAlLydtzMO87Mz5bqpJF4RmvoTv46wScS
         fgY63JiX93az0YH9mbRbuUdVxGW6dZh4w6bptfR11eCQYelJBTOs8VQKKrVEIMZWtzvH
         fXL1/cxcGGj5IM0c0mcAui8y7UjbbOkO82/9wxRcMUEvqWcm6jvc3eh1/NpvgXKMC8qL
         wFFpnLFjuWQqYjbyTNfFZi4wvWH/NYF78SfsqG5oKOVJYhMiiqs4RRJIWjZnFb4wjrLE
         VdK37ZGQw+ZFET8ZZNMztfIjMCCBV6VcN/HDl9AB11dhVdmDRQcvH5jQIcOPFvlRVFC1
         +w5A==
In-Reply-To: <3345fdf3-26e7-5f2c-cbf0-53026a76399a@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Schwarz <roland.schwarz@blackspace.at>
Cc: linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>

Hi Roland,

Op ma 20 sep. 2021 om 12:53 schreef Roland Schwarz
<roland.schwarz@blackspace.at>:
>
> Hallo Dave,
>
> On 19.09.21 at 20:07 wrote Dave van der Locht:
>
> > Well... That problem is there for quite some years now and there still
> > isn't a solution.
>
> Have you seen Ralfs comment?
> > I wasn't even aware of these patches and an internet search didn't turn
> > up anything.
>
> So it looks to me as if no one had tried to contact the maintainer via
> this list before. I don't believe it is the duty of a maintainer to
> track all possible places on the net for issues, do you?

I've seen Ralf's comment, which suprised me. I was told by several HAM
application developers that particular patch has been rejected several
times in the past and there are more threads here regarding the issue.
I don't know by who and the technical reason/explanation about it and
its complete history. Of coarse I understand it isn't a task of a
maintainer to keep track of all possible places on the net regarding
this issue.

Hopefully it will be investigated and solved now Ralf is aware of the issue.

>
> > Although that proposed solution might not be the root cause I'm
> > wondering what the real root cause is and why it's still not
> > researched and fixed after years with everyone complaining about it.
>
> Again it's two months at best and this is not much time.

See my comment above.

>
> > In the mean time it still seems better to have a good work-around than
> > a pretty useless AX.25 stack.
>
> The work around already is there. One just need to compile with the
> patch in place.

For me and a lot of other users who know how to do it I agree. For
most HAM radio enthousiasts it's been proven to be a big challenge to
do and keep up with kernel updates too.
Currently there's a security issue with kernel 5.4 and up too
regarding NETROM, so for now we're stuck to 4.19 with patch to keep
things stable and safe regarding AX.25 + NETROM.

>
> 73 de Roland oe1rsa

73! Dave
