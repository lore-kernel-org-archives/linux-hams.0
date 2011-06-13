From: f8arr <f8arr@f8arr.org>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Mon, 13 Jun 2011 22:28:22 +0200
Message-ID: <4DF672E6.7050403@f8arr.org>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4DF66BF8.6090003@shom.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hello,

I'm not sure because I found the problem to resolve my issue :

stty --file=3D/dev/ttyUSB0 clocal

I remove all flow control on the serial.

Has I have two same USB controler, I made a diff from USB0 to USB1 :

# diff usb0 usb1
5c5
<  -parenb -parodd cs8 hupcl -cstopb cread clocal -crtscts
---
>  -parenb -parodd cs8 hupcl -cstopb cread -clocal -crtscts

This is the only difference... maybe there is a configuration somewhere=
 at boot that specify such parameters. Has i'm not really aware of hard=
ware configuration I'll investigate to resolve on the source.
(instead of putting a line on my .profile ;-)

f8arr



On 06/13/2011 09:58 PM, Bruno Tr=E9guier wrote:
> Le 13/06/2011 =E0 21:24, f8arr a =E9crit :
>> mtp-probe: bus: 3, device: 8 was not an MTP device
>
> Hello Guillaume,
>
> Your problem might be related to that bug:
>
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D630202
>
> I guess it can occur in other Linux distros, so even if you're not=20
> running Debian, you might be concerned too.
>
> This bug is still in "open" state, in the meantime, if you don't need=
=20
> "libmtp-runtime" (or its equivalent in your distro), the temporary=20
> solution is to remove it, or at least the "mtp-probe" binary which=20
> seems to be responsible for this buggy behaviour.
>
> Best Regards,
>
> Bruno - F8FIV
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
