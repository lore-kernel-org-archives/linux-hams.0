From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Fragmentation
Date: Sat, 11 Jan 2003 18:11:48 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301111806160.1411-100000@oh2bns.ampr.org>
References: <3E1F3667.C25ABB5B@free.fr>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E1F3667.C25ABB5B@free.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Fri, 10 Jan 2003, G=E9rard Parat / F6FGZ wrote:

> I am wondering how to tweak mss/mtu/window/packet lenght etc ... to a=
void
> TCP/IP fragmentation for a 1200 bds link. I am trying to send 256 byt=
e size
> AX25 packet, here an example:

I think having the interface MTU equal to the value in=20
/proc/sys/net/ax25/<ifname>/maximum_packet_length should be enough to=20
prevent AX.25 fragmentation.

--=20
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
