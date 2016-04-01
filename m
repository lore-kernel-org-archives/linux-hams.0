From: David Ranch <linux-hams@trinnet.net>
Subject: Re: icmp
Date: Fri, 1 Apr 2016 12:41:59 -0700
Message-ID: <56FECF07.8020306@trinnet.net>
References: <20160401184226.GC25136@belle.intranet.vanheusden.com>
 <20160401190724.GD25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160401190724.GD25136@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>, linux-hams@vger.kernel.org


This is because you have your window setting per the /etc/ax25/axports 
file set to 1.   Change it to say 4 and things should work better.

Btw.. what speed are you running your LoRa network at?  A round trip 
time of 1.6 seconds is quite slow but maybe that's due to the 
serialization delays of running your network at say 300bps!

--David


On 04/01/2016 12:07 PM, folkert wrote:
> An other strange thing: I can't have 2 packets in that 2 second
> interval. E.g. a traceroute only works if I add -N 1 -w 2.
>
> On Fri, Apr 01, 2016 at 08:42:26PM +0200, folkert wrote:
>> Hi,
>>
>> This evening I succeeded in doing ICMP over AX.25 over LoRa(!)!
>>
>> root@savannah:~/data/mkiss_moteino# ping -i 5 192.168.5.1
>> PING 192.168.5.1 (192.168.5.1) 56(84) bytes of data.
>> 64 bytes from 192.168.5.1: icmp_seq=4 ttl=64 time=4524 ms
>> 64 bytes from 192.168.5.1: icmp_seq=7 ttl=64 time=1601 ms
>> 64 bytes from 192.168.5.1: icmp_seq=8 ttl=64 time=1601 ms
>> 64 bytes from 192.168.5.1: icmp_seq=9 ttl=64 time=1601 ms
>> ^C
>> --- 192.168.5.1 ping statistics ---
>> 9 packets transmitted, 4 received, 55% packet loss, time 40005ms
>> rtt min/avg/max/mdev = 1601.358/2332.248/4524.246/1265.550 ms

