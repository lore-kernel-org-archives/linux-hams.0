From: "Wilson G. Hein" <wilson.hein@verizon.net>
Subject: RE: ax25 start up scripts
Date: Thu, 18 Jul 2002 16:27:53 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLGEPBEFAC.wilson.hein@verizon.net>
References: <1026526200.3223.2.camel@linux2.baznet.com>
Reply-To: <wghein@ptd.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1026526200.3223.2.camel@linux2.baznet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Barry <barry_linux@rogers.com>, Linux-Hams <linux-hams@vger.kernel.org>

Have you tried putting sleep 2 after the first 3 kissataches? I know that
was a problem in the past.

Wilson, WJ3G

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]On Behalf Of Barry
Sent: Friday, July 12, 2002 10:10 PM
To: Linux-Hams
Subject: ax25 start up scripts


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




-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


