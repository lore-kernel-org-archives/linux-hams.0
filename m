From: w9ya@amsat.org
Subject: Re: Packet at the physical level
Date: Fri, 19 Sep 2003 09:19:51 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200309190919.51583.w9ya@amsat.org>
References: <memo.20030919071047.57493A@rovoreed.compulink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <memo.20030919071047.57493A@rovoreed.compulink.co.uk>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Well the "bottom layer" of VHF packet can be done with almost any standard 202 
modem.

Back in late 1983 "we" put just such a modem into "loopback" mode, adjusted 
the audio response characteristics, and added a time-out/control timer to an 
existing duplex 2-meter repeater. We then had a duplex packet repeater. This 
was documented in two of the early ARRL Networking Conference books.

I have since moved from the Los Angeles area but before I left we incorporated 
some of the ded/netrom software using the rs-232 connection the repeater now 
had on it by way of the attached modem. (This repeater was used extensively 
during development of the netrom software.)

We also modified the Jon Bloom Xerox 820 software as our second controller. It 
had a homemade version of skip's state machine made out of some simple TTL 
and roms. It also used the same 202 modem and a very simple keep-alive 
circuit. This allowed us to do cross-band/cross-network hookups while the 
netrom stuff was being developed. This controller was complete overkill for 
transporting in-network (lan) operation.

(I am told that the operation was still running, although on different 
hardware, the last time I checked a few years ago. I imagine it still is. )

Bottom line: yes there is the need to run some "nrzee-ish" code into a modem, 
but what a "modem does" is what *is* done by a 202 modem as far a 1200 baud 
ham packet is standardized at. As long as one is talking about the physical 
layer of ham-packet, the modem tones are properly handled by the 202 
standard(s).

Vy 73 y'all;

Bob
w9ya

On Friday 19 September 2003 02:10 am, Mike Davies wrote:
> 	Thanks for all the replies (so far). A little bit of fiddling here
> has confirmed that valid packets can start with either tone. You learn
> something every day.
>
> 	By the way, VHF amateur packet is not Bell202 compatible. I've
> seen this mentioned before, but I've got the source code for a Bell202
> modem which I know works, and that simply uses a 1300Hz tone for high bit
> and a 2100Hz tone for a low bit. So not only does it use different tones
> it doesn't do the NRZ modulation.
>
> 	Hopefully in the next day or two I'll be able to transmit a few
> test packets, and then I'll be able to determine the CRC polynomial if
> nothing turns up before.
>
> Mike
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

