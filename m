From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: SPAM: Re: SPAM: New on this
Date: Fri, 05 Apr 2013 16:09:23 +0100
Message-ID: <515EE923.6090305@rns-stearn.demon.co.uk>
References: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>	<CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>	<CAHMoZxVwQdBPXPJO_xCgY-z5q2daFn4HB3qTgbDcBwj0i9+4dw@mail.gmail.com> <CA+nFU8ThN0wJWFZcRitULy0cpbAoJ83vUJ1_zta0tENGo6PQOA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CA+nFU8ThN0wJWFZcRitULy0cpbAoJ83vUJ1_zta0tENGo6PQOA@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Marc Mar=ED wrote:
 > And now, we are searching the solution to create AX25 packets and
 > process them as if there was a TNC, and then ask CC1101 to send this
 > packages (this last thing works, the problem is that the data we sen=
d
 > now is not AX25 encoded, and the Ground Station doesn't understand
 > us). Linux AX25 seemed a good option, but before recompiling the
 > kernel, installing and configure, we wanted to know what it does
 > exactly, and implementing Linux AX.25, and then creating code to
 > scramble and all the other things seems oversized.
 >
 > Do you know any solution for this?

Marc

It is not clear from your original message which OS you are using.
You mention Linux AX.25, if you are using Linux as the OS then
this may be a route to a viable solution.

Enable "Amateur Radio AX.25 Level 2 protocol" and
"BAYCOM ser12 halfduplex driver for AX.25" driver.

The BAYCOM driver is a "bit banger".  It uses the "hdlcdrv" driver
to produce the HDLC frame to send and then the DTR, CTS & RTS
lines of standard RS232 for hardware IO:

DTR -> TXD
CTS -> RXD
RTS -> PTT

The original BAYCOM site has been shutdown for some years, however
you can find much related to the BAYCOM modem here:
http://www.nl3asd.tk/software/baycom/tcm3105.zip

and schematic of a BAYCOM modem here.
http://www.nl3asd.tk/software/baycom/tcm3105.zip

This will give you 1200bps half duplex.
Dependant on your hardware you may need to modify baycom_ser_hdx.c
to use different IO lines.

The above is _not_ a complete solution but may, if you are using
Linux, get you to the point of having TXD, RXD & PTT to connect
to you transceiver via some suitable modem.

--=20
73 de g1sog
     Richard
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
