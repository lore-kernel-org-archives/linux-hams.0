From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ftp - Re: MiniLinux
Date: Tue, 3 Sep 2002 14:49:43 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0209031449430B.09346@unix.pa3gcu>
References: <20020903073458.46101.qmail@web14401.mail.yahoo.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020903073458.46101.qmail@web14401.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vivi Kusumo <vivi_ksm@yahoo.com>, linux-hams@vger.kernel.org
Cc: M Taylor <mctylr@privacy.nb.ca>

On Tuesday 03 September 2002 07:34, Vivi Kusumo wrote:

> $ftp ftp.torun.ampr.pl
> ftp: connect: Network is unreachable


Well i have checked here, the above URL is reachable readable and ftp'able.
It could have been down when you tryed, works fine here with 'ftp' of ftp 
with netscape, no problem at all.

>
> $ftp ftp.torun.ampr.pl /pub/hamradio/linux/minilinux
> ftp.torun.ampr.pl: bad port number--
> /pub/hamradio/linux/minilinux usage: ftp host-name
> [port]
>
> I don't know the port number.

AFAIK, you cant do the above with 'ftp' there is a whitespace after the 
address field.
You can do the following with 'ncftp'

 ncftp ftp://ftp.torun.ampr.pl/pub/hamradio/linux/minilinux

>
> Thanks for any help.
> Vivi

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

