From: Dave Platt <dplatt@radagast.org>
Subject: Re: problems with soundmodem (userspace)
Date: Mon, 7 Jun 2004 13:36:14 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040607203614.30352.qmail@radagast.org>
References: <40C4CE6E.70403@psionic.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40C4CE6E.70403@psionic.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: psionic@psionic.de
Cc: linux-hams@vger.kernel.org

Jochen Schaeuble <psionic@psionic.de> wrote:
> Hi,
> I have several problems setting up the userspace version of soundmodem 
> with 9k6. Everything works perfect if I only send a small set of 
> characters (like c or m) - but sometimes a bit slow. If I enter a larger 
> amount of text (like a message) the connection is lost after about 10 
> minutes of retries. Any hints what I'm doing wrong? I use a Yaesu FT-817 
> with Debian testing (Kernel 2.4.22, ALSA). The parameters of soundmodem 
> are as follows:
> 
> txdelay="150" slottime="30" ppersist="30" fulldup="0" txtail="25"
> 
> As terminal I use xcall.
> 
> Is it better to use the kernelspace driver?

From what I've seen, problems with the user-mode soundmodem driver
can fall into the following categories:

-  Incorrect audio levels.  A receiver whose audio output is too
   "hot" can overdrive a PC's sound card input, clipping the
   waveforms and distorting the signal.  Similarly, a PC whose
   audio output level is set too high can overdrive the rig's
   microphone or accessory audio input, clipping the signal or
   overdeviating.

   The 9k6 FSK modulation is, I understand, quite "touchy" in
   terms of the transmit audio level.  Since you're driving the
   modulator directly, too high an audio output level can
   easily over-deviate your signal, and you might drive the
   signal out past the receiving radio's discriminator lock
   range.

   See if you can find someone in your area who has a
   deviation/modulation meter, and see whether you're pushing the
   transmit deviation too hard.

-  Incorrect setting of the radio.  For 9k6 FSK, you can't use
   the mic and speaker jacks.  You must use an audio interface
   which bypasses the transmit equalization circuitry, and which
   gives you access to the receiver's discriminator output without
   re-equalization.  Some radios with auxiliary audio jacks have
   a menu setting e.g. "1200" or "9600" - if the FT-817 has such
   a menu, make sure you've selected 9600.

-  Sound-card resampling problems.  Many modern PCs use sound
   interfaces based on the AC97 codecs, which have only a couple
   of hardware sampling rates.  The soundmodem driver may be expecting
   to use a different sampling rate.  If the soundmodem sample rate
   and the codec sample rates don't overlap, then somebody has to
   re-sample the audio data - some chipsets do this in hardware, while
   others have no such ability and require the CPU and drivers to do
   the resampling.  ALSA's OSS-compatibility driver will try to do
   resampling, but some reports on this group seem to indicate that the
   resampling code has bugs in it and can result in bad samples being
   transmitted or received.

Also, packet transmissions in general and (I think) 9k6 in particular
are often quite sensitive to RF signal quality.  In particular,
multipath reflections can result in enough inter-symbol interference
to render the signal unreadable.  Use of directional beam antennas,
mounted high up in the clear, may clean up the signal enough to make
the channel usable.

Another thing to check is to make sure that your radio isn't set
in a power-saving mode, which leaves the receiver turned off much
of the time.  These modes play merry hell with packet, as the SYNC
bursts are often lost.

My guess is that the kernel soundmodem driver is probably not going
to be the cure for your problem... the fault lies elsewhere.
