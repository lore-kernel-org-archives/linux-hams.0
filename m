From: Chuck Hast <wchast@gmail.com>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 14:51:55 -0600
Message-ID: <620c905705061113516f7636e2@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <1118518985.1275.1.camel@oh2bns.ampr.org>
	 <d5d4185b050611125459e4d41a@mail.gmail.com>
	 <1118520574.1282.10.camel@oh2bns.ampr.org>
	 <6299972ae763a89e9fb7d206490cf1b7@utac.net>
	 <42AB4A77.9080705@sktc.net>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42AB4A77.9080705@sktc.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David D. Hagood" <wowbagger@sktc.net>
Cc: John Hurst <jhurst@utac.net>, Tomi Manninen <oh2bns@sral.fi>, Linux-hams List <linux-hams@vger.kernel.org>

On 6/11/05, David D. Hagood <wowbagger@sktc.net> wrote:
> John Hurst wrote:
> > How about using the TTL to decide when to re-query?
> 
> 
> Or better still, just query a local nameserver on every packet, and let
> the local nameserver worry about nameserver type issues like TTL and
> caching.
> 
> Remember the Unix way - do what you do very well, and do nothing else -
> let others do what they do very well.
> -

Well, if I can figure out how to get ax25ipd to do so that is what I would do.
Problem is that it does not do any of that except at startup.

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
