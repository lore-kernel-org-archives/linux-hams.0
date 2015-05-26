From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Packet duplication in kernels 2.6 onwards
Date: Tue, 26 May 2015 16:09:30 +0100
Message-ID: <55648CAA.7010204@rns-stearn.demon.co.uk>
References: <5547BACC.7000709@rns-stearn.demon.co.uk> <55483EB3.6070600@trinnet.net> <5558FA02.5070308@rns-stearn.demon.co.uk> <555C7F26.7030006@rns-stearn.demon.co.uk> <20150526075435.GC8600@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150526075435.GC8600@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Ralf Baechle DL5RB wrote:
> In fact when somebody else earlier in this thread said it did only affect
> IP traffic it was quite clear where the issue must be.  I've only ever
> tried to replicate this with non-IP traffic so never got to see the
> duplication.

I was working from reports, in the form of capture files, coming from a
different direction, Wireshark.


> This might also fix the hard to properly fix ARP-over-ROSE issue that
> resulted in a kernel crash.

Post 2.5 kernels there is nothing in the ROSE module that is IP or ARP
related.  Could this be related to the lack of socket locking and device
use count tracking in the ROSE module?  I have published a patch for that.
This weeks job is to raise a kernel bug report and attach the patch to
that.

The packet "duplication" affects more than IP-over-AX25/NETROM/ROSE, I
think it affects IP-over-IP, AX25-over-IP and other packet encapsulating
protocols.  Probably anywhere where "netif_rx()" is used because that call
puts the packet back onto the network interface for further processing.

Note: although this is being called "packet duplication" it appears to be
a packet being seen twice by promiscuous tools (listen & libpcap) as it
is sequentially processed, firstly on it's way to the AX25 handler and
then on it's way to the IP handler.  It is probably necessary to setup
filtering for "listen" and libpcap to select only AX25 packets rather
than all packets on an AX25 interface.

-- 
Regards
	Richard

