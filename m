From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 12:55:29 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c9057041015125535932b34@mail.gmail.com>
References: <620c9057041015095771b236e0@mail.gmail.com>
	 <20041014025505.66938.qmail@web40824.mail.yahoo.com>
	 <620c9057041014060070eeccf6@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
	 <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>
	 <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linux-hams List <linux-hams@vger.kernel.org>

I am not interested in doing multiple TNC's all I want is the crc part,
Do I still have to use the master slave part? Looks like the AX25-
config program does not take into account such things.

Here is a listing from a lsmod on my system
kp4djt@rf-tool:~> lsmod
Module                  Size  Used by
mkiss                  10020  0
ax25                   58476  1 mkiss


This is the ax25-up script file that the ax25-config program created.

#!/bin/bash
# Startkiss0
# Firmware-TNCs in den KISS-Modus schalten
#stty 19200 < /dev/ttyS0
#echo -e "\r\033@K1\r" > /dev/ttyS0
#sleep 3
#
# KISS-Modul einbinden
modprobe ax25; modprobe kiss; modprobe mkiss
#
# KISS-Ger=EF=BF=BD an /dev/ttyS0 als Port kiss0 anbinden
/usr/sbin/kissattach -i 44.1.1.1 /dev/ttyS0 kiss0
# Parameter einstellen: P=3D128, W=3D10, TX-Delay=3D100
/usr/sbin/kissparms -p kiss0 -r 128 -s 10 -l 10 -t 100
# Endkiss0
# StartARNM
#
# Logins von au=EF=BF=BDn erm=EF=BF=BDlichen
/usr/sbin/ax25d &
echo $! > /var/run/ax25d.pid
#
# Start AX25 routing daemon
/usr/sbin/ax25rtd &
echo $! > /var/run/ax25rtd.pid
insmod netrom
nrattach -i 44.1.1.1 nr0
#
# Monitor auf Terminal 11 starten
/usr/bin/listen -artc > /dev/tty11 &
echo $! > /var/run/listen.pid
# EndARNM
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
