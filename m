From: "David D. Hagood" <wowbagger@sktc.net>
Subject: Re: ax25ipd issue
Date: Sat, 11 Jun 2005 15:32:55 -0500
Message-ID: <42AB4A77.9080705@sktc.net>
References: <620c90570506110638c4a2659@mail.gmail.com> <1118518985.1275.1.camel@oh2bns.ampr.org> <d5d4185b050611125459e4d41a@mail.gmail.com> <1118520574.1282.10.camel@oh2bns.ampr.org> <6299972ae763a89e9fb7d206490cf1b7@utac.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6299972ae763a89e9fb7d206490cf1b7@utac.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Hurst <jhurst@utac.net>
Cc: Tomi Manninen <oh2bns@sral.fi>, Linux-hams List <linux-hams@vger.kernel.org>

John Hurst wrote:
> How about using the TTL to decide when to re-query?


Or better still, just query a local nameserver on every packet, and let 
the local nameserver worry about nameserver type issues like TTL and 
caching.

Remember the Unix way - do what you do very well, and do nothing else - 
let others do what they do very well.
