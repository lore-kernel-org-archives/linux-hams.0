From: "Bob Donnell" <kd7nm@pugetsound.net>
Subject: RE: standard_window_size.
Date: Thu, 11 Dec 2008 11:08:09 -0800
Message-ID: <4AF3DAA982EC4E8087B36F9B72B051AD@arkalmus.com>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com> <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org> <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org> <493EB4E4.8060003@radagast.org> <325AA1D57A4349FDB3F232F90C474007@arkalmus.com> <BDE0A29E-E674-46AA-81F8-756301C6F295@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BDE0A29E-E674-46AA-81F8-756301C6F295@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'John Ronan' <jronan@tssg.org>, 'Linux-Hams' <linux-hams@vger.kernel.org>

Hi John, and all

I see that you've referred to the AX.25 v2.2 specification.  Please be aware
that you may be doing original work, as to the best of my knowledge, no
hardware TNCs implement the additions defined in version 2.2, vs. the well
established v2.0 specification.  Using v2.2 in any way other than with
another matching client, directly connected or probably via a digipeater, is
likely to be recognized by any efforts outside what you're working on.

As far as using TCP/IP, the approach we used here in the Pacific Northwest
was to create LANs that were hidden-transmitter-syndrome-free (HTS-free),
and establish gateway stations for packets traveling from one LAN to
another.  These were generally at the home of a well located station, one
that was able to provide HTS-free support for 2 or more LANs, so they could
act as effective routers.  This was helped along in our area by creating a
number of full-duplex packet repeaters - for 1200 bps, that could be nothing
more than a stripped-down voice repeater.  For 9600 bps operation, the
no-longer-available TAPR 9600 bps modem, with the bit-regeneration hardware,
tied to a receiver and transmitter made or modified to have a low bit-error
rate at 9600 bps worked very well.  Even better for 1200 bps would be a bit
regenerator well matched to an appropriate modem.  I'm not aware of any
currently implemented bit regenerator hardware for 1200 bps - though I'm
trying to convince N1VG to create a firmware load for his OpenTracker2
product to accomplish this.

Further, we used AX.25 UI frames, with the maximum AX.25 frame size and the
maximum TCP window size adjusted to cause a less-than-5% packet loss, on a
quiet channel.  On LANs with a low bit-error rate, this could mean UI frames
as large or larger than 1024 bytes per frame.  We let TCP (within limits)
adjust its window size and retry timer, based on its perception of packet
loss.  About the only real change was to modify the TCP retry timer
adjustment algorithm to add to the retry timer, instead of multiplying it.
With the latter strategy, if a gateway station was off the air temporarily,
the TCP retry timer for a link that used that station could fairly quickly
grow to hours or days.  The additive approach usually resulted in a link
that started to function again allowing the sender to recover and get on
with transferring data in less time.  This is more important if the link
quality (bit error rate) won't support a less than 5% packet loss, since at
regularly higher rates, the TCP retry timer will still climb excessively.

Each LAN was assigned a pool of IP addresses, to create a subnet, and
allowing a primary gateway to be assigned.  Later we implemented RSPF, which
didn't work well, because the table was complicated, and an XT-class
computer would take 5-10 minutes to recompute the table, during which,
having no valid routing table, it would not be able to route packets.  After
living through that bottle-neck, we changed to using RIP, for which routing
table computations can be completed more quickly, and as I recall, the
implementation keeps the current routing table until an update is completed,
and then switches to the new table - so packets can be routed (perhaps
sub-optimally, or in error) while an update is being processed.

Making TCP/IP over amateur packet radio is "all about" managing the
bit-error rate to eliminate as many reasons for retries as possible.  Coming
up with hardware/software that could be installed in existing TNCs and would
accept KISS frames and encode them into FX.25 (AX.25 with an FEC wrapper) is
worthy of effort.  Many existing older TNCs won't support this without other
hardware modifications, if indeed they have the horsepower to do the job,
because many of them depend on hardware HDLC controller chips, of one
variety or another, to send and receive the bit streams and manage the bit
stuffing.  And the FEC data can't or shouldn't be bit-stuffed.

So, some food for thought, further along the journey!

73, Bob, KD7NM

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of John Ronan
Sent: Thursday, December 11, 2008 12:50 AM
To: Linux-Hams
Subject: Re: standard_window_size.


On 9 Dec 2008, at 19:42, Bob Donnell wrote:

> There is no provision in the AX.25 protocol for the negotiation of
>
[bigsip]
Bob, Dave, thanks for your detailed replies (I didn't get Dave's directly,
only saw it on Bob's reply). I've printed off the email as it is going to
require a few readings to fully understand it. MSYS's negotiation does sound
like the business.

That said, the post put me on the right track. There isn't any protocol
negotiation taking place.

The culprit was, in fact me, or at leas my understanding of AX25 (call it
dumbness if you like), which, I have to say is still spotty, and I must
apologise to the list for wasting the bandwidth.

The T2 Timer is what I was missing.  I went and read the spec and came to
http://www.tapr.org/pub_ax25.html#2.4.7.4

The default T2 timer value of 3 seconds is just about perfect for two
255 byte packets (which makes sense given the default window size is 2).
That is what was causing the replies to occur when they were.

FYI I'm just testing some DTN software (an AX25 convergence layer for the
DTN Reference implementation developed by Darren Long G0HHW) vs raw ax25
connections (use axcall to connect to host, look at large file, time it,
repeat etc). So I'm testing on point to point links and via a digipeater.
Bob, your comments have already given us some more ideas as to how to
improve the current DTN convergence layer.

Once I get these tests complete I might look at getting IP to run
efficiently over the same links, but that's another days work.

Thanks for the help and suggestions everyone.

Regards
de John
EI7IG
--
John Ronan <jronan@tssg.org>, +353-51-302938 Telecommunications Software &
Systems Group,  http://www.tssg.org



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


