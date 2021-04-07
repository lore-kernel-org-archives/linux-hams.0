From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 4/6] fs/jffs2: Delete obsolete TODO file
Date: Thu, 8 Apr 2021 00:20:17 +0200
Message-ID: <CAFLxGvy7vKJHAms-QAyhcUiv58GYQy+zy3AZ3hP_g+tmh-X4xg@mail.gmail.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com> <1617087773-7183-5-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ner43B1c7JahH39vGo3hPzauiEoC0Ok0VtKiG5WaEkY=;
        b=U16K0peTEaFDRZyiGqG5dTqKXCkKnJRPaNxJmbe3Q1Sg+u+XdBREmoPk9D4QGlPs5S
         eTTzVZabqfO+GDt9sCXNTUNN7zPqDYAwEn/+f1DLP5YiPjdgVRptDaBiPpYpOQLEQWeE
         t7lF2JbRy5iYwmiS/bJfdY9wv3rjHc1YWXsBlgjnAnXwVhZWzIfsGph7UJ6fQc4MSqkm
         v1pgLQlSm4eycU9hOmk4BInbijaFF+2qzoygqyipg1Ovqc4qsO3VU+eZKFmfHpWgy+yM
         cFlr/DFB9mOdGNdSs6D1jITwediB2I33I9gGyJAwfQTLgdHMu4BcSJ57rpvOpM6FRZsG
         1NYQ==
In-Reply-To: <1617087773-7183-5-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Qing <wangqing@vivo.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net, Greg KH <gregkh@linuxfoundation.org>

On Tue, Mar 30, 2021 at 9:07 AM Wang Qing <wangqing@vivo.com> wrote:
>
> The TODO file here has not been updated for 14 years, and the function
> development described in the file have been implemented or abandoned.
>
> Its existence will mislead developers seeking to view outdated information.

Did you check whether all items in this list are really outdated?
Nobody shall ever blindly follow a TODO list without checking first which
points are still valid or not.
Removing that file does not magically solve the issues it describes.

-- 
Thanks,
//richard
