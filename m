From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: packet radio indoor
Date: Sun, 29 Dec 2002 11:35:52 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021229193552.74273.qmail@web14407.mail.yahoo.com>
References: <Pine.LNX.4.44.0212252216050.1449-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212252216050.1449-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Dear all,

I will use packet radio only in a room
|pc1|--|sc1|--|ht1| <--/
                      /--> |ht2|--|sc2|--|pc2| 
The hardware and software are:
Personal Computer
Sound Card
HT
RH Linux 7.1 kernel upgraded 2.4.19 and radio packet
support
libax25-0.0.9
ax25-apps-0.0.6
ax25-tools-0.0.8
node.0.3.0
soundmodem-0.7


First of all I am using stereo cable to connect 2
machines without ht and checking if the TCP/IP
facilities works such as ping, ftp, telnet and ssh. 
|pc1|--|sc1|--------|sc2|--|pc2|

According to
<http://people.zeelandnet.nl/pa3gcu/installax25.htm> I
have installed the ax.25 stuff and node.0.3.0 in pc1
and pc2, and all going well without error message in
the directory </usr/local/src>. Than I  installed the
soundmodem-0.7 in the same directory.

my1com# ifconfig
sm0  Link encap: AMPR AX.25 HWaddr MY1COM
     inet addr: 44.128.1.5 Bcast: 44.128.1.255 Mask:
255.255.255.0
     ..

my2com# ifconfig 
sm0  Link encap: AMPR AX.25 HWaddr MY2COM
     inet addr: 44.128.1.8 Bcast: 44.128.1.255 Mask:
255.255.255.0
     ..

Next I have connected sc1 and sc2 using stereo cables
as follow:
MIC-sc1|----|SPK-sc2

SPK-sc1|----|MIC-sc2

But the "ping", "ftp", "ssh" and "telnet" commands
don't work from pc1 to pc2 and virce virca.
[my1com]$ ping my2com
PING my2com.ampr.org (44.128.1.8) from 44.128.1.5:
56(84) bytes of data
From my1com.ampr.org (44.128.1.5): Destination Host
unreachable
From my1com.ampr.org (44.128.1.5): Destination Host
unreachable
From my1com.ampr.org (44.128.1.5): Destination Host
unreachable

--- my2com.ampr.org ping statistics ---
4 packets transmitted, 0 packet received, +3 errors,
100% packet loss

Please any idea what should I do to make "ping",
"ftp", "ssh" and "telnet" commands workable and
useable? 

Thanks
Vivi


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
