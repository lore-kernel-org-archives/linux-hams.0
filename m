From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: SPAM: Re: SPAM: New on this
Date: Fri, 05 Apr 2013 17:31:45 +0100
Message-ID: <515EFC71.9070903@rns-stearn.demon.co.uk>
References: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>	<CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>	<CAHMoZxVwQdBPXPJO_xCgY-z5q2daFn4HB3qTgbDcBwj0i9+4dw@mail.gmail.com>	<CA+nFU8ThN0wJWFZcRitULy0cpbAoJ83vUJ1_zta0tENGo6PQOA@mail.gmail.com>	<515EE923.6090305@rns-stearn.demon.co.uk> <CA+nFU8T_Fk=ZGW660pfrLcNx0u0VzBm1_PUVWhuL-VR0G1JRyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CA+nFU8T_Fk=ZGW660pfrLcNx0u0VzBm1_PUVWhuL-VR0G1JRyQ@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Marc Mar=ED wrote:
> We are using a Portux computer on a chip, with Debian and Linux.
>=20
> I have to analize your solution, but I have to say that we are using
> the CC1101 chipset to transmit, which is connected with SPI and which
> transmits in 9600bps.

In which case you will probably need to design and build a driver that
connects to the hdlcdrv for the HDLC packet assembly/disassembly in the
same way as the BAYCOM driver does and the Linux SPI driver for
bit transmit/receive via the CC1101.

--=20
73 de g1sog
	Richard

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
