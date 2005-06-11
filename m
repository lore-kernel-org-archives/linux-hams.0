From: Steve Fraser <sfraser@sierra.apana.org.au>
Subject: Re: ax25ipd issue
Date: Sun, 12 Jun 2005 08:33:20 +0930
Message-ID: <42AB6DB8.2070604@sierra.apana.org.au>
References: <620c90570506110638c4a2659@mail.gmail.com>	 <1118518985.1275.1.camel@oh2bns.ampr.org>	 <d5d4185b050611125459e4d41a@mail.gmail.com> <1118520574.1282.10.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1118520574.1282.10.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hi All,

Tomi Manninen wrote:

> 
> If doing a DNS lookup for each outgoing AX.25 packet is ok for
> people then so be it. You have the source. Modify it.
> 
> I find it braindead. The fix should be something else.
> 
I agree. That would be a ridiculous overhead.

Some time ago I prototyped a "dynamic" ax25ipd. The lookup table 
(translating callsigns to IP's) was held in memory space that could also 
be accessed by other programs. The idea was that ax25ipd initially 
populated the table, then other programs (eg DNS, or a "learning" 
listener) could amend it. Each time ax25ipd sent a packet, it looked up 
that table, so if the entry had changed the packet went to the new 
destination.

It needed a simple locking mechanism, but before I got around to that 
someone did a major rewrite of ax25ipd and I never got around to 
re-doing it :-(  But I'm sure it could be re-done relatively easily 
(even if I can't find the code).

73

Steve, vk5asf
