From: Dave Platt <dplatt@radagast.org>
Subject: soundmodem HDLC compatibility problem
Date: Tue, 10 Feb 2004 19:25:59 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040211032559.28029.qmail@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

I ran into an interesting compatibility problem recently, between
soundmodem 0.7 and a new KISS-mode-only TNC kit (www.tnc-x.com).

The symptom was that if my Linux system send multiple AX.25
frames back-to-back in a single transmission, the TNC-X would
properly receive only the first, and would drop the second and
subsequent ones on the floor almost all of the time.  The
problem did not occur in the reverse direction.  Both the
soundmodem and the TNC-X had no problem communicating with
other TNCs.

The problem turned out to be a minor deficiency in the soundmodem
HDLC encoder, which was tripping up the HDLC parser in the
TNC-X.

The soundmodem HDLC encoder takes as input a packet of data to
be sent (an integral number of bytes) and encodes this into
HDLC frames, storing the HDLC-encoded bits in a circular buffer.  
The circular-buffer management is also being done in increments 
of 1 byte, and as a result it's quite common for the second of
the two flags at the end of the frame to be truncated.  This
doesn't seem to have any bad effect when only single frames are
transmitted, but it causes problems when back-to-back frames
are encoded.  The HDLC data ends up looking like:

 (flag) (flag) [frame 1] (flag) (fla) (flag) [frame 2] (flag) (fl)

The partial flag in between the two frames isn't quite kosher,
according to the recommendations in the AX.25 spec.  Due to the
way the TNC-X HDLC parser is implemented, the partial flag causes
the TNC-X to lose sync with the incoming data - [frame 1] is
processed properly, but the TNC fails to resynchronize in time
to receive [frame 2].  Most other TNCs seem to have more robust
intra-frame flag synchronization, and aren't confused by the
few bits of garbage.

The net result with a TNC-X is a severe loss of useful bandwidth, 
as the lost frames must be retransmitted when the higher-level 
protocols time out.

The fix was relatively simple.  The soundmodem HDLC encoder can
be modified to pack both of the terminating (flag) bytes into the
HDLC buffer, and (if another frame is encoded before the data
is transmitted) to pack that frame's leading (flag) immediately
after the last bits of the trailing (flag).  This brings the
transmission into compliance with the AX.25 spec's recommendations,
and cures the problem.

Patches for this can be found at 

  http://www.radagast.org/~dplatt/hamradio/soundmodem-0.7a.patch
  http://www.radagast.org/~dplatt/hamradio/soundmodem-0.7b.patch

The "a" version is more conservative, in that it guarantees
three (flag) bytes between back-to-back frames... the two which
were encoded to terminate [frame 1] and one which is encoded
to start [frame 2].  The "b" version of the patch eliminates the
third (flag) in this case.

A more aggressive patch would go even further, and use just one
"shared" flag as is permitted by the spec, but I haven't been
able to test this with enough TNCs to be confident that it
wouldn't tickle problems in some TNCs.

