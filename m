From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: RE: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port
 configuring corruption HELP Required please
Date: Sun, 6 Apr 2014 15:17:13 +0000
Message-ID: <0AC34FBF7531404B98449A9318023E3B011B294F@EXMBX16.thus.corp>
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

Hello David
15:32-15:51
test 3 FAILED  I was able to connect out via the three radio interfaces
then found ax1 had later gone AWOL.  Extracted all that I can find related toe ax0 ax1 ax2 in the 
messages log
update 3
Test 3
ax0 u433 ttyS8
ax1 u439 ttyS5 
ax2 v70  ttyS10
lcpsi
02:01.0 Serial controller: Titan Electronics Inc VScom 400H 4 port serial adaptor assume ttyS4-7
02:01.1 Serial controller: Titan Electronics Inc VScom 400HF1 4 port serial adap             ttyS8-11

Apr  6 15:32:55 gb7cip kernel: [    0.396619] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Apr  6 15:32:55 gb7cip kernel: [    0.482151] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Apr  6 15:32:55 gb7cip kernel: [    0.504154] ttyS4: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.504167] 0000:02:01.0: ttyS4 at I/O 0xef00 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.504332] ttyS5: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.504342] 0000:02:01.0: ttyS5 at I/O 0xef08 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.504479] ttyS6: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.504488] 0000:02:01.0: ttyS6 at I/O 0xef10 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.504622] ttyS7: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.504632] 0000:02:01.0: ttyS7 at I/O 0xef18 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.504825] ttyS8: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.504836] 0000:02:01.1: ttyS8 at I/O 0xed00 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.504979] ttyS9: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.504989] 0000:02:01.1: ttyS9 at I/O 0xed08 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.505129] ttyS10: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.505139] 0000:02:01.1: ttyS10 at I/O 0xed10 (irq = 22) is a 16C950/954
Apr  6 15:32:55 gb7cip kernel: [    0.505281] ttyS11: detected caps 00000700 should be 00000500
Apr  6 15:32:55 gb7cip kernel: [    0.505291] 0000:02:01.1: ttyS11 at I/O 0xed18 (irq = 22) is a 16C950/954

kissattach section 
AX.25 port u433 bound to device ax0
AX.25 port u439 bound to device ax1
AX.25 port v70 bound to device ax2
ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ax1       Link encap:AMPR AX.25  HWaddr GB7CR-11                   <<<<<< HAS CONFIGURATION 
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:576  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ax2       Link encap:AMPR AX.25  HWaddr GB7CIP-4  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Apr  6 15:38:52 gb7cip kernel: [  394.742748] mkiss: ax0: crc mode is auto.
Apr  6 15:38:52 gb7cip kernel: [  394.747173] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  6 15:38:56 gb7cip kernel: [  398.758298] mkiss: ax1: crc mode is auto.
Apr  6 15:38:56 gb7cip kernel: [  398.762874] IPv6: ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Apr  6 15:39:00 gb7cip kernel: [  402.773601] mkiss: ax2: crc mode is auto.
Apr  6 15:39:00 gb7cip kernel: [  402.777423] IPv6: ADDRCONF(NETDEV_CHANGE): ax2: link becomes ready
Apr  6 15:39:58 gb7cip kernel: [  460.932642] mkiss: ax2: Trying crc-smack
Apr  6 15:39:58 gb7cip kernel: [  460.932947] mkiss: ax1: Trying crc-smack
Apr  6 15:39:58 gb7cip kernel: [  460.939735] mkiss: ax0: Trying crc-smack
Apr  6 15:40:18 gb7cip kernel: [  481.096275] mkiss: ax1: Trying crc-flexnet
Apr  6 15:40:18 gb7cip kernel: [  481.101450] mkiss: ax0: Trying crc-flexnet
Apr  6 15:43:30 gb7cip kernel: [  673.205110] mkiss: ax2: Trying crc-flexnet

confirm
connect out via radio on port ax0 u433
connect out via radio on port ax1 u439
connect our via radio on port ax2 v70

15:51  u439 has gone AWOl
ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:603 (603.0 B)

ax1       Link encap:AMPR AX.25  HWaddr                           AWOL <<<<<<<<<<<<<<<<<<<<<<
          BROADCAST MULTICAST  MTU:236  Metric:1          NOTE MTU as changed
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ax2       Link encap:AMPR AX.25  HWaddr GB7CIP-4  
          inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
          UP BROADCAST RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:250 (250.0 B)

gone through log again after error to pick up anything related to ax0 ax1 ax2 after error noted
Apr  6 15:38:52 gb7cip kernel: [  394.742748] mkiss: ax0: crc mode is auto.
Apr  6 15:38:52 gb7cip kernel: [  394.747173] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  6 15:38:56 gb7cip kernel: [  398.758298] mkiss: ax1: crc mode is auto.
Apr  6 15:38:56 gb7cip kernel: [  398.762874] IPv6: ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Apr  6 15:39:00 gb7cip kernel: [  402.773601] mkiss: ax2: crc mode is auto.
Apr  6 15:39:00 gb7cip kernel: [  402.777423] IPv6: ADDRCONF(NETDEV_CHANGE): ax2: link becomes ready
Apr  6 15:39:31 gb7cip kernel: [  434.063357] IPv4 over IPv4 tunneling driver
Apr  6 15:39:58 gb7cip kernel: [  460.932642] mkiss: ax2: Trying crc-smack
Apr  6 15:39:58 gb7cip kernel: [  460.932947] mkiss: ax1: Trying crc-smack
Apr  6 15:39:58 gb7cip kernel: [  460.934640] mkiss: ax4: Trying crc-smack
Apr  6 15:39:58 gb7cip kernel: [  460.939735] mkiss: ax0: Trying crc-smack
Apr  6 15:40:18 gb7cip kernel: [  481.096275] mkiss: ax1: Trying crc-flexnet
Apr  6 15:40:18 gb7cip kernel: [  481.101450] mkiss: ax0: Trying crc-flexnet
Apr  6 15:43:30 gb7cip kernel: [  673.205110] mkiss: ax2: Trying crc-flexnet
Apr  6 15:46:17 gb7cip node[3550]: g4apl @ 44.131.244.1 logged out: Bye
Apr  6 15:47:41 gb7cip kernel: [  923.663996] mkiss: ax1: crc mode is auto.
Apr  6 15:53:43 gb7cip node[3633]: g4apl @ 44.131.244.1 logged in

15:52 AX1 has gone AWOL
c u439 g4apl-8
GB7CR:CRNODE CRCHAT:GB7CIP-5 Invalid port
TEST THREE FAILED

Any theories??
73 de Paul G4APL GB7CIP
###
