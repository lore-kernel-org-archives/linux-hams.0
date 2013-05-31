From: f6bvp <f6bvp@free.fr>
Subject: New RaspBerry Pi Linux system image with xfbb 7.05e, Rose/fpac node,
 Dx cluster, APRS, web server ...
Date: Fri, 31 May 2013 12:52:29 +0200
Message-ID: <51A880ED.5010605@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hello All,

A new version of Raspberry Pi Linux Wheezy SD card image is available.
Here is the list of pre installed and working software :

     Configured Linux system comprises:
     Raspberry pi Raspbian Linux raspberrypi 3.6.11+ #446 PREEMPT Fri 
May 10 20:17:25 BST 2013 armv6l GNU/L
     inux
     Usual hamradio interface modules drivers : ax25, rose, mkiss, 
6pack, bpqether, netrom
     Several examples of device types are initialized in default script 
/etc/ax25/ax25-up.
     Other scripts named ax25-up-xxxxxxx are available in /etc/ax25
     AX.25 ports names are declared as usual in /etc/ax25/axports

     List of working applications when booting:
     F6FBB BBS version 7.05e
     AX.25 packet radio switch FPAC node (NetRom and ROSE protocols).
     aprslist (APRS beacon and repeater)
     Dx spots relay DX Cluster
     Web server lighthttpd (/var/www/index.html)
     watchdog (RPi reboots in case of Linux kernel failure)
     beacon (AX.25 radio beacons)
     mheardd daemon (client is mheard)
     dxget (DX spots broadcast on AX.25 ports)
     ax25ipd for AX.25 frames encapsulation into UDP/TCP Internet 
protocols frames or reversely encapsulated IP frames stripped into AX.25 
frames.
     ax25d : daemon redirecting incoming frames from peripheral devices 
to appropriate application software depending on protocols and ports.

See documentation page (running on web server hosted by a RPi !) :

http://f6bvp.org/AX25_BBS_Node_RaspBerry_Pi_install.html
Mirror :
http://f6bvp.free.fr/AX25_BBS_Node_RaspBerry_Pi_install.html

73 de  Bernard, f6bvp
