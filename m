From: folkert <folkert@vanheusden.com>
Subject: Re: icmp
Date: Fri, 8 Apr 2016 13:40:44 +0200
Message-ID: <20160408114043.GV25136@belle.intranet.vanheusden.com>
References: <20160401184226.GC25136@belle.intranet.vanheusden.com>
 <20160401190724.GD25136@belle.intranet.vanheusden.com>
 <56FECF07.8020306@trinnet.net>
 <20160401201429.GF25136@belle.intranet.vanheusden.com>
 <56FEEC21.3020607@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FEEC21.3020607@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

"Volgens mij gebruik je instellingen SF=10 en BW=250000.
Je stuurt dan BW/(2^SF) symbolen per seconde = 244 symbool/s
Elk symbool codeert voor 10 bitjes, dus 2440 bits/seconde.
Maar je spendeert ook weer de helft van je bitjes aan errorcorrectie,
dus effectief ca 1220 bps.
Verder zit er in elk LoRa pakketje een beetje overhead aan headers,
preamble, CRC, etc."

To translate this: 2440 bits/sec minus error correction is around 1220
bps and then a bit less for headers, preamble, crc, etc.

On Fri, Apr 01, 2016 at 02:46:09PM -0700, David Ranch wrote:
> 
> Considering I have no experience with some of these LoRa data modules, what
> is this resulting in terms of modulation type, data rate and over what kind
> of distance?
> 
> --David
> KI6ZHD
> 
> 
> On 04/01/2016 01:14 PM, folkert wrote:
> >Ah darn, of course!
> >Thanks.
> >
> >Regarding the lora configuration: a friend of mine gave me the
> >configuration-parameters for best reliability for a long distance:
> >
> >const RH_RF95::ModemConfig cfg = {
> >                 // Register 0x1D:
> >                 // BW         CR      0=explicit
> >                 (8 << 4) | (4 << 1) | (0 << 0),
> >                 // Register 0x1E:
> >                 // SF       CRC enable
> >                 (10 << 4) | (1 << 2),
> >                 // Register 0x26:
> >                 // bit3 = LowDataRateOptimization
> >                 (0 << 3)
> >         };
> >                 rf95.setModemRegisters(&cfg);
> >                 rf95.setFrequency(869.850);
> >                 rf95.setPreambleLength(8);
> >
> >Packet loss is 12-15%.
> >
> >
> >On Fri, Apr 01, 2016 at 12:41:59PM -0700, David Ranch wrote:
> >>
> >>This is because you have your window setting per the /etc/ax25/axports file
> >>set to 1.   Change it to say 4 and things should work better.
> >>
> >>Btw.. what speed are you running your LoRa network at?  A round trip time of
> >>1.6 seconds is quite slow but maybe that's due to the serialization delays
> >>of running your network at say 300bps!
> >>
> >>--David
> >>
> >>
> >>On 04/01/2016 12:07 PM, folkert wrote:
> >>>An other strange thing: I can't have 2 packets in that 2 second
> >>>interval. E.g. a traceroute only works if I add -N 1 -w 2.
> >>>
> >>>On Fri, Apr 01, 2016 at 08:42:26PM +0200, folkert wrote:
> >>>>Hi,
> >>>>
> >>>>This evening I succeeded in doing ICMP over AX.25 over LoRa(!)!
> >>>>
> >>>>root@savannah:~/data/mkiss_moteino# ping -i 5 192.168.5.1
> >>>>PING 192.168.5.1 (192.168.5.1) 56(84) bytes of data.
> >>>>64 bytes from 192.168.5.1: icmp_seq=4 ttl=64 time=4524 ms
> >>>>64 bytes from 192.168.5.1: icmp_seq=7 ttl=64 time=1601 ms
> >>>>64 bytes from 192.168.5.1: icmp_seq=8 ttl=64 time=1601 ms
> >>>>64 bytes from 192.168.5.1: icmp_seq=9 ttl=64 time=1601 ms
> >>>>^C
> >>>>--- 192.168.5.1 ping statistics ---
> >>>>9 packets transmitted, 4 received, 55% packet loss, time 40005ms
> >>>>rtt min/avg/max/mdev = 1601.358/2332.248/4524.246/1265.550 ms
> >
> >
> >Folkert van Heusden
> >


Folkert van Heusden

-- 
Nagios user? Check out CoffeeSaint - the versatile Nagios status
viewer! http://www.vanheusden.com/java/CoffeeSaint/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
