From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: AX25 udev pseudo tty support
Date: Mon, 21 Mar 2005 00:38:14 +0100
Message-ID: <423E0966.4050702@ccr.jussieu.fr>
References: <000601c4c852$79768360$07001aac@adminqn> <4234CBD4.3010600@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4234CBD4.3010600@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>

Hi,

I have simplified usage of AX25 udev support by mkiss, kissattach and 
ax25ipd applications and tools for AX25.

There is no more need to specify full slave pseudo tty device names.
kissattach command line now only refers to /dev/pts, and the program 
will find itself the slave pseudo tty related to the master.
The same for ax25ipd in ax25ipd.conf.

Please have a look at the following script including some comments.
If you need help or have any questions, please do not hesitate to mail me.

Of course, my modifications are backward compatible with previous
usage of devfs pseudo ttys (which is much more complicated).

I have checked that it works with kernels 2.2.26 and 2.6.11.


  #!/bin/sh
  #
  # This is a sample script to demonstrate the use of udev
  # Unix98 master-slave pseudo tty device pairs for AX25
  # on Linux kernel = and > 2.2.
  #
  # Udev system usage is much more simple than former devfs.
  # There is a unique master pseudo tty, and a corresponding
  # slave pseudo tty is automatically created when opening
  # the master tty. Both are tunneled.
  #
  # AX25 ports 0 and 1 are declared in /etc/ax25/axport file
  #
  # In file /etc/ax25/ax25ipd.conf is declared a slave pseudo tty
  # device /dev/pts
  # to make a tunnel link with master /dev/ptmx opened by the
  # command line kissattach /dev/ptmx
  #
  # The following files have been modified to accept
  # /dev/ptmx - /dev/pts request :
  # ax25-apps-0.0.6/ax25ipd/io.c
  # ax25-tools-0.0.8/kiss/mkiss.c and kissattach.c
  #
  # The patched files can be downloaded from :
  # http://f6bvp.free.fr/logiciels/Unix98-pseudo-tty/
  #
  # Bernard Pidoux f6bvp@amsat.org
  #
  echo 1 > /proc/sys/net/ipv4/ip_forward
  # load ax25 packet radio, rose and mkiss modules
  /sbin/modprobe ax25
  /sbin/modprobe rose
  /sbin/modprobe mkiss
  /bin/sleep 4
  # mkiss opens two master pseudo ttys connected to serial port ttyS0
  /usr/local/sbin/mkiss -s 38400 -l /dev/ttyS0 /dev/ptmx /dev/ptmx
  /bin/sleep 4
  # kissattach links a slave pseudo tty to ax25 port 0
  /usr/local/sbin/kissattach /dev/pts 0 44.151.75.150
  # kissattach links a second slave pseudo tty to ax25 port 1
  /usr/local/sbin/kissattach /dev/pts 1 44.151.75.150
  # kissattach attachs a master pseudo tty to ax25 port 2
  # and creates a slave tty, making a tunnel between them
  /usr/local/sbin/kissattach -l -m 256 /dev/ptmx 2 44.151.75.150
  /bin/sleep 4
  # ax25ipd links slave pseudo tty to UDP port declared in ax25ipd.conf
  /usr/local/sbin/ax25ipd -l4
  /bin/sleep 4
  # start ROSE / FPAC AX25 level 3 packet switch application
  /usr/local/sbin/fpac/fpac.sh
  /bin/sleep 4
  # starts Dx cluster application using level 3 ROSE/FPAC routing
  /usr/local/sbin/dxnet/dxnet.sh &
  /bin/sleep 4
  # start mheardd daemon
  /usr/local/sbin/mheardd
  #


73 de Bernard, f6bvp.
