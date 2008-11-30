From: Pidoux <f6bvp@free.fr>
Subject: Re: debugging KISS basics
Date: Sun, 30 Nov 2008 12:13:30 +0100
Message-ID: <4932755A.6020904@free.fr>
References: <200811281632.mASGWxi3021582@moose.dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200811281632.mASGWxi3021582@moose.dimebank.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Kantarjiev <cak@dimebank.com>
Cc: vk2tv@exemail.com.au, linux-hams@vger.kernel.org

Chris,

When TNC is in KISS mode you cannot issue any more command to it.
Every data received are transparently transmitted (except the escape se=
quence for putting it back into TERMinal mode.)
Thus, you must set the TNC parameters (like the serial port speed, MYCA=
LL, dual port mode if TNC3, and adjust different=20
audio TX levels for once) before putting the TNC in kiss mode.
In addition, once AX25 driver is loaded, you cannot converse with TNC u=
sing your favorite Linux terminal communication=20
program.
My option is to boot Linux system without AX25 drivers, configure TNC p=
arameters, verify that you can listen to AX25=20
traffic and connect to a local AX25 station using 1200 or 9600 baud por=
t. Then, when you estimate your TNC is doing=20
well, send it the escape sequence command to turn it into KISS mode.
You can leave it in KISS mode forever.
After that you are ready to load AX25 and mkiss drivers and run AX25 ap=
plications.
Listen utility will help you verify the TNC can pass through AX25 traff=
ic.

73 de Bernard, f6bvp


Chris Kantarjiev a =E9crit :
>>
>> Wade through this document http://rose.fpac.free.fr/MINI-HOWTO/
>=20
> Thanks, Ray - that was very useful for learning about config
> and startup.
>=20
> I'm still trying to figure out how to debug the fact that
> my basic KISS commands won't cause the TNC to do anything...
>=20
> 73 de chris K6DBG
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
