From: heitzmah <heitzmann@utanet.at>
Subject: Problem with YAM and Debian;
Date: Sat, 25 Jan 2003 01:06:52 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301250106.52676.heitzmann@utanet.at>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_GFW8JAQQER4R95D2DBP9"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: vladpopa@inode.at


--------------Boundary-00=_GFW8JAQQER4R95D2DBP9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Linux-Ham's!

Since abt 2 months I'm using Debian. Before I was a SuSE-user. With SuSE =
my=20
Packet-Radio worked very good.

RX/TX: T7F (data-transceiver-kit for 9k6 or 19k2)
Modem: YAM

Now I tried to set up my Debian-box for Packet. I did this with a small=20
program called ax25-config. It's a script using 'dialog'. After setup the=
=20
file /etc/init.d/ax25 is starting the script /etc/ax25/ax25-up, to launch=
 =20
the ax.25-subsystem. You can see this file as attachment. The=20
TCP/IP-section is for testing only... :-))

The following deb-packages are installed:

ax25-tools
ax25-xtools
ax25-apps
ax25-utils
ax25-utils-devel

Kernel: 2.4.19 (self-compilation) - yam and ax25 are compiled into the=20
kernel, it's not necessary to load this functions as module.

After booting my 'Woody 3.0 unstable' (basing on Knoppix 3.1), I tried to=
=20
connect my local 9k6-node:

call ym0 oe2xum

The Transceiver is going on air, but is not willing to end his transmissi=
on.=20
The only way to interrupt this, is to switch of the power-supply. Maybe I=
=20
could try to kill some jobs on my Debian-box, but this would require too=20
much time and I don't like to waste time of other hams on our local node.=
=2E.

Anyone an idea?
I would be very glad getting help to activate my PR. tnx!

Deutschsprachige Linux-Hams k=F6nnen mir nat=FCrlich auch in deutscher Sp=
rache=20
antworten. Ich glaube das krieg ich als '=D6si' noch hin... :-)) hi

73 + 55 de Herbert (OE2HHN - NCI#3766)
--------------Boundary-00=_GFW8JAQQER4R95D2DBP9
Content-Type: application/x-shellscript;
  name="ax25-up"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="ax25-up"

#!/bin/bash
# Version =3D ax25-config-0.3.3
# Startym0
# Serielle Schnittstelle freigeben
setserial /dev/ttyS0 uart none
# Module einbinden
#modprobe ax25; modprobe yam
#
setserial /dev/ttyS0 Port 0 > /dev/null
# Konfiguration des Modems:
yamcfg yam0 irq 4 iobase 0x3f8 bitrate 9600 baudrate 19200
#
# Parameter einstellen: P=3D128, W=3D10, TX-Delay=3D60
yamcfg  yam0  txdelay 60 txtail 20 slottime 10 persist 128 duplex 0
#
# Modem im System anmelden und mit dem Rufzeichen verkn=FCpfen
/sbin/ifconfig yam0 hw ax25 OE2HHN-0 up
echo 100 > /proc/sys/net/ax25/yam0/t1_timeout
echo 30 > /proc/sys/net/ax25/yam0/t2_timeout
echo 30000 > /proc/sys/net/ax25/yam0/t3_timeout
echo 10 > /proc/sys/net/ax25/yam0/maximum_retry_count
echo 4 > /proc/sys/net/ax25/yam0/standard_window_size
echo 256 > /proc/sys/net/ax25/yam0/maximum_packet_length
# Port "ym0" als Netzwerkger=E4t "yam0" anmelden mit IP 44.143.33.19
/sbin/ifconfig yam0 44.143.33.19 netmask 255.0.0.0 \
               broadcast 44.255.255.255 up
# Endym0
# StartARNM
/usr/sbin/axparms -route add ym0 default oe2xum -ipmode vc
# weitere Routen:
/usr/sbin/axparms -route add ym0 oe2xum -ipmode vc
/sbin/arp -H ax25 -f /etc/ax25/arptab
/sbin/route del -net 44.0.0.0 netmask 255.0.0.0 yam0
/sbin/route add -net 44.0.0.0 netmask 255.0.0.0 irtt 8000 yam0
# Gateways:
/sbin/route add -net 44.143.33.0 netmask 255.255.255.0 gw 44.143.33.19 oe=
2hhn  irtt 12000 yam0
echo 1 >/proc/sys/net/ax25/yam0/ip_default_mode
#
# Logins von au=DFen erm=F6glichen
/usr/sbin/ax25d &
echo $! > /var/run/ax25d.pid
#
# Start AX25 routing daemon
/usr/sbin/ax25rtd &
echo $! > /var/run/ax25rtd.pid
#
# Monitor auf Terminal 11 starten
#/usr/bin/listen -artc > /dev/tty11 &
#echo $! > /var/run/listen.pid
# EndARNM
# AX.25-SpyDaemon starten
ax25spyd
#


--------------Boundary-00=_GFW8JAQQER4R95D2DBP9--

