From: =?ISO-8859-15?Q?P=E4r?= <perpetum@home.se>
Subject: Re: Gmfsk 0.6beta3 segmentation fault with Mandrake 10
Date: Sun, 14 Mar 2004 09:05:17 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4054204D.8030909@home.se>
References: <4052C5F5.8070903@home.se> <1079182965.1271.1.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1079182965.1271.1.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: Linux Hams <linux-hams@vger.kernel.org>

Tomi Manninen wrote:

>On Sat, 2004-03-13 at 10:27, P=E4r wrote:
>
> =20
>
>>Has anyone tried getting gmfsk to work with Mandrake 10 ?
>>It compiles and installs nicely but when I try to run it crashes
>>after the initial wizard. It will present a nice "segmentation
>>fault" every time now.  Any hints ?
>>   =20
>>
>
>This seems to happen with certain versions of Gnome libs. Please
>try the attached patch.
>
> =20
>
I tried switching to Mandrake 9.2.1 and got the same segfault there as
well. I've applied the patch and it seems to work, no segfaults now.
I'll retry it on Mandrake 10 but as I got the same errors in 9.2.1 as i=
n
10 I guess it will work in 10 as well now (will check).
Thank you !

/P=E4r

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
