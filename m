From: csmall@eye-net.com.au (Craig Small)
Subject: Re: IPv6 Amateur Allocation ?
Date: Tue, 30 Jul 2002 21:00:54 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020730110054.GD7293@eye-net.com.au>
References: <20020729193853.GA842@columbia.g7iii.bogus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020729193853.GA842@columbia.g7iii.bogus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Mon, Jul 29, 2002 at 08:38:53PM +0100, Iain Young - G7III wrote:
> Hi Everyone,
> 
> I know Amateur Radio has a IPv4 alllocation (44/8). Does Anyone know
> if we have an IPv6 allocation ? And if so, what it is ?

Well, we actually have two allocations in a way...
The less interesting one is v4 mapped addresses, ::44.x.y.z pretty
boring really.

The more interesting ones are the 6to4 addresses.  These are a rather
large subnet of IPv6 addresses for each IPv4 address.  All you have to 
do is have some connectivity into the IPv6 network and then a 6to4
gateway, to speed things up you could even have a 6to4 gateway near
mirrorshades (it could even be mirrorshades but I won't wish that upon 
Brian).

The 6to4 address contains the IPv4 address in it.  Special 6to4 gateways
advertise the entire 6to4 network or parts of the network (this
theoretical ampr 6to4 gateway would say "I can get 6to4 addresses for
what is translated from 44.0.0.0/8" ).  The 6to4 gateway knows about 
these special addresses and then encapsulates the packet into a IPv6 in
IPv4 tunnel to the IPv4 address.

I don't believe there is any direct allocation of IPv6 addresses
to radio amateurs, NICs are too fascist for that these days :(

Go grab a 6bone block. I got one and, well it's ok and its free!
If you run IPv6 already, have a crack at getting to
http://www.ipv6.eye-net.com.au/

  - Craig

-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
