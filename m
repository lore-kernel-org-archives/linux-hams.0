From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: script for 2.6 multi kiss dual port TNC
Date: Sat, 14 Feb 2004 12:40:01 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <402E1721.1050601@ccr.jussieu.fr>
References: <402E0D4C.6050503@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090001090208020504050509"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <402E0D4C.6050503@ccr.jussieu.fr>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090001090208020504050509
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

With kernel 2.6 there are some differences for initializing a multi 
serial kiss connexion using a dual port TNC.
This is part of my rc.ax25 script for two KPC9612 tncs I am using.
Hope it will help starting with 2.6

73 de Bernard, f6bvp



--------------090001090208020504050509
Content-Type: text/plain;
 name="rc.ax25-2.6"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rc.ax25-2.6"

#!/bin/sh
# /etc/rc.d/rc.ax25
# script for initializing ax25 multi kiss connexions
# on two KPC9612 dual ports
# to be used with kernel 2.6
# f6bvp@amsat.org
echo "Attaching kiss serial ports ax0, ax1, ax2, ax3"
# radio ports ax0 ax1 ax2 ax3 are declared in /etc/axports
# serial port 1 at 38400 bauds connected to KPC9612 #2
/usr/local/sbin/mkiss -s 38400 -l /dev/tts/1 /dev/pty/m3 /dev/pty/m4
# PORT #1 KPC9612 = 1200 ---> ax0
/usr/local/sbin/kissattach -m 256 /dev/pty/s3 ax0 44.151.75.15
# PORT #2 KPC9612 = 9600 ---> ax1
/usr/local/sbin/kissattach -m 256 /dev/pty/s4 ax1 44.151.75.15
# serial port 0 at 38400 bauds connected to KPC9612 #1
/usr/local/sbin/mkiss -s 38400 -l /dev/tts/0 /dev/pty/m1 /dev/pty/m2
# PORT #1 KPC9612 = 1200 ---> ax2
/usr/local/sbin/kissattach -m 256 /dev/pty/s1 ax2 44.151.75.15
# PORT #2 KPC9612 = 9600 ---> ax3
/usr/local/sbin/kissattach -m 256 /dev/pty/s2 ax3 44.151.75.15
#

--------------090001090208020504050509--

