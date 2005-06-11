From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 23:09:34 +0300
Message-ID: <1118520574.1282.10.camel@oh2bns.ampr.org>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <1118518985.1275.1.camel@oh2bns.ampr.org>
	 <d5d4185b050611125459e4d41a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <d5d4185b050611125459e4d41a@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 2005-06-11 at 22:54, Jeremy Utley wrote:

> On 6/11/05, Tomi Manninen <oh2bns@sral.fi> wrote:
> > Ax25ipd is completely stateless, so the other alternative would be
> > to resolve for each packet. That would be braindead if you ask me...

> Does ax25ipd initiate a SYN/ACK handshake with the remote system only
> at startup, and maintain the connection, or does it initiate the
> connection, send it's data, and terminate the connection, reopening it
> later when there is more data to send?  If it's the latter, then my
> own personal opinion is that it should be doing a DNS lookup for each
> connection it initiates.  And if it's using UDP instead of TCP, then
> yes, each individual packet should be accompanied by a DNS lookup
> request.

AX25IP works with not TCP, not UDP, but with IP protocol 93. It's a
stateless protocol consisting of not much else than wrapping an
AX.25 packet to an IP frame. Then there are variants that use UDP 
to do pretty much the same.

If doing a DNS lookup for each outgoing AX.25 packet is ok for
people then so be it. You have the source. Modify it.

I find it braindead. The fix should be something else.

-- 
Tomi Manninen / OH2BNS / KP20JF74

