From: Steve Fraser <sfraser@sierra.apana.org.au>
Subject: Re: iptables versus ax25ipd
Date: Wed, 19 Nov 2008 19:46:03 +1030
Message-ID: <4923D953.9010704@sierra.apana.org.au>
References: <1222244947.6886.5.camel@zaba> <4923B2D8.4090909@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4923B2D8.4090909@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cathrynham <cathrynm@junglevision.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

cathrynham wrote:
> I'm trying to setup axip, and when I turn on iptables/firewall in 
> Fedora I stop
> receiving any messages at all in axip. How do I  configure iptables so 
> that it
> works with axip at the same time?  --
Assuming you have a default of 'drop or deny', then you need to allow 
the axip protocol through (the same applies to tunnelled ip).

To allow both, without restriction, something like this:

# encapsulation (IPIP=4, AXIP=93)
iptables -A FORWARD -p 
4                                                   -j ACCEPT
iptables -A FORWARD -p 
93                                                  -j ACCEPT

i.e. axip and ipip are separate protocols, just like tcp and udp are.

cheers

Steve
