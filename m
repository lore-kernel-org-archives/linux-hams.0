From: folkert <folkert@vanheusden.com>
Subject: Fw: ax25d
Date: Thu, 8 Feb 2018 11:11:09 +0100
Message-ID: <20180208101109.enjbdoee5wfqdudu@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

Trying to setup an ax25 connection between two systems.
They are connected via an ax25 over udp tunnel.
axcall just sits there and eventually times out.

caller system:
=============

Debian stretch, 4.9.0-4-amd64

ii  ax25-apps                     0.0.8-rc4-2                    amd64
ii  ax25-tools                    0.0.10-rc4-3                   amd64
ii  libax25                       0.0.12-rc4-1                   amd64


/etc/ax25/axports
-----------------
ax0	FH8GOU-1	38400	255	7	AXUDP gw


/etc/ax25/ax25ipd.conf
----------------------
mycall FH8GOU-1
socket udp 93
route FH9GOU-1 192.168.64.112 udp 10093 b d


root@dc:/home/folkert# axcall ax0 FH9GOU-1
GW4PTS AX.25 Connect v1.11
Trying...

[...]



callee:
======

Debian stretch, raspberry pi, 4.9.41+

ii  ax25-apps                        0.0.8-rc4-2
ii  ax25-node                        0.3.2-7.4
ii  ax25-tools                       0.0.10-rc4-1
ii  ax25-xtools                      0.0.10-rc4-1
ii  libax25                          0.0.12-rc4-1


/etc/ax25/axports
-----------------
axportu	FH9GOU-1        38400   236     7       AXUDP gateway


/etc/ax25/ax25ipd.conf
----------------------
FH9GOU-1
socket udp 10093
route FH8GOU-1 192.168.64.185 udp 93 b


/etc/ax25/ax25d.conf
--------------------
[FH9GOU-1 VIA axportu]
default  * * * * * *  -	root  /usr/sbin/ax25-node	ax25-node


root@nieteentplink:/etc/ax25# axlisten -8 -a -t axportu
axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:20:25
axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:20:35
axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:20:56
axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:21:26

So traffic comes in but it is unhandled.
I did an strace on ax25d and it just sits there in a select() doing
nothing.


Anyone got an idea what is going wrong here?


Folkert van Heusden
