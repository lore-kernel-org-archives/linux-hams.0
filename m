From: Jacques Chion <Jacques.Chion@wanadoo.fr>
Subject: netrom problems
Date: Fri, 3 Jan 2003 21:13:42 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301032111490.1134-100000@cwoux.cerise.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-hams@vger.kernel.org


Hello,
I am using Linux for a long time without problems.
At this time, i run with the kernel 2.4.20 and a home-made
distribution which is an awful mix of redhat, debian and slackware.
=46or the fun, i tried the netrom services with packet-radio.
To install the necessary software, no probems.
I run with a soundcard, using the the software soundmodem
(the software itself, not the one included in the kernel).

As i do'nt hear a node directly, i must contact it via=20
a digipeater. So i used the nrparms command like that :
nrparms -nodes F6ZZZ-8 + 44ZZZ 255 6 sm0 F6ZZZ-8 F5XXX
nrparms -routes sm0 F6ZZZ-8 F5XXX + 120

And i cannot contact F6ZZZ-8.
If i look in /proc/net/nr_neigh, i get that :


addr  callsign  dev  qual lock count failed digipeaters
00001 F6ZZZ-8   sm0   120    1     1      0 F5XX *

So you see, the call under digipeaters in not correct, truncated and=20
cause mistakes when i try to connect the node.

I am using the following packages :

libax25-0.0.9-2
ax25-tools-0.0.8-3
ax25-apps-0.0.5-1
ax25-utils-2.1.42a-3

I have tried different nrparms software coming from different packages
without success.
So, can you help me to find a solution ?
Many thanks and best wishes for this new year.

------
Jacques.Chion@wanadoo.fr f6cwo
Quelques HOWTO en fran=E7ais http://perso.wanadoo.fr/jacques.chion/

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
