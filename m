From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: netcfg problem
Date: Sun, 7 Jul 2002 19:05:00 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0207071822450.1789-100000@Consulate.UFP.CX>
References: <02070716310700.11637@localhost.localdomain>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <02070716310700.11637@localhost.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Lloyd <g.lloyd@btinternet.com>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi George.

> Can anyone help me. I'm using RedHat 7.1 and trying to set the
> default route to the internet machine on my small home network. If I
> use nefcfg to set the route and enter save it comes up with "unknown
> process" but the machine knows the default route to the internet
> machine. However, when I reboot it looses the default route data
> again.

I don't use netcfg so can't advise there. However, I have used Red Hat
since 5.1 was current.

> Can I install the routing information manually?

Yes.

> If so which file is it stored in?

That depends on the interface it refers to.

> As you can no doubt tell I'm not that up on networking in Linux so
> any help would be appreciated.

Here's the important information, this from a RH 6.2 system as that is
what I'm currently using:

 1. The file /etc/HOSTNAME should contain a single line stating the
    host name of the machine it is on. This one says...

	Consulate.Williams.LAN

 2. There is a directory /etc/sysconfig/network-scripts which contains
    a set of files with details relating to each network interface on
    your system. The details that relate to the eth0 interface are to
    be found in /etc/sysconfig/network-scripts/ifcfg-eth0 and those
    for the other interfaces are found by replacing eth0 in the above
    name by the name of the interface.

    The file /etc/sysconfig/network-scripts/ifcfg-eth0 here says...

	DEVICE=eth0
	IPADDR=192.168.252.254
	NETMASK=255.255.255.0
	NETWORK=192.168.252.0
	BROADCAST=192.168.252.255
	ONBOOT=yes

    ...with the relevant lines stating as follows...

	DEVICE=eth0

		This is the name of the interface, and should match
		the name of the file.

	IPADDR=192.168.252.254
	NETMASK=255.255.255.0
	NETWORK=192.168.252.0
	BROADCAST=192.168.252.255

		These are the parameters assigned to this specific
		network interface.

	ONBOOT=yes

		This states that the interface should be configured
		at boot time.

    ...and these lines are read by the boot-time configuration system
    and used to configure that interface. Each file will result in a
    route being added to the routing table to support that particular
    interface.

 3. There is a file /etc/sysconfig/network with basic global network
    information for your system. This one says...

	NETWORKING=yes
	HOSTNAME=`cat /etc/HOSTNAME`
	#GATEWAY=

    The first line states that networking is configured, and the second
    states the host name of the machine it is on. The last is commented
    out on this system as it dials up using a modem, but on a system
    that connects to the Internet via another machine on an ethernet
    link, it would (for example) read...

	GATEWAY=192.168.252.254

    ...to state that packets for the Internet were routed via the system
    with the specified IP address.

 4. If this system dials up over a modem to connect to the Internet, the
    GATEWAY= line in (3) above MUST be commented out. DIALD (the dial-
    on-demand server) manages the gateway internally and fails to work
    if one is previously configured, and PPP will configure the correct
    gateway for the negotiated link when DIALD is not used.

This description does not deal with DNS (which is a separate subsystem),
but deals with all other aspects of routing that may be relevant on Red
Hat based systems.

Best wishes from Riley.

