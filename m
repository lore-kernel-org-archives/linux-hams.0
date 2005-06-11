From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 12:54:03 -0700
Message-ID: <d5d4185b050611125459e4d41a@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <1118518985.1275.1.camel@oh2bns.ampr.org>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1118518985.1275.1.camel@oh2bns.ampr.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 6/11/05, Tomi Manninen <oh2bns@sral.fi> wrote:
> On Sat, 2005-06-11 at 16:38, Chuck Hast wrote:
> 
> > I am using ax25ipd to route some connections over the wire to other sites
> > while we get the RF paths back up and running. The issue I am having is
> > that some of these sites do not have fixed addresses, and the lease exp-
> > ires every 12 hours or so. If I use the domain name address it will pick up
> > the numerical address when ax25ipd is first started but once started it
> > appears to cash the address it got and continue to use it rather than try
> > to resolve the domain name each time it needs to make a connection.
> >
> > In my particular case I am trying to make connetions to people using
> > the no-ip.com domain, but I tried it with another and the same thing
> > happens. It resolves the first time and continues to use that address
> > even after the dhcp assignment has changed which indicates to me
> > that it is only doing address resolution when ax25ipd is starting.
> 
> Yes, it does the address resolution only at startup.
> 
> Ax25ipd is completely stateless, so the other alternative would be
> to resolve for each packet. That would be braindead if you ask me...

I don't know if it would be braindead or not.  I'm not familiar with
ax25ipd or how it works, but here's the question I would ask:

Does ax25ipd initiate a SYN/ACK handshake with the remote system only
at startup, and maintain the connection, or does it initiate the
connection, send it's data, and terminate the connection, reopening it
later when there is more data to send?  If it's the latter, then my
own personal opinion is that it should be doing a DNS lookup for each
connection it initiates.  And if it's using UDP instead of TCP, then
yes, each individual packet should be accompanied by a DNS lookup
request.

Just my .02 worth.

Jeremy, NW7JU
