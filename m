From: "Wilson G. Hein" <wilson.hein@verizon.net>
Subject: RE: ax25 Questions
Date: Sat, 5 Jun 2004 21:00:46 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLOEEOFAAC.wilson.hein@verizon.net>
References: <200406042119.14847.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200406042119.14847.oyvind@cs.uit.no>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams Mailing List <linux-hams@vger.kernel.org>



> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org]On Behalf Of =D8yvind Hansse=
n
> Sent: Friday, June 04, 2004 3:19 PM
> To: linux-hams@vger.kernel.org
> Subject: Re: ax25 Questions
>
> Another question btw. It seems that the SOCK_PACKET type of socket is
> the typical way to access raw AX.25 packets in Linux, but the doc
> says that this
> type of socket should be avoided (obsolete) and that the
> AF_PACKET/SOCK_RAW
> type should be used instead. I this equivalent, is this supported
> for AX.25?
>

SOCK_PACKET as I remember it is going to be phased out, and was kept so=
lely
till older apps could be upgraded to work with libax25, or something li=
ke
that. I would recommend use of AF_PACKET/SOCK_RAW to be forward compati=
ble.

73,

Wilson, WJ3G
---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.692 / Virus Database: 453 - Release Date: 5/28/2004

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
