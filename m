From: IZ4EFN Alessio <iz4efn@libero.it>
Subject: Gateway matters...routing matters!
Date: Sat, 16 Jul 2005 23:00:56 +0200
Message-ID: <42D97588.3050509@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

I'm currently trying to setup a gateway to the 44 network for my local 
wi-fi users.

I've been following some advices offered by local gateway owner and 
linuxham how to as well.

Now:

I'm able to load the module ipip.

I'm able to load the tunl0 interface for tunneling: ifconfig tunl0 
44.134.130.1 mtu 576 up

I'm able to set the default route to USCD.EDU: ip route add 44.0.0.0/8 
via 128.54.16.18 dev tunl0 onlink

and the routing table says:

root@arimodena:/etc# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
localnet        *               255.255.255.0   U     0      0        0 eth0
loopback        *               255.0.0.0       U     0      0        0 lo
44.0.0.0        mirrorshades.uc 255.0.0.0       UG    0      0        0 
tunl0
default         192.168.0.1     0.0.0.0         UG    1      0        0 eth0
root@arimodena:/etc#



Now I should load from a file all the routes, but let's try manually 
with one single routes!

I wanna add the 44.134.8.0/24 network to be routed through 134.43.26.1 
via the tunl0 device:

root@arimodena:/etc# route add -net 44.134.8.0 netmask 255.255.255.0 dev 
tunl0 gw 134.43.26.1
SIOCADDRT: Network is unreachable
root@arimodena:/etc#

The SIOCADDRT error is clear, but I don't understand why this happends.

Maybe I forgot something before setting the roules?

Any help is really appreciated!

(I know I should ask this on the Gateways ML on cows.net but its server 
looks down...)

Thanks!!

Alessio IZ4EFN.




