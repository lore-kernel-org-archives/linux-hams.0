From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: ax.25 using WAN cards
Date: Mon, 31 Mar 2008 22:21:56 +0100
Message-ID: <20080331212156.GA21500@linux-mips.org>
References: <20080321142120.50720434121@mail.bilten.metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080321142120.50720434121@mail.bilten.metu.edu.tr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?xLBza2VuZGVyIFnEsMSexLBURUw=?= <iskender.yigitel@uzay.tubitak.gov.tr>
Cc: Linux-Hams@vger.kernel.org

On Fri, Mar 21, 2008 at 04:21:17PM +0200, =C4=B0skender Y=C4=B0=C4=9E=C4=
=B0TEL wrote:

> Hi everybody. I am curious about using a PC + PCI HDLC card + Modem i=
nstead
> of PC+TNC+Modem configuration. What is the most suitable solution (I =
mean
> hardware and drivers) for this kind of approach. Can you suggest any =
cards
> and where can I find them?=20
>=20
> I wonder if is it possible to use a WAN card (supporting HDLC, PPP, X=
25) for
> AX.25. There are many HDLC cards that are currently being sold but mo=
st of
> the cards nowadays are not based on Z8530 or Z85130. Although the pri=
ces of
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
