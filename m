From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [AX25] ipv6 incompatible with AX.25
Date: Tue, 25 Jan 2022 10:14:30 -0800
Message-ID: <2394eae7-dada-f43e-40b9-fae929212913@trinnet.net>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
 <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: f6bvp@free.fr, linux-hams@vger.kernel.org
Cc: List for the LINUX version of FBB <xfbb@f6fbb.org>, fpac@f6fbb.org, F3KT <f3kt@free.fr>


Hey Bernard,

When you saw the lines:

--
Jan 25 12:16:31 f6bvp-Ubuntu kernel: [ 6942.400016] IPv6:
ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
--

was the AX25 interface not up and usable for classic packet regardless 
of it's IPv6 state?  Generally speaking, I had been been disabling IPv6 
for the longest time but I've been leaving it enabled as all of us need 
to start embracing IPv6.  Anyway, on my Ubuntu 20.04 machine, I have 
IPv6 enabled with AX25 interfaces present though I only have a link 
local address on my primary Ethernet interface (no IPv6 on ax0).  It 
should be noted I do NOT use AXIPv4 and it wouldn't surprised me if 
AXIPv6 doesn't work. There are a lot of tools in modern Linuxes that 
don't even support all aspects of AX25, NETROM, ROSE, etc. in modern 
tools like "ip", etc.  Many of us have to resort to installing legacy 
tools like ifconfig and route to get the job done.

--
$ ip addr

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
group default qlen 1000
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
        valid_lft forever preferred_lft forever
     inet6 ::1/128 scope host
        valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state 
UP group default qlen 1000
     link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
     altname enp0s31f6
     inet 192.168.0.25/24 brd 192.168.0.255 scope global dynamic 
noprefixroute eth0
        valid_lft 66471sec preferred_lft 66471sec
     inet6 fe80::xxxx:xxxx:xxxx:xxxx/64 scope link
        valid_lft forever preferred_lft forever
3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue 
state DOWN group default qlen 1000
     link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
     altname wlp4s0
4: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue 
state DOWN group default qlen 1000
     link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
     inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
        valid_lft forever preferred_lft forever
5: virbr0-nic: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel master 
virbr0 state DOWN group default qlen 1000
     link/ether xx:xx:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
11: ax0: <BROADCAST,UP,LOWER_UP> mtu 255 qdisc fq_codel state UNKNOWN 
group default qlen 10
     link/ax25 xx:xx:xx:xx:xx:xx:xx brd a2:a6:a8:40:40:40:00
     inet 44.128.0.1/24 scope global ax0
        valid_lft forever preferred_lft forever
--


> I hope this will help and I have a question. Shall this line be 
> uncommented in sysctl.conf ?
>
> # Uncomment the next line to enable packet forwarding for IPv4
> #net.ipv4.ip_forward=1

I question if you really want this on as this should only be enabled if 
you what your LInux device to be a router (aka.. forwarding packets 
between one interface and another).  This is NOT used if remote stations 
just want to reach your machine via IP.  Fyi, this kernel /proc command 
alone isn't enough to get routing working.  You also need to setup 
forwarding policies using tools like iptables (legacy) or nftables 
(newest way).


> I actually have the following in my ax25start script :
>
> ax25start:echo 1 > /proc/sys/net/ipv4/ip_forward

Same point as above.

--David
KI6ZHD
