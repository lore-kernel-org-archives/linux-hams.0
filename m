From: "Bob Donnell" <kd7nm@pugetsound.net>
Subject: RE: standard_window_size.
Date: Tue, 9 Dec 2008 11:42:16 -0800
Message-ID: <325AA1D57A4349FDB3F232F90C474007@arkalmus.com>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com> <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org> <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org> <493EB4E4.8060003@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <493EB4E4.8060003@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Linux-Hams' <linux-hams@vger.kernel.org>

There is no provision in the AX.25 protocol for the negotiation of
connected-mode window size, only for the AX.25 version supported by the
connection.  The receiving window size is (or at least should be) assumed to
be 7.  Of course, not all TNC's support connected mode, and not all of those
that do actually have enough buffer space to support 7 frames - but neither
type would be considered AX.25 compliant either.  The significant
enhancement of a version 2 connection is that a station having sent
information packets, but having failed to receive an acknowledgement, will
poll the remote station, asking what the next packet is that the remote
station is expecting to receive, providing implied acknowledgement of all
earlier packet.  Then the sender can queue the next round of information
packets for transmission.

Part of the problem with [2] in the kernel is that the T1 timer operation is
very decoupled from when the transmission is actually made.  It's one of the
reasons I suggested that at the very least, the on-air data rate needs to be
known so that the time required to actually transmit the data can be added
to the T1 timer value, for each packet.  Additionally (or alternatively), if
channel DCD can be tested by the AX.25 stack, it can be used to hold (or
significantly slow) the T1 counter when the channel is busy, since with the
channel being busy, it's impossible for the queued packets to be sent.  The
channel-busy indication could also be used to prevent the queuing of the
acknowledgement packet to the air interface until the channel has become
clear, allowing the stack to generate a single implied acknowledgement for
all of the correctly received frames, instead of one per frame.  So it's
more efficient of air time.  Further, for working with clients that don't
work this way, information packets shouldn't be queued to the air interface,
until the after the T1 timer expires, or if any acknowledgement packets have
been received, until the channel-busy indication goes false, so that no
acknowledged frames are retransmitted.

I'm sorry to say I currently have zero familiarity with the AX.25 kernel
code itself, but infer a lot of the internal functionality based on observed
behavior, with the kernel, and with other programs that use air interface
drivers that are decoupled from the protocol stack, vs. hardware TNC's,
running in their native mode as the AX.25 protocol processor, which show all
the signs of doing this processing internally.  

The conclusion below that the TNC would "want" to unkey after 2 frames makes
several invalid assumptions.
	In hardware TNCs, there's one T1 timer per connection - not per
packet.
	The T1 timer is started when the transmission is complete.  This
makes T1 independent of number of frames sent to the receiving station.  In
a multi-connect environment, it also makes the T1 timeout independent of
packets being sent to multiple stations.  That technically might be a minor
mistake, since now acknowledgements might have to be received from 2 or more
stations.
	If digipeating is being used, the T1 setting used by the timer is
the T1 mulitplied by the number of digipeating hops.

One assumption that should be made when people are configuring AX.25 to use
more than 1 or 2 frames is that if retries are happening due to poor paths
or busy channels, they shouldn't be using a setup that causes long
transmissions.  If only 2 stations are on the channel, and the bit error
rate is such that sending 7 frames of 256 bytes only results in retries less
than 5% of the time, then using the maximum settings is justified.  If you
can't get 95% of each block of transmissions through without retries, using
fewer frames of smaller size is a performance tuning option that is
required.  No matter what the reason.

One of the best features I recall from the MSYS PBBS software was that it
adaptively adjusted T1 value, packet size and number of frames, based on the
retry rate it had on each connected link it was sending data to.  This
allowed it to be self-adaptable to the channel baud rate, much along the
lines of how TCP adjusts its window size and retry timer to match the
channel.  It may also have kept track of the number of stations recently
received on the channel to adjust the supporting KISS TNC Persistence
setting.  I don't recall the later detail with regard to MSYS clearly.
There was a Dutch version of the KA9Q NET software that also did this.  It
kept track of how many individual stations (call/SSID) had been heard on the
channel for the last 5 or 10 minutes, used it to calculate the correct
Persistence setting, and updated the TNC when that value changed, so it did
adaptive channel sharing computation and correction.  It was possible to see
changes being made on the fly in both of these programs.

73, Bob, KD7NM

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Dave Platt
Sent: Tuesday, December 09, 2008 10:12 AM
To: Linux-Hams
Subject: Re: standard_window_size.

John Ronan wrote:
> 
> Morning,
> 
> I tested over the weekend (and I though I had posted it already).
> 
> After changing the kernel header to have the standard window size = 3. 
> This was verified when I booted the machine as the entry in /proc was 
> 3.  However, once I connected to it and started passing data, it again 
> behaved as though it was set to 2.
> 
> RR after every second packet
> 
> Suggestions as to where to look next appreciated.

I think I'd start by using a third packet station, to monitor the whole
connection and see if there's any protocol negotiation taking place between
the two systems (and, if so, what protocol parameters are being negotiated).

It's been a while since I looked at AX.25 in detail, but here are some
thoughts:

[1] Negotiation between the two peers can result in different parameters
     being used than you may have programmed in.  I believe that the
     maximum window size will be the *smaller* of (a) what the sender
     decides it should send and (b) what the receiver says that it's
     willing/able to accept during the (optional?) protocol negotiation.
     You may need to snoop the channel (or use Ethereal or a similar
     software protocol sniffer on one peer) to see all the details.

[2] I think that the number of packets that the sender will transmit
     before it drops carrier and waits for an RR may depend (in some
     implementations at least) on the value of the T1 timer and the
     channel baud rate, as well as on the (fixed or negotiated) window
     size.  If I recall correctly, the T1 timer is the amount of time
     that the sender is willing to wait for an RR, after the packet is
     transmitted, before it will decide that the packet was lost and
     will retransmit it.  If this is set too low it may cause the sender
     to reduce the effective window size, to guarantee that the channel
     will be cleared for an RR before the first packet's T1 timer
     expires.

As an example:  let's assume a 1200-baud channel (roughly 100 bytes per
second counting overhead?) and 256-byte packets.  Let's also assume a
three-second T1 timer, and a 7-packet window (hard-set or negotiated, I
don't think it matters).

Sender puts packet 1 into the transmit channel.  It takes a couple of
seconds to transmit.  When it has been transmitted, its T1 starts.
Packet 2 goes into the transmit channel, and is successfully transmitted
about two seconds later... and *its* T1 starts.

Even if the sender still has packets queued up, and "window room"
for them, it probably doesn't want to send packet 3 without dropping carrier
and giving its peer time to respond.  Why?  Because, if it did, it would
still be using the channel (and blocking the peer from transmitting the RR)
for long enough that the first packet's
T1 timer would expire, and T1 would assume to be lost.  This would lead to
unnecessary packet retransmissions.  A "smart" sender would adjust the
number of packets sent back-to-back, based on the
T1 timer limit and the size of the packets and the effective baud rate of
the channel, in order to avoid these undesirable timer expirations and
re-transmitted packets.

If you're increasing the window size, and are sending relatively long
packets, you may need to increase your T1 timer value to somewhat over
[packet transmission time] * [window size].

However, if you do, you may hurt your connection's ability to recover from
lost packets, in at least two ways:

-  If the last/only packet in a burst is lost or corrupted,
    you'll have to wait for the (longer) T1 timer to expire
    before your node will resend it, and

-  If a packet in the middle of a long burst is lost or
    corrupted, you'll have to retransmit not only this one
    packet but all after it in the burst (either when T1 expires
    or when you get an SREJ frame from the receiver).

So, whether a long window increases or decreases your effective throughput
is going to depend not only on the window size and the link turnaround time,
but also on the error characteristics of the channel.  If the connection is
relatively noisy, a smaller window size and T1 may actually give you better
throughput.

You should also check your T107 setting (the "channel hog" timer), as this
is specifically intended to keep one station from monopolizing the channel.

Best of luck in your investigation!

73,

	Dave AE6EO

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


