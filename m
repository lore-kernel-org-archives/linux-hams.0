From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v2 3/3] arch: mips: remove dead references
Date: Sat, 17 Jul 2021 08:52:20 +0200
Message-ID: <CAKXUXMxJS-H7ZtM0deSN493aQACTtbHH+y8C-f3XKANsH3UCHg@mail.gmail.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
 <20210625110419.24503-4-lukas.bulwahn@gmail.com> <CAAdtpL6CMAbBPJr3La31Y3AYY48TjLZhDHjKWjUJxXdBS--Xmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fj4r/axWRIO6jSTkcRS6R08Hk59RDdA00RhrYBvWubg=;
        b=PTmyJ9xuIut1vhuWMO/d0Zk/gcwgE0m2uYvkM3OcYBxo1lK07xxCASqH6KPVdIcbwB
         O5X1X9we+GG4MGX+Wdp/or8XRYjo3q88MNgI67HDI2by+Mh3QJpei/OZFn61YSk2fU/d
         OmnIlWWyBx4DVKy9zYNBRPd0NZEKVnTIdOYjPHJaGBQKvBWwzrjmXOsGiJs19pMP+iD6
         qje39jgGTUS/wa2WY0VJV3hizLG961fQ43YXLd19dnhxa4KEJ2ZBhMkvaG0k3o/MC2+W
         SGvANFiHZRzkqHjSYDIA61hBZUw8bNaVomP/aQZgJJ9gFTaOKqtKb61t61r2qm8LZimc
         m9hA==
In-Reply-To: <CAAdtpL6CMAbBPJr3La31Y3AYY48TjLZhDHjKWjUJxXdBS--Xmw@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sat, Jun 26, 2021 at 6:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On Fri, Jun 25, 2021 at 1:05 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> w=
rote:
> >
> > The domain lookup for linux-mips.org fails for quite some time now.
> > Further, the two links:
> >
> >   http://decstation.unix-ag.org/
>
> https://web.archive.org/web/20061010210936/http://decstation.unix-ag.org/
>
> >   http://www.computer-refuge.org/classiccmp/ftp.digital.com/pub/DEC/Tri=
Add/
>
> https://web.archive.org/web/20050205114151/ftp.digital.com/pub/DEC/TriAdd=
/
>
> > refer to old webpages or contain no further technical information.
>
> FWIW the information is still online somewhere.

Thanks, I prefer not to reference archive.org links, because I do not
think that is generally a good practice. But maybe somebody with some
mild interest in this architecture can support scanning through the
archived web pages and we store any information still worth mentioning
in the kernel Documentation?

Lukas

>
> > Remove all those dead references.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  arch/mips/Kconfig             |  8 +-------
> >  arch/mips/jazz/Kconfig        | 12 +++---------
> >  tools/include/nolibc/nolibc.h |  3 +--
> >  3 files changed, 5 insertions(+), 18 deletions(-)
