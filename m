From: John Ackermann N8UR <jra@febo.com>
Subject: Using Kenwood D7 with Linux AX.25
Date: Fri, 02 Aug 2002 22:24:56 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <310796010.1028327096@[192.168.1.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I'm trying to use my Kenwood TH-D7A(g) handy-talkie for some packet demos 
and am having real problems.  My basic AX25 configuration is OK as I can 
hook up to a TNC-2 clone with KISS chip and it works fine.

I put the D7 in KISS mode at 9600 baud (which it seems to drop out of on 
every power cycle, grrrr) and hook it up to the known-working linux setup. 
The D7 receives OK but seems to transmit only preamble flags; when you 
listen to a packet, there's just flags with no evidence of a data portion 
and nothing decodes at the other end.  No data comes out of the thing, no 
matter how long I program the TXD.

I understand that the D7 has KISS limitations due to buffer size, but I'm 
not even getting the basic function to work, and that doesn't seem right.

Anyone got a D7 working with kernel AX.25, and have any suggestions for me? 
(As a data point, when the D7 is in normal packet mode using minicom as a 
terminal program it transmits just fine, so the hbaud, etc. are set 
correctly.)

Thanks,

John

----
John Ackermann   N8UR      jra@febo.com              http://www.febo.com
President, TAPR            n8ur@tapr.org             http://www.tapr.org 
