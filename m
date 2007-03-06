From: John Ronan <jronan@tssg.org>
Subject: Questions.
Date: Tue, 6 Mar 2007 11:36:55 +0000
Message-ID: <B01D5789-9A34-4587-812D-CF0BE49E9697@tssg.org>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hi Folks,

I'm about to build a new node here, and I've actually now got time to  
do it properly (rather than having to rush it).  I want to enable IP  
on all interfaces/APRS on some normal Packet forwarding on another.

I'm waiting to see if our National TCP/IP Co-Ordinator is still co- 
ordinating ;), but I can still go on and do the design on paper.

2m Port will be 144.800 primarily APRS and will have TCP/IP
4m Port will be for forwarding to local FBB BBS (and TCP/IP) & APRS
UHF port will be 9K6, my plan for this port is to act as a TCP/IP  
port, but it will also allow ax25 connects & APRS

We've never really 'done' TCP/IP around here, so no real thought ever  
went into the network IP address allocation scheme (Anyone tried IPv6  
over AX25 btw).

If this was a wired network, I'd look for a /24 for each interface,  
but I don't know if thats the 'done thing', also the AX25 HOWTO seems  
out of date, I've emailed the author to as if its possible to suggest  
updates to the document

Any thoughts appreciated.

Regards
de John
EI7IG


--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



