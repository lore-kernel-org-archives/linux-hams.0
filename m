From: Barry <barry_linux@rogers.com>
Subject: ax25 start up scripts
Date: 12 Jul 2002 22:09:59 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1026526200.3223.2.camel@linux2.baznet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hi, I have the following in a file called rc.ax25

#!/bin/bash

kissnetd /dev/ptysf /dev/ptyse & 

#sleep 10

kissattach  /dev/ttyS2 ax0 44.135.97.18
kissattach  /dev/ttyS3 ax1 44.135.97.19  
kissattach  /dev/ttysf ax2 44.135.97.20
kissattach  /dev/ttyse ax3 44.135.97.21

/sbin/ifconfig ax0 mtu 236 broadcast 44.135.97.255 up
/sbin/ifconfig ax1 mtu 236 broadcast 44.135.97.255 up
/sbin/ifconfig ax2 mtu 236 broadcast 44.135.97.255 up
/sbin/ifconfig ax3 mtu 236 broadcast 44.135.97.255 up

The script works just fine if I execute it from a consol, but if I call
it from rc.local and have it run at start up, ax0 and ax1 are created
OK, but not ax2 and ax3.

This problem occurs in other situations too, where the file runs fine
when manually started, but not when called at startup. Any ideas please?

Using Mandrake 8.2, with kernel 2.4.18-19
Athalon 1.3 ghz

Barry
Ve3nav/va3wi




