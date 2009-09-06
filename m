From: Dave Platt <dplatt@radagast.org>
Subject: Re: Fldigi and RTTY decodes
Date: Sat, 05 Sep 2009 19:43:55 -0700
Message-ID: <4AA321EB.4080807@radagast.org>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop> <4A9DA743.9090101@radagast.org> <20090905160400.GH3807@mea-ext.zmailer.org> <4AA2AA78.5000605@radagast.org> <4AA309E9.3040004@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AA309E9.3040004@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "David A. Ranch" <dranch@trinnet.net>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

David A. Ranch wrote:
> 	
> Hello Everyone,
> 
> I'm a new HAM but not new to Linux.  I've been using Fldigi for
> monitoring BPSK31, etc. with good luck but I've been finding that RTTY
> rarely works.  It maybe decodes 10% of the time even with a strong
> signal.  It also seems the good decodes are specific to a given remote
> handle's QSO.
> 
> I stumbled upon something today which I bet has a major impact on the
> RTTY decoding and I was curious about the group's thoughts.

#snip#

> So my questions for the net are:
> 
>   1. What's more common on the digital bands?  FSK RTTY or AFSK RTTY?
> If it's FSK RTTY, are people using TNCs to do RTTY vs. soundcard-based
> solutions?

My guess is that direct FSK is more common among hams who have
been on the air for decades and are using older radios.  Most
newer setups probably use TNCs (or soundcard equivalents) fed
into SSB modulators, and are thus AFSK.

As I understand the math:  there is no actual difference in the RF
waveform and content, between:

(1) a "true FSK" signal - e.g. one in which a single oscillator is
     directly "pulled" by a certain amount (the frequency shift) by
     a baseband signal (the one/zero bit), and

(2) a sideband-synthesized signal, in which a non-changing RF
     carrier is modulated (SSB) via an AFSK signal whose audio
     frequency shift is equal to the desired RF shift and where
     the shift is controlled by the one/zero-bit baseband signal.

Now, this equivalence assumes that the sideband modulation process
is perfect - that is, that the carrier is completely suppressed, and
that the opposite sideband is completely filtered out.

This isn't ever actually the case, of course... no sideband modulator
is perfect.  So, in that sense, a "true" or direct-FSK RTTY signal may
produce a more "pure" modulated RF signal.

On the other hand, it may be easier to get exactly the right frequency
shift with an AFSK process - "pulling" a crystal or VCO by an exact
amount isn't always easy.

This equivalence also assumes that you've got your shift convention
correct... i.e. is a 1-bit signified by a higher RF frequency than
a 0-bit, or by a lower RF frequency?  If the receiving station tries
to use the incorrect shift convention for a given QSO, the signal won't
decode - it'll be gibberish.

You can transmit *either* shift convention with either FSK or
AFSK-into-SSB.

FLdigi "prefers" to use AFSK, since that's what a soundcard-
into-audio-input system is naturally set up for.  The auxiliary
circuit is FSK is interesting, and would be primarily of use (I
imagine) with special-function RTTY radios set up for baseband-
controlled FSK and which don't have a mic (or which have a poor
SSB modulator which doesn't handle AFSK cleanly).

>   2. Is there a way to determine if a given RTTY transmission is FSK vs.
> AFSK?  I have fairly good ears but maybe it's impossible to hear the
> difference with background noise?

You could look at a wider area (say, 10 kHz) around the signal center
frequency with some sort of spectrum analyzer.  If you can see a
residual bit of carrier a few kHz away from the RTTY tones, and perhaps
even see a "ghost image" of the RTTY tones twice as far away, then it's
a good bet that you're looking at an AFSK signal fed into an SSB
modulator, and the modulator has imperfect carrier and opposite-
sideband suppression.

On the other hand, if the RF signal appears pure (no suppressed
carrier or opposite-sideband residue), then it could be FSK, or
it could be a really good SSB modulator transmitting an AFSK
signal.

> 
>   3. Can FLdigi still decode FSK-based RTTY?  Maybe this is only a Tx
> limitation?

FLdigi should be able to decode either with equal clarity, as long as
you get the shift direction correct, because they're essentially the
same signals in the RF domain.

If you fail to decode a soecific signal, try reversing the shift
direction on receive.  You might be able to do this within FLdigi
(I imagine it has an option for this), or could do it by switching
from USB to LSB (or vice versa) and re-tuning to reacquire the signal.


