From: Dave Platt <dplatt@radagast.org>
Subject: Re: FlexNet connect
Date: Mon, 1 Mar 2004 13:53:30 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040301215330.6188.qmail@radagast.org>
References: <1078173025.1255.94.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1078173025.1255.94.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-hams List <linux-hams@vger.kernel.org>

> 
> Do you mean setting the Audio IO "half duplex" option on
> or setting the Channel Access "full duplex" option off?
> 
> The former should not be used unless the sound driver does not
> work reliably with it off.

I made this suggestion to Michael based on my own experiences
with the soundmodem (0.5 and 0.7) on a Dell Latitude CP
laptop.  My laptop would do APRS well enough in full-duplex
mode, but I was unable to connect reliably to local BBSen
when the sound interface was set to full-duplex.  Once I
switched to half-duplex mode, it began to work very
reliably.

I've observed that some sound cards / chips which seem to
be able to support full duplex audio I/O, do not do so
at all well.  I'm not sure whether this is a driver
issue, or a hardware issue.  My recollection is that many
sound cards (e.g. SoundBlaster clones) have a rather
asymmetrical architecture, in terms of DMA transfer width
and perhaps even sample size, when they're used in full
duplex mode.  Perhaps there are audio fidelity problems,
if you try to receive while having the transmit channel
open-but-idle?

For what it's worth, my laptop has a CS4236 sound chip,
and uses the current ALSA drivers.

>                      Setting it on can cause additional
> latency in T/R switching and thus make life miserable for 
> everyone on the channel.

My impression (perhaps wrong?) is that this is more likely
to be an issue for higher-speed modulations, which are
designed to have fast turnarounds, and less so for simple
1200 bps Bell 202 packet.

How much additional latency seems to be added by half-duplex
mode (which seems to close and re-open the audio device when
switching directions)?


> The latter should be obvious (and also default to off).

Yup.  Didn't help, in my own situation - I had to turn the
sound card down to half-duplex mode in order to get the
data to flow reliably.
