From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: YAM modems at higher (shared) IRQ's
Date: Sun, 6 Mar 2011 11:30:25 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:subject:message-id:user-agent
         :mime-version:content-type;
        bh=JJUSRl38jNrdNwxQ8/RIxK6KSNH4vfae1u2mU+uU0zE=;
        b=QJlJC8HsJmEn11tS7ZFp8feSypkIV3kz2201Vqs8SlVjL2AiMXqa/F1Tedc7sZTaXq
         uJJXGC9swRtdJSAifNaZ1ua1s3A4mRBQ/fm9segcHB7EBUwI669QhwHHDEg5HLwEVaDB
         wgCUQ03R0b7MWBDEFQdqU5omJCyL0X43hQstE=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


I haven't seen a lot of activity on the mailing lists for a while about YAM modems, but I just got handed a couple of them and I'd
like to put them to use.

I've successfully configured a YAM on a laptop w/OpenSUSE-11.3 32bit, but cannot on a desktop running OpenSUSE-11.3 64bit.  The
desktop has a Startech 4-port PCI card (with 16550's on it) at /dev/tty4 through 7 at odd addresses and a shared IRQ 17.  The
laptop has one /dev/ttyS0 port at the standard address and IRQ.


Laptop config, appears to work but is not hooked to a radio yet.  The red LED blinks when I do a ping:

     /sbin/modprobe -a yam
     /bin/setserial /dev/ttyS0 uart none
     /usr/sbin/yamcfg yam0 io 0x3f8 irq 4 pers 128 txd 150 bitrate 9600 baudrate 9600
     /sbin/ifconfig yam0 44.24.102.128 netmask 255.255.255.0 mtu 256 hw ax25 WE7U-3 up


Desktop config, doesn't work:

     modprobe -a yam
     setserial /dev/ttyS7 uart none
     yamcfg yam0 io 0xd880 irq 17 pers 128 txd 150 bitrate 9600 baudrate 9600
     /sbin/ifconfig yam0 44.24.102.128 netmask 255.255.255.0 hw


I get this for the desktop config at the "yamcfg" stage:

     yamcfg yam0 io 0xd880 irq 17 pers 128 txd 150 bitrate 9600 baudrate 9600

     yamcfg: Version 0.1 (C) 1998 by Jean-Paul ROUBELAT - F6FBB

     yamcfg: Error Invalid argument (22), cannot ioctl SIOCYAMSCFG on yam0


Using only "yamcfg yam0 io 0xd880 irq 17" I get the same error, but "yamcfg yam0 io 0xd880" works (but IRQ is set to 0 in that case).

I believe the problem is the shared IRQ 17.  "yam.h" appears to reserve one character position for the IRQ, so can't use IRQ's
above 9.  Correct?

I'm attempting to fetch kernel sources but the repositories appear to be unavailable.  Once I have them I'll try to code around the
problem.

If anyone has any ideas or pointers on how to fix this, please let me know.  Thanks!

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
Babysitting your tracker:  http://info.aprs.net/index.php?title=ControlOperator
