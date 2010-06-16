From: Dave Platt <dplatt@radagast.org>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 16:53:16 -0700
Message-ID: <4C1963EC.506@radagast.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org> <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net> <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com> <20100616222913.GO898@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100616222913.GO898@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> There are some advantages at 6PACK, but they relate to time of real
> serial ports, not USB virtual devices that run at 500 or 20 000 times
> the speed of 1200 bps packet...
> 
> But then we hams tend to prefer running with _old_ hardware instead of
> doing something truly smart.  A GMSK modulation and some sort of FEC
> coding would be smart, but as it is incompatible with 1960es landline
> audio modulation used for 1200 bps packet, such ideas will never gain
> any use.

Several ideas intermixed here, so I have several comments.

I think that there are probably two different "markets" which could be
addressed by improvements to ham packet technology... but which may
need technology which is significantly different in detail.

(1) End-users - individual hams, who want to add some amount of
    packet connectivity to an otherwise-already-functioning station.

    Having to buy expensive TNCs, and (especially) expensive new data
    radios, is a non-starter for most of these people.  Solutions
    which can use their existing radio hardware are preferred.  This
    often means "mic/speaker interface to an FM radio".

    May operate mobile or portable (or, at least, with mobile or portable
    radios and TNC setups - not necessarily moving around), with simple
    or impromptu antennas.

(2) Base stations, backbones, infrastructure - stations which are generally
    fixed in location, operating over a longer period of time, with
    significant investment in the equipment, antennas, computers, and
    the setup and optimization of all these things.

Now... with regard to your specific suggestions...

Forward error correction seems like an excellent idea, no matter what
the lower-level modulation is - it could cut packet retransmissions down
by quite a lot.  It would be beneficial if the specific parameters for
the FEC were somewhat adjustable, and were explicitly identified in the
packet headers - this would allow operation under a range of different
error rates and correction levels.  Given the interference and dropout
behaviors seen on VHF and UHF, you'd want to use a significant amount
of data interleaving, with a correction-block size large enough that
a single noise burst or multipath-flutter wouldn't knock out too many
bits to allow error correction to occur.

Reed-Solomon EC is well understood and free code seems to be available.
More effective correction could probably be achieved via a turbo-code
system (perhaps with a flexible puncturing algorithm) but I'm not sure
about the patent status of turbo codes... we wouldn't want to create
another AMBE-like licensing debacle!

Systems using sophisticated error-correction coding might best be
implemented in the PC itself, with the the "TNC" mostly driving the
radio itself.  The interface between the PC and the "TNC" might just
be frames or packets filled with bits, with the PC doing all of the
actual frame-detection and error correction.

My understanding is that current 9600 bit/second ham packet isn't
too far from being GMSK in its design?

I've read a lot which believes me to believe that GMSK, and similar
single-carrier modulations have a significant vulnerability to
multipath interference.  Ham 9600 packet has been notorious for
this... works rather better with highly-directional antennas than
with spray-and-bounce omnis.  Some digital land-mobile deployments
I've heard about, have had serious problems with picket-fencing
when the mobile station is... well, mobile... and have had to deploy
additional base stations to improve signal coverage.

So, I think there might be merit in pursuing two different
approaches to improving performance:  one for casual hams and
mobile operation (standard-FM-radio-compatible) and one for
infrastructure/backbone use.

For base/backbone use, adding FEC to the current 9600-bit
protocol could help.  I think there's already some sort of data
scrambler in use, to try to help with the low-frequency-content
issue, but perhaps it could be improved... or maybe a trellis-
coded QAM16 or some such modulation could be used to enforce
a low average DC offset.

For improved audio-radio-compatible performance... I've long been
a fan of DMT (discrete multi-tone), OFDM, and other modulations in
this family.  Back in the late 1980s, the Telebit Trailblazer modems
were a very successful niche product - probably the most popular
way of tying together Unix/Linux systems over phone lines.  They
could manage to maintain a 9600-bit/second connection (half duplex)
over lousy, scratchy overseas land lines and satellite links, when
industry-standard V.32 models would just gasp and choke and disconnect.
I swear, the Telebits would work over two tin cans and a length of
damp string.

I don't know the the fine details of their protocols, but do recall
that they were a DMT system, with several hundred individual carriers
spaced evenly across the voice-band spectrum.  Each carrier was
modulated (QPSK or QAM?) at a relatively low rate - around 7 baud
I think.  The protocol was point-to-point, and adaptive - each modem
could tell its peer which carrier frequencies were working well,
and which were noisy or attenuated.  I believe they applied FEC to
the data prior to modulation.

I'd love to see a ham-packet modulation based on this sort of
technology.  It's probably something which could be made compatible
with the soundmodem framework.

I recall reading that somebody was working on a system somewhat
like this for HF packet use - a protocol called SCAMP.  I think it
died on the vine, although it's possible that some of its ideas were
picked up by newer versions of WinLink.

As to compatibility with current ham TNCs and nodes... well, clearly,
it's tricky.  I think it'd probably be desirable to treat the new
modulations a bit like Ethernet, in that they could carry multiple
higher-level protocols within appropriate framing structures.  We
could carry AX.25 (e.g. as BPQEther), or TCP/IP, or jump right to
IPv6.  If I recall correctly, this is the approach D*Star has
taken... it uses Ethernet framing.

This could allow backwards compatibility with existing ham
infrastructures, while still allowing advances and the use of
better high-level protocols on the same frequencies (and on the
same systems!).

As I understand it, essentially all of the ham packet systems
in use today still implement AX.25 2.0 (which dates back to the
mid-1980s).  The effort in the late 1990s to create a newer
revision (AX.25 2.2) doesn't seem to have come to much.

1200-baud packet and the TNC-2 infrastructure is probably
like crabgrass and FORTRAN - we'll never be free of them, and will
always have to deal with them in one way or another.

> One related USB interface issue is that there is no specification for
> serial port!  All that exist are proprietary chip vendor specific things.
> (Unless something has crept up during last month.)

Yup.  It really annoys me that the USB consortium didn't specify standard
device-class interfaces for serial ports, parallel ports, and
network adapters *years* ago!
