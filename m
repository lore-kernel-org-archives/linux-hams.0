From: "Janusz Przybylski - SP1LOP" <sp1lop@sp1lop.szczecin.pl>
Subject: Configuration Problem !!!
Date: Sun, 17 Aug 2003 02:19:54 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000701c36455$48b4c4b0$6400000a@sp1lop.szczecin.pl>
Reply-To: "Janusz Przybylski - SP1LOP" <sp1lop@sp1lop.szczecin.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: SP2LOB Tomek Serwer <sp2lob@sp2lob.ampr.pl>


Hi ALL

Whether someone can we explain.???

It walks about link to 44.165.2.2  (pruszcz-l.ampr.org  - this  linux RH 7.3
kernel 2.4.20)
and to 44.165.2.3  (pruszcz.ampr.org  - this JNOS 1.11f)


---------------------------------------------------------------------------
traceroute to Linux [44.165.2.2]

[root@stargard /root]# traceroute pruszcz-l.ampr.org
traceroute to pruszcz-l.ampr.org (44.165.2.2), 30 hops max, 38 byte packets
 1  80.50.184.38 (80.50.184.38)  24.990 ms  28.476 ms  28.858 ms
......
20  mirrorshades.ucsd.edu (128.54.16.18)  228.144 ms  228.418 ms  228.967 ms
21  * * *
......
30  * * *
[root@stargard /root]#
-------------------------------------------------------------------------
Next to JNOS 1.11f [44.165.2.3]

[root@stargard /root]# traceroute pruszcz.ampr.org
traceroute to pruszcz.ampr.org (44.165.2.3), 30 hops max, 38 byte packets
 1  80.50.184.38 (80.50.184.38)  35.044 ms  28.355 ms  29.078 ms
......
20  mirrorshades.ucsd.edu (128.54.16.18)  228.222 ms  228.535 ms  229.041 ms
21  213.25.77.73 (213.25.77.73)  248.108 ms  238.548 ms  258.929 ms
22  213.25.77.73 (213.25.77.73)  238.141 ms  238.728 ms  278.819 ms
[root@stargard /root]#

!!! IP 213.25.77.73 (sp2lob.ampr.pl  - for NAT) !!!

in encap.txt is registration:
route addprivate 44.165.2/28 encap 213.25.77.73

where mistake is in system configuration:

data from /sbin/ifconfig
--------------------------------------------------------------------------
[sp1lop@sp2lob sp1lop]$ /sbin/ifconfig
ax0       Link encap:AMPR AX.25  HWaddr SP2LOB-10
          inet addr:44.165.2.2  Bcast:44.255.255.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:255  Metric:1
          RX packets:1 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10188 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:17 (17.0 b)  TX bytes:326863 (319.2 Kb)
.......
eth0    Link encap:Ethernet  HWaddr 00:60:08:7C:4B:6A
          inet addr:192.168.1.13  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:242334 errors:0 dropped:0 overruns:0 frame:0
          TX packets:152444 errors:0 dropped:0 overruns:0 carrier:1
          collisions:29 txqueuelen:100
          RX bytes:31593448 (30.1 Mb)  TX bytes:14835925 (14.1 Mb)
          Interrupt:5 Base address:0x220
......
sl0      Link encap:Serial Line IP
          inet addr:44.165.2.2  P-t-P:44.165.2.3  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1536  Metric:1
          RX packets:7434 errors:0 dropped:0 overruns:0 frame:0
          TX packets:16292 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:552085 (539.1 Kb)  TX bytes:4290381 (4.0 Mb)

tunl0   Link encap:IPIP Tunnel  HWaddr
          inet addr:44.165.2.2  Mask:255.255.255.255
          UP RUNNING NOARP  MTU:1024  Metric:1
          RX packets:3723 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3848 errors:3 dropped:0 overruns:0 carrier:0
          collisions:3 txqueuelen:0
          RX bytes:577036 (563.5 Kb)  TX bytes:411328 (401.6 Kb)

[sp1lop@sp2lob sp1lop]$
----------------------------------------------------------------------------
------

I ask about help in configuration, why traceroute to Linux 44.165.2.2
nothing mute
and it to JNOS is ????  Where to look for mistake.  System works after  NAT.
!!!

 I apologize there now my English it is not good  :-((((



        greeting  73 de Janusz SP1LOP
====================================
Coordinator Polish AmprNet 44.165/16
====================================
Inet:      sp1lop@sp1lop.szczecin.pl
AmprNet:    sp1lop@szczecin.ampr.org
AX25:      sp1lop @ sr1bsz.sz.pol.eu
====================================
Home:  sp1lop.ampr.org [44.165.25.33]
====================================
Sysop: SR1BSZ and szczecin.ampr.org
       XNET and JNOS 1.11f system





---
avast! Antivirus: Outbound message clean.
Virus Database (VPS): 2003-08-14
Tested on: 2003-08-17 02:19:55
avast! is copyright (c) 2000-2003 ALWIL Software.
http://www.avast.com



