From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 21:50:53 -0700
Message-ID: <d5d4185b05061121502bfbdaf8@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <1118518985.1275.1.camel@oh2bns.ampr.org>
	 <d5d4185b050611125459e4d41a@mail.gmail.com>
	 <1118520574.1282.10.camel@oh2bns.ampr.org>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1118520574.1282.10.camel@oh2bns.ampr.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 6/11/05, Tomi Manninen <oh2bns@sral.fi> wrote:
> On Sat, 2005-06-11 at 22:54, Jeremy Utley wrote:
> 
> > On 6/11/05, Tomi Manninen <oh2bns@sral.fi> wrote:
> > > Ax25ipd is completely stateless, so the other alternative would be
> > > to resolve for each packet. That would be braindead if you ask me...
> 
> > Does ax25ipd initiate a SYN/ACK handshake with the remote system only
> > at startup, and maintain the connection, or does it initiate the
> > connection, send it's data, and terminate the connection, reopening it
> > later when there is more data to send?  If it's the latter, then my
> > own personal opinion is that it should be doing a DNS lookup for each
> > connection it initiates.  And if it's using UDP instead of TCP, then
> > yes, each individual packet should be accompanied by a DNS lookup
> > request.
> 
> AX25IP works with not TCP, not UDP, but with IP protocol 93. It's a
> stateless protocol consisting of not much else than wrapping an
> AX.25 packet to an IP frame. Then there are variants that use UDP
> to do pretty much the same.
> 
> If doing a DNS lookup for each outgoing AX.25 packet is ok for
> people then so be it. You have the source. Modify it.
> 
> I find it braindead. The fix should be something else.

Not to flame, but I find your implementation braindead.  IP addresses
change, and the whole purpose of DNS is to make it so you don't have
to remember ip's - you can use friendly names instead.  If your
application cannot respect the DNS TTL value as specified by the name
server that provides the reverse mapping (and on the dyndns services
such as no-ip this are naturally set very low), then IMHO, it's a
broken application.

Since the program is using a stateless mode of communication, then it
*IS* necessary for the program to either (a) respect the TTL setting
provided by the remote authoritative DNS server, or (b) make a call to
gethostbyname() (If I remember my c networking code that's the
function used) to translate the hostname to the IP each an every time.
 Anything else is irresponsible, and broken, because you're relying on
data that is outdated.

Jeremy, NW7JU
