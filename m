From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Problems ax25 with 1270b (TF27 chip)
Date: Tue, 06 Mar 2007 07:55:30 +0100
Message-ID: <45ED1062.2040500@ccr.jussieu.fr>
References: <1173072551.3328.52.camel@localhost.localdomain>	 <45EC0987.7020009@ccr.jussieu.fr> <1173140754.7002.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1173140754.7002.2.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: vk5hsx@wia.org.au
Cc: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Stef Daniels VK5HSX a =E9crit :
> On Mon, 2007-03-05 at 13:13 +0100, Bernard Pidoux wrote:
>  =20
>> Did you put your TNC into kiss mode and are you using mkiss driver ?
>>    =20
>
> kiss mode.
>
> # ! /bin/bash
> #
> # This is /etc/init.d/ax25
> #
> # VK5TTY BBS AX25 Script
> # by Stef Daniels VK5HSX and Geoff Madden VK5KMG.
> # in January 2007.
> #----------------------------------------------------
> # Date and person making changes to script
> #----------------------------------------------------
> #    Date      Who     	Changes
> #----------------------------------------------------
> # 12/01/2007   SJD    	Created script
> # 13/01/2007   SJD    	Added kissattach for ptyqa & b
> #
> #----------------------------------------------------
> #
> # Firmware-TNC's placed into kiss mode
> echo "... MFJ 1270b TNC Placed into kiss mode"
> #
> stty 9600 < /dev/ttyS0
> #
> # MFJ 1270b in kiss with TF27 chip
> echo -e "\r\033@K1\r" > /dev/ttyS0
> #
> # MFJ 1270b in kiss with TNC2 chip
> #echo -e "kisson\rrestart\r" > /dev/ttyS0
> #
> sleep 3
> #
> # setting baud rate to 4800bd device (PK232).
> setserial /dev/ttyS1 base_baud 4800
> #
> echo "Starting modules...."
> # starting modules
> /sbin/modprobe ax25
> /sbin/modprobe mkiss
> /sbin/modprobe netrom
> /sbin/modprobe rose
> #
> echo "... configuring 'ax25' ports"
> sleep 1
> #
> echo -n "port 2 '144.900 port'"
> # com1 1200bd user port 144.900MHz
> /usr/sbin/kissattach -m 255 /dev/ttyS0 2 44.136.176.220
> /sbin/ifconfig 2 44.136.176.220 netmask 255.255.255.0 \
> #		broadcast 44.136.176.255 arp
> #
> echo -n "port 3 '434.050 port'"
> # com2 4800bd backbone port 434.050MHz
> /usr/sbin/kissattach -m 255 /dev/ttyS1 3 44.136.203.2
> /sbin/ifconfig 3 44.136.203.1 netmask 255.255.255.0 \
> # 		broadcast 44.136.203.255 arp
> #
> echo -n "port4 '439.075 port'"
> # com3 4800bd user port 439.075MHz
> /usr/sbin/kissattach -m 255 /dev/ttyS2 4 44.137.177.220
> /sbin/ifconfig 4 44.136.177.220 netmask 255.255.255.0 \
> #		broadcast 44.136.177.255 arp
> #
> # configuring loopback ports 'loop0' & 'loop1'"
> /usr/sbin/kissnetd /dev/ptyq1 /dev/ptyq2 &
> #
> sleep 3
> #
> echo -n "loop0 loop1"
> /usr/sbin/kissattach /dev/ttyq1 10.0.0.1 loop0
> /usr/sbin/kissattach /dev/ttyq2 10.0.0.2 loop1
> #
> echo -n "... configuring 'netrom'"
> #
> /usr/sbin/nrattach 44.136.176.220 -m 236 netrom
> /usr/sbin/nrattach 44.136.176.220 -m 236 nrbb
> /usr/sbin/nrattach 44.136.176.220 -m 235 nrdxc
> #
> #
> echo -n "Starting ax25 & netrom daemons:"
> #
> echo "ax25 daemon"
> /usr/sbin/ax25d
> #
> echo "netrom daemon"
> /usr/sbin/netromd -i -t 45
> #
> echo "axip daemon"
> /usr/sbin/axipd
> #
> # --------- End ------------------------------
>
>
>  =20
>> 73 de Bernard, f6bvp
>>    =20
>
>
>  =20
Did you try to listen  AX25 packets coming to that port  with listen=20
application ?

73 de Bernard, f6bvp

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
