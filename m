From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: wrong packet size
Date: Sun, 28 Feb 2016 09:40:23 +0100
Message-ID: <20160228084023.GC24846@x-berg.in-berlin.de>
References: <20160226234204.GA30036@belle.intranet.vanheusden.com>
 <20160227074945.GB24846@x-berg.in-berlin.de>
 <20160227150514.GB25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160227150514.GB25136@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: folkert <folkert@vanheusden.com>
Cc: Amateur Radio meets Linux <linux-ham@trilug.org>, linux-hams@vger.kernel.org

On Sat, Feb 27, 2016 at 04:05:14PM +0100, folkert wrote:
> > As far as I know, AX.25 MTU is only take care of on transmitting.
> > There are no trunked buffer sizes on the rx-routines in the kernel.
> > => larger packets, even beyond the ax25 protocol spec (>256 bytes)
> > could be handled.
> > 
> > On transmission, the MTU is respected.
> > But if you read my last posts on this list, that's not always true (IP):
> > I proposed a fix for packets leaving the interface that are much
> > larger than the configured MTU or / and the max-mtu of 256.
> > For normal PID=text packets, data sent with write() is adjusted to the
> > MTU, and data tried to send with syscall sendto() and a size > MTU are
> > rejected.
> 
> check
> In which kernel is this implemented?

What of the things I described?
write(): afaik, since ever. segmentation happens (but not as PID=segment
         as for IP - just a simple split of the data at the length)
sendto(): for ax25-I: sendto() with len > MTU fails.
          for ax25-UI: see my proposal in https://marc.info/?l=linux-hams&m=145554737504304&w=2 section 2.1

 
> > Btw, in your line:
> > > 23    11.084320000    FH4GOU-01       TRDS01-01       AX.25-NoL3 271 Text
> >
> > => 271 is beyond the standard. You'll might find many old software, 
> > TNCs, etc. that would even not be capable to decode such a packet.
> 
> Yes, that's how I found it out :-)
> 
> > On the other hand I wonder what packet that was.
> > "NoL3" => I assume PID=text (not IP, ARP, etc.).
> 
> It was a conversation between "axcall" and "ax25-node" (or "node"). In
> that packet was the result of "M ax0" (or "mheard ax0"). 

ax25-node was the sender?

I'd be glad if you could provide:
1. listen -a -h
AND
2. an strace of node ( strace -tt -s 2048 -xx -p PIDofNODE )
..at the point it gets the command it to send the result of "M ax0".
   
> > Sender is FH4GOU-1 (but that's not a call of one of the two sides in
> > your test setup). How does that callsign comes to the line and what
> > computer / os / pr-program / userspacesprogram sends this data?
> 
> It should be correct, I checked it moments ago.
> 
> Ok setup:
> 
> - laptop with a tnc and a radio running linux kernel 4.2.1-2 from debian
> - raspberry pi with a tnc and a radio running kernel 4.1.18+ (raspbian)
> 
> Both are connected to the TNCs via USB to serial converters. Both TNCs
> run the same software.

And I assume, raspberry pi is FH4GOU-0 running "node" with call FH4GOU-1 ?
And the program connecting with call is your laptop?

> The TNCs are arduinos and the radios are LoRa modules connected to them.
> https://www.vanheusden.com/radio/arduino-tnc.php

We talked about it on Jan, 30 ;)

vy 73,
	- Thomas  dl9sau
