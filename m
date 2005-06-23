From: Steve Fraser <sfraser@sierra.apana.org.au>
Subject: Re: ax25ipd issue
Date: Thu, 23 Jun 2005 21:21:30 +0930
Message-ID: <42BAA242.3000809@sierra.apana.org.au>
References: <620c90570506110638c4a2659@mail.gmail.com>	 <1118518985.1275.1.camel@oh2bns.ampr.org>	 <d5d4185b050611125459e4d41a@mail.gmail.com>	 <1118520574.1282.10.camel@oh2bns.ampr.org>	 <6299972ae763a89e9fb7d206490cf1b7@utac.net> <620c905705061113454d208a97@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905705061113454d208a97@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hi All,

Regarding the problem of IP addresses changing for AXIP links, Chuck 
Hast wrote:

> Yes, we need to come up on a work around,  Stewart Wilkinson sent
> me a set of scripts that kill and restart ax25ipd when they detect a
> out of date address. Would be much better to figure out how to come
> up with a solution that will get a new one and go from there. 

I've done some changes to the code. I've altered it so that every five 
minutes and after 10 seconds of inactivity (or every 15 minutes 
regardless) the IP entries for all route lines that have hostnames 
rather than IP numbers get requeried by DNS. (It would have been better 
to use TTL's, but I couldnt find any way to get the TTL without a lot of 
coding!)

Anyway, if you specify an IP number on a route line, then it's clearly 
fixed. If you use a FQDN then the IP number may change, so is 
re-checked. (If it is found to be invalid upon re-checking, the old IP 
number is re-used).

I think this will work OK, (without the overhead of a DNS lookup of 
every packet) but I dont have any partners who use dynamic dns, so I 
guess I need a volunteer to try it out for me..........

Drop me a line if you'd like to try it out.

73

Steve, vk5asf

