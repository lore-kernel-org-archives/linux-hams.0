From: linuxhams@n0qbj-11.ampr.org
Subject: 2.6 Kernel AX25 driver bug
Date: 25 Sep 2004 03:52:19 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040925035219.4875.qmail@kunk.qbjnet.com>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

It appears that a bug has been introduced in the ax25 driver for 2.6 that
prevents it from working properly on big-endian machines. When I take exactly
the same hardware from a working debian 2.6.7 x86 system and move it to a
PPC system with the exact same setup and parameters it appears to inproperly
process RECEIVED packets. The listen command shows that the reply packets
are being read (I'm doing a ping) but the tcp/ip level appears to ignore them.
If I boot a 2.4.27 kernel on the PPC box it works fine with the exact same
setup. Note that a simple call command DOES work, just tcp/ip packets fail.

I've tried this with the YAM driver AND the kiss driver through a serial port.

Who is maintaining the ax25 driver in 2.6?? I see a lot of changes were made
to it and maybe they would know what might be endian specific.

Regards,
Bob
