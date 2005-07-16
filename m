From: IZ4EFN Alessio <iz4efn@libero.it>
Subject: Re: Gateway matters...routing matters!
Date: Sun, 17 Jul 2005 00:21:52 +0200
Message-ID: <42D98880.7040509@libero.it>
References: <OMEGIMHHANGHDCMEGEJCOELICCAA.g0lgs@gb7lgs.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <OMEGIMHHANGHDCMEGEJCOELICCAA.g0lgs@gb7lgs.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


>I think you need:
>
>	ip route add 44.134.8.0/24 via 134.43.26.1 dev tunl0 onkink
>
>--
>Stewart 
>
Thanks Stewart!!

I'm OK now!

I tryed with some known routes and hosts, everything worked fine with 
the routing table:

root@arimodena:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
ir3ip.ampr.org  ppp-217-133-38- 255.255.255.255 UGH   0      0        0 
tunl0
44.134.8.0      134.43.26.1     255.255.255.0   UG    0      0        0 
tunl0
localnet        *               255.255.255.0   U     0      0        0 eth0
44.134.144.0    213.254.10.100  255.255.252.0   UG    0      0        0 
tunl0
44.134.128.0    213.254.10.100  255.255.240.0   UG    0      0        0 
tunl0
loopback        *               255.0.0.0       U     0      0        0 lo
default         192.168.0.1     0.0.0.0         UG    1      0        0 eth0
root@arimodena:~#


but i'm not able to use the gateway to ping a known host behind the 
network routed.

ip_forward IS configured (echo 1 > /proc/sys/net/ipv4/ip_forward).

I'm wondering if my router is blocking Protocol 94 (it's a Cisco SOHO 
97, and the gateway machine as all ports opened on its pubblic IP).

Or other mistakes are stopping the connection?

I just noticed (with netwatch) that i send packets to the rigth gateway 
(on the iNET address) while pinging, but nothing comes back. RX packets 
are 0.
That's why I'm wondering about the router...even if all ports are 
opened...Protocol 94 matter?

Thanks!

Alessio IZ4EFN.
