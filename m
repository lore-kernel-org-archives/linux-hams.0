From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: mkiss, udev and kernel 2.6
Date: Mon, 14 Mar 2005 00:25:08 +0100
Message-ID: <4234CBD4.3010600@ccr.jussieu.fr>
References: <000601c4c852$79768360$07001aac@adminqn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000601c4c852$79768360$07001aac@adminqn>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: AA6QN <AA6QN@pacbell.net>
Cc: linux-hams@vger.kernel.org

Hi,

It took me a while but I succeeded in adding Unix98 pseudo tty master 
/dev/ptmx and slave /dev/pts/X into mkiss, kissattach and ax25ipd.

It was not so easy. Not for a lack of documentation, but because there 
was not much sample code. So, I had to make a lot of tries and errors.

However the principle is very simple. When one opens a master pseudo 
tty, the system automatically creates a slave pseudo tty.

This makes a pseudo tty couple that can be used like a tunnel. Every 
character written on the master tty side is presented to the slave tty 
and vice versa.

As, devfs is becoming obsolete with 2.6 kernel, udev support is needed 
for AX25. However, the additional code is backward compatible and I am 
also using it with 2.2.25 kernel.

As an example, here is a very simple rc.radio script I am using for 
initialisation of AX25 on my 2.6 kernel machine :

#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
/sbin/modprobe ax25
/sbin/modprobe rose
/sbin/modprobe mkiss
/bin/sleep 4
/usr/local/sbin/mkiss -s 38400 -l /dev/ttyS0 /dev/ptmx /dev/ptmx
/bin/sleep 4
/usr/local/sbin/kissattach -l /dev/pts/0   0   44.151.75.150
/usr/local/sbin/kissattach -l /dev/pts/1   1   44.151.75.150
/usr/local/sbin/kissattach -l -m 256 /dev/ptmx   2   44.151.75.150
/bin/sleep 4
/usr/local/sbin/ax25ipd -l4
/bin/sleep 4
/usr/local/sbin/fpac/fpac.sh
/bin/sleep 4
/usr/local/sbin/dxnet/dxnet.sh &
/bin/sleep 4
/usr/local/sbin/mheardd

This script initializes two radio ports 0 and 1 on a
KPC9612 dual port TNC connected to single computer serial port.

mkiss will make an interconnexion between a serial device carrying AX25 
packets (from a TNC) and a master pseudo terminal.
kissattach will connect the slave pseudo terminal side to an AX25 port 
on which Linux software can write or read characters.

In the third case, kissattach opens a master /dev/ptmx that in turn 
creates another /dev/pts/X device. This slave pseudo tty is then opened 
by ax25ipd.
ax25ipd will connect the AXIP port (port 2 in /etc/axports) to UDP port 
10093 for ROSE/FPAC Internet connexions (as declared in /etc/ax25ipd.conf).
Thus, AX25 programs can write or read characters on an AX25 port. They 
are assembled into an AX25 packet that is then encapsulated into IP 
frames that goes over the Internet to reach another AX25 talking station.

I don't know to whom I should submit the sources, for ax25-tools-0.0.8 
and ax25-apps-0.0.6 seem to be unchanged for months.

So, for anybody wanting to share the files, sources can be found here :

http://f6bvp.free.fr/logiciels/Pseudo-TTY/

io.c is from ax25-apps-0.0.6/ax25ipd/
mkiss.c and kissattach.c are from ax25-tools-0.0.8/kiss/


73 de Bernard, f6bvp

-----------

AA6QN wrote:
> I ported my Linux over to Gentoo and started off with devfs. I did try udev
> and it did not work for me. So, back to devfs and things are working once
> again. Let us know if you get it running.
> 
> 73,John AA6QN
> 
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Bernard Pidoux
> Sent: Tuesday, November 02, 2004 8:49 AM
> To: unlisted-recipients:; no To-header on input
> Cc: linux-hams@vger.kernel.org
> Subject: mkiss, udev and kernel 2.6
> 
> Hi,
> 
> Does someone have an experience with mkiss and udev in 2.6 kernel ?
> 
> I need to use mkiss-kissattach to drive a dual port TNC 1200/9600 KPC9612.
> 
> However I don't see how to set up a master-slave pseudo tty system with 
> udev.
> 
> Actually, I went through by instructing the kernel to load devfs at boot 
> (append="devfs=mount... " in lilo.conf.
> 
> But Is there any other solution with udev alone (without devfs) ?
> 
> 73 de Bernard, f6bvp

