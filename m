From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: AX25 applications working with 2.6.14-3 kernel
Date: Sun, 11 Dec 2005 23:19:30 +0100
Message-ID: <439CA5F2.1010904@ccr.jussieu.fr>
References: <438B674E.7030100@sm6tpn.mine.nu>
Reply-To: List for the LINUX version of FBB <xfbb@f6fbb.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <438B674E.7030100@sm6tpn.mine.nu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: List for the LINUX version of FBB <xfbb@f6fbb.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi,

A few days ago I reported that kernel 2.6.14-3 was fine for AX25,
It is still true.

I also reported that ROSE/FPAC was not working and crashed the system.

Indeed, this was due to the fact that I was too lazy and had not yet 
recompiled libax25, ax25-tools and ax25-apps,

Now that I recompiled those librairies and utilities together with 
FPAC325, FPAC runs fine.

I also compiled DxNet 4.4 (by F5MZN) and it goes well.
[ cvs -d :pserver:anonymous@cvs.f5mzn.org:/home/cvs checkout dxnet ]

Next step, will be to compile and run LinFbb and try the serial kiss 
links with TNCs. Up to now I am only running an experimental machine 
connected via AXIP over local LAN.

By the way, it is also connected via a 150 feet ethernet link to a 2.4 
GHz spread spectrum Access Point (Linksys WRT54G) in a waterproof box 
situated on the roof of my home building. The firmware has been updated 
with Alchimy 1.0 from SVEASOFT. With this firmware it is possible to set 
a number of options like the output power from 28 mW (default) up to 250 
mW (not recommanded), select the TX and RX antenna etc... My WRT54G is 
connected to a 19dBi parabolic antenna. I plan to set up a second one 
with an omni +8dBi vertical antenna.

73 de Bernard, f6bvp
http://f6bvp.org

