From: Jim Meehan <jmeehan@vpizza.org>
Subject: YAM transmit problem
Date: Fri, 5 Nov 2004 18:56:01 -0800
Message-ID: <20041106025600.GV16055@alcatraz.vpizza.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello all,

I'm trying to get a YAM modem working with my Linux machine.  I believe
I've got the configuration correct using yamcfg, ifconfig, and the 
/etc/ax25/axports file.  I can see inbound packets using the "listen" tool
from the ax25-utils package, and the RX packets counter is incrementing
when I look at ifconfig:

yam0      Link encap:AMPR AX.25  HWaddr W6XE-11  
          inet addr:10.0.0.1  Mask:255.0.0.0
          UP RUNNING  MTU:256  Metric:1
          RX packets:108 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:4 Base address:0x3f8 

However, when I try to transmit packets, using the "beacon" tool, or 
ax25_call, no packets are transmitted.  I don't believe this is a hardware
problem, since I don't see the TX packets counter in ifconfig incrementing,
and I don't see any outbound packets in the output from "listen".  Also,
I don't see the red TX LED go on on the YAM board.

Any ideas on why none of the ax25 programs are transmitting packets?

Thanks,

Jim, W6XE

