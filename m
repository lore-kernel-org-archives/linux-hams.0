From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: Soundmodem Not Decoding Real Packets
Date: Sat, 2 Jul 2005 04:58:15 +0000 (UTC)
Message-ID: <loom.20050702T065537-241@post.gmane.org>
References: <20050702040932.4754.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Dave Platt <dplatt <at> radagast.org> writes:
> Hmmm.
> 
> Which audio drivers are you using - OSS, or ALSA?

I've tried both. I'm using the i810_audio module with the AC97 codec for an
on-board sound device on a laptop.
 
> I've seen some rather bizarre things with some combinations of card,
> driver, and software setting.  In particular, problems can occur if:
> 
> [1] The card itself is only capable of supporting a small selection of
>     sampling rates (many AC97 codes seem to want to run at 48000
>     samples/second), and
> 
> [2] You set up the sound modem to use the "natural" sampling rate for
>     the modulation in question (e.g. 9600 samples/second for 1200-baud
>     packet), and

I cannot seem to find where this is set. Are the specifications for the config
file somewhere?

> [3] The soundmodem is configured to use /dev/dsp, and
> 
> [4] You're using an ALSA driver with OSS emulation.
> 
> What seems to happen is that the OSS emulation layer quite politely
> lies to the soundmodem, says "Sure, 9600 samples/second is supported",
> and then tells the ALSA PCM layer to do sample-rate conversion in
> software.  The ALSA rate converter has some problems, and it ends up
> introducing noise into the received audio signal occasionally (usually
> on internal buffer boundaries, I believe).  The noise is sufficient to
> mess up the audio reception.
> 
> The solution to this involves disabling the sample rate conversion
> process.  I _think_ (but am not sure) that the best way to do this is
> to tell the soundmodem to use the ALSA API directly, rather than using
> the OSS emulation via /dev/dsp - recent versions of the soundmodem can
> do this, and are smart enough to use a sampling rate that the audio
> chip supports directly with no conversion being required.

Well, from some of the things you have pointed out, I might suspect an audio
driver issue, but I'm not sure if the ALSA driver is using OSS emulation with
the older i810_audio driver.

