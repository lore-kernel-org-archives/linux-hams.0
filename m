From: Dave Platt <dplatt@radagast.org>
Subject: Re: struggling with gMFSK setup
Date: Tue, 31 Oct 2006 14:58:20 -0800 (PST)
Message-ID: <courier.4547D50C.00001533@radagast.org>
References: <20061031192555.780641768@teufel.hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061031192555.780641768@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: brownh@hartford-hwp.com
Cc: linux-hams@vger.kernel.org

brownh@hartford-hwp.com (Haines Brown) wrote:
> Kind of a progress report on my initial query. 
> 
> I had to do some stumbling about to get myself set up my soundcard to
> record so that I might perform a test on my soundcard. I was
> eventually able to record and playback sound from my transceiver, and
> so the soundcard is working. 
> 
> However, I found that if my transceiver (FT-817) audio was at all up,
> it triggered the PTT LED on my SignaLink interface, at which point it
> blocked sound getting to my sound cards' Mike conenction.    As a result,
> the volume level on my transceiver had to be turned most of the way
> down, and as a result, only a very weak signal was recorded.

It's common for a soundcard's mic input to have two different audio
routing pathways associated with it.

When the input is in the "play" mode, the signal coming from it is
mixed into the outgoing (speaker or headphone) audio output, at the
level controlled by the input's software volume control.  The
signal may also be digitized and captured.

When the input is in the "record" or "capture" mode, the signal
coming from it doesn't go to the outgoing audio output, but 
only to the digitize-and-capture logic.

The same is usually true for the line-level input(s).

On some cards, these two signal pathways have a common volume
control setting, and there's just a mode switch (record or
playback) which controls the particular pathway which is enabled
at any given time.  On other cards, the two pathways have
individual enable/disable switches as well as individual volume
controls.

What you want, for computer-to-rig hookup, is to put whatever input
you're using into the "record" mode.  This will prevent the rig's
audio signal (fed to the sound card) from being fed back into the
rig via the speaker pathway, and will ensure that you won't get
accidental or inappropriate triggering of the vox (whether that's
on the rig, or in your audio interface box).

When using ALSA, you can manipulate the input's mode via the
GUI in the "amixer" program.  What you'd want to do, I think, is
select the input that you're using (MIC, probably), hit the M key
to mute it (the display will show MM to indicate that it's muted),
and enable capture with the space bar (the display will show
CAPTUR rather than ------).

This should let you set your rig's audio output level high enough
to permit a high-quality signal capture and digitization, without
inadvertently feeding back the audio into the transmit side and
triggering the vox/PTT.
