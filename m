From: Ricardo Saiz Villoria <ea1apm@amsat.org>
Subject: trouble with ax25ipd
Date: Mon, 15 Apr 2002 19:27:41 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204151837460.2097-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hello

I'm trying to set up a link between a linux machine and another one
running flexnet. The system is RedHat 7.2 with the following utilities
installed:

ax25-tools-0.0.6-13
ax25-apps-0.0.4-9
libax25-devel-0.0.7-7
libax25-0.0.7-7

The axports file is:
radio   EA1RCT-1        9600    255     7       Puerto 1200bps
axip    EA1RCT-2        38400   255     7       Red local

("radio" is a kiss tnc which works fine).

The ax25ipd.conf contains:

socket udp 93
mode tnc
beacon after 360
btext ax25ip - PRUEBA
device /dev/ptyp0
speed 38400
loglevel 2
broadcast QST-0 NODES-0
broadcast QST-0 NODES-0
route ea1apm 192.168.1.6 b d udp 93

Then I run kissattach:

/usr/sbin/kissattach /dev/ptyp0 axip 44.133.36.1
AX.25 port axip bound to device ax1

And then /usr/sbin/ax25ipd

ax25ipd Version 1.0.2 / 0.0.4
Copyright 1991, Michael Westerhof, Sun Microsystems, Inc.
This software may be freely used, distributed, or modified, providing
this header is not removed

Current configuration:

  socket     udp on port 93
  mode       tnc
  device     /dev/ptyp0
  speed      38400
  beacon     after 360
  btext      ax25ip - PRUEBA
  loglevel   2
1 active routes.
  EA1APM        192.168.1.6     udp     93      3
0 parameters
opening tty device: Input/output error

I've tried with different pipes, and the result is the same. Any help will 
be appreciated, I'm willing to make it work.

Thanks in advance

--
Ricardo Saiz Villoria EA1APM
AX.25:  ea1apm@ea1rkv.eapo.esp.eu
WEB:    http://www.qsl.net/ea1apm
E-MAIL: mailto:ea1apm@amsat.org

