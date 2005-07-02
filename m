From: "Dave Platt" <dplatt@radagast.org>
Subject: Re: Soundmodem Not Decoding Real Packets
Date: 2 Jul 2005 04:09:32 -0000
Message-ID: <20050702040932.4754.qmail@radagast.org>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Lassoff <jlassoff@gmail.com>, linux-hams@vger.kernel.org


> I did find out that the audio output from my radio was a bit high.
> I don't have an oscilloscope to play with, so I just used audacity to see the
> audio while recording it. I trimmed it down so that everything is there. I'm
> still having the same problem though. I have also been trying to decode packets
> off of APRS here in California on 144.390 to no avail. I also tried the decoding
> process with squelch open. I'm not really sure what is going on here. I also
> tried twiddling with the audio levels on my input channel in a mixer program.
> Any crafty diagnostic ideas?

Hmmm.

Which audio drivers are you using - OSS, or ALSA?

I've seen some rather bizarre things with some combinations of card,
driver, and software setting.  In particular, problems can occur if:

[1] The card itself is only capable of supporting a small selection of
    sampling rates (many AC97 codes seem to want to run at 48000
    samples/second), and
    
[2] You set up the sound modem to use the "natural" sampling rate for
    the modulation in question (e.g. 9600 samples/second for 1200-baud
    packet), and
    
[3] The soundmodem is configured to use /dev/dsp, and

[4] You're using an ALSA driver with OSS emulation.

What seems to happen is that the OSS emulation layer quite politely
lies to the soundmodem, says "Sure, 9600 samples/second is supported",
and then tells the ALSA PCM layer to do sample-rate conversion in
software.  The ALSA rate converter has some problems, and it ends up
introducing noise into the received audio signal occasionally (usually
on internal buffer boundaries, I believe).  The noise is sufficient to
mess up the audio reception.

The solution to this involves disabling the sample rate conversion
process.  I _think_ (but am not sure) that the best way to do this is
to tell the soundmodem to use the ALSA API directly, rather than using
the OSS emulation via /dev/dsp - recent versions of the soundmodem can
do this, and are smart enough to use a sampling rate that the audio
chip supports directly with no conversion being required.

