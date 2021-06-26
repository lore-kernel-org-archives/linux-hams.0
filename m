From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 3/3] arch: mips: remove dead references
Date: Sat, 26 Jun 2021 18:52:28 +0200
Message-ID: <CAAdtpL6CMAbBPJr3La31Y3AYY48TjLZhDHjKWjUJxXdBS--Xmw@mail.gmail.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com> <20210625110419.24503-4-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20210625110419.24503-4-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Fri, Jun 25, 2021 at 1:05 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> The domain lookup for linux-mips.org fails for quite some time now.
> Further, the two links:
>
>   http://decstation.unix-ag.org/

https://web.archive.org/web/20061010210936/http://decstation.unix-ag.org/

>   http://www.computer-refuge.org/classiccmp/ftp.digital.com/pub/DEC/TriAdd/

https://web.archive.org/web/20050205114151/ftp.digital.com/pub/DEC/TriAdd/

> refer to old webpages or contain no further technical information.

FWIW the information is still online somewhere.

> Remove all those dead references.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/mips/Kconfig             |  8 +-------
>  arch/mips/jazz/Kconfig        | 12 +++---------
>  tools/include/nolibc/nolibc.h |  3 +--
>  3 files changed, 5 insertions(+), 18 deletions(-)
