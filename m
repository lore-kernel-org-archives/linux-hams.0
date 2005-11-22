From: David Rivenburg <driven@onr.com>
Subject: Re: YAM/Tekk help
Date: Tue, 22 Nov 2005 00:57:38 -0600
Message-ID: <4382C162.7090202@onr.com>
References: <20051116151748.GN3241@goldengate.vpizza.org>
Reply-To: ad5oo@arrl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051116151748.GN3241@goldengate.vpizza.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: Jim Meehan <jmeehan@vpizza.org>

Jim Meehan wrote:
> Problem 1:
> 
> If I ping from either side, that machine sends out ARP requests endlessly.

Just a quick sanity check: did you set the ping interval to something 
higher than 3 seconds?  The round trip time for radio pings is about 3 
seconds, and if you use something less (like the default of 1 second) 
the pingee will have a hard time getting an out an arp reply between the 
pingers requests.

> Problem 2:
> 
> The link is not reliable.  Right now, I've got the txdelay set to 300 ms on
> both sides, and I'm still getting 3 or 4 percent packet loss with 64 byte
> pings.

Only 3-4%?  That's actually pretty good.  Reliable 9600 baud packet is 
practically nonexistant without using hardware specifically designed for 
9600 baud baseband fsk.  I am not aware of any commercial radio or tnc 
that is.  They may *try* to do 9600, and even have modest success with 
it, but they are flawed from the start and cannot be counted on for 
reliable operation.

You would actually be better off with 1200 baud since that *is* 
implemented correctly in the bulk of the hardware out there.  Fewer 
retries = faster throughput.  If you're really adventursome, give the 
4800bps psk soundmodem a try.  It is *much* more reliable than 9600 
baud, and about 6x faster than 1200 baud (taking into account a longer 
mtu with fewer retries).

73
AD5OO


