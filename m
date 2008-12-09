From: Dave Platt <dplatt@radagast.org>
Subject: Re: standard_window_size.
Date: Tue, 09 Dec 2008 13:52:07 -0800
Message-ID: <493EE887.8090805@radagast.org>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com> <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org> <D4E78BFF-CD8E-4281-B40D-D006E1090768@tssg.org> <493EB4E4.8060003@radagast.org> <325AA1D57A4349FDB3F232F90C474007@arkalmus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <325AA1D57A4349FDB3F232F90C474007@arkalmus.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Linux-Hams' <linux-hams@vger.kernel.org>

Bob Donnell wrote:
> There is no provision in the AX.25 protocol for the negotiation of
> connected-mode window size, only for the AX.25 version supported by the
> connection.  The receiving window size is (or at least should be) assumed to
> be 7.  Of course, not all TNC's support connected mode, and not all of those
> that do actually have enough buffer space to support 7 frames - but neither
> type would be considered AX.25 compliant either.

It appears to me that parameter negotiation was added in AX.25
version 2.2.  The station which is initiating negotiation (which
can take place at any time) sends an XID command frame.  The station
receiving it sends back an XID response frame... or, if it's running
AX.25 versions prior to 2.2, it sends back an FRMR reject frame, and
the peer which sent the XID command frame abandons the attempt to
negotiate and uses a default set of parameters.

The XID negotiation can apparently set the half/full-duplex modes,
selective-rejection modes, modulo-8 or modulo-128 modes, I field
length, window size receive, acknowledgement timer (T1), and
retries.

The details are on pages 24-25 and 37-38 of the AX.25 2.2 spec at TAPR.

I don't know whether the Linux kernel AX.25 implementation is up to
AX.25 2.2 or whether it's a prior version.  Ditto for "hard" TNCs.

> Part of the problem with [2] in the kernel is that the T1 timer operation is
> very decoupled from when the transmission is actually made.  It's one of the
> reasons I suggested that at the very least, the on-air data rate needs to be
> known so that the time required to actually transmit the data can be added
> to the T1 timer value, for each packet.

That would certainly help... although, as you say, the underlying problem
is that the timer management and packet transmission are decoupled.  If
the network layer assumes that actual air transmission starts when the link
layer is told to transmit it, it'll be wrong much of the time (especially
on a congested channel).  Adding the transmission time to the timer value
will help reduce the magnitude of the problem but won't eliminate it.

I imagine that the only way to really fix this particular problem would
be have the link layer send back a positive "OK, packet N sent" when it
has actually been transmitted.  Unfortunately, the KISS protocol
has no such acknowledgment capability... there is no feedback or flow
control at all in either direction.

Either a per-packet handshake from the KISS termination (TNC), or
some way of polling the packet buffer, would be required.

> 	In hardware TNCs, there's one T1 timer per connection - not per
> packet.
> 	The T1 timer is started when the transmission is complete.  This
> makes T1 independent of number of frames sent to the receiving station.

Right you are, thanks for the correction.  The spec says that T1 is to be
started at the end of the transmission of a packet, if it's not already
running... and if it is running, it's to be restarted.  This is in effect
the same thing as what you wrote.

> One assumption that should be made when people are configuring AX.25 to use
> more than 1 or 2 frames is that if retries are happening due to poor paths
> or busy channels, they shouldn't be using a setup that causes long
> transmissions.  If only 2 stations are on the channel, and the bit error
> rate is such that sending 7 frames of 256 bytes only results in retries less
> than 5% of the time, then using the maximum settings is justified.  If you
> can't get 95% of each block of transmissions through without retries, using
> fewer frames of smaller size is a performance tuning option that is
> required.  No matter what the reason.

I agree with you in the case of AX.25 prior to the introduction of the
SREJ frame (which I think came in with 2.2), since a single lost or
corrupted packet will require that packet, plus all subsequent ones in
the window to be retransmitted.

With the use of SREJ, I believe one can afford to run large windows
over a somewhat noisier link, as you can recover from a lost or
corrupted packet in the middle of the window by sending an SREJ naming
that one packet.  The sender needs only retransmit that one packet,
and may immediately continue sending other (not-yet-transmitted) packets
within the range allowed by the window.

> One of the best features I recall from the MSYS PBBS software was that it
> adaptively adjusted T1 value, packet size and number of frames, based on the
> retry rate it had on each connected link it was sending data to.  This
> allowed it to be self-adaptable to the channel baud rate, much along the
> lines of how TCP adjusts its window size and retry timer to match the
> channel. 

Nice!

I suspect that a large part of the difficulty with AX.25 is that it
was derived from a protocol which was largely intended to work on
point-to-point links with rather low error rates.  Dealing with a
shared medium with high noise/collision/corruption rates wasn't
really engineered in from the beginning.

73,

	Dave AE6EO



