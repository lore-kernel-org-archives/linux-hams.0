From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX.25 in Wireshark (nee Ethereal)
Date: Fri, 09 Apr 2010 22:50:36 +0100
Message-ID: <4BBFA12C.3000002@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

For those that are interested, I have ported my patches of 2007
for wireshark-0.99.5 to wireshark-1.2.7

The patch and implementation instructions can be found here:
   http://www.rns-stearn.demon.co.uk/ax25.wireshark.2010-04-10/

What is in the patch:
	Correct handling of the KISS header in Linux.
	Correct handling of the BPQ encapsulation.
	AX.25 dissection
	NetROM dissection
	Recognition of FlexNet
	TCP/IP dissection, actually a handoff to the TCP/IP dissector
	ROSE dissection, actually a handoff to the X.25 dissector
	Decoding from the No Layer 3 PID of:
		DX cluster
		APRS
		
Wanted:
	Captures of:
		FlexNet
		Anything that does not decode correctly.

Thank you for all those who contributed in 2005, 2006 & 2007.

-- 
73 de g1sog
	Richard

