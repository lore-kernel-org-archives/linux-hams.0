From: Miroslav Skoric <skoric@EUnet.rs>
Subject: Linux nodes instead of BPQ32 nodes in the LAN
Date: Wed, 06 Jul 2011 21:08:22 +0200
Message-ID: <4E14B2A6.5000707@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi all!

I have been experimenting with 3 computers as AX.25 nodes in a home LAN,
as follows:

            _____________      ___________________   __________________
VHF        |MS DOS 5 comp|    |MS Windows XP comp|  |MS Windows XP comp|
TRX--TNC2--|  BPQ 4.09d  | -- |    BPQ32 4.10f   |--|    BPQ32 4.10f   |
ant         -------------      ------------------    ------------------

                (1)                   (2)                    (3)


In the situation above all 3 nodes talk to each other without problems.
What I wanted to do was to replace comps (2) and (3) with Linux nodes.
Both of those comps are dual-boot: (2) is Debian 6.0.1a, and (3) is
Ubuntu 10.04.2 LTS.

Ok so I installed libax, ax25tools and ax25apps, as well as node on both
(2) and (3) by using Synaptic but am not able to activate the nodes
properly. In fact, I have edited the main files in /etc/ax25 on both
machines according to the ancient AX.25-howto and then tried the
following commands in Ubuntu terminal (in Debian root terminal of course
without 'sudo'):

sudo modprobe bpqether (did not complain anything)
sudo /sbin/ifconfig bpq0 hw ax25 yt7mpb-15 up (did not complain either)
sudo ifconfig responded with:
bpq0      Link encap:AMPR AX.25  HWaddr YT7MPB-15
          UP RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth0      Link encap:Ethernet  HWaddr 00:25:22:3d:9f:22
          inet addr:192.168.0.4  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::225:22ff:fe3d:9f22/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:116 errors:0 dropped:0 overruns:0 frame:0
          TX packets:125 errors:0 dropped:0 overruns:0 carrier:1
          collisions:0 txqueuelen:1000
          RX bytes:12824 (12.8 KB)  TX bytes:11360 (11.3 KB)
          Interrupt:27

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:15 errors:0 dropped:0 overruns:0 frame:0
          TX packets:15 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:957 (957.0 B)  TX bytes:957 (957.0 B)

sudo modprobe netrom (did not complain)
sudo nrattach netrom responded with:
NET/ROM port netrom bound to device nr0
sudo nrattach netnod responded with:
NET/ROM port netnod bound to device nr1
sudo ax25d responded with:
axconfig: port bpq0 not active
ax25d: no AX.25 port data configured
sudo netromd
axconfig: port bpq0 not active
netromd: no AX.25 ports defined

I suppose that I mis-configured and/or forgotten some important steps
and would like to contact somebody with more experience with Linux nodes
running over Ethernet. Btw, at the moment I do not plan to run any RF
ports on those Linux machines - just to have netrom nodes on them so
that those nodes should be able to talk with the dos computer (1), and
probably later I will add LinFBB to replace the WinFBB's that run over
BPQ32 nodes when (2) and (3) are booted as Win XP.

Regards,

Misko YT7MPB

