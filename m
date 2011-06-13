From: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Mon, 13 Jun 2011 22:53:04 +0200
Message-ID: <4DF678B0.1080600@shom.fr>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr> <4DF672E6.7050403@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shom.fr; s=20100103;
	t=1307998385; bh=qUVnH7IjfUHwkrb/zJyrOAyKFh7TG56BNzC17PayHBE=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=JiqwKIUC5lLs
	b6veOHsPylRBavY/mt90lqMZMlVK2ira4un4H4SavVyF5gvzdYnlRx33IbspbAGHb5o
	7Yagun7Wz0Xgsm+Ws0kS3+C9F5+1FLtC5Hq9lm0i8c6wQFFr6Iv+Y0xdHO1RA4vR9X6
	nGYLm2DGFfgw4Z9XY69iR8jEw=
In-Reply-To: <4DF672E6.7050403@f8arr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Le 13/06/2011 =E0 22:28, f8arr a =E9crit :
> Hello,
>
> I'm not sure because I found the problem to resolve my issue :
>
> stty --file=3D/dev/ttyUSB0 clocal
>
> I remove all flow control on the serial.
>
> Has I have two same USB controler, I made a diff from USB0 to USB1 :
>
> # diff usb0 usb1
> 5c5
> < -parenb -parodd cs8 hupcl -cstopb cread clocal -crtscts
> ---
>> -parenb -parodd cs8 hupcl -cstopb cread -clocal -crtscts

Ok, sorry for that, I made the wrong assumption that your /dev/ttyUSB0=20
device didn't even exist and that it was the reason you could not have=20
any access to it.

This is quite strange as (at least as far as I know) PL2303 chips=20
usually cope quite well with flow control. I've been using quite a few=20
of them here, but never on Fedora Core however (thought I doubt this=20
makes any difference here).


> This is the only difference... maybe there is a configuration somewhe=
re
> at boot that specify such parameters. Has i'm not really aware of
> hardware configuration I'll investigate to resolve on the source.
> (instead of putting a line on my .profile ;-)

;-)

Regards,

Bruno - F8FIV
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
