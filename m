From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: soundmodem and fedora c3
Date: Thu, 10 Mar 2005 07:43:02 +0100
Message-ID: <200503100743.02472.pa3gcu@zeelandnet.nl>
References: <BAY104-F15F9ECFFC4D95DADD060958B510@phx.gbl> <422F2365.80902@cox.net>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <422F2365.80902@cox.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On Wednesday 09 March 2005 17:25, you wrote:
> This was bothering me so I took another look. =A0I loaded my original=
 FC3
> =A0 .config into menuconfig. =A0Amateur radio support was not enabled=
=2E =A0I
> loaded the .config I am currently using and it definitely was enabled=
,
> so I must have had to turn it on when I enabled KISS.

There is no support for Ham protocols in Fedora3 kernels, you need to m=
ake=20
your own kernel if you require ham radio support.

>
> I hope I didn't confuse the issues with my previous post. =A0I don't =
think
> you =A0need AX25 support in the kernel to use soundmodem, but if you =
want
> MKISS then you have to enable AX25 to get it (unless you manually edi=
t
> .config, which is a really, really bad idea).

Well some say it is bad but most know its the easyest way to change thi=
ngs.
If you simply delete the section for AX25 support and its sub protocols=
 and=20
then run make oldconfig it will automaticly stop and ask you if you wan=
t AX25=20
support in the kernel or as modules, when you select one or the other y=
ou=20
will then be asked about netrom, rose, mkiss, scc drivers and the likes=
=2E
As soon as the last question has been answered the config process will =
fly on=20
to the end.

Good or bad idea, well i=B4ve done it that way for years and never had =
problems.

> The reason I needed AX25=20
> was that I have some other AX25 apps that require it. =A0I haven't tr=
ied
> routing between those devices and soundmodem, but I imagine you could=
 do
> it with a pty/tty pair as Luc suggested.
>
> Jeff

Ron VE3DTT wrote.

> I still have a question which relates to the above postings by Richar=
d Adams=20
> and Jeff Camp. My boot configuration tells me that I don't have ham r=
adio=20
> support but menuconfig contains all asterisks in this area including =
ax.25,=20
> tellimg me that this is built-in. Is this a contradiction or am I=20
> misinterpreting it? Do I still have to re-build the kernel for ax.25 =
support=20
> or am I simply looking at a configuration issue?

You may well have changed things yourself, but if you did not compile a=
nd=20
install another kernel then you dont have AX25 support anywhere.

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
