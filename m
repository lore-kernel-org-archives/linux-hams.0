From: Jim Meehan <jmeehan@vpizza.org>
Subject: YAM/Tekk help
Date: Wed, 16 Nov 2005 07:17:48 -0800
Message-ID: <20051116151748.GN3241@goldengate.vpizza.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I'm trying to get two Linux systems talking to each other over 9600 bps packet.
Here's my setup:

System 1:
Pentium 133 MHz running RedHat 8
Kenwood TM-D700A /w integrated 9600 bps TNC
AX25 HW addr: W6XE-12
IP addr 10.0.0.1


System 2:
Soekris single-board computer running custom Linux mini-distro
Kernel version 2.4.20
YAM 9600 bps modem
Tekk KS-900L radio
AX25 HW addr: W6XE-14
IP addr 10.0.0.2

Problem 1:

If I ping from either side, that machine sends out ARP requests endlessly.
If I do "ifconfig" on the other side, I can see the RX packet counter
incrementing, and in "listen" I can see the ARP requests being received.
But no ARP reply is ever sent.  If I create a static ARP entries on both sides,
then the machines can find each other, and I can ping in both directions.
I guess it's not really such a problem to add static ARP entries on both sides,
since there won't be any stations other than these two.  Would be nice to
know why ARP isn't working though.

Problem 2:

The link is not reliable.  Right now, I've got the txdelay set to 300 ms on
both sides, and I'm still getting 3 or 4 percent packet loss with 64 byte
pings.  If I increase that to 192 byte pings (which is a more realistic size
for real world data transfer) that goes up to ~ 12 percent packet loss.  This
isn't really acceptable, especially since the two systems are just one room
away from each other at the moment.

It looks like packets sent by the TM-D700A are received reliably by the 
YAM/Tekk side, but packets going the other direction are prone to bit errors.
Since there are really no adjustments to make on the TM-D700A, I suspect that
something needs to be adjusted on the YAM/Tekk combo.  There's one adjustment
on the YAM, for TX gain, and I've tried to adjust that for best reliability.
There are also a ton of trimmers and adjustments inside the Tekk, and I suspect
it needs to be realigned.  There are pretty detailed tune-up instructions for
the Tekk radio here:

http://www.guerrilla.net/reference/tekk/ks960_techman.html

But I don't own the equipment necessary to make all the adjustments.

Anyone in the SF bay area who has access to that gear who'd be willing to
help me tune up the Tekk radio?  Any other suggestions on how to get the 
YAM/Tekk combo tuned up and working more reliably?

Thanks,

Jim Meehan, W6XE
Oakland, CA

