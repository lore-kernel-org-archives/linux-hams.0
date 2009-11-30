From: Cathryn Mataga <cathryn@junglevision.com>
Subject: nr0 doesn't show up (netrom)
Date: Mon, 30 Nov 2009 12:38:50 -0800
Message-ID: <4B142D5A.7010803@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

On Fedora 12.  Kernel 2.6.31.5-127.fc12.i686  I install
libax25,ax25-apps, and ax25-tools via yum. I created my
nrports file as follows.  nrattach says it's creating
nr0, but then it says it creates nr0 again.  ifconfig
never shows nr0.

(Actually, otherwise this combination of software is working
correctly so far, and I am able to connect to ax25 stations
over actual RF.)


[root@junglevision ax25]# modprobe netrom
[root@junglevision ax25]# cat nrports
netrom KE6I-10 BERK 236 Berkeley
netrom2 KE6I-11 BRKBBS 236 Berkeley BBS
[root@junglevision ax25]# nrattach -i 192.168.0.10 netrom
NET/ROM port netrom bound to device nr0
[root@junglevision ax25]# nrattach -i 192.168.0.11 netrom2
NET/ROM port netrom2 bound to device nr0
[root@junglevision ax25]# /sbin/ifconfig
eth0      Link encap:Ethernet  HWaddr 00:13:20:12:68:A4
           inet addr:75.101.49.34  Bcast:75.101.49.63  Mask:255.255.255.224
           inet6 addr: fe80::213:20ff:fe12:68a4/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:2572078 errors:0 dropped:0 overruns:0 frame:0
           TX packets:4287069 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:682027869 (650.4 MiB)  TX bytes:4048632775 (3.7 GiB)

lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           inet6 addr: ::1/128 Scope:Host
           UP LOOPBACK RUNNING  MTU:16436  Metric:1
           RX packets:2318600 errors:0 dropped:0 overruns:0 frame:0
           TX packets:2318600 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:3228300929 (3.0 GiB)  TX bytes:3228300929 (3.0 GiB)

virbr0    Link encap:Ethernet  HWaddr 5A:7F:B7:E8:BC:C4
           inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.255.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:26 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 b)  TX bytes:5517 (5.3 KiB)

[root@junglevision ax25]#


Messages doesn't show much.  Just

NET: Registered protocol family 3
NET: Registered protocol family 6
