From: Robert Mead <rmead@justconnected.net>
Subject: KISS TNC problems with kissattach and mkiss
Date: Sun, 14 Aug 2011 23:16:34 -0400
Message-ID: <FFF6ABE8-4EA3-46F1-B877-0E99BF67EC4D@justconnected.net>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=justconnected.net; h=from
	:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version; s=justconnected.net; bh=wYUFIgdqCFVI4u7sRZxvVv
	WQkCc=; b=PI417++zA6oKLItChCW10JXwoasqGY/MYwC5i+b95Kr0REdeUBL448
	ovILX2myZdE33LN/xiacTRkHyzH+fYgvEfUouiZsTXVTEuWSvBjlkV8lfIlYmx1B
	TGfI4z58lGHJeiwGUUUpQO/lXW3UZ2RSCpbaO27NLi7YInMCucQ0U=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams@vger.kernel.org

Hey all - I've spent a very frustrating week trying to sort this out, m=
aybe you guys can help:

I've got a spare laptop in my shack. I tossed Linux (Xubuntu 11.04, 2.6=
=2E38) on it to do some packet work, and hooked it up to my TNC-X via a=
 USB/serial dongle.

I've got my axports file set up properly with my call sign and the conf=
igured (by jumper) port speed on the TNC. When I go and run:

kissattach /dev/ttyUSB0 radio <my AMPR IP address>

it works. That is, the 'ax0' device shows up in ifconfig, it's listed i=
n 'route', and I can even make connections over it with axcall and read=
 packets in axlisten.=20

That's all fine and dandy, but it stops working very quickly - always w=
ithin 10 minutes, usually within 5. I'll be playing around with somethi=
ng and get a "Network is down" error, after which the ax0 port has vani=
shed and any ax25 application I try to run will say:

axconfig: port radio not active  <radio being the name in axports>

I dug through the kernel log and found this:

mkiss: ax0: crc mode is auto.
ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
mkiss: ax0: Trying crc-smack
mkiss: ax0: Trying crc-flexnet
mkiss: ax0: crc mode is auto

The duplicate is intentional. It seems to be set to auto at the initial=
 connection (with kissattach), and again at the moment at which the con=
nection stops working.

Now, if I go and kill 'kissattach', I get to try again - and it works f=
or another few minutes.=20

Do I need mkiss for my single-port TNC? Seems like might just be gettin=
g in the way and guessing that my TNC is fancier than it is=85=20

I must say I'm utterly flummoxed. The TNC works fine in Windows, and Xa=
stir with a direct serial KISS setup. And what's more, this is relative=
ly new. I set this up originally and ran Xastir over the AX25 port for =
about 36 hours straight, with no problems, but it hasn't worked since. =
I even reinstalled the OS to no avail (needed to do it anyway).

Anyone have any clever ideas? I'm out of places to look.

Thanks,
-Robert KC2YWE--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
