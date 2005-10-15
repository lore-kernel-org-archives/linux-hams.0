From: aa6qn@aa6qn.sytes.net
Subject: iproute2 ipip tunnel routing ?
Date: Sat, 15 Oct 2005 05:43:26 -0700 (PDT)
Message-ID: <59203.127.0.0.1.1129380206.squirrel@127.0.0.1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I could use a little help here. When I was running 2.4 kernels with
iproute2 commands I used the following routing statements to achieve my
ipip tunnels:

ip route add (dest ip) via (dst ip gateway) dev tunl0 proto static onlink

This worked very well for ax25ipd ipip tunnels.

Now that I am running 2.6.14-r3 kernel with uDev, the above routing
statement loads just fine but I can not make a ipip connection to the
destination address.

I did some reading on iproute2 and tried to load a tunnel using:

ip tunnel add mode ipip remote (dest ip gateway) local (my local eth0 ip)
dev tunl0

The above statement works and allows me to connect from the console to the
remote 44 domain IP address. It does not work for the ax25ipd connection
or from a jnos application that is attached via slattach on sl0.

I have tried adding IP tunnels to my kernel both static and as modules
with the same results. I have added IP protocol 4 to my internal and
external firewalls (as when I ran 2.4)

ip link show:

1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: tunl0: <NOARP,UP> mtu 512 qdisc noqueue
    link/ipip 0.0.0.0 brd 0.0.0.0
3: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:11:2f:69:5f:1a brd ff:ff:ff:ff:ff:ff
4: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 1000
    link/ether 00:d0:b7:a0:23:6e brd ff:ff:ff:ff:ff:ff
5: nr0: <NOARP,UP> mtu 236 qdisc noqueue
    link/generic 82:82:6c:a2:9c:40:06 brd 00:00:00:00:00:00:00
6: nr1: <NOARP> mtu 236 qdisc noop
    link/generic 00:00:00:00:00:00:00 brd 00:00:00:00:00:00:00
7: nr2: <NOARP> mtu 236 qdisc noop
    link/generic 00:00:00:00:00:00:00 brd 00:00:00:00:00:00:00
8: nr3: <NOARP> mtu 236 qdisc noop
    link/generic 00:00:00:00:00:00:00 brd 00:00:00:00:00:00:00
9: sl0: <POINTOPOINT,MULTICAST,NOARP,UP> mtu 576 qdisc pfifo_fast qlen 10
    link/slip
10: ax0: <BROADCAST,UP> mtu 512 qdisc pfifo_fast qlen 10
    link/ax25 82:82:6c:a2:9c:40:12 brd a2:a6:a8:40:40:40:60
11: ax1: <BROADCAST,UP> mtu 256 qdisc pfifo_fast qlen 10
    link/ax25 82:82:6c:a2:9c:40:18 brd a2:a6:a8:40:40:40:60
12: ax2: <BROADCAST,UP> mtu 256 qdisc pfifo_fast qlen 10
    link/ax25 82:82:6c:a2:9c:40:16 brd a2:a6:a8:40:40:40:60
13: ax3: <BROADCAST,UP> mtu 256 qdisc pfifo_fast qlen 10
    link/ax25 98:9e:9e:a0:62:40:00 brd a2:a6:a8:40:40:40:60
14: ax4: <BROADCAST,UP> mtu 256 qdisc pfifo_fast qlen 10
    link/ax25 98:9e:9e:a0:64:40:00 brd a2:a6:a8:40:40:40:60
15: ax5: <BROADCAST,UP> mtu 256 qdisc pfifo_fast qlen 10
    link/ax25 96:86:6c:92:96:8a:0e brd a2:a6:a8:40:40:40:60

Note tunl0 is ipip

ip route show (when using the original ip route add)

(remote dst ip) via (remote dst gw) dev tunl0  proto static onlink

ip tunnel show (using the ip tunnel add)

tunl0: ip/ip  remote any  local any  ttl inherit  nopmtudisc
tunl1: ip/ip  remote (remote dst gw ip)  local (local 44 ip on eth0)  dev
tunl0  ttl inherit

So the question begs, why does the original ip route add statment not work?
Gentoo-2.6.14-r3
ax25-tools-0.0.8
ax25-apps-0.0.6
libax25-0.0.11
node-0.3.2


73, JohnF AA6QN


