From: Dave Platt <dplatt@radagast.org>
Subject: Re: struggling with gMFSK setup
Date: Sat, 04 Nov 2006 20:35:15 -0800
Message-ID: <courier.454D6A03.0000497C@radagast.org>
References: <courier.454A6BB0.000072D7@radagast.org>
 <20061103140739.06C951173@teufel.hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061103140739.06C951173@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dplatt@radagast.org, brownh@hartford-hwp.com
Cc: linux-hams@vger.kernel.org

> Today, because I fiddled with soundcard mixer settings, my soundcard
> does not function at all, even to play a simple sound file, so I'm
> back to scratch, but at least I know what to do once I get my card to
> word again.

I've had a similar experience enough times, that I've taken to
storing my sound card configuration setup in a script file (e.g.
running "amixer" with a bunch of "set" commands) so that I can always
get the card back to a known good state.

> Which brings up another naive question. On 20-meters, communications
> principally rely on F2 layer skip, and that means I can hear stations
> from about 500 miles to several throusand miles away. That's great,
> but it would also be nice to communicate with folks in my own state
> (within 100 miles) by PSK31. Is there any ground wave communication?

In my experiences, groundwave on HF is good for very short distances
only.  It'll sometimes work out to a few miles, or to a few tens of
miles, but poops out after that.  It doesn't have much range advantage
(if any) over VHF.

Groundwave propagation works much better for vertically polarized
signals than for horizontally polarized.  That's one reason why
HF verticals have a reputation for being noisy - they pick up the
vertically-polarized groundwave QRM from manmade sources (power poles,
neon lights, etc.).  Horizontal antennas tend to reject this V-P
noise, and since horizontally-polarized noise (and signal) doesn't
propagate well by groundwave the horizontal antennas tend to notice
local QRM sources less.

There are a number of propagation tricks you can try:

-  Local groundwave from a 20-meter vertical.  Probably works best if
   both stations use verticals.
   
-  NVIS (near-vertical-incidence skywave).  A horizontal dipole at a
   low height (say, 1/8 wavelength) radiates most of its energy
   upwards, and enough may refract back for local and area
   communication.  The military has become fond of NVIS HF for
   tactical communication, I understand.
   
Sometimes NVIS works, sometimes it doesn't.  20 meters is probably a
bit harder to work via NVIS than 40 or 80, especially in the low part
of the sunspot cycle.

I've had some odd experiences doing local PSK31 on 20.  On one
occasion I was barely able to raise a station 15 miles away, even
though we were both working at about 50 watts.  His signal strength
seemed OK and there wasn't much noise, but my software couldn't get a
decent lock on it.  He had a similar problem copying me.  My best
guess is that we were receiving a combination of groundwave and NVIS,
and that the two pathways were interfering enough to mess up the phase
of the PSK31 carrier and prevent proper decoding.

