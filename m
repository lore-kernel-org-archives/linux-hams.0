From: Dennis Boone <drb@msu.edu>
Subject: Re: Packet at the physical level
Date: Thu, 18 Sep 2003 15:17:09 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E1A04H7-0008Ka-00@yagi.h-net.msu.edu>
References: <20030918190546.GB3466@n7xy.net>  <memo.20030918184842.4613A@rovoreed.compulink.co.uk>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Thu, 18 Sep 2003 12:05:46 PDT.)
             <20030918190546.GB3466@n7xy.net> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > You should also take a look at the AX25 Version 2, Level 2
 > specification: ftp://tapr.org/general/ax25.doc

This addresses the original poster's link layer questions (#2, #3).

To address his physical layer questions:

For most amateur VHF packet, I believe the physical layer is
equivalent to Bell 202.  I've not yet managed to find a copy of that
spec online, but there are a number of documents about chips which
implement it, for example:

http://laspace.lsu.edu/aces/Docs/Component%20Docs/mx614.pdf

which might prove helpful.  A tour of the soundmodem code for Linux
might also be enlightening.

Dennis Boone
KB8ZQZ

 > > 	I'm trying to find out what happens at the physical level with 
 > > Ax25 packet. I've tried looking at the source code but either I'm looking 
 > > in the wrong place, or I don't understand.
 > > 
 > > 	I'm assuming tones of 1200Hz and 2200Hz for 1200bps
 > > 
 > > 	I have several questions concerning transmission.
 > > 	
 > > 	1) Am I right in thinking that the tone changes every time a zero 
 > > bit is sent, and not changed when a 1 bit is sent? If so, what tone 
 > > frequency do I start with (for the first zero bit in the $7E frame start 
 > > octet)
 > > 
 > > 	2) Which order are the bits sent ? LSB or MSB first ?
 > > 	
 > > 	3) What is the polynomial for the frame check CRC. I have seen two 
 > > quoted, x^16 + x^12 + x^5 + 1 and also x^16 + X^15 + x^2 + 1 which is 
 > > right, or is it something else ?
 > > 
 > > 	4) Given that one of the tones is the same as the baud rate, i.e. 
 > > one complete cycle for one bit, does it matter where in the cycle I start 
 > > the tone ?
 > > 
 > > 	5) I'm assuming there is no phase shift between bits. Is this 
 > > correct ?
