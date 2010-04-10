From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: AX.25 in Wireshark (nee Ethereal)
Date: Sat, 10 Apr 2010 10:02:55 +0100
Message-ID: <4BC03EBF.3010701@rns-stearn.demon.co.uk>
References: <4BBFA12C.3000002@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BBFA12C.3000002@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Ok, Ok, I am posting in reply to my own post.  A number have asked if 
the patch is being offered to the Wireshark developers, the answer is 
yes but...

I proposed the 2007 patch to the Wireshark developers in 2007 and
it was declined at that time for a number of reasons.

Primarily because the Linux implementation of AX.25 has a "KISS"
header byte thus is not true AX.25 (protocol 3), I had handled
this in the AX.25 dissector. I had done the same with the BPQ
ethernet encapsulation.  So the developers for libpcap, tcpdump
& wireshark declined to accept that patches at that time and in
that form.  I can see their point and do not have a problem with
that point of view.

The libpcap maintainers did add a new protocol
     DLT_AX25_KISS "AX.25 with KISS header"
to libpcap, this went into libpcap late in the 0.9.x series and 
overcomes the problems with having an unidentified protocol to
handle.  I then had to reimplement the dissectors so I had a
KISS dissector that could handle the KISS header and then hand the
encapsulated AX.25 frame on to an AX.25 dissector which in turn can
hand on any encapsulated higher protocol to the appropriate dissector.

Unfortunately I have been involved in family affairs for the last 3
years (the passing of my parents, Mum, Jean G7DKZ and Dad, Bill G0MLT)
so have had no time to follow up on the work.

I have just (in the last week) returned to the issue and have
re-implemented the patch to handle the various "protocols" correctly.
I will be attempting to get the patch accepted by the Wireshark
developers, but in small pieces, not the whole patch as one entity.

Even so parts such as FlexNet, DX cluster & APRS may not be accepted,
FlexNet because I have no spec and the current implementation only
recognises FlexNet rather than doing a detailed dissection, DX cluster
and APRS because they are not protocols, more a way of using the No
Layer 3 protocol PID payload.

I have published this patch so that those who can apply the patch and
recompile can have the benefit while I get the patch into Wireshark
piece by piece.  I can also benefit by the patch being used and hence
the bugs found.

So, please if you can recompile, do so, and use the patch, I no longer
have a working Packet system and thus am dependant on those that do, to
use the code and thus test it.  Also my Packet system was a Linux box,
all my captures are from that system, the code needs to "see" packets
from other systems.

I would also like to know who does recompile to use the patch, so if
you do recompile please drop me an email, via the list or direct, I
do not mind.  Knowing the number who do may be useful when talking to
the Wireshark developers.

-- 
73 de g1sog
	Richard

