From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: Strange error
Date: Mon, 30 Aug 2004 23:26:59 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <41339BA3.F1F7850A@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hello,

I use a pseudo tty pipe between Xnet 1.36 and DXCLuster CLX. The proble=
m is
when someone connect to CLX from Xnet network. I get an endless loop of=
 REJ
frame with the following message into syslog file:
kernel: mkiss: ax4: truncating oversized transmit packet!

Config is:
libax25-0.0.11
ax25-tools-0.0.8
ax25-apps-0.0.6
kernel 2.4.18

It occurs ONLY from an incoming outside connection (i.e from the Xnet n=
etwork).
If I use call from the machine, all is OK. If somebody have an idea of =
what's
going on ?
BTW, I use socat over a WiFi link to transport AX25 frames over a TCP/I=
P layer.
Maybe the cause with improper buffer size?

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
