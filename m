From: =?iso-8859-9?B?3XNrZW5kZXIgWd3Q3VRFTA==?= 
	<iskender.yigitel@uzay.tubitak.gov.tr>
Subject: RE: ax.25 using WAN cards
Date: Wed, 2 Apr 2008 15:33:10 +0300
Message-ID: <20080402123313.1AAD0434105@mail.bilten.metu.edu.tr>
References: <20080331212156.GA21500@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080331212156.GA21500@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Ralf Baechle DL5RB' <ralf@linux-mips.org>
Cc: Linux-Hams@vger.kernel.org

Hi, in fact I don't want to use such a card as a dumb high speed UART. =
My
aim is different. I have found some cards that have Linux drivers to se=
nd
and receive HDLC frames. For example there are drivers for Farsync WAN =
cards
in the kernel source tree. By the use of this cards and drivers it is
possible to send and receive HDLC frames. And if we can put the AX.25 d=
ata
in an HDLC frame (by changing and hacking the driver code) it may be
possible to achieve AX25. I don't know the correct strategy but this ki=
nd of
approach seemed reasonable to me (Well I am not an expert. Too optimist=
ic
maybe).For example think about the KISS TNC usage, The kernel sends the=
 AX25
frame bytes to the TNC asynchronously by the use of KISS protocol and
driver. And the TNC puts the coming bytes into an HDLC frame and sends =
to
the modem. Here we already have a card that that can send and receive H=
DLC
frames. If we can find a way to pass the AX25 data to this card instead=
 of
the TNC (a new kernel module acting as a bridge between the kernel and =
the
HDLC driver maybe), it is done. I don't know. Just an idea. Any comment=
s?

-----Original Message-----
=46rom: Ralf Baechle DL5RB [mailto:ralf@linux-mips.org]=20
Sent: Tuesday, April 01, 2008 12:22 AM
To: =DDskender Y=DD=D0=DDTEL
Cc: Linux-Hams@vger.kernel.org
Subject: Re: ax.25 using WAN cards

On Fri, Mar 21, 2008 at 04:21:17PM +0200, =DDskender Y=DD=D0=DDTEL wrot=
e:

> Hi everybody. I am curious about using a PC + PCI HDLC card + Modem
instead
> of PC+TNC+Modem configuration. What is the most suitable solution (I =
mean
> hardware and drivers) for this kind of approach. Can you suggest any =
cards
> and where can I find them?=20
>=20
> I wonder if is it possible to use a WAN card (supporting HDLC, PPP, X=
25)
for
> AX.25. There are many HDLC cards that are currently being sold but mo=
st of
> the cards nowadays are not based on Z8530 or Z85130. Although the pri=
ces
of
> these cards are high, these new generation WAN cards support HDLC, ci=
sco
> HDLC, X25 etc. at very high speeds. Is it possible to use such a card=
 for
> ax.25? If yes which drivers must be used?

=46or the hardware which I'm familiar with the support for higher level
protocols such as HDLC would need to be disabled running them effectivl=
y
as dumb highspeed UARTs.  Some of such interfaces have reloadable firmw=
are
but the architecture and interfaces rarely seem to be documented.  So
what you suggest isn't impossible but it's not (always?) quite trivial.

73 de DL5RB op Ralf

---
DL5RB / M0LRB / AB1IN
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
