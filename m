From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: netrom
Date: Mon, 15 Apr 2002 18:55:04 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0204151842060.365-100000@Consulate.UFP.CX>
References: <Pine.GSO.4.10.10204141802280.15175-100000@asuwlink.uwyo.edu>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.10.10204141802280.15175-100000@asuwlink.uwyo.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter R Fletcher <fletcher@uwyo.edu>
Cc: M Taylor <mctylr@privacy.nb.ca>, Shane Deering <vk3bvp@qsl.net>, Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Walter.

>>> Please do not randomly used a 44. address without allocation.
>>> 44.135.96/24 is Ottawa, Ontario, Canada (ve3), so I suspect that
>>> you do not have it allocated to you (having a vk callsign I
>>> assume you are not operating in Canada).
>>> 
>>> Use a non-routable Private IP (RFC 1918) such as 10.0.0.1.

>> Alternatively, I understand that 44.128.* addresses are reserved
>> for testing as well, and can be freely used as a result.
>> 
>> Perhaps somebody could clarify that for me though?

> From the 12 Dec 2001 list of AMPR IP address coordinators:

> # 44.128 is reserved for testing. Do not use for operational
> # networks. You may safely assume that any packets with 44.128
> # addresses are bogons unless you are using them for some sort
> # of testing.

> 44.128.x.y may be allocated for 44.x.y.z internal testing but what
> happens to them depends on the net 44 routers being set up properly
> such that they dispose of the test packets.

Fairy Nuff.

> Using the 10.x.y.z addresses gives you a certainty that if your test
> packets inadvertantly leak out of the 44.x.y.z net, they will
> promptly and safely be dropped.

Not if you use IC24 as your IP - they allocate 10.* addresses to your
modem and the router at the other end, and their DHCP servers provide
a routing line that routes ALL 10.* IP addresses across the modem link
to the router you're dialled up to.

Incidentally, I didn't know that when I posted the original message, and
only discovered it because one of my customers has them as their ISP and
I was sorting their computer out Saturday afternoon.

Probably a better choice would be to use 172.24.* addresses for this
purpose if your ISP does the above, and probably even if they don't.

> Either way would be using the addresses for what they were intended
> of course. It's a matter of making things happen that are proper and
> predictable, hence good network etiquette.

Just ensure that whatever you use doesn't conflict with your ISP
either. Here's the allocated ranges that I'm aware of:

	10.*		Use with care - some ISP's use this.

	172.16.*
	172.17.*
	172.18.*
	172.19.*
	172.20.*
	172.21.*
	172.22.*
	172.23.*
	172.24.*
	172.25.*
	172.26.*
	172.27.*
	172.28.*
	172.29.*
	172.30.*
	172.31.*

	192.168.*	Most home networks use this.

Best wishes from Riley.

