From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v2 3/3] arch: mips: remove dead references
Date: Sat, 17 Jul 2021 08:53:44 +0200
Message-ID: <CAKXUXMwsiOMX0CismKBhcopkNtCUTmwDxQTC9KOBYQ2VfK6q-g@mail.gmail.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
 <20210625110419.24503-4-lukas.bulwahn@gmail.com> <CAAdtpL6CMAbBPJr3La31Y3AYY48TjLZhDHjKWjUJxXdBS--Xmw@mail.gmail.com>
 <alpine.DEB.2.21.2106261919300.37803@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7g1basq9FIMEpxZHyAA7wCvpnCVvOwjerdE9BRFHgr4=;
        b=jx2mOZGG/9NAOBxuu+ImUitJqa/QecCGWQ2n/a+OaVrhni/m6bAT+dLEAV5p4xDTtQ
         1wCnldiCQMzzE8TEP71/J0qWgJiiimwpRwzt9XfVyL/NWWJTsukjCkAM6VLOn+OgMMQY
         PjayFSCUHZG3ScrB5X38+V/7xGbZJv/09cSd5yeUc5lixwu6sTL8jK5VqEXpS+faz2RU
         5VoDAE4uSvYorO3I9T4Iq+SglZ3SGO5biixnFxPg3byx6luGl8wklN47LJLqj186kxhg
         mup+Be9QlHYVrhKGVKOJ3CkVmkha11cgFzgQ1y9epECo7u3CO6bSiBQ9l8P9QqOOEyAg
         piHg==
In-Reply-To: <alpine.DEB.2.21.2106261919300.37803@angie.orcam.me.uk>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sat, Jun 26, 2021 at 7:22 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote=
:
>
> On Sat, 26 Jun 2021, Philippe Mathieu-Daud=C3=A9 wrote:
>
> > >   http://www.computer-refuge.org/classiccmp/ftp.digital.com/pub/DEC/T=
riAdd/
> >
> > https://web.archive.org/web/20050205114151/ftp.digital.com/pub/DEC/TriA=
dd/
>
>  I suggest: <ftp://ftp.hp.com/pub/alphaserver/archive/triadd/> as the
> canonical reference nowadays.  If that goes offline sometime, we can thin=
k
> of an alternative.
>

Thanks, Maciej. I will update the reference to that location, when I
come across to send the next version of this patch set.

Lukas

>   Maciej
