From: Dave Platt <dplatt@radagast.org>
Subject: Re: standard_window_size.
Date: Tue, 09 Dec 2008 10:11:48 -0800
Message-ID: <493EB4E4.8060003@radagast.org>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com> <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org> <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

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
connection and see if there's any protocol negotiation taking place
between the two systems (and, if so, what protocol parameters are being
negotiated).

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
three-second T1 timer, and a 7-packet window (hard-set or negotiated,
I don't think it matters).

Sender puts packet 1 into the transmit channel.  It takes a couple of
seconds to transmit.  When it has been transmitted, its T1 starts.
Packet 2 goes into the transmit channel, and is successfully transmitted
about two seconds later... and *its* T1 starts.

Even if the sender still has packets queued up, and "window room"
for them, it probably doesn't want to send packet 3 without
dropping carrier and giving its peer time to respond.  Why?  Because,
if it did, it would still be using the channel (and blocking the
peer from transmitting the RR) for long enough that the first packet's
T1 timer would expire, and T1 would assume to be lost.  This would
lead to unnecessary packet retransmissions.  A "smart" sender would
adjust the number of packets sent back-to-back, based on the
T1 timer limit and the size of the packets and the effective baud
rate of the channel, in order to avoid these undesirable timer
expirations and re-transmitted packets.

If you're increasing the window size, and are sending relatively
long packets, you may need to increase your T1 timer value to
somewhat over [packet transmission time] * [window size].

However, if you do, you may hurt your connection's ability to
recover from lost packets, in at least two ways:

-  If the last/only packet in a burst is lost or corrupted,
    you'll have to wait for the (longer) T1 timer to expire
    before your node will resend it, and

-  If a packet in the middle of a long burst is lost or
    corrupted, you'll have to retransmit not only this one
    packet but all after it in the burst (either when T1 expires
    or when you get an SREJ frame from the receiver).

So, whether a long window increases or decreases your effective
throughput is going to depend not only on the window size and
the link turnaround time, but also on the error characteristics
of the channel.  If the connection is relatively noisy, a smaller
window size and T1 may actually give you better throughput.

You should also check your T107 setting (the "channel hog" timer),
as this is specifically intended to keep one station from monopolizing
the channel.

Best of luck in your investigation!

73,

	Dave AE6EO

