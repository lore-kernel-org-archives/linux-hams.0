From: cathryn mataga <cathrynm@junglevision.com>
Subject: Re: iptables versus ax25ipd
Date: Wed, 19 Nov 2008 11:21:18 -0800
Message-ID: <4924672E.2050401@junglevision.com>
References: <1222244947.6886.5.camel@zaba> <4923B2D8.4090909@junglevision.com> <22F4D895-DAAA-4C44-9500-4AE854AB1857@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <22F4D895-DAAA-4C44-9500-4AE854AB1857@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

John Ronan wrote:
>
> On 19 Nov 2008, at 06:31, cathrynham wrote:
>
>> I'm trying to setup axip, and when I turn on iptables/firewall in 
>> Fedora I stop
>> receiving any messages at all in axip. How do I  configure iptables 
>> so that it
>> works with axip at the same time?
> Hmm, is run over port 91? Our club machine is off so I can't check and 
> I don't remember.
>
raw        0      0 0.0.0.0:93                  
0.0.0.0:*                   7
        -

I set to 'ip' mode and it looks like it opens a socket for port 93 raw. 
  I assume
it's doing something slightly strange here.  I just went into the Fedora 
control panel
and naively turned on tcp/ip and udp for port 93, and that didn't 
work.   I'll
try the iptables that the other guy posted here this weekend, to see
if that works. 
.




