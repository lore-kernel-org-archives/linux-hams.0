From: Dave Platt <dplatt@radagast.org>
Subject: RE: YAPP File Transfer with Linux
Date: Wed, 13 Jul 2005 10:51:00 -0700 (PDT)
Message-ID: <20050713175100.21549.qmail@radagast.org>
References: <MAEBLGENFLMMCIMBCMPOEEJOCKAA.la6gha@robenel.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <MAEBLGENFLMMCIMBCMPOEEJOCKAA.la6gha@robenel.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: la6gha@robenel.com
Cc: linux-hams@vger.kernel.org

> Right. The IP-header is 20 bytes, and the TCP-header is also 20 bytes. I
> wouldn't be surprised if NetRom adds another 20 bytes as wrapping.
> 
> Now, the AX.25 protocol adds another chunk of overhead, probably close to 20
> bytes (don't remember, but both source and destination address are included
> AFAIK) or even more when digipeaters are being used.
> 
> Avoiding the AX.25 overhead is close to impossible. But it should be
> possible to skip netrom and load TCP/IP right into the info-field of an
> AX.25 frame. Fragmented of course. But... Having double ACK (both AX.25 and
> TCP) is bad and a waste of bandwidth.

This is, I believe, the preferred way of doing TCP/IP over AX.25.
AX.25 has "first class citizen" support for IP - there's a unique
AX.25 protocol identifier for IP (just as there is for NETROM and
for the normal AX.25 connection protocol) and another for IP ARP.

These IP and ARP packets are not encapsulated in the higher-level
AX.25 Layer 3 packets.  Rather, they're riding on top of AX.25
Layer 2, just as AX.25 Layer 3 and NETROM packets do.

It's entirely possible to run TCP/IP over AX.25 without suffering
from IP fragmentation in the packets when they traverse the AX.25
link(s).  This is done by configuring the MTU of the AX.25
interface properly, and letting the (fairly standard) IP
path-MTU-discovery algorithm figure out the minimum MTU of any
link in the path.

> 
> Another problem is the routing. It would be possible to rewrite the
> ARP-protocol and replace hardware addresses (MAC) with callsigs. And of
> course we would need to broadcast the ARP protocol...  Unconnected <UI>
> frame mode perhaps... (starting to sound like netrom)

No need.  Already been done, long ago.  Linux supports it beautifully.

> But the double ACK problem is still unsolved.

With IP-in-AX.25, I believe that there is no double-ACK problem at all.
IP-in-AX.25 uses unnumbered (UI) frames.  All acknowledgement and
flow control is handled at the TCP layer.  If you do UDP-over-IP-over
AX.25, any acknowledgement is done at a higher layer - there won't be
any done at all by UDP, IP, or AX.25!

> Another question: There is no length-field in an AX.25-frame, right? The
> payload is wrapped in 01111110-flags if I remember correct. So in theory we
> can transmit fullsize IP-frames (1500 bytes), in a single AX.25-frame ?

The spec says "The default maximum number of octets allowed in the I field
is 256.  This variable is negotiable between end stations.  The I field
is an integral number of octets."

So, as I read it, if you're running IP-over-AX.25, you could negotiate a
larger I-limit (and thus a larger interface MTU) with your peer stations
ahead of time.  I suspect that you'd have to set up your interface to use
the *minimum* I limit / MTU of any of the stations with which you were
communicating directly (or via digipeat) at the AX.25 level.

If I recall correctly, IP is not limited to a 1500-byte MTU.  That limitation
is set by standard 10-base-whatever Ethernet.  It's possible to set up a
larger IP MTU for other sorts of links.

So, there are a couple of ways that things can go, packet-wise:

-  Set the AX.25 interface MTU to 255 (which seems to be the Linux
   default).  Inbound and outbound connections from your own system
   will honor this limit.  IP being forwarded through your system
   may either end up being fragmented (if the sender isn't doing
   MTU path discovery and if your system is configured to permit
   fragmentation to occur), or may be forced down to smaller IP
   packets via voluntary or involuntary "no fragmentation here"
   processing.

-  Set the AX.25 MTU higher than 255, and make sure that every AX.25
   node with which you're in contact on that interface / radio
   agrees with your higher limit.

Linux also allows you to play with some of the other TCP parameters
in order to promote the reliability of IP-over-AX.25 operation.
On my laptop (soundmodem) setup, I use /sbin/route to set up
the route to the 44.* network with "irtt 3000 window 220".
The irtt setting is particularly helpful, as it prevents
TCP from doing a whole bunch of retries during the very
early stages of connection setup and transmission.  The
"window 220" is a kluge I put in place to keep the laptop from
ever sending two IP frames back-to-back in a single
keydown, and was required to work around the fact that the
TNC-X at my house becomes confused by the not-quite-AX.25-
conformant inter-frame fill behavior of the user-mode
soundmodem code.

> But I guess all this has been discussed years ago.  :-)

Seems to have been!  I'd suggest reading the AX.25 protocol
specification, current revision (2.2, I think).  It's normally
available via www.tapr.org, but they've recently reorganized
their site and the links to the spec seem to be broken.

