From: Chuck Hast <wchast@gmail.com>
Subject: Re: ax25ipd issue
Date: Thu, 23 Jun 2005 06:15:22 -0600
Message-ID: <620c905705062305151025e082@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <1118518985.1275.1.camel@oh2bns.ampr.org>
	 <d5d4185b050611125459e4d41a@mail.gmail.com>
	 <1118520574.1282.10.camel@oh2bns.ampr.org>
	 <6299972ae763a89e9fb7d206490cf1b7@utac.net>
	 <620c905705061113454d208a97@mail.gmail.com>
	 <42BAA242.3000809@sierra.apana.org.au>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42BAA242.3000809@sierra.apana.org.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Fraser <sfraser@sierra.apana.org.au>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On 6/23/05, Steve Fraser <sfraser@sierra.apana.org.au> wrote:
> Hi All,
> 
> Regarding the problem of IP addresses changing for AXIP links, Chuck
> Hast wrote:
> 
> > Yes, we need to come up on a work around,  Stewart Wilkinson sent
> > me a set of scripts that kill and restart ax25ipd when they detect a
> > out of date address. Would be much better to figure out how to come
> > up with a solution that will get a new one and go from there.
> 
> I've done some changes to the code. I've altered it so that every five
> minutes and after 10 seconds of inactivity (or every 15 minutes
> regardless) the IP entries for all route lines that have hostnames
> rather than IP numbers get requeried by DNS. (It would have been better
> to use TTL's, but I couldnt find any way to get the TTL without a lot of
> coding!)
> 
> Anyway, if you specify an IP number on a route line, then it's clearly
> fixed. If you use a FQDN then the IP number may change, so is
> re-checked. (If it is found to be invalid upon re-checking, the old IP
> number is re-used).
> 
> I think this will work OK, (without the overhead of a DNS lookup of
> every packet) but I dont have any partners who use dynamic dns, so I
> guess I need a volunteer to try it out for me..........
> 
> Drop me a line if you'd like to try it out.
> 

Steve,
Send me that sucker and I will pop it in here and test it. I have one and
soon two switch sites that have no-ip.com addresses and they change
about every 12 hours.. Be glad to give it a try.

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
