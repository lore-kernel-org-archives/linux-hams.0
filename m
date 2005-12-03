From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Good news : AX25 is working with 2.6.14-3 kernel
Date: Sat, 03 Dec 2005 01:37:19 +0100
Message-ID: <4390E8BF.7070902@ccr.jussieu.fr>
References: <438B674E.7030100@sm6tpn.mine.nu>
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

For the first time using a 2.6 kernel I have been able to run an AX25 
application using 2.6.14-3 kernel, All previous attempts with 2.6 
kernels had failed...

I can use "call" program through an AXIP link to connect a remote BBS.

My previous semi success where limited to a 2.4 kernel, but it was not 
very stable,

My 24h/7d BBS-ROSE/FPAC switch / DxNet node station keeps on running on 
a 2.26 highly stable kernel for years. (updated Mandrake 7.2).

On my test machine I am using a Mandriva Linux 2006 here on a PIII 500 
MHz PC (distributed with kernel 2.6.12).
I have compiled and installed kernel 2.6.14-3 from kernel.org with 
hamradio ax25, rose, netrom and mkiss compiled as modules.
I can modprobe AX25, MKISS, ROSE.

libax25, ax25-tools and apps had been previously compiled after some 
#include modifications on an earlier 2.6 kernel.
See here : 
http://f6bvp.free.fr/logiciels/Kernel-2.6-AX25-patchs/ax25-tools-0.0.8-kernel2.6.diff

For AX25 over IP encapsulation I start a tunnel with :
/usr/sbin/kissattach -l -m 256 /dev/pty/m0 0 44.151.75.15
0 is the first port declared in /etc/ax25/axports like this :
0 F6KFA-6 115200 256 4 Linux (AXIP)

Then I run ax25ipd
/usr/sbin/ax25ipd

While in file /etc/ax25/ax25ipd.conf the device declaration for the 
other part of the tunnel is :

device /dev/pty/s0

Ifconfig shows me that ax0 port has been created.

I can then use call to connect a BBS or remote ROSE/FPAC AX25 node.

Up to now, ROSE/FPAC is not working and makes the system crash.
I will try to find the reason and the try to run the F6FBB BBS.
See here a usefull patch :
http://f6bvp.free.fr/logiciels/rose-fpac/axlib.h.diff


By the way, I found very usefull to set

echo > 10 /proc/sys/kernel/panic

to make the machine reboot 10 sec after a kernel crash.

73 de Bernard, f6bvp
http://f6bvp.org
