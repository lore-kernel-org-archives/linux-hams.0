From: <dplatt@radagast.org>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 13:18:32 -0700
Message-ID: <1DhCR6-3jp-00@radagast.org>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> AX25IP works with not TCP, not UDP, but with IP protocol 93. It's a
> stateless protocol consisting of not much else than wrapping an
> AX.25 packet to an IP frame. Then there are variants that use UDP 
> to do pretty much the same.
> 
> If doing a DNS lookup for each outgoing AX.25 packet is ok for
> people then so be it. You have the source. Modify it.
> 
> I find it braindead. The fix should be something else.

I'm not sure that actually doing a DNS lookup (via the resolver
interface) is necessary or desireable.

However, I do think that when the daemon does such a lookup, and
caches the resulting IP address, it should also cache the current time
and the time-to-live value from the DNS lookup.  Once the response's
time-to-live expires, it should discard the callsign-to-IP-address
mapping and look it up again.

For the daemon to assume that a DNS response has an effectively
infinite lifetime is not a good thing.
