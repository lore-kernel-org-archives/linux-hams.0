From: Haines Brown <haines@histomat.net>
Subject: Re: fldigi setup question
Date: Thu, 23 Jun 2016 07:48:30 -0400
Message-ID: <20160623114830.GC12415@engels.historicalmaterialism.info>
References: <20160619135457.GN4605@engels.historicalmaterialism.info>
 <20160623011533.GB12415@engels.historicalmaterialism.info>
 <1466674104.1592.6.camel@raag.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466674104.1592.6.camel@raag.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-hams@vger.kernel.org

On Thu, Jun 23, 2016 at 12:28:24PM +0300, Apostolos Kefalas wrote:
> On =CE=A4=CE=B5=CF=84, 2016-06-22 at 21:15 -0400, Haines Brown wrote:=
=20

> > The SignaLink USB instructions tell me to make sure the software's
> > transmit and receive audio card is set to USB Audio CODEC. I go to
> > fldigi, Configure, Soundcard. Although PulseAudio is present on the
> > computer, not wishing to use PulseAudio for fldigi, I have selected
> > PortAudio. I assume I can do this. Am I wrong?
>=20
> No you are not wrong... though I can not understand why you want to d=
o
> that. Portaudio will use ALSA which will redirect you through
> Pulseaudio!!!

I'm in process of transitioning from Wheezy to Jessie, from 32bit to
64bit, and part of that will be to replace Pulseaudio with apulse.=20

> Make sure you have installed libportaudio packages.

I had  libportaudio2 installed.

Your point that with PulseAdio installed ALSA ends up using it convince=
d
me that it would be easier to use puseaudio for the time being. So I
told fldigi to use PulseAudio. But that leaves me with questions about
how to configure pulseaudio. Reading and online searching do not even
mention these things and apparently assumes the person knows that to do=
=2E

Pavucontrol shows I have three output devices: HDA NVidia Digital
Stereo, Xonar DX, and the SignaLink USB sound card identified as PCM290=
4
Audio Codec Analog Stereo. This apparently is the Burr-Brown Stereo USB
CODEC used by SignaLink.=20

In pavucontrol Configuration tab. for PCM2904 Audio Codec there is a
menu of Analog profiles affecting whether mono, stereo, duplex, input,
output, etc. I've no idea at all which to choose. I find strong signals
with stereo + mono out or duplex, and so set it to duplex.

In pavucontrol input devices there is PCM2904 Audio Codec Analog Stereo=
,
which is set as fall back and channel is locked. This shows some
signal. An there is also the device Monitor PCM2904 Audio Codec Analog
Stereo. I've no idea what this is. This does not show a signal.

In pavucontrol output devices there is PCM2904 audio codec analog
stereo. It is not set to default, but its channel is locked with anothe=
r
channel.

In pavucontrol, Recording, there are four instances of ALSA plug-in
[fldigi] which are locked, show a little signal and are set to capture
from PCM2904 Audio Codec rather than from Monitor of PCM904. Again, no
idea what "monitor" refers to. Then there is also a Fldigi capture
from. I set this also to PCM12904 rater than monitor. It also has
a little signal.=20

I've been assuming that Playback tab in pavucontrol refers to
transmission and Recording refers to reception. Is this so?

My waterfall is still like before. It is black except for a 353 Hz-wide
band of noise at 14.071.503. What looks more like a signal at the very
left edge of the waterfall (14.070.016) produces garbage output.

Haines Brown KB1GRM

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
