From: folkert <folkert@vanheusden.com>
Subject: problems with howto at http://tldp.org/HOWTO/AX25-HOWTO/x495.html
Date: Wed, 23 Jun 2010 13:15:51 +0200
Message-ID: <20100623111550.GH15838@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I'm trying to implement a baycom-construction with my 27mc setup.
Now I follow the howto at http://tldp.org/HOWTO/AX25-HOWTO/x495.html but
I fail already at one of the first steps :-)

I tried:
	/bin/setserial /dev/ttyS0 uart none
	/sbin/modprobe hdlcdrv
	/sbin/modprobe baycom_ser_hdx mode="ser12*" iobase=0x3f8 irq=4
and I tried (after a reboot):
	modprobe baycom_ser_hdx
	sethdlc -p -i bc0 mode "ser12*" io 0x3f8 irq 4

But the problem is, that no /dev/bc* device appears.
I'm running a stock debian 2.6.32 kernel.

Anyone got an idea what may be going wrong?


Folkert van Heusden

-- 
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
