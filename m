From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: RE: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port
 configuring corruption HELP Required please
Date: Sun, 6 Apr 2014 14:19:00 +0000
Message-ID: <0AC34FBF7531404B98449A9318023E3B011B2933@EXMBX16.thus.corp>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk>,<53406C67.3080008@trinnet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <53406C67.3080008@trinnet.net>
Content-Language: en-GB
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: David Ranch <linux-hams@trinnet.net>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
Cc: "," <info@skywaves.demon.co.uk>, Paul Lewis <paul@skywaves.demon.co.uk>

hello David and co.

this the result of test1 and 2,  with just ax0 and ax1 serial interface configured
copied in wrong setting as pci board moved to other PCI slot IRQ moved from IRQ17 to 22
resent to included the update device params

System P4 2GB Ram  
Linux gb7cip 3.5.0-48-generic #72~precise1-Ubuntu SMP 
Tue Mar 11 20:08:23 UTC 2014 i686 i686 i386 GNU/Linux
Ubuntu Desktop 12.04 lts
AX25 software installed from source configured and compiled
from yesterday (5.4.2013) now using (downloaded from www.linux-ax25.org/wiki/
 442172 Apr  5 19:20 ax25-apps-0.0.8-rc4.tar.gz
 364332 Apr  5 19:08 ax25-tools-0.0.10-rc4.tar.gz
 335535 Apr  5 20:22 libax25-0.0.12-rc4.tar.gz
 901120 Apr 30  2013 node-0.3.3.tar



Serial ports ax0 to ax5 are configure using legacy dev ttyS##
ax0 = ttyS8 u433

6 of PacCom TNC's 4 of serial  9600bd wire 1200bd radio
                  2 of serial 19200bd wire 9600bd radio
                  All the above use JKISS eproms
                  2 used by linfbb direct for HF Pactor
 ax port 7 to 11 are tunnels ipip axip axudp
VScom TC-800 8 port PCI serial card

lspci
02:01.0 Serial controller: Titan Electronics Inc VScom 400H 4 port serial adaptor
02:01.1 Serial controller: Titan Electronics Inc VScom 400HF1 4 port serial adaptor

detected during system start up /var/log/kern extract
NOTE IRQ Changed from 17 t0 22  after VSCOM CARD MOVED to the other PCI slot before these series of tests
pr  6 13:52:49 gb7cip kernel: [    0.388866] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Apr  6 13:52:49 gb7cip kernel: [    0.477751] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Apr  6 13:52:49 gb7cip kernel: [    0.500138] ttyS4: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500152] 0000:02:01.0: ttyS4 at I/O 0xef00 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500316] ttyS5: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500326] 0000:02:01.0: ttyS5 at I/O 0xef08 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500463] ttyS6: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500472] 0000:02:01.0: ttyS6 at I/O 0xef10 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500607] ttyS7: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500616] 0000:02:01.0: ttyS7 at I/O 0xef18 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500810] ttyS8: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500821] 0000:02:01.1: ttyS8 at I/O 0xed00 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500964] ttyS9: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500974] 0000:02:01.1: ttyS9 at I/O 0xed08 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.501114] ttyS10: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.501124] 0000:02:01.1: ttyS10 at I/O 0xed10 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.501265] ttyS11: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.501275] 0000:02:01.1: ttyS11 at I/O 0xed18 (irq = 22) is a 16C950/954


## ax25 ax0  test load
ifconfig -a
ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Apr  6 13:55:45 gb7cip kernel: [  213.915596] mkiss: ax0: crc mode is auto.
Apr  6 13:55:45 gb7cip kernel: [  213.918593] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  6 13:59:25 gb7cip kernel: [  434.067807] mkiss: ax0: Trying crc-smack
Apr  6 13:59:45 gb7cip kernel: [  454.223432] mkiss: ax0: Trying crc-flexnet

I confirm that I can connect out via radio ax0 u433 radio interface
##
Test 2
ax0 u433 ttyS8
ax1 u439 ttyS5 
Apr  6 14:32:42 gb7cip kernel: [    0.388490] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Apr  6 14:32:42 gb7cip kernel: [    0.477917] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Apr  6 14:32:42 gb7cip kernel: [    0.496667] ttyS4: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.496681] 0000:02:01.0: ttyS4 at I/O 0xef00 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.496821] ttyS5: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.496831] 0000:02:01.0: ttyS5 at I/O 0xef08 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.496966] ttyS6: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.496975] 0000:02:01.0: ttyS6 at I/O 0xef10 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.497111] ttyS7: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.497120] 0000:02:01.0: ttyS7 at I/O 0xef18 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.497301] ttyS8: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.497312] 0000:02:01.1: ttyS8 at I/O 0xed00 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.497454] ttyS9: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.497464] 0000:02:01.1: ttyS9 at I/O 0xed08 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.500306] ttyS10: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.500318] 0000:02:01.1: ttyS10 at I/O 0xed10 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.500465] ttyS11: detected caps 0Hello David
this the result of test1 and 2,  with just ax0 and ax1 serial interface configured
copied in wrong setting as pci board moved to other PCI slot irq moved from IRQ17 to 22
resent to included the update device params

System P4 2GB Ram  
Linux gb7cip 3.5.0-48-generic #72~precise1-Ubuntu SMP 
Tue Mar 11 20:08:23 UTC 2014 i686 i686 i386 GNU/Linux
Ubuntu Desktop 12.04 lts
AX25 software installed from source configured and compiled
from yesterday (5.4.2013) now using (downloaded from www.linux-ax25.org/wiki/
 442172 Apr  5 19:20 ax25-apps-0.0.8-rc4.tar.gz
 364332 Apr  5 19:08 ax25-tools-0.0.10-rc4.tar.gz
 335535 Apr  5 20:22 libax25-0.0.12-rc4.tar.gz
 901120 Apr 30  2013 node-0.3.3.tar



Serial ports ax0 to ax5 are configure using legacy dev ttyS##
ax0 = ttyS8 u433

6 of PacCom TNC's 4 of serial  9600bd wire 1200bd radio
                  2 of serial 19200bd wire 9600bd radio
                  All the above use JKISS eproms
                  2 used by linfbb direct for HF Pactor
 ax port 7 to 11 are tunnels ipip axip axudp
VScom TC-800 8 port PCI serial card

lspci
02:01.0 Serial controller: Titan Electronics Inc VScom 400H 4 port serial adaptor
02:01.1 Serial controller: Titan Electronics Inc VScom 400HF1 4 port serial adaptor

detected during system start up /var/log/kern extract
NOTE IRQ Changed from 17 t0 22  after VSCOM CARD MOVED to the other PCI slot before these series of tests
pr  6 13:52:49 gb7cip kernel: [    0.388866] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Apr  6 13:52:49 gb7cip kernel: [    0.477751] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Apr  6 13:52:49 gb7cip kernel: [    0.500138] ttyS4: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500152] 0000:02:01.0: ttyS4 at I/O 0xef00 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500316] ttyS5: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500326] 0000:02:01.0: ttyS5 at I/O 0xef08 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500463] ttyS6: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500472] 0000:02:01.0: ttyS6 at I/O 0xef10 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500607] ttyS7: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500616] 0000:02:01.0: ttyS7 at I/O 0xef18 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500810] ttyS8: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500821] 0000:02:01.1: ttyS8 at I/O 0xed00 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.500964] ttyS9: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.500974] 0000:02:01.1: ttyS9 at I/O 0xed08 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.501114] ttyS10: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.501124] 0000:02:01.1: ttyS10 at I/O 0xed10 (irq = 22) is a 16C950/954
Apr  6 13:52:49 gb7cip kernel: [    0.501265] ttyS11: detected caps 00000700 should be 00000500
Apr  6 13:52:49 gb7cip kernel: [    0.501275] 0000:02:01.1: ttyS11 at I/O 0xed18 (irq = 22) is a 16C950/954


## ax25 ax0  test load
ifconfig -a
ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Apr  6 13:55:45 gb7cip kernel: [  213.915596] mkiss: ax0: crc mode is auto.
Apr  6 13:55:45 gb7cip kernel: [  213.918593] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  6 13:59:25 gb7cip kernel: [  434.067807] mkiss: ax0: Trying crc-smack
Apr  6 13:59:45 gb7cip kernel: [  454.223432] mkiss: ax0: Trying crc-flexnet

I confirm that I can connect out via radio ax0 u433 radio interface
##
Test 2
ax0 u433 ttyS8
ax1 u439 ttyS5 
Apr  6 14:32:42 gb7cip kernel: [    0.388490] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Apr  6 14:32:42 gb7cip kernel: [    0.477917] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Apr  6 14:32:42 gb7cip kernel: [    0.496667] ttyS4: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.496681] 0000:02:01.0: ttyS4 at I/O 0xef00 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.496821] ttyS5: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.496831] 0000:02:01.0: ttyS5 at I/O 0xef08 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.496966] ttyS6: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.496975] 0000:02:01.0: ttyS6 at I/O 0xef10 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.497111] ttyS7: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.497120] 0000:02:01.0: ttyS7 at I/O 0xef18 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.497301] ttyS8: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.497312] 0000:02:01.1: ttyS8 at I/O 0xed00 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.497454] ttyS9: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.497464] 0000:02:01.1: ttyS9 at I/O 0xed08 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.500306] ttyS10: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.500318] 0000:02:01.1: ttyS10 at I/O 0xed10 (irq = 22) is a 16C950/954
Apr  6 14:32:42 gb7cip kernel: [    0.500465] ttyS11: detected caps 00000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.500476] 0000:02:01.1: ttyS11 at I/O 0xed18 (irq = 22) is a 16C950

ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ax1       Link encap:AMPR AX.25  HWaddr GB7CR-11  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:576  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Apr  6 14:40:04 gb7cip kernel: [  479.843892] mkiss: ax0: crc mode is auto.
Apr  6 14:40:04 gb7cip kernel: [  479.844356] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  6 14:40:08 gb7cip kernel: [  483.861336] mkiss: ax1: crc mode is auto.
Apr  6 14:40:08 gb7cip kernel: [  483.865233] IPv6: ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Apr  6 14:41:06 gb7cip kernel: [  541.779571] mkiss: ax1: Trying crc-smack
Apr  6 14:41:06 gb7cip kernel: [  541.786702] mkiss: ax0: Trying crc-smack
Apr  6 14:41:26 gb7cip kernel: [  561.957066] mkiss: ax1: Trying crc-flexnet
Apr  6 14:41:26 gb7cip kernel: [  561.962409] mkiss: ax0: Trying crc-flexnet

confirm
connect our via radio on port ax0 u433
connect our via radio on port ax1 u439
##0000700 should be 00000500
Apr  6 14:32:42 gb7cip kernel: [    0.500476] 0000:02:01.1: ttyS11 at I/O 0xed18 (irq = 22) is a 16C950

ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ax1       Link encap:AMPR AX.25  HWaddr GB7CR-11  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:576  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Apr  6 14:40:04 gb7cip kernel: [  479.843892] mkiss: ax0: crc mode is auto.
Apr  6 14:40:04 gb7cip kernel: [  479.844356] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  6 14:40:08 gb7cip kernel: [  483.861336] mkiss: ax1: crc mode is auto.
Apr  6 14:40:08 gb7cip kernel: [  483.865233] IPv6: ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Apr  6 14:41:06 gb7cip kernel: [  541.779571] mkiss: ax1: Trying crc-smack
Apr  6 14:41:06 gb7cip kernel: [  541.786702] mkiss: ax0: Trying crc-smack
Apr  6 14:41:26 gb7cip kernel: [  561.957066] mkiss: ax1: Trying crc-flexnet
Apr  6 14:41:26 gb7cip kernel: [  561.962409] mkiss: ax0: Trying crc-flexnet

confirm
connect out via radio on port ax0 u433
connect out via radio on port ax1 u439
##
73 de Paul G4APL GB7CIP
