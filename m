From: "Robin Gilks" <robin@gilks.org>
Subject: Re: soundmodem HDLC compatibility problem
Date: Wed, 11 Feb 2004 21:43:27 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1071.192.168.1.20.1076489007.squirrel@server>
References: <20040211032559.28029.qmail@radagast.org>
Reply-To: robin@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040211032559.28029.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> I ran into an interesting compatibility problem recently, between
> soundmodem 0.7 and a new KISS-mode-only TNC kit (www.tnc-x.com).
>
> The symptom was that if my Linux system send multiple AX.25
> frames back-to-back in a single transmission, the TNC-X would
> properly receive only the first, and would drop the second and
> subsequent ones on the floor almost all of the time.  The
> problem did not occur in the reverse direction.  Both the
> soundmodem and the TNC-X had no problem communicating with
> other TNCs.
>
> The problem turned out to be a minor deficiency in the soundmodem
> HDLC encoder, which was tripping up the HDLC parser in the
> TNC-X.
>
> The soundmodem HDLC encoder takes as input a packet of data to
> be sent (an integral number of bytes) and encodes this into
> HDLC frames, storing the HDLC-encoded bits in a circular buffer.   The
> circular-buffer management is also being done in increments
> of 1 byte, and as a result it's quite common for the second of
> the two flags at the end of the frame to be truncated.  This
> doesn't seem to have any bad effect when only single frames are
> transmitted, but it causes problems when back-to-back frames
> are encoded.  The HDLC data ends up looking like:
>
>  (flag) (flag) [frame 1] (flag) (fla) (flag) [frame 2] (flag) (fl)
>
> The partial flag in between the two frames isn't quite kosher,
> according to the recommendations in the AX.25 spec.  Due to the
> way the TNC-X HDLC parser is implemented, the partial flag causes
> the TNC-X to lose sync with the incoming data - [frame 1] is
> processed properly, but the TNC fails to resynchronize in time
> to receive [frame 2].  Most other TNCs seem to have more robust
> intra-frame flag synchronization, and aren't confused by the
> few bits of garbage.
>
> The net result with a TNC-X is a severe loss of useful bandwidth,  as
> the lost frames must be retransmitted when the higher-level
> protocols time out.
>
> The fix was relatively simple.
[snip]

Indeed it is simple - fix the tnc-x as this is what has the problem. I've
implemented similar code on an AVR for 9k6 full duplex operation* so a PIC
shouldn't have any problems keeping up at 1200bps.

HDLC is a bit oriented protocol and as such what the soundmodem sends is
quite valid since each frame is correctly bounded by flags. Any number of
odd bits although perhaps not the best result is perfectly acceptable in
protocol terms.



* www.tvipug.org - IPRI (a SLIP based IP only TNC that doesn't require any
AX25 layer at all - or you can run it as a KISS TNC)

-- 
Robin Gilks (g8ecj, zl3rob)
Internet: robin@gilks.org    http://www.gilks.org
Tel:      (+64) (3) 347 4370



