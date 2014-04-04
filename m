From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port configuring corruption HELP Required please
Date: Fri, 4 Apr 2014 16:36:59 +0100
Message-ID: <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello All

I have looked through the last four years of Linux-Ham listings and can
not find an Answer to my difficulties.
Here is a copy of my Packet bulletin that I have put out to packet lan
also includes as much related diagnostic information as I find.
Remember that I am not a 'software engineer' [smile]

GB7CIP UPGRADE help reqd pls(2)

My thanks for Matt M0ZAI, Gus I0OJJ Jim WU3V
Jim I did not know about the dmesg trace command very usefull

Now to follow up from my last bulletin 1 April 2014 GB7CIP UPGRADE help
reqd pls
I am aware the log listing are greater than 78 characters

I spent most of yesterday into the early hours of this morning trying to
establish
what is going on with the serial interfaces.

So back requesting help from Packet Land Support.

I will briefly recap, then give details of my investigations and lastly
the what the system details the serial devices


Moving all the services that have been running for 20 years on my
slarkware
ip/ax25 server gb7cip.ampr.org over to Ubuntu. 12.04 lts... kernel
3.5.0-48
A task that I started in the Spring of 2013.
After many false attempts in the previous ten years.

I have copied across my configuration files and edited them to meet the
current
directory structure and interface changes.
Install and compiled all the source using Charles K4GBB Scripts]

I have a VSCOM TC-800 PCI 8 port serial card vscardcfg-1_62
Using the dmesg trace

We have proved that it is recognised by the system
the six ax ports have been annotated.  The other two unused ports
at the moment will be use by linfbb HF Pactor as before

0.384504] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[    0.473977] 00:08: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A

 i/f port    VSCom Card
[ax3 u432 0.492748] ttyS4: detected caps 00000700 should be 00000500
[         0.492762] 0000:01:02.0: ttyS4 at I/O 0xef00 (irq = 17) is a
16C950/954
[ax1 u439 0.492903] ttyS5: detected caps 00000700 should be 00000500
[         0.492913] 0000:01:02.0: ttyS5 at I/O 0xef08 (irq = 17) is a
16C950/954
[         0.493046] ttyS6: detected caps 00000700 should be 00000500
[ax5 u432b0.493056] 0000:01:02.0: ttyS6 at I/O 0xef10 (irq = 17) is a
16C950/954
[ax4 v50  0.493190] ttyS7: detected caps 00000700 should be 00000500
[         0.493199] 0000:01:02.0: ttyS7 at I/O 0xef18 (irq = 17) is a
16C950/954

[ax0 u433 0.493377] ttyS8: detected caps 00000700 should be 00000500
[         0.493387] 0000:01:02.1: ttyS8 at I/O 0xed00 (irq = 17) is a
16C950/954
[   PTC2  0.493527] ttyS9: detected caps 00000700 should be 00000500
[         0.493537] 0000:01:02.1: ttyS9 at I/O 0xed08 (irq = 17) is a
16C950/954
[ax2 v70  0.496275] ttyS10: detected caps 00000700 should be 00000500
[        0.496286] 0000:01:02.1: ttyS10 at I/O 0xed10 (irq = 17) is a
16C950/954
[   PTC1 0.496430] ttyS11: detected caps 00000700 should be 00000500
[        0.496440] 0000:01:02.1: ttyS11 at I/O 0xed18 (irq = 17) is a
16C950/954


lspci    Correctly Identifies the serial
01:02.0 Serial controller: Titan Electronics Inc VScom 400H 4 port
serial adapter
01:02.1 Serial controller: Titan Electronics Inc VScom 400HF1 4 port
serial adapter

The problem

Identifies the TC-800 VScom board correctly
Running kissattach  version 1.0.2

If I run kissattach just for the first four interfaces ax0 to ax3
it configures the Interfaces and pick ups the port details from the
axports file

Extract from Kernel Log
Apr  4 01:20:15 gb7cip kernel: [    0.496570] ttyS4: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.496583] 0000:01:02.0: ttyS4 at I/O
0xef00 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.496726] ttyS5: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.496736] 0000:01:02.0: ttyS5 at I/O
0xef08 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.496871] ttyS6: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.496880] 0000:01:02.0: ttyS6 at I/O
0xef10 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.497015] ttyS7: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.497024] 0000:01:02.0: ttyS7 at I/O
0xef18 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.497205] ttyS8: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.497215] 0000:01:02.1: ttyS8 at I/O
0xed00 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.497357] ttyS9: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.497367] 0000:01:02.1: ttyS9 at I/O
0xed08 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.497507] ttyS10: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.497517] 0000:01:02.1: ttyS10 at
I/O 0xed10 (irq = 17) is a 16C950/954
Apr  4 01:20:15 gb7cip kernel: [    0.497660] ttyS11: detected caps
00000700 should be 00000500
Apr  4 01:20:15 gb7cip kernel: [    0.497670] 0000:01:02.1: ttyS11 at
I/O 0xed18 (irq = 17) is a 16C950/954
Apr  4 01:21:50 gb7cip kernel: [  133.104704] mkiss: ax0: crc mode is
auto.
Apr  4 01:21:50 gb7cip kernel: [  133.105109] IPv6:
ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  4 01:21:54 gb7cip kernel: [  137.119205] mkiss: ax1: crc mode is
auto.
Apr  4 01:21:54 gb7cip kernel: [  137.122573] IPv6:
ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Apr  4 01:21:58 gb7cip kernel: [  141.132074] mkiss: ax2: crc mode is
auto.
Apr  4 01:21:58 gb7cip kernel: [  141.135056] IPv6:
ADDRCONF(NETDEV_CHANGE): ax2: link becomes ready
Apr  4 01:22:02 gb7cip kernel: [  145.144135] mkiss: ax3: crc mode is
auto.
Apr  4 01:22:02 gb7cip kernel: [  145.147110] IPv6:
ADDRCONF(NETDEV_CHANGE): ax3: link becomes ready
Apr  4 01:31:13 gb7cip kernel: [  696.023192] mkiss: ax3: crc mode is
auto.
Apr  4 01:47:08 gb7cip kernel: [ 1650.914089] mkiss: ax1: crc mode is
auto.




If I run the kissattach for
If I run kissattach just for all six interfaces ax0 to ax5
with sleep delays, so that I can check the configuration setting with
ifconfig
it configures the first four ax0-ax3 Interfaces and pick upi the port
details from
the axports file correctly. continuing ax4 to ax6

Checking the setting again with ifconfig,
I find that ax0, ax3, ax4 have lost there settings e.g
ax0       Link encap:AMPR AX.25  HWaddr
          BROADCAST MULTICAST  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Early this morning 03:30 hours when I left the server running
I had lost three interfaces ax0, ax3, ax4
checking the system which is still running since 03:30 Ihave lost
ax0 ax1 ax3 ax4 i.e only two serial interfaces up.

kernal log extract from the reload this morning all six serial
interfaces
### ################## The Following Load is left to run overnight
############
Apr  4 02:58:49 gb7cip kernel: [    0.496141] 0000:01:02.0: ttyS4 at I/O
0xef00 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.496307] ttyS5: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.496317] 0000:01:02.0: ttyS5 at I/O
0xef08 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.496453] ttyS6: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.496462] 0000:01:02.0: ttyS6 at I/O
0xef10 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.496598] ttyS7: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.496607] 0000:01:02.0: ttyS7 at I/O
0xef18 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.496800] ttyS8: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.496810] 0000:01:02.1: ttyS8 at I/O
0xed00 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.496954] ttyS9: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.496964] 0000:01:02.1: ttyS9 at I/O
0xed08 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.497104] ttyS10: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.497114] 0000:01:02.1: ttyS10 at
I/O 0xed10 (irq = 17) is a 16C950/954
Apr  4 02:58:49 gb7cip kernel: [    0.497255] ttyS11: detected caps
00000700 should be 00000500
Apr  4 02:58:49 gb7cip kernel: [    0.497265] 0000:01:02.1: ttyS11 at
I/O 0xed18 (irq = 17) is a 16C950/954
Apr  4 03:00:21 gb7cip kernel: [  130.959172] mkiss: ax0: crc mode is
auto.
Apr  4 03:00:21 gb7cip kernel: [  130.959634] IPv6:
ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
Apr  4 03:00:25 gb7cip kernel: [  134.975966] mkiss: ax1: crc mode is
auto.
Apr  4 03:00:25 gb7cip kernel: [  134.980656] IPv6:
ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
Apr  4 03:00:29 gb7cip kernel: [  138.988381] mkiss: ax2: crc mode is
auto.
Apr  4 03:00:29 gb7cip kernel: [  138.992689] IPv6:
ADDRCONF(NETDEV_CHANGE): ax2: link becomes ready
Apr  4 03:00:33 gb7cip kernel: [  143.001514] mkiss: ax3: crc mode is
auto.
Apr  4 03:00:33 gb7cip kernel: [  143.005291] IPv6:
ADDRCONF(NETDEV_CHANGE): ax3: link becomes ready
Apr  4 03:00:37 gb7cip kernel: [  147.014007] mkiss: ax4: crc mode is
auto.
Apr  4 03:00:37 gb7cip kernel: [  147.017765] IPv6:
ADDRCONF(NETDEV_CHANGE): ax4: link becomes ready
Apr  4 03:00:41 gb7cip kernel: [  151.028427] mkiss: ax0: crc mode is
auto.
Apr  4 03:00:41 gb7cip kernel: [  151.037120] mkiss: ax4: crc mode is
auto.
Apr  4 03:00:41 gb7cip kernel: [  151.037578] mkiss: ax5: crc mode is
auto.
Apr  4 03:00:41 gb7cip kernel: [  151.037990] IPv6:
ADDRCONF(NETDEV_CHANGE): ax5: link becomes ready
Apr  4 03:01:05 gb7cip kernel: [  175.235462] mkiss: ax3: crc mode is
auto
Apr  4 03:01:19 gb7cip kernel: [  188.836533] mkiss: ax6: crc mode is
auto.
Apr  4 03:01:19 gb7cip kernel: [  188.851813] IPv6:
ADDRCONF(NETDEV_CHANGE): ax6: link becomes ready
Apr  4 03:02:01 gb7cip kernel: [  230.680657] mkiss: ax7: crc mode is
auto.
Apr  4 03:02:01 gb7cip kernel: [  230.691875] IPv6:
ADDRCONF(NETDEV_CHANGE): ax7: link becomes ready
Apr  4 03:02:34 gb7cip kernel: [  264.134716] mkiss: ax8: crc mode is
auto.
Apr  4 03:02:34 gb7cip kernel: [  264.138326] IPv6:
ADDRCONF(NETDEV_CHANGE): ax8: link becomes ready
Apr  4 03:02:51 gb7cip kernel: [  280.524937] mkiss: ax9: crc mode is
auto.
Apr  4 03:02:51 gb7cip kernel: [  280.534841] IPv6:
ADDRCONF(NETDEV_CHANGE): ax9: link becomes ready
Apr  4 03:03:05 gb7cip kernel: [  294.913728] mkiss: ax10: crc mode is
auto.
Apr  4 03:03:05 gb7cip kernel: [  294.920428] IPv6:
ADDRCONF(NETDEV_CHANGE): ax10: link becomes ready
Apr  4 03:03:18 gb7cip kernel: [  307.859752] mkiss: ax11: crc mode is
auto.
Apr  4 03:03:18 gb7cip kernel: [  307.869133] IPv6:
ADDRCONF(NETDEV_CHANGE): ax11: link becomes ready
Apr  4 03:03:34 gb7cip kernel: [  323.956963] IPv4 over IPv4 tunneling
driver
Apr  4 03:04:00 gb7cip kernel: [  349.463572] mkiss: ax9: Trying
crc-smack
Apr  4 03:14:00 gb7cip kernel: [  949.464723] mkiss: ax9: Trying
crc-flexnet
Apr  4 03:26:49 gb7cip kernel: [ 1718.436030] mkiss: ax1: Trying
crc-smack
Apr  4 03:26:49 gb7cip kernel: [ 1718.436623] mkiss: ax1: Trying
crc-flexnet
Apr  4 03:26:49 gb7cip kernel: [ 1718.440807] mkiss: ax5: Trying
crc-smack
Apr  4 03:26:49 gb7cip kernel: [ 1718.441305] mkiss: ax5: Trying
crc-flexnet
Apr  4 03:30:34 gb7cip kernel: [ 1944.082136] mkiss: ax7: Trying
crc-smack
Apr  4 03:30:44 gb7cip kernel: [ 1954.112035] mkiss: ax7: Trying
crc-flexnet
Apr  4 03:31:01 gb7cip kernel: [ 1970.738598] mkiss: ax10: Trying
crc-smack
Apr  4 03:31:11 gb7cip kernel: [ 1980.768038] mkiss: ax10: Trying
crc-flexnet
############### 03:40 hours left running overnight
###########################


Spent hours testing, experimenting yesterday on this issue.

System confused, and so am I at the moment.

Still a lot more on the task list.

Hope someone out there in Packet Land has the answer, Please

73 de Paul g4apl @ gb7cip.#32.gbr.eu
email paul [at ] skywaves.demon.co.uk







-- 
paul@skywaves.demon.co.uk
