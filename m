From: rovoreed@cix.co.uk (Mike Davies)
Subject: Packet at the physical level
Date: Thu, 18 Sep 2003 18:48 +0000 (Greenwich Standard Time)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <memo.20030918184842.4613A@rovoreed.compulink.co.uk>
Reply-To: rovoreed@cix.co.uk
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: rovoreed@cix.co.uk


	I'm trying to find out what happens at the physical level with 
Ax25 packet. I've tried looking at the source code but either I'm looking 
in the wrong place, or I don't understand.

	I'm assuming tones of 1200Hz and 2200Hz for 1200bps

	I have several questions concerning transmission.
	
	1) Am I right in thinking that the tone changes every time a zero 
bit is sent, and not changed when a 1 bit is sent? If so, what tone 
frequency do I start with (for the first zero bit in the $7E frame start 
octet)

	2) Which order are the bits sent ? LSB or MSB first ?
	
	3) What is the polynomial for the frame check CRC. I have seen two 
quoted, x^16 + x^12 + x^5 + 1 and also x^16 + X^15 + x^2 + 1 which is 
right, or is it something else ?

	4) Given that one of the tones is the same as the baud rate, i.e. 
one complete cycle for one bit, does it matter where in the cycle I start 
the tone ?

	5) I'm assuming there is no phase shift between bits. Is this 
correct ?


Mike de G0WZY
