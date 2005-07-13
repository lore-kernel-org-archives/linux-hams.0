From: Tomi Manninen <oh2bns@sral.fi>
Subject: RE: YAPP File Transfer with Linux
Date: Wed, 13 Jul 2005 14:03:46 +0300 (EEST)
Message-ID: <Pine.GSO.4.61.0507131342520.12837@vipunen.hut.fi>
References: <MAEBLGENFLMMCIMBCMPOEEJOCKAA.la6gha@robenel.com>
Reply-To: oh2bns@sral.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <MAEBLGENFLMMCIMBCMPOEEJOCKAA.la6gha@robenel.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, 13 Jul 2005, Robert Eliassen wrote:

> Avoiding the AX.25 overhead is close to impossible. But it should be
> possible to skip netrom and load TCP/IP right into the info-field of an
> AX.25 frame. Fragmented of course. But... Having double ACK (both AX.25 and
> TCP) is bad and a waste of bandwidth.

This is how IP over AX.25 works. You have the choise of using connected or 
unconnected mode AX.25. Unconnected (UI) has the advantage of lower 
overhead and avoiding double ack's but connected mode gives you lower 
packet loss (as visible to TCP). Relying solely on the TCP retransmissions 
with it's exponential backoff is a quick way to frustration. The 
non-TCP/IP band users will steal your bandwidth as they are running linear 
or no backoff and in general much more aggressive timers.

> Another problem is the routing. It would be possible to rewrite the
> ARP-protocol and replace hardware addresses (MAC) with callsigs. And of
> course we would need to broadcast the ARP protocol...  Unconnected <UI>
> frame mode perhaps... (starting to sound like netrom)

Callsigns are used in ARP over AX.25. Broadcasted as UI frames, destined 
to the AX.25 address "QST".

> But the double ACK problem is still unsolved.

Actually the ACK'ing isn't all that bad. What's bad is retransmissions on 
several layers. On a busy or lossy channel, when using connected mode 
AX.25, you quickly get in to the situation where you have TCP 
retransmissions in your AX.25 send queue, while the original data hasn't 
even been transmitted yet.

There used to be a re-write of the linux AX.25 stack around, based on work 
done in the Flexnet project I think (?), that had a few quite clever 
tricks in it. By using connected mode AX.25 to transport IP frames, they 
could for example use VJ compression to squeeze out some of the IP header 
overhead. But also they had a mechanism that purged any duplicate TCP 
retransmissions from the AX.25 send queue. I never got around to test it 
but reportedly it worked quite well.

Unfortunately the so called NEWAX25 stack died because of loss of 
time/interest of the original authors. :(

> Another question: There is no length-field in an AX.25-frame, right? The
> payload is wrapped in 01111110-flags if I remember correct. So in theory we
> can transmit fullsize IP-frames (1500 bytes), in a single AX.25-frame ?

Yes. You might get some negative feedback from other users though. At 
least in the past some AX.25 stacks didn't quite like seeing such 
oversized frames and crashed... But I guess that is history now.

> But I guess all this has been discussed years ago.  :-)

Yes. Discussed and implemented (in KA9Q NOS) about 20 years ago. :)

-- 
Tomi Manninen / OH2BNS / KP20JF74
