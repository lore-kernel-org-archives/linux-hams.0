From: Darren Long <darren.long@virgin.net>
Subject: Delay Tolerant Networks now with Linux AX.25 support
Date: Wed, 21 Feb 2007 22:59:20 +0000
Message-ID: <6236AAC1-751C-4B30-A0CC-D1E6DE6DCC3A@virgin.net>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

The Delay Tolerant Networks Research Group (dtnrg.org) of the IETF  
have developed an overlay network architecture and protocol (the  
Bundling Protocol) primarily for use in joining the Interplanetary  
Network with terrestrial nodes, using persistent incremental store  
and forward techniques.  They also have developed the Licklider  
Transmission protocol (LTP) for delay tolerant operation over point- 
to-point links.  The concept has moved on to include DARPA programs  
and is extended for disruption tolerance too.  The DTN2 reference  
implementation of the bundling protocol is open source and has moved  
(mostly) to an Apache 2 licence.

Anyway, I've just implemented a convergence layer adapter for AX.25  
SEQ_PACKET sockets which carries the bundling protocol.  It's not  
currently in CVS, as I'm not familiar enough with autotools to sort  
it the configure scripts yet, and its only been running since Sunday.

The code is pretty much a direct port of the existing TCP convergence  
layer and has been tested through a pk232 in KISS mode with a  
loopback cable.  It may not be perfect yet but it seems to work well  
enough.  I've not yet provided support for digipeating, and the link  
configurations are a little iffy.

The DTN2 RI code works happily on embedded Linux too, such as my  
NSLU2 (Debian Etch) and the GUMSTIX, although I've not looked at AX. 
25 support in those yet, and on Macs.  With DTN nodes scattered  
around, it is possible to create an overlay network encompassing  
internet connectivity and extending over AX.25 links (with suitable  
Linux gateway nodes).  Work is being done on probabilistic routing  
and discovery mechanisms. It offers TCP, UDP, and  Bluetooth CLs  
already.

I'm a little isolated here in terms of AX.25 connectivity (but with  
some APRS connectivity and the odd packet through the ISS) so I've  
not tested it on air. I wondered if  someone else might be interested  
enough to have a go at building and firing up the DTN2 implementation  
and taking a look at my (our) code ;-)

Darren, G0HWW
