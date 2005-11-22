From: "Mike Murphree" <mike@tropo.org>
Subject: Re: YAM/Tekk help
Date: Tue, 22 Nov 2005 08:17:58 -0600 (CST)
Message-ID: <57660.130.76.96.19.1132669078.squirrel@webmail.dogbark.com>
References: <20051116151748.GN3241@goldengate.vpizza.org>
    <4382C162.7090202@onr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4382C162.7090202@onr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

David Rivenburg said:
> Jim Meehan wrote:
>> Problem 1:
>>
>> If I ping from either side, that machine sends out ARP requests
>> endlessly.
>
> Just a quick sanity check: did you set the ping interval to something
> higher than 3 seconds?  The round trip time for radio pings is about 3
> seconds, and if you use something less (like the default of 1 second)
> the pingee will have a hard time getting an out an arp reply between the
> pingers requests.

You should only see one arp request on the first ping after a period of
inactivity.  Endless arps indicates that the link was very unreliable to
start with.

>
>> Problem 2:
>>
>> The link is not reliable.  Right now, I've got the txdelay set to 300 ms
>> on
>> both sides, and I'm still getting 3 or 4 percent packet loss with 64
>> byte
>> pings.
>
> Only 3-4%?  That's actually pretty good.  Reliable 9600 baud packet is
> practically nonexistant without using hardware specifically designed for
> 9600 baud baseband fsk.  I am not aware of any commercial radio or tnc
> that is.  They may *try* to do 9600, and even have modest success with
> it, but they are flawed from the start and cannot be counted on for
> reliable operation.

3 to 4 percent on small ping packets translates into much worse for actual
data transfers.  He is using at least one real (Tekk) data radio, but the
other one will be worse.  It would be worth setting maxframe on both ends
to 1 to see if that helps the Kenwood's TNC cope better with this kind of
usage.


> You would actually be better off with 1200 baud since that *is*
> implemented correctly in the bulk of the hardware out there.  Fewer
> retries = faster throughput.  If you're really adventursome, give the
> 4800bps psk soundmodem a try.  It is *much* more reliable than 9600
> baud, and about 6x faster than 1200 baud (taking into account a longer
> mtu with fewer retries).

The only 1200 bps system that I've ever seen come close to a decent 9600
bps setup was a full duplex repeater.   Otherwise 1200 bps was just
painful for tcp/ip use...

73
Mike W4LNA


