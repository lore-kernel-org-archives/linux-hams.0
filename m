From: Robert Mead <rmead@justconnected.net>
Subject: Re: KISS TNC problems with kissattach and mkiss
Date: Mon, 15 Aug 2011 21:47:15 -0400
Message-ID: <4B875EC4-30C1-4E2A-9368-FB014240B8B0@justconnected.net>
References: <FFF6ABE8-4EA3-46F1-B877-0E99BF67EC4D@justconnected.net>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=justconnected.net; h=
	content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to; s=
	justconnected.net; bh=CF9XRnGDYGLrBhLaK5jEsGatow0=; b=fU6lrzTO4B
	Sn999lOiqhJ9YndT2A9mHms/o1V6iSeO0RIsF4gnY8/eegg4nnZnnxPFqTuHRZMQ
	fEqEQtCK9aX+V+FnIstI9/PmkgRkwxZIkaiTO924aur4e0wwl98kUyil+bdntAUc
	urywPpEiq0P487Muui18sMn03t7W62i8Y=
In-Reply-To: <FFF6ABE8-4EA3-46F1-B877-0E99BF67EC4D@justconnected.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams@vger.kernel.org

I was finally able to fix this by compiling ax25tools, ax25apps, and li=
bax25 myself. Ubuntu's versions are old. Still not sure why that fixed =
it, since it seemed to be a kernel-level (miss module) issue.

Running the serial port at 1200bps improved things substantially, as we=
ll, but didn't entirely fix it.

-Robert KC2YWE

On Aug 14, 2011, at 11:16 PM, Robert Mead wrote:

> Hey all - I've spent a very frustrating week trying to sort this out,=
 maybe you guys can help:
>=20
> I've got a spare laptop in my shack. I tossed Linux (Xubuntu 11.04, 2=
=2E6.38) on it to do some packet work, and hooked it up to my TNC-X via=
 a USB/serial dongle.
>=20
> I've got my axports file set up properly with my call sign and the co=
nfigured (by jumper) port speed on the TNC. When I go and run:
>=20
> kissattach /dev/ttyUSB0 radio <my AMPR IP address>
>=20
> it works. That is, the 'ax0' device shows up in ifconfig, it's listed=
 in 'route', and I can even make connections over it with axcall and re=
ad packets in axlisten.=20
>=20
> That's all fine and dandy, but it stops working very quickly - always=
 within 10 minutes, usually within 5. I'll be playing around with somet=
hing and get a "Network is down" error, after which the ax0 port has va=
nished and any ax25 application I try to run will say:
>=20
> axconfig: port radio not active  <radio being the name in axports>
>=20
> I dug through the kernel log and found this:
>=20
> mkiss: ax0: crc mode is auto.
> ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
> mkiss: ax0: Trying crc-smack
> mkiss: ax0: Trying crc-flexnet
> mkiss: ax0: crc mode is auto
>=20
> The duplicate is intentional. It seems to be set to auto at the initi=
al connection (with kissattach), and again at the moment at which the c=
onnection stops working.
>=20
> Now, if I go and kill 'kissattach', I get to try again - and it works=
 for another few minutes.=20
>=20
> Do I need mkiss for my single-port TNC? Seems like might just be gett=
ing in the way and guessing that my TNC is fancier than it is=85=20
>=20
> I must say I'm utterly flummoxed. The TNC works fine in Windows, and =
Xastir with a direct serial KISS setup. And what's more, this is relati=
vely new. I set this up originally and ran Xastir over the AX25 port fo=
r about 36 hours straight, with no problems, but it hasn't worked since=
=2E I even reinstalled the OS to no avail (needed to do it anyway).
>=20
> Anyone have any clever ideas? I'm out of places to look.
>=20
> Thanks,
> -Robert KC2YWE--
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
