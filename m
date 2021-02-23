From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] arch: mips: remove dead references
Date: Tue, 23 Feb 2021 10:59:44 +0100
Message-ID: <CAAdtpL7tj2CvK9w8PNofu1C6Do0gojwWgupJmB_XEYto+EEf3A@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-5-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20210222161905.1153-5-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Mon, Feb 22, 2021 at 5:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> The domain lookup for linux-mips.org fails for quite some time now.
> Further, the two links:
>
>   http://decstation.unix-ag.org/

https://web.archive.org/web/20070609185805/http://decstation.unix-ag.org/

>   http://www.computer-refuge.org/classiccmp/ftp.digital.com/pub/DEC/TriAdd/
>
> refer to old webpages or contain no further technical information.
>
> Remove all those dead references.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/mips/Kconfig             |  8 +-------
>  arch/mips/jazz/Kconfig        | 12 +++---------
>  tools/include/nolibc/nolibc.h |  3 +--
>  3 files changed, 5 insertions(+), 18 deletions(-)
