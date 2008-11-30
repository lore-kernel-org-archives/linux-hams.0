From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: debugging KISS basics
Date: Mon, 01 Dec 2008 07:37:38 +1100
Message-ID: <4932F992.5000305@exemail.com.au>
References: <200811281632.mASGWxi3021582@moose.dimebank.com> <4932755A.6020904@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4932755A.6020904@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pidoux <f6bvp@free.fr>
Cc: Chris Kantarjiev <cak@dimebank.com>, linux-hams@vger.kernel.org

Pidoux wrote:
> Chris,
>
> When TNC is in KISS mode you cannot issue any more command to it.
> Every data received are transparently transmitted (except the escape=20
> sequence for putting it back into TERMinal mode.)
> Thus, you must set the TNC parameters (like the serial port speed,=20
> MYCALL, dual port mode if TNC3, and adjust different audio TX levels=20
> for once) before putting the TNC in kiss mode.
> In addition, once AX25 driver is loaded, you cannot converse with TNC=
=20
> using your favorite Linux terminal communication program.
> My option is to boot Linux system without AX25 drivers, configure TNC=
=20
> parameters, verify that you can listen to AX25 traffic and connect to=
=20
> a local AX25 station using 1200 or 9600 baud port. Then, when you=20
> estimate your TNC is doing well, send it the escape sequence command=20
> to turn it into KISS mode.
> You can leave it in KISS mode forever.
> After that you are ready to load AX25 and mkiss drivers and run AX25=20
> applications.
> Listen utility will help you verify the TNC can pass through AX25=20
> traffic.
>
> 73 de Bernard, f6bvp
>
>
> Chris Kantarjiev a =E9crit :
>>>
>>> Wade through this document http://rose.fpac.free.fr/MINI-HOWTO/
>>
>> Thanks, Ray - that was very useful for learning about config
>> and startup.
>>
>> I'm still trying to figure out how to debug the fact that
>> my basic KISS commands won't cause the TNC to do anything...
>>
>> 73 de chris K6DBG
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
>
Bernard,

You didn't mention kissparms (man 8), the description of which says ...
"Kissparms is used to dynamically configure KISS TNCs that have been se=
t=20
up for AX25 use by kissattach. This program uses the packet interface t=
o=20
allow it to communicate with the KISS TNC without interrupting the AX25=
=20
data stream. Therefore the KISS parameters may be set at any time durin=
g=20
the operation of the AX25 port.

Chris, if your TNC is TNC2 compatible you might consider a KISS only=20
EPROM. Then you know it's always in KISS. Also, the KISS implementation=
=20
in a native mode TNC2 EPROM has terrible timing issues (not sending dat=
a=20
to the radio, and then sending over the top of a received station were=20
two significant issues I found. The KISS only unit doesn't have these=20
problems.


Ray vk2tv
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
