From: Wilbert Knol <zl2bsj@zl2tze.myip.org>
Subject: PARPORT 9k6 modem & kernel 2.4.18
Date: Fri, 26 Apr 2002 10:27:33 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0204261018460.7924-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>
Cc: w.knol@niwa.cri.nz


I can confirm James's story.

After upgrading from kernel 2.4.8 (Mdk 8.1) to 2.4.18 (Mdk 8.2), my
parport 9k6 BayCom modem no longer works.

All modules load as they should, without complaints:

Module                  Size  Used by    Not tainted
netrom                 27012   4
mkiss                   6912   2
baycom_par              5632   1
hdlcdrv                 8020   4  [baycom_par]
ax25                   44500  12  [netrom mkiss hdlcdrv]
parport_pc             22088   1
parport                23968   1  [baycom_par parport_pc]


The bcp0 network interface shows up as:

bcp0      Link encap:AMPR AX.25  HWaddr ZL2BSJ-12
          inet addr:44.147.180.122  Mask:255.255.0.0
          UP RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:16
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:7 Base address:0x378

..but doesn't pass any traffic. No RX, no TX. I am using the same ax25-up
script I used with the 2.4.8 kernel.

Any pointers on how to fix this are most welcome...I am stumped.
I am considering patching up to the most current kernel to get Jeroen's
sock_orphan() fix, although it probably won't solve this problem.


Wilbert, ZL2BSJ


