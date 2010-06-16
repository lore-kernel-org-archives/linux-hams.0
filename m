From: Dave Platt <dplatt@radagast.org>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 15:29:54 -0700
Message-ID: <4C195062.7050401@radagast.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org> <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Curt, WE7U wrote:
> 
> LOTS of good info Dave!  A couple of minor comments:

> Another thing to watch is whether the PLL in the transmitter you're
> using tries to compensate for the low-frequency audio.  Many
> PLL-based radios will try to do this, screwing up the transmission.
> I used to have a 9600 baud modem hooked to an ICOM IC-27A and it
> definitely had that problem.  Even some "9600-baud ready" radios
> with the modem connector on the back might have this sort of
> problem.

Interesting!  I hadn't encountered, or thought of that issue.
Yeah, a PLL-based frequency synthesizer which is designed for
rapid frequency changes and quick stabilization (e.g. during
scanning) could easily end up trying to "correct the errors"
caused by the low-frequency signal being fed directly to the
modulator.

I've read opinions by people who said that old-style crystal-
based radios are a better choice for running a 9600 bit/second
backbone than modern synthesized radios are.  Maybe this is why?

I do know that our local guys have had difficulty getting good,
predictable performance out of the 9600 bit/second backbone they
have been trying to set up.  Our first assumptions were that
the main problems have been noise, multipath, and intermod...
but maybe transmitter frequency stability is also complicating
matters.  I'll mention this to Michael.

> Note that the 0 bits are a disadvantage for the reasons mentioned,
> but they're an advantage for the purpose of getting more clock
> transitions to sync up with at the receive side.  If it weren't for
> the extra short packet in there that some devices create it would be
> much better to have a sequence of 0-bits than flags.  This is
> especially important for the first part of a transmission when the
> receiver is attempting to sync up to the transmit clock:  With
> 0-bits you can often use a shorter TXD at the transmit side yet
> still get the receiver to sync before the data starts across.  It
> might also be important in lower S/N conditions.

Hmmm... that's an argument I haven't seen proposed in the X.25 or
AX.25 literature.

During the initial part of transmission (before the first frame)
I could well see it... send a continuous stream of 0-bits during
the TXDELAY period (to allow for the modem-level clock
synchronization), then send one or two FLAGs to sync up the
HDLC bitstream.  Dunno about in between frames, though.

When I figured out that the soundmodem and my TNC-X weren't
playing well together, I looked into the soundmodem code and
figured out a couple of possible fixes.  One is to modify
soundmodem's HDLC encoder and bit-stuffer so that it doesn't
generated invalid (runt) frames.  The reason for the runts, is
that the encoder doesn't attempt to maintain bit synchronization
in its output buffer in between frames... at the end of a frame,
it appends the final FLAG to its output and then flushes the
output buffer, and starts packing the next frame at the beginning
of a new byte.  I did develop a patch to maintain synchronization
between frames, but it has never been incorporated into the official
software (Thomas didn't care for it).

Another possible approach would be to give soundmodem the ability
to generate a somewhat more complex start-of-frame sequence...
perhaps a programmable number of zero-bytes followed by a programmable
number of FLAGs.  This would allow TNCs with marginal firmware (or
operating under noisy conditions) a better chance to re-synchronize
at the beginning of the next frame.

> I've seen a few references to 6-pack, and know that its a "special
> firmware" that one would load on the TNCs...But I can't seem to find
> that firmware anywhere.  Does anyone know where I can actually get it,
> and find info about what TNCs it supports?

As far as I can tell, it was only ever available as an EEPROM swap-out
for the classic TAPR TNC-2 design.

It was developed by the Flexnet people. The firmware is supposedly
available (as "6pack.bin") on any system running Flexnet 3.2.  I
dug around on the Flexnet home page

  http://www.afthd.tu-darmstadt.de/~flexnet/intro.html

and through their archives.  The download directory contains
a "6pack.lzh" archive, which does (when unpacked with the
"lza" utility) contain a file called "6pack.bin", but it's only
4k bytes long... I have difficulty believing that this is
actually valid firmware for a TNC-2.  You might want to write
to the Flexnet people and ask them for a clean copy of the
PROM image file.

Apparently, some older TNC-2 systems with slower clocks are
limited in their ability to support 6Pack, and need a bit of
hardware modification.  6Pack appears to want to run its serial
port at 2x the modem data speed, so supporting 9600 bit/second
operation on an older TNC-2 isn't possible without modifications
to increase its serial port speed.

> It seems that for hardware available today, the recommendation for
> infrastructure use is to use a TNC in KISS or 6-pack mode.  I've been
> using one at home in KISS mode for a while, and I've been noticing
> what I think now is the T1 timer problem, and its been causing very
> frustrating and massive reduction in throughput on my local 9k6
> channel, even though my radio and the node are the only two on
> frequency!  I often see my system try and send retransmits before the
> first packet ever even makes it out the radio (but on the other hand,
> I also think my TNC is sitting on packets way too long -- PacComm
> Spirit-2).  

I agree with Curt - your TNC's delay and persistence values are
probably a bit out of whack with your upper-level protocol timeouts.

As I read things, the T1 timer in your AX.25 stack needs to be
set high enough to allow your packet to be transmitted, and the
response to come back.  In the Linux kernel, T1 is normally set to
twice the average-measured round trip time, with the default
value for the AX.25 device being 10 seconds.  The RTT calculations
operate on a basis of averaging, with a lower clamp limit of 1
second and an upper clamp limit of 30 seconds.

It's possible to adjust T1 on a per-connection basis, once
you've created the socket... but unfortunately I don't see any way
to adjust it semi-permanently for a device/port, or for the whole
AX.25 stack.  The default and clamp values are compiled into the
kernel and don't seem to be configurable.

In a standard TNC-2 (with current firmware), the TNC will delay
before transmitting (once it hears clear air) by a multiple
of the slot delay time.  The multiple will be between 1, and
the persistence limit, apparently chosen at random.  If your limit
(or the slot time) is set too high, it'll be possible for the
Linux system's T1 timer to expire before the TNC transmits,
even if the air is completely clear. Lowering the persistence
limit and/or the slot-delay time could help throughput.

However, setting your parameters too aggressively would cause
your station to "hog the air", at which point other users
of the frequencies may show up on your doorstep to gently
reason with you (e.g. pitchforks and flaming torches being
optional :-).

You may need to specifically enable P-Persistence in your TNC
settings - it might default to an older mode of operation.

I'd suggest checking that SCC-ARES-RACES page I pointed to... our
guys have developed a set of recommendations for TNC settings, to
improve overall throughput and reduce unnecessary retransmissions
during busy-air conditions.

> Thanks all for the ideas/input.  I think the BPQether driver best fits
> what I was hoping to find, except for the fact that it doesn't exist
> off-the-shelf yet....

I agree - an interesting idea.

As far as the actual USB protocol goes, you'd probably want to look
into the "usbnet.c" driver in the kernel.  This implements a fairly
generic "USB driver for Ethernet-like thingies" framework, for a bunch
of devices which share a fairly common approach to the problem of
sending Ethernet frames over USB connections.  It's used for some
PC-to-PC "USB null modem" cables, other sorts of network-like peripherals,
and for some actual USB network adapters.  [Only a minority of USB
Ethernet devices use this framework - most are implemented with vendor-
or chipset-specific USB protocols and are extremely non-portable.]

You could probably implement this sort of USBNET protocol in a
high-end microcontroller, which is then wired up to one or more
modem chips or ADC/DAC chips which interface to the radio.  Using
BPQether framing on Ethernet seems like a fine idea.

The Cypress microcontrollers with the EZ-USB stack could be
suitable targets.  These have the ability to have their firmware
downloaded by the host over USB each time they plug in and
enumerate... easy updating, no need to burn EEPROMs or flash
firmware directly into the chips.  High-end PIC micros could
be another workable choice.




