From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: soundmodem parameter definitions
Date: Fri, 20 Feb 2004 17:23:19 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1077290599.1262.25.camel@oh2bns.ampr.org>
References: <20040220144037.GQ14329@strauss.udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040220144037.GQ14329@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Markowski <mm@UDel.Edu>
Cc: Linux Hams <linux-hams@vger.kernel.org>

On Fri, 2004-02-20 at 16:40, Mike Markowski wrote:

> 	txDelay: is this the delay between asserting PTT
> 		 and start of data transmission?
> 		 (My set up with an ICOM 706 MkIIg didn't work
> 		 until increasing txDelay to 400 ms)

Yes. Also, typically HDLC flags are sent during this time to fill
the void.

> 	txTail:  delay from end of transmission till deasserting PTT?
> 		 I'm using the default 10 ms and my aprs UI packets are
> 		 being received by others.

Right again. And again flags are sent.

> 	slot time: this one confuses me.  I know what traditional slotted
> 	         channels are, but it doesn't make sense that a user
> 		 would pick the slot length.  So I'm guessing this
> 		 is something different.  Is the default of 100 ms
> 		 reasonable?  I used 300 ms for no special reason...

This is the minislot width (tau) in the p-Persistent CSMA algorithm.

> 	pPersistence: I assume this is used by the CSMA backoff
> 	         algorithm.  Would I ever want to change the
> 		 default of 40?

And this is the probability p = 40/256.

Proakis, Digital Communications, p. 869:

  ... In summary, in the p-persistent protocol, a user with a packet 
  to transmit proceeds as follows.

  a) If the channel is sensed idle, the packet is transmitted with 
  probability p, and with probablility 1-p the transmission is delayed 
  by tau seconds.

  b) If at t=tau, the channel is still sensed to be idle, step a) is 
  repeated. If a collision occurs, the users schedule retransmission of 
  the packets according to some preselected transmission delay 
  distribution.

  c) If at t=tau, the channel is sensed busy, the user waits until it 
  becomes idle, and then operates as in a) and b).

We don't really detect collisions so the CS part is not relevant, but
other than that, this is what happens in soundmodem as well.

The correct parameters depend on the number of users on the channel
and for optimum performance should probably be dynamic. p=40 is not
very aggressive but in my opinion everyone should rather be
un-aggressive than too aggressive...

-- 
Tomi Manninen / OH2BNS / KP20ME04

