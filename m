From: "jbennett" <jbennett@insightbb.com>
Subject: Re: 4 port serial card.
Date: Sun, 12 Jan 2003 14:22:38 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <008a01c2ba78$5a14a720$0701a8c0@lz130>
References: <3E20FF68.000003.11949@gizmo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ray Wells <mvc@dodo.com.au>, linux-hams@vger.kernel.org

Not stated in the message, but I would assume that this is an ISA card.
Unless you are out of IRQs, I would suggest selecting individual IRQs. This
would eliminate the need for any special driver. You should then be able to
use setserial. I know these are dirty words here, but Norton Utilities
ndiag.exe for DOS might be able to help you determine if the IO address and
IRQ for each port is set correctly before trying to use setserial. When
using setserial, be sure you have copied and renamed the appropriate serial
script for your OS to init.d and use chkconfig so that it runs at startup.
Also would suggest using the -z option with setserial to insure you don't
inherit any prior settings. That can cause a great deal of grief.

GL es 73
John Bennett
n4xi

----- Original Message -----
From: "Ray Wells" <mvc@dodo.com.au>
To: <linux-hams@vger.kernel.org>
Sent: Saturday, January 11, 2003 11:38 PM
Subject: 4 port serial card.


> Hi All,
>
> This enquiry relates to a four-port serial card for a Linux BBS so I hope
it
> s directed to the right place.
>
> I acquired a four-port serial card that I'm trying to identify.
>
> I've checked out the latest serial-howto but to no avail so I'm hoping
> someone on this list may be able to assist.
>
> The card in question was made in Australia about 1992 (copyright allaw
1992)
> and carries the identification COM-4 (a brand name ??).
>
> It has four 16550 UARTS and individual jumpers for each port to set
comport
> number and IRQ. Additionally, there is an 8 way DIP switch which permits
> selection of operation under a single IRQ, among other things.
>
> The documentation says that Windows, Pick, Xenix, Unix, Concurrent DOS and
> DOS are supported.
>
> I don't have the drivers :-(
>
> Does anyone know anything about this card? My BBS is crying out for it for
> additional radio ports :-)
>
> TIA
>
> Ray Wells VK2TV
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

