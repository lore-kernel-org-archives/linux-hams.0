From: James Cutler <jwc@stanford.edu>
Subject: Kissattach and pseudoterminals
Date: Thu, 13 Feb 2003 19:18:37 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0302131901220.4132-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Just wondering if anyone has every tried to setup two local KISS devices 
with kissattach using psuedo terminals on Linux?  See 
http://www.tldp.org/HOWTO/Text-Terminal-HOWTO-6.html for info pseudo 
terminals.  Basically they allow you to create two serials on a machine 
that are connected via software.

I'd like to write and test AX25 code on my laptop using KISS devices.  On 
my desktop, which has two physical serial ports, I connect them with a 
null modem cable as loop back.  Then I can attach two KISS devices that 
are connected via the cable.

I cannot do this on my laptop since I have just one serial port.  In the 
past I've built a small connector that connects TX line to the RX line to 
test one way, but I'd like to test bi directional communication, hence the 
pseudo terminals.

But, when I use pseudo terminals, only one packet can be sent and then it 
stops (tested with beacon and listen).  Killing and restarting kissattach 
allows one more packet to go through but no more.

Anyone have an idea on how to fix this?

Cheers,

--James, KF6RFX


