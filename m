From: Ron <ke7rt@clearwater.net>
Subject: AX25/NETROM
Date: Mon, 12 May 2003 15:03:45 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <S262447AbTELTDp/20030512190345Z+8235@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

I am trying to setup DXSPIDER as a DX Cluster and am experiencing some
trouble trying to get the AX25 stuff going.

I have compiled kernel V.2.4.2-2 with the following enabled:
        networking support  (General support)
	UNIX domain sockets  (Networking options)
	AX.25 Level 2 protocol
	serial port KISS driver
	Amateur Radio NET/ROM protocol

From the AX.25HOW-TO
I have downloaded and installed the AX.25 library, tools and application
programs with no apparent error messages????

I have edited AX25d.conf, axports, nrports, nrbroadcast and their relevant
sections are shown below.

From the DXSPIDER install manual, executing the following commands gets this:

kissattach /dev/ttyS0 spider 192.168.0.0
LINUX --->	AX.25 port spider bound to device ax0

kissattach /dev/ttyS1 spideruse 192.168.0.0
LINUX --->	AX.25 port spideruse bound to device ax1

kissparms -p spider -t 150 -l 150 -s 50 -r 50

kissparms -p spideruse -t 150 -l 150 -s 50 -r 50

nrattach netrom
LINUX --->	NET/ROM port netrom bound to device nr0

nrattach netrom2
LINUX --->	NET/ROM port netrom bound to device nr1

------------so far looks good???????-------

ax25d
LINUX --->nrconfig:port netrom not active
LINUX --->nrconfig:port netrom2 not active
LINUX --->rsconfig: port  rose not active
LINUX --->invalid NET/ROM port 'netrom2'
LINUX --->bad config entry on line 64
LINUX --->bad config entry on line 65
LINUX --->bad config entry on line 66
LINUX --->invalid NET/ROM port 'netrom'
LINUX --->bad config entry on line 70
LINUX --->bad config entry on line 71
LINUX --->bad config entry on line 72

---------NOT GOOD???????, and i do not know why???????--------------


AX25D.CONF:#
# AX.25 Ports begin with a '['.
#
[ke7rt-0 via spider]
parameters 2  1    6 900 *   15 0
NOCALL   * * * * * * L
default  * * * * * * -   sysop /spider/src/client client %u ax25
#[ke7rt-0 via spideruse]
parameters 2  1    6 900 *   15 0
NOCALL   * * * * * * L
default  * * * * * * -  sysop /spider/src/client client %u ax25
#
#
# NET/ROM Ports begin with a '<'.
#
<netrom2>
parameters 1    10 * * * 3 *
NOCALL   * * * * * * L
default  * * * * * * -  sysop /spider/src/client client %u ax25
#
#
<netrom>
parameters 1    10 * * * 3 *
NOCALL   * * * * * * L
default  * * * * * * 0 root    /usr/sbin/node   node
#


AXPORTS:
#
#
spider      KE7RT-1     9600    255 7   BACKBONE
spideruse   KE7RT-2     9600    255 7   USERS

NRPORTS
#
# The format of this file is:
# name callsign alias paclen description
#
#netrom	OH2BNS-10 #LNODE	235	Switch Port
#
#
# THIS IS FOR KE7RT DX CLUSTER
#
#
netrom     KE7RT-3    BCKBN   235     BACKBONE 145.53 MHZ
netrom2    KE7RT-4    LOCAL   235     USER     145.07 MHZ


NRBROADCAST:
# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
#1	5	192	100	0
#2	5	255	100	1
#
#
#  THIS IS FOR KE7RT DX CLUSTER
#
#
spider    5     10  100  0
spideruse 5     10  100  1

