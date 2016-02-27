From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: wrong packet size
Date: Sat, 27 Feb 2016 08:49:45 +0100
Message-ID: <20160227074945.GB24846@x-berg.in-berlin.de>
References: <20160226234204.GA30036@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160226234204.GA30036@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: folkert <folkert@vanheusden.com>
Cc: Amateur Radio meets Linux <linux-ham@trilug.org>, linux-hams@vger.kernel.org


As far as I know, AX.25 MTU is only take care of on transmitting.
There are no trunked buffer sizes on the rx-routines in the kernel.
=> larger packets, even beyond the ax25 protocol spec (>256 bytes)
could be handled.

On transmission, the MTU is respected.
But if you read my last posts on this list, that's not always true (IP):
I proposed a fix for packets leaving the interface that are much
larger than the configured MTU or / and the max-mtu of 256.
For normal PID=text packets, data sent with write() is adjusted to the
MTU, and data tried to send with syscall sendto() and a size > MTU are
rejected.


Btw, in your line:
> 23    11.084320000    FH4GOU-01       TRDS01-01       AX.25-NoL3 271 Text
=> 271 is beyond the standard. You'll might find many old software, 
TNCs, etc. that would even not be capable to decode such a packet.

On the other hand I wonder what packet that was.
"NoL3" => I assume PID=text (not IP, ARP, etc.).
Sender is FH4GOU-1 (but that's not a call of one of the two sides in
your test setup). How does that callsign comes to the line and what
computer / os / pr-program / userspacesprogram sends this data?


vy 73,
	- Thomas  dl9sau


On Sat, Feb 27, 2016 at 12:42:04AM +0100, folkert wrote:
> Hi,
> 
> I have a radio link between two systems.
> The maximum packet size in this link is 254 bytes.
> On both sides this limit is set:
> 
> root@travelmate:~# uname -r
> 4.2.0-1-amd64
> 
> root@travelmate:~# ifconfig ax0
> ax0       Link encap:AMPR AX.25  HWaddr FH4GOU-1  
>           UP BROADCAST RUNNING  MTU:254  Metric:1
>           RX packets:245 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:67 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:10 
>           RX bytes:6492 (6.3 KiB)  TX bytes:8810 (8.6 KiB)
> 
> root@travelmate:~# grep ax0 /etc/ax25/axports 
> ax0	FH4GOU-1	115200	254	1	AX25 over LoRa
> 
> 
> root@tardis:/usr/src/sketches/mkiss# uname -r
> 4.1.18+
> 
> root@tardis:/usr/src/sketches/mkiss# ifconfig ax0
> ax0       Link encap:AMPR AX.25  HWaddr TRDS01-1  
>           UP BROADCAST RUNNING  MTU:254  Metric:1
>           RX packets:569 errors:1 dropped:0 overruns:0 frame:0
>           TX packets:212 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:10 
>           RX bytes:14033 (13.7 KiB)  TX bytes:4987 (4.8 KiB)
> 
> root@tardis:/usr/src/sketches/mkiss# grep ax0 /etc/ax25/axports 
> ax0     TRDS01-1        9600    254     1       AX.25 over LoRa
> 
> 
> Transmitting/receiving packets < 254 bytes works fine; e.g. IDENT with
> not too large texts and also "axcall"-sessions with small pieces of
> texts.
> But if I invoke "mheard" which returns quite a bit of text,
> communication fails. I checked with wireshark and I saw that even
> though there's that 254 bytes MTU, I still get packets way larger:
> 
> nr      time            source          target          protocol   length info
> 23	11.084320000	FH4GOU-01	TRDS01-01	AX.25-NoL3 271 Text
> 
> What can I do to prevent these overly large packets?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
