From: "Robert Eliassen" <la6gha@robenel.com>
Subject: RE: YAPP File Transfer with Linux
Date: Wed, 13 Jul 2005 09:53:00 +0200
Message-ID: <MAEBLGENFLMMCIMBCMPOEEJOCKAA.la6gha@robenel.com>
References: <42D415F6.6040400@jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42D415F6.6040400@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Bill wrote:

> That's correct.   With TCP/IP on packet, 40 of the 256 bytes are
> overhead.  Putting it on Netrom adds another 20 bytes.   The real killer
> is that all the ACK packets have the same (40 or 60 bytes) of overhead.

Right. The IP-header is 20 bytes, and the TCP-header is also 20 bytes. I
wouldn't be surprised if NetRom adds another 20 bytes as wrapping.

Now, the AX.25 protocol adds another chunk of overhead, probably close to 20
bytes (don't remember, but both source and destination address are included
AFAIK) or even more when digipeaters are being used.

Avoiding the AX.25 overhead is close to impossible. But it should be
possible to skip netrom and load TCP/IP right into the info-field of an
AX.25 frame. Fragmented of course. But... Having double ACK (both AX.25 and
TCP) is bad and a waste of bandwidth.

Another problem is the routing. It would be possible to rewrite the
ARP-protocol and replace hardware addresses (MAC) with callsigs. And of
course we would need to broadcast the ARP protocol...  Unconnected <UI>
frame mode perhaps... (starting to sound like netrom)

But the double ACK problem is still unsolved.

Another question: There is no length-field in an AX.25-frame, right? The
payload is wrapped in 01111110-flags if I remember correct. So in theory we
can transmit fullsize IP-frames (1500 bytes), in a single AX.25-frame ?

But I guess all this has been discussed years ago.  :-)


Bob, LA6GHA

