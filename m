From: =?iso-8859-1?q?=D8yvind_Hanssen?= <oyvind@cs.uit.no>
Subject: Re: ax25 Questions
Date: Fri, 4 Jun 2004 21:19:14 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200406042119.14847.oyvind@cs.uit.no>
References: <478F6623898BBC4DBD692A223D28298A05A630@amewebsrvr.webametx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <478F6623898BBC4DBD692A223D28298A05A630@amewebsrvr.webametx.local>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Yes, it was a bug there. I will also consider using separate Linux sock=
ets (in the native code) for=20
sending and receiving, but I thought those sockets allowed one to send =
at the same time as
block for receive, on the same socket instance.=20

Another question btw. It seems that the SOCK_PACKET type of socket is=20
the typical way to access raw AX.25 packets in Linux, but the doc says =
that this
type of socket should be avoided (obsolete) and that the AF_PACKET/SOCK=
_RAW=20
type should be used instead. I this equivalent, is this supported for A=
X.25?=20

73 de LA7ECA, =D8yvind


On Friday 04 June 2004 20:12, AE5PL Lists wrote:
> Well, I have got the answers, sort of.
>=20

--=20
Computer Science dept. University of Troms=F8,  ohanssen@acm.org,  Cell=
: +47 9511 7457
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
