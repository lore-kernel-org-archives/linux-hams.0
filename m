From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 18:15:55 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c905704101518153ff636e@mail.gmail.com>
References: <620c9057041015095771b236e0@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
	 <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>
	 <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
	 <620c9057041015125535932b34@mail.gmail.com>
	 <620c90570410151618432401d1@mail.gmail.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570410151618432401d1@mail.gmail.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Here is what I ended up with when I commented out the listen console.
This appearst to have cleared up the locking up of the machine, I have
not had it lock up since.

Now if I can just get the BPQKISS part running (CRC kiss)


#!/bin/bash
# Startkiss0
# Firmware-TNCs in den KISS-Modus schalten
#stty 19200 < /dev/ttyUSB0
echo -e "\r\033@K1\r" > /dev/ttyUSB0
#sleep 3
#
# KISS-Modul einbinden
modprobe ax25; modprobe kiss; modprobe mkiss
#
# KISS-Ger344t an /dev/ttyUSB0 als Port kiss0 anbinden
/usr/sbin/kissattach -i 44.1.1.1 /dev/ttyUSB0 kiss0
# Parameter einstellen: P=254, W=10, TX-Delay=100
/usr/sbin/kissparms -p kiss0 -r 254 -s 1 -l 10 -t 100
# Endkiss0
# StartARNM
#
# Logins von au337en erm366glichen
#/usr/sbin/ax25d &
#echo $! > /var/run/ax25d.pid
#
# Start AX25 routing daemon
#/usr/sbin/ax25rtd &

#echo $! > /var/run/ax25rtd.pid
#insmod netrom
#nrattach -i 44.1.1.1 nr0
#
# Monitor auf Terminal 11 starten
#sleep 2
#/usr/bin/listen -artc > /dev/tty11 &
#echo $! > /var/run/listen.pid
# EndARNM
