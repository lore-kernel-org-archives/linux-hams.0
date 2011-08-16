From: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Subject: Re: KISS TNC problems with kissattach and mkiss
Date: Tue, 16 Aug 2011 13:08:21 -0400
Message-ID: <20110816130821.19041n4ih2dxq2h1@horde.mgtmail.com>
References: <FFF6ABE8-4EA3-46F1-B877-0E99BF67EC4D@justconnected.net>
 <4B875EC4-30C1-4E2A-9368-FB014240B8B0@justconnected.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B875EC4-30C1-4E2A-9368-FB014240B8B0@justconnected.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; delsp="Yes	format=flowed"
To: Robert Mead <rmead@justconnected.net>
Cc: linux-hams@vger.kernel.org

Robert,

Let me preface my comments by saying I have yet to install and play =20
with Ubuntu where it intersects with Amateur radio (though I do intend =
=20
to do so and play with packet again).

Have you looked at this page at all? I have been reading some of there =
=20
pages and am curious what people think of the qualatative level of =20
their work and their packages?

https://wiki.ubuntu.com/UbuntuHams


V/R,

Stuart, N3GWG


--

IT2 Stuart Blake Tener, USNR, N3GWG (Extra), MROP
Beverly Hills, CA / Las Vegas, NV / Philadelphia, PA / Washington, DC
mobile: (310) 358-0202
Nextel: 124*233172*14 (direct connect)
e-mail: teners@bh90210.net



Quoting Robert Mead <rmead@justconnected.net>:

> I was finally able to fix this by compiling ax25tools, ax25apps, and =
=20
> libax25 myself. Ubuntu's versions are old. Still not sure why that =20
> fixed it, since it seemed to be a kernel-level (miss module) issue.
>
> Running the serial port at 1200bps improved things substantially, as =
=20
> well, but didn't entirely fix it.
>
> -Robert KC2YWE
>
> On Aug 14, 2011, at 11:16 PM, Robert Mead wrote:
>
>> Hey all - I've spent a very frustrating week trying to sort this =20
>> out, maybe you guys can help:
>>
>> I've got a spare laptop in my shack. I tossed Linux (Xubuntu 11.04, =
=20
>> 2.6.38) on it to do some packet work, and hooked it up to my TNC-X =20
>> via a USB/serial dongle.
>>
>> I've got my axports file set up properly with my call sign and the =20
>> configured (by jumper) port speed on the TNC. When I go and run:
>>
>> kissattach /dev/ttyUSB0 radio <my AMPR IP address>
>>
>> it works. That is, the 'ax0' device shows up in ifconfig, it's =20
>> listed in 'route', and I can even make connections over it with =20
>> axcall and read packets in axlisten.
>>
>> That's all fine and dandy, but it stops working very quickly - =20
>> always within 10 minutes, usually within 5. I'll be playing around =20
>> with something and get a "Network is down" error, after which the =20
>> ax0 port has vanished and any ax25 application I try to run will say=
:
>>
>> axconfig: port radio not active  <radio being the name in axports>
>>
>> I dug through the kernel log and found this:
>>
>> mkiss: ax0: crc mode is auto.
>> ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
>> mkiss: ax0: Trying crc-smack
>> mkiss: ax0: Trying crc-flexnet
>> mkiss: ax0: crc mode is auto
>>
>> The duplicate is intentional. It seems to be set to auto at the =20
>> initial connection (with kissattach), and again at the moment at =20
>> which the connection stops working.
>>
>> Now, if I go and kill 'kissattach', I get to try again - and it =20
>> works for another few minutes.
>>
>> Do I need mkiss for my single-port TNC? Seems like might just be =20
>> getting in the way and guessing that my TNC is fancier than it is=E2=
=80=A6
>>
>> I must say I'm utterly flummoxed. The TNC works fine in Windows, =20
>> and Xastir with a direct serial KISS setup. And what's more, this =20
>> is relatively new. I set this up originally and ran Xastir over the =
=20
>> AX25 port for about 36 hours straight, with no problems, but it =20
>> hasn't worked since. I even reinstalled the OS to no avail (needed =20
>> to do it anyway).
>>
>> Anyone have any clever ideas? I'm out of places to look.
>>
>> Thanks,
>> -Robert KC2YWE--
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
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
