From: Bernard Pidoux <bernard.pidoux@sorbonne-universite.fr>
Subject: [AX25] ipv6 incompatible with AX.25
Date: Tue, 25 Jan 2022 12:46:25 +0100
Message-ID: <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
Reply-To: f6bvp@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Language: fr
In-Reply-To: <4DFA6A59.2000709@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: List for the LINUX version of FBB <xfbb@f6fbb.org>, fpac@f6fbb.org, F3KT <f3kt@free.fr>, F6BVP <f6bvp@free.fr>

Hi,

Recently installing a new node for kernel rose module debugging (...) I 
experienced a few connexion troubles.

Some are already known AX.25 bug and rose bug that I wanted to 
investigate taking advantage of kernel Ubuntu 5.4.151 source 
availability that can be patched and module recompiled.

Here is a new feature interfering with AX.25 connexions as displayed in 
/var/log/syslog :

Jan 25 12:16:31 f6bvp-Ubuntu kernel: [ 6942.400016] IPv6: 
ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready

After some investigations I added the following four lines in 
/etc/sysctl.conf and rebooted :

# Disable ipv6
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1

Then no more ipv6 are shown by ifconfig and AX25 connexions via LAN are 
now ok !

enp5s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         inet 44.168.19.21  netmask 255.255.255.240  broadcast 44.168.19.31
         ether 00:23:54:8d:41:e9  txqueuelen 1000  (Ethernet)
         RX packets 44907  bytes 60439240 (60.4 MB)
         RX errors 0  dropped 53  overruns 0  frame 0
         TX packets 16668  bytes 2115347 (2.1 MB)
         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Looking at my ROSE/FPAC nodes I found that I could perform the same 
changes on my RaspBerry Pis nodes for better results.

I hope this will help and I have a question. Shall this line be 
uncommented in sysctl.conf ?

# Uncomment the next line to enable packet forwarding for IPv4
#net.ipv4.ip_forward=1

I actually have the following in my ax25start script :

ax25start:echo 1 > /proc/sys/net/ipv4/ip_forward

