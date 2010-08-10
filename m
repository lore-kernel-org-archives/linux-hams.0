From: f6bvp <f6bvp@free.fr>
Subject: Re: Unix98 pseudo TTYs
Date: Tue, 10 Aug 2010 13:06:19 +0200
Message-ID: <4C6132AB.9030707@free.fr>
References: <34C5C52FB2C9B74385FEB9A50B037C31371959@lpiserver.LPI.local> <4BC6CC8D.2030903@upmc.fr> <4BC753E2.6060407@embarqmail.com> <34C5C52FB2C9B74385FEB9A50B037C313A5467@lpiserver.LPI.local> <4BC7AE4B.4000804@embarqmail.com> <34C5C52FB2C9B74385FEB9A50B037C313A5489@lpiserver.LPI.local> <4BD01188.5090508@upmc.fr> <4BD1CC94.40607@embarqmail.com> <4C4056FA.9060903@free.fr> <4C408CB6.7090306@embarqmail.com> <4C41BD8C.4030104@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C41BD8C.4030104@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: C Schuman <k4gbb1@embarqmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>

Hi Charlie,

I have just installed new Mandriva Spring 2010.1 Linux distro in place 
of last year Mandriva distro. The distro is coming with kernel version 
2.6.33.5.

There was no need to apply any patch to Linux kernel this time.

I installed f6bvp patched libax25 rc-12 and other ax25 tools and apps rc.
http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.12-rc2.patched_f6bvp.tar.bz2
http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp.tar.bz2
http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.10-rc2.patched_f6bvp.tar.bz2

I wanted to take he opportunity to try Unix98 standard tty devices.

I started with your AX25 script in order to initialize master and slave 
Unix98 pseudo tty.
FPAC and FBB BBS are working fine now.
However it took me a while before I found what was preventing any RX 
while TX on HF ports was fine.

Finally I looked at the significance of parameter -c you were using with 
mkiss and I had to remove it, for my TNCs are using standard KISS EPROMs 
without CRC.

I am listing the actual script for general documentation. It is included 
into updated
FPAC Linux MINI-HOWTO http://rose.fpac.free.fr/MINI-HOWTO/

Thanks again for your help.

73 de Bernard,f6bvp


#!/bin/sh
# this script file is /etc/rc.d/rc.ax25
# adapted from K4GBB ax25 scripts
echo 1 > /proc/sys/net/ipv4/ip_forward
# just in case ...
/usr/bin/killall -KILL /usr/local/sbin/kissattach
/usr/bin/killall -KILL /usr/local/sbin/ax25ipd
/usr/bin/killall -KILL /usr/local/sbin/mkiss
/sbin/ifconfig /dev/ax0 down
/sbin/ifconfig /dev/ax1 down
/sbin/ifconfig /dev/ax2 down
#
echo "Installing ax25ipd Unix98 master pseudo tty"
/bin/date > /var/log/ax25ipd.log
/usr/local/sbin/ax25ipd > /tmp/unix98
echo $! > /var/run/ax25ipd.pid
export AXUDP=`tail -1 /tmp/unix98`
#
echo "Installing a KISS link on ethernet port"
/usr/local/sbin/kissattach  $AXUDP axudp > /tmp/ax25-config.tmp
  awk '/device/ { print $7 }' /tmp/ax25-config.tmp > /tmp/ax25-config-tmp
read Device < /tmp/ax25-config-tmp
# Check for Device
if [ -d /proc/sys/net/ax25/$Device ]
then echo "Port axudp attached to $Device"
     cd /proc/sys/net/ax25/$Device/
# $Device parameters
  ifconfig $Device netmask 255.255.255.255
  ifconfig $Device broadcast 0.0.0.0
else echo "** Error setting $Device parms **"
fi

/bin/sleep 4
echo "Installing two KISS connexions on serial port ttyS0"
# aprs & uhf-1 are ports names in /etc/ax25/axports
#/usr/local/sbin/mkiss -s 38400 -c -x 2 /dev/ttyS0 > /tmp/unix98
# -c enables a one-byte checksum on each incoming and outgoing KISS 
frame  on
#    the  serial  port.  This  checksum is used by G8BPQ KISS roms to 
maintain the
#    integrity of KISS frames. Don't use if standard KISS EPROM.
/usr/local/sbin/mkiss -s 38400 -x 2 /dev/ttyS0 > /tmp/unix98
export PTS0=`more /tmp/unix98 | grep -w /dev | cut -b -11`
export PTS1=`more /tmp/unix98 | grep -w /dev | cut -b 12-`
# Attach KPC9612 TNC in kiss mode - on primary PORT ttyS0 = 1200 bauds 
---> ax0 = 0 = aprs
/usr/local/sbin/kissattach $PTS0 aprs > /tmp/ax25-config.tmp
  awk '/device/ { print $7 }' /tmp/ax25-config.tmp > /tmp/ax25-config-tmp
read Device < /tmp/ax25-config-tmp
#
/usr/local/sbin/kissparms -p aprs -r 250 -s 10 -l 20 -t 220
# Check for Device
if [ -d /proc/sys/net/ax25/$Device ]
then echo "Port aprs attached to $Device"
     cd /proc/sys/net/ax25/$Device/
# $Device parameters
  ifconfig $Device netmask 255.255.255.0
  ifconfig $Device broadcast 0.0.0.0
else echo "** Error setting $Device parms **"
fi
# Port end

# Attach KPC9612 TNC in kiss mode - on secondary PORT ttyS0 = 9600 bauds 
---> ax1 = 1 = uhf-1
/usr/local/sbin/kissattach $PTS1 uhf-1 > /tmp/ax25-config.tmp
  awk '/device/ { print $7 }' /tmp/ax25-config.tmp > /tmp/ax25-config-tmp
read Device < /tmp/ax25-config-tmp
#
/usr/local/sbin/kissparms -p uhf-1 -r 250 -s 10 -l 20 -t 220
# Check for Device
if [ -d /proc/sys/net/ax25/$Device ]
then echo "Port uhf-1 attached to $Device"
     cd /proc/sys/net/ax25/$Device/
# $Device parameters
  ifconfig $Device netmask 255.255.255.0
  ifconfig $Device broadcast 0.0.0.0
else echo "** Error setting $Device parms **"
fi
# Port end
#



