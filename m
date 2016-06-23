From: Haines Brown <haines@histomat.net>
Subject: Re: fldigi setup question
Date: Wed, 22 Jun 2016 21:15:33 -0400
Message-ID: <20160623011533.GB12415@engels.historicalmaterialism.info>
References: <20160619135457.GN4605@engels.historicalmaterialism.info>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160619135457.GN4605@engels.historicalmaterialism.info>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

There was no response to the question of my original post. I assume that
this was because it was too open ended. So I'll be more specific.

I'm running debian Wheezy with a SignaLink USB sound card and fldigi
software. The transmitter is a K3 tuned to 14.070, TX DATA mode USB. My
computer uses PulseAudio as default. Alsamixer also sees the presence of
SignaLink's USB Audio CODEC, which is un-muted and at 84%.

The SignaLink USB instructions tell me to make sure the software's
transmit and receive audio card is set to USB Audio CODEC. I go to
fldigi, Configure, Soundcard. Although PulseAudio is present on the
computer, not wishing to use PulseAudio for fldigi, I have selected
PortAudio. I assume I can do this. Am I wrong?

PortAudio does not offer an option to choose the Transmit and Receive
audio card, but instead the Capture and Playback card. I set PortAudio
Capture to the SignaLink's USB Audio CODEC card. But the fldigi
PortAudio Playback does have that option. Its options are Xonar DX (my
computer's sound card) HDA NNvidia (motherboard audio chip), iec958,
spdif (a cable?), pulse (PulseAudio?) and default (my computer's Xonar
sound card?). USB Audio CODEC is not a choice. Should it be? Should I
instead use iec958?

Pavucontrol sees "ALSA Plugin [fldigi]" for ALSA Capture under Recording
and sees PCM2904 Audio Codec Analog Stereo among Output
Devices. Question: shouldn't what pavucontol sees and the values it sets
be irrelevant?

And the fldigi waterfall is strange. Fldigi is set to PSK31 at
14070.000. The waterfall sees noise only in a band at its center
(14071.240 to 14071.716) and at its extreme left edge (14070.041). While
the middle region has nothing that looks like signals (unless it itself
is a broadband signal), the left edge looks as though it is close to the
IM distortion of a signal just out of range. Although the central region
has no visible PSK31 signals and I hear no PSK31 warble, it and the
extreme left produce garbage text ("e S tite ate oee o e too="), whether
I set the demodulation for frequency or phase shift. The only effect
changing the demodulation is that with RTTY, the garbage is upper case.

Please help.

Haines Brown KB1GRM

