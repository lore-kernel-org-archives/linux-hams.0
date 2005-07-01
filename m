From: Dave Platt <dplatt@radagast.org>
Subject: Re: Soundmodem Not Decoding Real Packets
Date: Fri, 1 Jul 2005 11:42:03 -0700 (PDT)
Message-ID: <20050701184203.2013.qmail@radagast.org>
References: <loom.20050701T095736-780@post.gmane.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <loom.20050701T095736-780@post.gmane.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jlassoff@gmail.com
Cc: linux-hams@vger.kernel.org

Jonathan Lassoff <jlassoff@gmail.com> wrote:
> I've been trying to get Tom Sailer's soundmodem to decode AX.25 packets. I've
> been able to see the audio coming in from the radio and from other machines
> transmitting packets through a cable. The only problem is that the DCD can be
> too sensitive and turn on when there is nothing but just inducted noise in the
> cable from somewhere. The noise in normal, and the level is very, very low. But,
> the problem is that soundmodem tries its best to try and decode the noise. But
> when a real packet comes down the line, it tries but fails to decode it
> properly. I think that I have an issue with audio levels, but I'm open to being
> wrong. Does anyone on list have any good ideas of things to try?

In my experience, the user-mode soundmodem code does a very fine job of
decoding AX.25 packets, and it does so even if the radio is operated
"open squelch".  In fact, in many areas it is a preferred practice for
packet nodes to be run with the receive squelch open - this allows
the TNC or other modem to synchronize very rapidly at the beginning
of each packet, without a long wait for the radio to detect carrier
energy and open its squelch.  This, then, allows the nodes in the
area to use a shorter beginning-of-packet synchronization burst, and
increase the useful data throughput of the packet channel.

The occasional flickering of the DCD indicator and/or LED ought
not to be a problem.  A similar phenomenon occurs on many
TNCs (which use hardware modem chips rather than audio DSP).
Any "packet" which is seen during this time (as a result of
the perceived detection of carrier as a result of noise)
will almost certainly be discarded by the soundmodem/TNC because
it fails any of several validity checks (e.g. contains enough
consecutive 1-bits to trigger an ABORT, fails the CRC16 frame
check sequence validation, is too short or too long, etc.).

In your situation, I'd look at several things:

-  Audio levels, as you suggest.  Take a look at the audio coming
   out of your radio when it's receiving a clean packet - use
   an oscilloscope.  Check for clipping (a "flat-top" appearance)
   in the waveform.  If you see it, turn the radio's audio-output
   control down until it goes away.

-  Once you're sure that the radio's audio output is clean and is
   not clipping or distorting, use the soundmodemconfig program's
   oscilloscope/waveform display to see how well the data is getting
   into your sound card.  Adjust the sound card audio input gain,
   and if necessary the radio's output level control, so that the
   waveform "seen" by the soundmodem is clean, not clipped, and is
   perhaps half of full-scale in amplitude.

-  Try running the radio with the squelch open.  It's possible that
   your radio takes so long to open its squelch that it's chopping
   off the beginning of each packet, and thus preventing the soundmodem
   from "seeing" the carrier in time to synchronize with the packet
   properly.

Also, check the quality of the signal from the sending station.  It's
not unusual for TNCs or soundmodems or audio interfaces or radios to
be misadjusted, causing any of several problems:

-  TNC or soundmodem audio output is clipping.  [I had horrible
   problems with a Dell Latitude laptop - if its PCM audio output
   control was set to above 25%, the audio waveform was clipped,
   independent of the setting of the master audio gain.  Didn't
   send packet worth a darned that way.]

-  Audio signal is overdriving the radio's mic input and is
   clipping or distorting.

-  Radio is being pushed into deviation limiting (typically at 5 kHz
   or so) and is distorting the audio, or is overdeviating and pushing
   the modulated signal outside the receiving radio's IF passband.

My own guess is that that Thomas Sailer's soundmodem code is not
the cause of your problem.  I've found it to be quite good indeed
at receiving packet.

The only gripe I have with the soundmodem, is that its handling
of back-to-back AX.25 frames in a single transmission does not
comply with the AX.25 protocol recommendation (specifically,
2.2.11 which states that the time between frames should be
filled with contiguous flags).  The soundmodem transmits one
complete flag, and then (most of the time) a partial flag,
and then a complete flag which begins the next frame.  This can
cause problems for TNCs whose HDLC parsing is not as robust
as should be the case.  Mr. Sailer has elected not to correct
this, feeling that it's a problem in the receiving TNCs.

