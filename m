From: f8arr <f8arr@f8arr.org>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Tue, 14 Jun 2011 22:52:32 +0200
Message-ID: <4DF7CA10.1090202@f8arr.org>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr> <4DF672E6.7050403@f8arr.org> <4DF678B0.1080600@shom.fr> <4DF67C02.4060200@radagast.org> <4DF68088.9070501@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4DF68088.9070501@f8arr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hello

Some progress on my acknowledge...

When the PC start, my DTR of my USB-RS232 is up (-6v).
It mean that a program or a daemon is listenning and/or managing my=20
serial. I don't want it because i'll use it directly from Wsjt.

If someone has an idear where to search...

73 qro
=468ARR

On 06/13/2011 11:26 PM, f8arr wrote:
> hum...
>
> you are right the Issue is not clear.. something is going wrong...
> I have to investigate.
>
> 73 qro
> f8ARR
>
> On 06/13/2011 11:07 PM, Dave Platt wrote:
>> On 06/13/2011 01:53 PM, Bruno Tr=E9guier wrote:
>>> Le 13/06/2011 =E0 22:28, f8arr a =E9crit :
>>>> Hello,
>>>>
>>>> I'm not sure because I found the problem to resolve my issue :
>>>>
>>>> stty --file=3D/dev/ttyUSB0 clocal
>>>>
>>>> I remove all flow control on the serial.
>> I don't think that "clocal" removes flow control (on RTS/CTS) -
>> that's controlled by a separate option.
>>
>> What "clocal" does, is "disable modem control signals".
>> Specifically, for a port marked "-clocal" (not local),
>> an open() call will block until the device on the port
>> asserts the CD (carrier detect) line, and if the CD
>> line is deasserted the port will "hang up".  This is
>> useful for serial ports connected to dial-up modems,
>> but not particularly desirable for serial ports being
>> used to control local devices such as transceiver.
>>
>> I can't recall whether a -clocal port automagically
>> asserts DTR even when it isn't open... I don't think so
>> but I could be wrong.
>>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
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
