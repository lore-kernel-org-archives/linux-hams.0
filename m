From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: node "Connection refused"
Date: Sat, 22 Feb 2003 11:39:28 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E57535F.38EE1D24@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hello,

When I try to connect a neighbour node I get the following:

LBE78:F6FGZ-12} Nodes:
#LINUX:F4BWT-10   F1EUC             LBE78:F6FGZ-12

f6fgz-0@f6fgz 11:35:57> c #LINUX
LBE78:F6FGZ-12} Trying #LINUX:F4BWT-10... Type <RETURN> to abort
LBE78:F6FGZ-12} Failure with #LINUX:F4BWT-10: connection refused

If I listen, the following occurs:

uhf2: fm F6FGZ-12 to F4BWT-10 ctl I22^ pid=3DCF(NET/ROM) len 39 11:33:3=
5
NET/ROM: F6FGZ-12->F4BWT-10 ttl 15
         conn rqst: my ckt 01/07 wnd 4 F6FGZ@F6FGZ-12 timeout 120
uhf2: fm F4BWT-10 to F6FGZ-12 ctl I32^ pid=3DCF(NET/ROM) len 20 11:33:3=
8
NET/ROM: F4BWT-10->F6FGZ-12 ttl 15
         conn ack: ur ckt 01/07 my ckt 00/00 wnd 4 CHOKE

I haven't found any configuration in node.conf

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
