From: Chuck Hast <wchast@gmail.com>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 14:45:54 -0600
Message-ID: <620c905705061113454d208a97@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <1118518985.1275.1.camel@oh2bns.ampr.org>
	 <d5d4185b050611125459e4d41a@mail.gmail.com>
	 <1118520574.1282.10.camel@oh2bns.ampr.org>
	 <6299972ae763a89e9fb7d206490cf1b7@utac.net>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6299972ae763a89e9fb7d206490cf1b7@utac.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Hurst <jhurst@utac.net>
Cc: Tomi Manninen <oh2bns@sral.fi>, Linux-hams List <linux-hams@vger.kernel.org>

On 6/11/05, John Hurst <jhurst@utac.net> wrote:
> 
> On Jun 11, 2005, at 1:09 PM, Tomi Manninen wrote:
> > I find it braindead. The fix should be something else.
> 
> How about using the TTL to decide when to re-query?
> 
> -jh
> 

Yes, we need to come up on a work around,  Stewart Wilkinson sent
me a set of scripts that kill and restart ax25ipd when they detect a
out of date address. Would be much better to figure out how to come
up with a solution that will get a new one and go from there. We are
running this using UDP, it works until a address gets changed some-
where and then you have to restart the ax25ipd links so as to pick up
the new addresses.



-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
