From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX.25 in tcpdump
Date: Tue, 13 Apr 2010 23:44:01 +0100
Message-ID: <4BC4F3B1.7000409@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

For those that are interested, I have ported my patches of 2007
for tcpdump-3.9.5 to tcpdump-4.1

The patch and implementation instructions can be found here:
   http://www.rns-stearn.demon.co.uk/ax25.tcpdump.2010-04-13/

What is in the patch:
     Correct handling of the KISS header in Linux.
     Correct handling of the BPQ encapsulation.
     AX.25 dissection
     NetROM dissection
     Recognition of FlexNet
     TCP/IP dissection, actually a handoff to the TCP/IP dissector
     recognition of ROSE

Wanted:
     Captures of:
         FlexNet
         Anything that does not decode correctly.

Thank you for all those who contributed in 2005, 2006 & 2007.
-- 
73 de g1sog
	Richard

