From: "Ronald Jochems" <pd1acf@xs4all.nl>
Subject: Request change ???
Date: Wed, 9 Jul 2003 08:35:05 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001101c345e4$3c5be020$2a01a8c0@p3>
References: <20030705211733.A255@jeroen.pe1rxq.ampr.org> <20030707001148.GC29616@linux-mips.org> <20030707223907.A8771@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeroen Vreeken <pe1rxq@amsat.org>, Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

All,

I'm not sure if this is the 'right' way/group to ask, but here is my
question. It is related to the AX25 kernel i believe.

Please see below examples, my question is about the 'statistical'
information wich is 'new' in i believe 2.4 kernels.
The total ammount of packets is translated in complete bytes transmitted,
and received.
With the current Z8530 SCC driver these statistics are not calculated.
For ethernet cards they are calculated.

Is there a way to make this work ? I guess it is a driver issue ???

root@pd1acf:~# ifconfig scc1
scc1      Link encap:AMPR AX.25  HWaddr PD1ACF-2
          inet addr:44.137.2.92  Mask:255.255.0.0
          UP RUNNING  MTU:256  Metric:1
          RX packets:1200006 errors:1150494 dropped:0 overruns:0 frame:0
          TX packets:509433 errors:2 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:16
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

root@pd1acf:/usr/src/linux# ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:60:08:E8:00:28
          inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8783615 errors:0 dropped:0 overruns:0 frame:0
          TX packets:9147315 errors:0 dropped:0 overruns:0 carrier:44
          collisions:237625 txqueuelen:100
          RX bytes:1045445509 (997.0 Mb)  TX bytes:3091956405 (2948.7 Mb)
          Interrupt:10 Base address:0x6800

root@pd1acf:/usr/src/linux#


Best regards,

Ron

