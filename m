From: Stef VK5HSX <sdaniels@airnet.com.au>
Subject: pci scc cards
Date: Tue, 21 Dec 2004 17:44:47 +1030
Message-ID: <200412211744.48000.sdaniels@airnet.com.au>
Reply-To: vk5hsx@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams List <linux-hams@vger.kernel.org>

Greetings..

	We are having trouble trying to configure PCI SCC Card. The chip used is a 
SUN 1889 (Dual Port card). Currently we use a script..

#!/bin/sh
# ax25 startup scripts
echo "Attach AX.25 devices to relevant ports"
#
setserial /dev/ttyS2 uart 16750 port 0xe800 baud_base 19200
setserial /dev/ttyS3 uart 16750 port 0xec00 baud_base 76800
#
/sbin/modprobe mkiss
/sbin/modprobe netrom
/sbin/modprobe ax25
#
/usr/sbin/kissnetd /dev/ptyqa /dev/ptyqb &
sleep 2
echo "Attach AX.25 loopback ports"
/usr/sbin/kissattach /dev/ttyqa loop0 10.1.1.1
/usr/sbin/kissattach /dev/ttyqb loop1 10.1.1.2
/usr/sbin/kissattach /dev/ttyS2 2 44.136.176.220
/usr/sbin/kissattach /dev/ttyS3 3 44.136.177.220
#
/sbin/ifconfig ttyS2 44.136.176.220 netmask 255.255.255.0 \
broadcast 44.136.176.255 arp hw ax25 vk5tty-15 up
/sbin/ifconfig ttyS3 44.136.177.220 netmask 255.255.255.0 \
broadcast 44.136.176.255 arp hw ax25 vk5tty-13 up

We tried looking at psicscc program, however, there is NO support for SUN 1889 
chip. Is there an alternative to the way we are doing it or using pciscc.
We had just moved away from ISA DRSI cards using the Z8530drv, as the cards 
were damaged.

The problem we get is cannot attach kiss to the devices..
Any help would be much appreciated


-- 
Regards - Stef VK5HSX
          Adelaide, Sth Australia 
	  -= Support Open Source =-
