From: csmall@eye-net.com.au (Craig Small)
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Tue, 30 Jul 2002 20:50:57 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020730105057.GC7293@eye-net.com.au>
References: <20020728224348.GG10796@eye-net.com.au> <Pine.HPX.4.10.10207291502190.25868-100000@saturn.trs.ntc.nokia.com> <20020729185037.GA684@columbia.g7iii.bogus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020729185037.GA684@columbia.g7iii.bogus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Mon, Jul 29, 2002 at 07:50:37PM +0100, Iain Young - G7III wrote:
> On Mon, Jul 29, 2002 at 03:16:32PM +0300, Tomi Manninen OH2BNS wrote:
> 
> > Oh, by the way. Has anyone done anything with the NEW-AX.25 patch lately?
> > I think it has some potential but unfortunately seems it's now completely
> > unmaintained.
> 
> I haven't, but I do have a request if anyone decides to 'Take Up The 
> Challenge".
> 
> Currently (IIRC), the patch routes all IP traffic destined for radio
> links (44/8) down the ipax0 device, and then decides the best layer 2
> (AX25) interface to throw it out.
> 
> I _personally_ believe that this is not the way it should be, I don't
> actually like this, but unfortunatley the ipax0 device actually
> encapsulates the IP packet, and puts the AX25 header on etc..
I think that's actually a very interesting idea myself.  Very interesting to 
have the AX.25 stuff sitting down in layer 2 and the IP sitting on a
different interface.  It sounds a lot like Linux bridges which have a
br0 interface, you might even be able to nick that code.

This is my set of interfaces on my firewall bridge:

 /sbin/ip addr show
1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host
2: eth0: <BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:50:bf:7a:05:88 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::250:bfff:fe7a:588/10 scope link
3: eth1: <BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:50:ba:88:b4:8e brd ff:ff:ff:ff:ff:ff
    inet6 fe80::250:baff:fe88:b48e/10 scope link
4: gre0@NONE: <NOARP> mtu 1476 qdisc noop
    link/gre 0.0.0.0 brd 0.0.0.0
5: sit0@NONE: <NOARP> mtu 1480 qdisc noop
    link/sit 0.0.0.0 brd 0.0.0.0
8: br0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether 00:50:ba:88:b4:8e brd ff:ff:ff:ff:ff:ff
    inet 172.16.42.22/24 brd 172.16.42.255 scope global br0
    inet6 fe80::250:baff:fe88:b48e/10 scope link

Ignore the IPv6 (inet6) addresses, you can see eth0 and eth1 have no IP
address but there is a br0 interface which does.

Of course I bet noone thinks running spanning tree over radio is a good
idea :)

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
