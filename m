From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: soundmodem, serial port, parallel port?
Date: Wed, 12 Feb 2003 06:22:04 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030212142204.63732.qmail@web14410.mail.yahoo.com>
References: <200302120839.38347.vk3bvp@qsl.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200302120839.38347.vk3bvp@qsl.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all,

I am trying now to communicate 2 machines using ax25
protocoll in a room.
The machines are using RH 7.1 kernel upgraded 2.4.19. 
The sound cards are PCI type and use the
soundmodem-0.7.

Firstly, I have tried using stereo cable as follow:
|pc1|-|sc1|------(cross connection)-----|sc2|-|pc2|
ping, ftp and telnet are worked enough.

Secondly, I am trying wireless using HT (Kenwood
TH-25G) <www.baycom.org/bayweb/tech/handy.htm> and PTT
circuit from
<http://campus.murraystate.edu/staff/scott.thile/k4set/packet/ptt.htm>.

|pc1|-|sc1|-|ht1|<~~~~~~>|ht2|-|sc2|-|pc2|
44.128.1.5                     44.128.1.8

[my1com]# route add 44.128.1.8 sm0
[my2com]# route add 44.128.1.5 sm0
[my1com]# arp -n 44.128.1.8 -H ax25 -s MY2COM -i sm0
[my2com]# arp -n 44.128.1.5 -H ax25 -s MY1COM -i sm0

[my2com]$ ping my1com
PING my1com.ampr.org (44.128.1.5) from 44.128.1.8:
56(84) bytes of data
From my2com.ampr.org (44.128.1.8): Destination Host
unreachable
..
..
From my2com.ampr.org (44.128.1.8): Destination Host
unreachable
--- my1com.ampr.org ping statistics ---
18 packets transmitted, 0 packet received, +17 errors,
100% packets loss

During ping 
[my2com]# listen -a
axconfig: port 1 not active
axconfig: port 2 not active
sc: fm my2com to my1com ctl UI pid=CC(IP) len 84
IP: len 84  44.128.1.8->44.128.1.5 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 42758 seq 0
0000  ..J>I>..................! "#$%&'()*+,-./01234567
sc: fm my2com to my1com ctl UI pid=CC(IP) len 84
IP: len 84  44.128.1.8->44.128.1.5 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 42758 seq 256
0000  ..J>a1..................! "#$%&'()*+,-./01234567
sc: fm my2com to my1com ctl UI pid=CC(IP) len 84
IP: len 84  44.128.1.8->44.128.1.5 ihl 20 ttl 64 DF
prot ICMP
ICMP: type Echo Request id 42758 seq 512
0000  ..J>B1..................! "#$%&'()*+,-./01234567
..
..
[my1com]# listen -a
axconfig: port 1 not active
axconfig: port 2 not active
[my1com]#
 
How can I ping correctly pc1<-->pc2?
Should I activate the serial port 1?
Can I activate the parallel port if I use
soundmodem-0.7 or it is only for serial port? As we
might know for soundblaster (ISA) we can do
# sethdlc -p -i sm0 mode sbc:afsk1200 io 0x388 irq 10
dma 1 pario 0x378

Many thanks for any help!
Vivi


__________________________________________________
Do you Yahoo!?
Yahoo! Shopping - Send Flowers for Valentine's Day
http://shopping.yahoo.com
