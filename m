From: Miroslav Skoric <skoric@eunet.rs>
Subject: Link Win/BPQ32 >< Lin/FPAC
Date: Sun, 19 Feb 2012 16:39:44 +0100
Message-ID: <4F4117C0.8060200@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

I have  three BPQ32  machines in  the home  LAN and  they talk  each 
other by using bpqether ports.  One machine has  two network cards  and 
the other two have one card each, so the box with two cards interconnect 
all of them in a chain. When everything is up, all three BPQ32 nodes see 
each other, netrom works too in between, etc.

Al three comps  are dual-boot (with  either Debian 6.04 or  Ubuntu 
10.04.2). Now I want to experiment  with  connecting  a BPQ32  node  to 
a FPAC node. It seems that FPAC nodes need axudp ports  to see the  rest 
of the  world, but if  I replace bpqether with axip  at BPQ32  comps, 
they  stop talking  each other  (I mean all three BPQ32 nodes).

On the  other side, I  do not know  if it is possible to use bpqether 
approach in FPAC (in a way bpq works  in Linux Node; I mean to configure 
ports bpq0, bpq1, etc.  instead of  ax0, ax1,  rose0, rose1,  etc.) In 
fact, some  time ago  I managed to interconnect a BPQ32 machine  with a 
Linux Node machine, by using only bpqether mode at the Windows side, and 
only bpq module at the Linux side. Any idea?

Misko
