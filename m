From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: kissnetd/net2kiss etc..
Date: Tue, 14 Feb 2006 09:42:40 -0800
Message-ID: <43F21690.6000101@jnos.org>
References: <Pine.LNX.4.63.0602131614510.7359@ve1drg.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0602131614510.7359@ve1drg.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ted Gervais <ve1drg@av.eastlink.ca>, linux-hams@vger.kernel.org

> 
> # vhf port is on ax1
> /usr/sbin/mkiss -s 9600 /dev/ttyS1 /dev/ptyb1 /dev/ptyb2
> /usr/sbin/kissattach -l -m 256 /dev/ttyb1 vhf 44.135.34.201
> /usr/sbin/kissattach -l -m 256 /dev/ttyb2 uhf 44.135.34.201
> 
> How is kissnetd attached to that?
> And if net2kiss is the solution is it used like this:
> net2kiss -i ax1 /dev/ptyq3....with jnos using /dev/ttyq3 ??
> For jnos this doesn't work, by the way..
> 
> Any thoughts would be appreciated..

net2kiss is an amazing little widget.  It lets JNOS run as an 
independent virtual computer on the packet system.

In my linux setup, I have:

---

echo "Initiating AX0 net2kiss connection for JNOS"
    /usr/sbin/net2kiss -i ax0 /dev/ptyp8 &
   echo "Allowing time for net2kiss to initialize "
   sleep 2
---

And then in the autoexec.nos, to attach the to the pseudo tty I have:

---
# linked connection to Linux AX0 port
#
# Attached pseudo tty linked to Linux ax0 packet port
# started with: /usr/sbin/net2kiss -i ax0 /dev/ptyp8 &
#
attach asy ttyp8 - ax25 vhf 512 236 9600
ifconfig vhf linkaddress wa7nwp-6
ifconfig vhf ipaddress 192.168.127.5
ifconfig vhf broadcast 192.168.127.255
ifconfig vhf ax25 maxframe 2
ax25 route add ID vhf GHAEC
ax25 route add MAIL vhf GHAEC
trace vhf 311
---

Hope that helps...

73,
Bill - WA7NWP

PS. - now if there were only a net2kpchostmode program...  So much time, 
so many more projects...

