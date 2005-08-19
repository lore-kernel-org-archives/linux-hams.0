From: "Scott Weis" <kb2ear@kb2ear.net>
Subject: AX-25 software that works on Fedora Core 4?
Date: Fri, 19 Aug 2005 14:55:42 -0400
Message-ID: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

I have been working for weeks to try and get AX-25 working with the mkiss 
module.  Best I can figure is that there is no working AX25 for SMP kernels 
and core 4.  The ax25-utils package has not kept up with the updates made in 
the kernel. This is all I can manage to get when I try to start an 
interface..

+ /sbin/modprobe mkiss
+ sleep 5
+ /usr/local/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptya1 /dev/ptya2
+ /usr/local/sbin/kissattach /dev/ttya1 ax0 172.16.198.1
kissattach: SIOCSIFHWADDR: Invalid argument
unregister_netdevice: device ax%d/ddc80400 never was registered
+ ifconfig ax0 netmask 255.255.255.0 broadcast 172.16.198.255
SIOCSIFNETMASK: No such device
SIOCGIFADDR: No such device
SIOCSIFBROADCAST: No such device
SIOCSIFBRDADDR: No such device
ax0: unknown interface: No such device
+ /usr/local/sbin/kissattach /dev/ttya2 ax1 172.16.199.1
kissattach: open: Input/output error
+ ifconfig ax1 netmask 255.255.255.0 broadcast 172.16.199.255
SIOCSIFNETMASK: No such device
SIOCGIFADDR: No such device
SIOCSIFBROADCAST: No such device
SIOCSIFBRDADDR: No such device
ax1: unknown interface: No such device

I am running kernel 2.4.13-rc6, I have a kantronics KAM-XL so I can't do 
6pack.

Any idea how to get up and running again, I don't want to go back to FC1


Thanks & 73 de
Scott KB2EAR 

