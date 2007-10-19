From: Peter <pc2a@pi4cc.nl>
Subject: TNC3
Date: Fri, 19 Oct 2007 18:13:05 +0000
Message-ID: <4718F3B1.1020401@pi4cc.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi

I'am looking for support to get a TNC3S with 2 modem working
With standard kissattach I got modem 1 on the air.

In the ax25 how-to I found:
If you have a dual port tnc and it is connected to
your /dev/ttyS0 serial device at 9600 bps,
the command:
/usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyp0 /dev/ptyp1
/usr/sbin/kissattach /dev/ttyp0 port1
/usr/sbin/kissattach /dev/ttyp1 port2

But none of the modem do work
Who has a TNC3S running ?

Peter
PC2A
