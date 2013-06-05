From: Alejandro Santos <alejolp@alejolp.com.ar>
Subject: Re: AX.25 now supported in Wireshark 1.10.0
Date: Wed, 5 Jun 2013 19:02:09 -0300
Message-ID: <CAOnrUC3MpBmryk1bnZZBQo1mTgYDKbmtQepk1H6aHsAyzGmAyA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hurray!

LU4EXT


On Wed, Jun 5, 2013 at 6:42 PM, Richard Stearn
<richard@rns-stearn.demon.co.uk> wrote:
>
> For those who would like to use Wireshark on AX.25 the following
> protocols have been added at Wireshark 1.10.0:
>
>         AX.25,
>         AX.25 KISS,
>         AX.25 no Layer 3,
>         BPQ,
>         NET/ROM,
>         FlexNet,
>         Rose,
>         TCP/IP over AX.25,
>         APRS
>
> Currently dissection of these protocols is known to work only for Linux.
>
> In the cases of:
>         TCP/IP  - the existing Wireshark TCP/IP dissection is called
>         Rose    - the existing Wireshark X.25 dissection is called
>
> Source and some binary packages are available from the Wireshark
> download site http://www.wireshark.org/download.html
>
> For MS-Windows, WinPcap will probably need to be updated to handle the
> necessary raw packet types AX.25 & AX.25 KISS.
>
> My thanks to all those who assisted in this effort.
> --
> Regards
>         Richard
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html




--
Alejandro Santos
