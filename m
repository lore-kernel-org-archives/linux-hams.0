From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: RFC 1226
Date: Mon, 01 Mar 2004 17:34:48 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1078155288.1256.64.camel@oh2bns.ampr.org>
References: <1078104092.23240.181857734@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1078104092.23240.181857734@webmail.messagingengine.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2004-03-01 at 03:21, Nick Schmalenberger wrote:

> A few weeks ago, I sent this message to Brian Kantor, the author of RFC
> 1226. I haven't gotten any response, so maybe you can answer my
> questions. Also, in the AX.25-HOWTO, it talks about these network layer
> protocols like NETROM and ROSE, and I can't understand what they are for.
> Why not just use IP? In the database of Linux Ham radio applications, it
> has a fileserver for AX.25. Why not just use the existing facilities in
> Linux? What is so special about radio that all this stuff needs to be
> reinvented incompatibly?

Radio does indeed pose problems that are not present in land line
networks. Mainly the high packet loss (due channel access, collision
detection, interference and propagation being much more challenging)
is a problem.

Ham radio poses even more problems. It's next to impossible to build
a properly co-ordinated network so any L3 protocol should have an 
automatic and quickly converging routing protocol on top of it.

When AX.25 was devised roughly 20 years ago they didn't specify
any L3 protocol. Possibly because of the limits posed by the
available (to the average ham) processing power and memory.
This resulted in the development of many rivalling upper level
schemes which is partly a good thing, partly a bad thing.

Anyway I think TCP/IP was a late entrant to the scene, required
relatively big amount of computing power, had a high overhead
and didn't have a working routing protocol. And then there 
probably were social reasons why IP over AX.25 never made a
big breakthrough.

And one has to remember, 15 to 20 years ago TCP/IP didn't
have nearly the status of de-facto standard of networking like 
it has now. The Internet of today didn't really exist...

> > I read your RFC 1226, and I wonder why would an AX.25 frame be
> > encapsulated in an IP datagram? 

Because of the above, ie. the fact that we still largely use AX.25
with our own upper layer protocols and even without any L3 protocol,
there still is a need for encapsulating AX.25 in IP frames for
tunneling over the Internet. Hence RFC1226.

> > Why
> > doesn't APRS use IP and UDP? Thanks.

The APRS "protocol" is basically a collection of standard text 
messages that are sent out as broadcasts and propagated in the
"network" in a simple flood like fashion. I don't see much
benefit in adding the overhead of IP/UDP...


(I hope the above makes sense to those that have been around 
longer than me. I have only about 12-13 years of experience 
in packet radio...)

-- 
Tomi Manninen / OH2BNS / KP20ME04

