From: Mike Murphree <mike@tropo.org>
Subject: Re: RFC 1226
Date: Sun, 29 Feb 2004 22:30:40 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <31DA5BDC-6B39-11D8-B396-000393BB4930@tropo.org>
References: <1078104092.23240.181857734@webmail.messagingengine.com>
Mime-Version: 1.0 (Apple Message framework v612)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1078104092.23240.181857734@webmail.messagingengine.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Schmalenberger <nschmalenberger@fastmail.fm>
Cc: linux-hams@vger.kernel.org


On Feb 29, 2004, at 7:21 PM, Nick Schmalenberger wrote:

> list:
> A few weeks ago, I sent this message to Brian Kantor, the author of RFC
> 1226. I haven't gotten any response, so maybe you can answer my
> questions. Also, in the AX.25-HOWTO, it talks about these network layer
> protocols like NETROM and ROSE, and I can't understand what they are 
> for.
> Why not just use IP? In the database of Linux Ham radio applications, 
> it
> has a fileserver for AX.25. Why not just use the existing facilities in
> Linux? What is so special about radio that all this stuff needs to be
> reinvented incompatibly?

Ahhhh, you're too funny....   "all this stuff" as you put it, occurred
before Phil Karn, KA9Q, ever produced "Net" which was the first 
recognized
debut of TCP/IP over radio.  "All this stuff" also occurred before Linux
was created too.  There are a *lot* of things that are different about
radio than required by a wired network.  Linux's support of NETROM and 
ROSE
(and half-dozen others) is there to remain compatible with existing 
radio
network nodes that were totally incapable of running something as 
massive
as Linux.  But to answer your question, yes, it is possible to run just 
IP,
but you need a decent computer at each node (excluding TheNetX1J) to 
run it
with any success...

> On Thu, 12 Feb 2004 20:46:47 -0800, "Nick Schmalenberger"
> <nschmalenberger@fastmail.fm> said:
>> Brian Kantor:
>> I read your RFC 1226, and I wonder why would an AX.25 frame be
>> encapsulated in an IP datagram? Is this some form of tunneling? Why 
>> not
>> just have AX.25 carry IP, and AX.25 would be a link-layer protocol 
>> just
>> like Ethernet, PPP, or 802.11? Also, do you know where I can find the
>> specification for APRS? I've looked at TAPR, and I couldn't find it.

You can't route AX.25 on the internet directly, it's incompatible, hence
a tunnel is required...

>>  Why
>> doesn't APRS use IP and UDP? Thanks.
>>

APRS was designed for packet radio, and not the internet...

73
Mike W4LNA

