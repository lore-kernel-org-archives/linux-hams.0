From: f8arr <f8arr@f8arr.org>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Tue, 14 Jun 2011 23:06:33 +0200
Message-ID: <4DF7CD59.4020007@f8arr.org>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr> <4DF672E6.7050403@f8arr.org> <4DF678B0.1080600@shom.fr> <4DF67C02.4060200@radagast.org> <4DF68088.9070501@f8arr.org> <4DF7CA10.1090202@f8arr.org> <4DF7CC0F.8020602@shom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4DF7CC0F.8020602@shom.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

yes..

nothing.. (as root)

But I remember that there was a daemon that was working on serial by=20
default on linux.. I'am wrong ?
I'm unable to remember.

f8arr

On 06/14/2011 11:01 PM, Bruno Tr=E9guier wrote:
> Le 14/06/2011 =E0 22:52, f8arr a =E9crit :
>> Hello
>>
>> Some progress on my acknowledge...
>>
>> When the PC start, my DTR of my USB-RS232 is up (-6v).
>> It mean that a program or a daemon is listenning and/or managing my
>> serial. I don't want it because i'll use it directly from Wsjt.
>>
>> If someone has an idear where to search...
>
> Hi Guillaume,
>
> Have you tried using "fuser" to see which process was using your tty =
?
>
> A simple "fuser /dev/ttyUSB0" (preferably as root) should do the tric=
k...
>
> Best regards,
>
> Bruno - F8FIV
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
