From: Ricardo Saiz Villoria <ea1apm@amsat.org>
Subject: still about ax25ipd
Date: Sat, 20 Apr 2002 22:31:03 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204202200490.2668-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hi

Maybe this is more about flexnet than about linux. I've continued trying
to make axip work between flexnet and linux.

The problem was: we have four computers at my radioclub (linux, msdos,
win95, win2k), and anyone can talk to any other through axip, EXCEPT linux
to msdos (the other way round works ok).

The msdos computer has a 3C503 card, with ippd driver and flexnet. I've 
configured it with raw ip encapsulation and udp via port 93 and 10093. 
Linux can hear its packets, as it can be seen with "listen".

When linux sends packets, they are received in msdos with a packet
watching utility (actually, it's a program called pktwatch). They are even
received by the flexnet axip device driver (ippd): when a packet (axip or
icmp echo request) is sent from linux, ippd increments the packet input 
count. BUT those packets do not reach flexnet kernel, as the "stat" 
utility always shows 0 received packets. Neither they can be seen with 
"show".

I did another test. I ran a ncsa telnet client from msdos, to see if it 
could connect to linux. It works flawlessly.

The only answer I can think of is that either ax25ipd or, more likely,
ippd, are not fully compliant with the protocol.

regards

-- 
Ricardo Saiz Villoria EA1APM
AX.25:  ea1apm@ea1rkv.eapo.esp.eu
WEB:	http://www.qsl.net/ea1apm
E-MAIL: mailto:ea1apm@amsat.org




