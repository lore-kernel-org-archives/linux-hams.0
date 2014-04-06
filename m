From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: RE: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port
 configuring corruption HELP Required please
Date: Sun, 6 Apr 2014 13:18:35 +0000
Message-ID: <0AC34FBF7531404B98449A9318023E3B011B2917@EXMBX16.thus.corp>
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


Hello David and co.
this the result of test1 with just one serial interface configured

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
Apr  6 10:49:09 gb7cip kernel: [    0.504399] 0000:02:02.0: ttyS4 at I/O 0xef00 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.504566] ttyS5: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.504575] 0000:02:02.0: ttyS5 at I/O 0xef08 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.504712] ttyS6: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.504721] 0000:02:02.0: ttyS6 at I/O 0xef10 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.504855] ttyS7: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.504864] 0000:02:02.0: ttyS7 at I/O 0xef18 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.505059] ttyS8: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.505069] 0000:02:02.1: ttyS8 at I/O 0xed00 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.505212] ttyS9: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.505222] 0000:02:02.1: ttyS9 at I/O 0xed08 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.505362] ttyS10: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.505372] 0000:02:02.1: ttyS10 at I/O 0xed10 (irq = 17) is a 16C950/954
Apr  6 10:49:09 gb7cip kernel: [    0.505514] ttyS11: detected caps 00000700 should be 00000500
Apr  6 10:49:09 gb7cip kernel: [    0.505524] 0000:02:02.1: ttyS11 at I/O 0xed18 (irq = 17) is a 16C950/9


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
73 de Paul g4apl gb7cip


_