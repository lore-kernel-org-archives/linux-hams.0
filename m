From: Haines Brown <haines@histomat.net>
Subject: Re: fldigi audio configuration.
Date: Sun, 19 Jun 2016 19:30:21 -0400
Message-ID: <20160619233021.GO4605@engels.historicalmaterialism.info>
References: <20160617133418.GF4605@engels.historicalmaterialism.info>
 <1466366399.1484.34.camel@raag.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466366399.1484.34.camel@raag.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-hams@vger.kernel.org

On Sun, Jun 19, 2016 at 10:59:59PM +0300, Apostolos Kefalas wrote:
> On =CE=A0=CE=B1=CF=81, 2016-06-17 at 09:34 -0400, Haines Brown wrote:=
=20
> > I'm getting back to ham radio after many years of absence. I'm runn=
ing
> > an Elecraft K3, PSK31 mode, with a Signalink USB sound card feeding=
 into
> > fldigi under Debian Wheezy.
> >=20
>=20
> First of all I would recommend to install Debian Jessie instead of
> Wheezy (which is too old) if this is possible.

Thanks for the reply, Apostolos. I'm actually running Devuan Jessie on
another disk on the current machine and also on another machine, but
want to get fldigi rolling on Wheezy. My ability to get fldigi going on
the other disk from the current one is limited by the fact that the
Jessie disk is 64 bit and my current Wheezy is 32 bit. This probably
precludes chroot.

> > My question concerns fldigi audio configuration. Because I happen t=
o
> > have PulseAudio installed, I checked Pulse Audio in fldigi audio
> > configuration. However, it asks for the sound server string. $ echo
> > $PULSE_SERVER returns nothing. How do I obtain the string's value?
> >=20
> You don't need any server string except on very special situations, l=
ike
> remote audio server.

Thanks.

> > Pavucontrol shows fldigi playback on and fldigi capture from. My K3
> > receiver is set to 14.070.15 and fldigi is set to 14070.00.=20
>=20
> If you are not controlling K3 through fldigi (flrig, hamlib, etc) the=
n
> its OK.
>
> > The sound
> > from the K3 speaker sounds like I might be getting some signals and=
 the
> > noise produces an occasional random character in fldigi's Rx field,=
 but
> > so far no waterfall. That is, I choose default PAL to be dark blue,=
 but
> > waterfall area is black
>=20
> Open pavucontrol, go to "Input Devices" and select the correct "Port"
> where you have connected K3

I've finally got a waterfall. I suspect this was by selecting USB Audio
CODEC as default card in alsamixer.

In pavucontrol, Input Devices, I see PCM2904 Audio Codec Analog Stereo
device. Its levels are high. It is not muted or locked or set to be
default. I see nothing about port here.

In fldigi. I set Xcvr Freq to 14070.150, the frequency to which the K3
is tuned. In Open List (book icon), I select "14070.000 USB BPSK31
10000" When I go to the middle of the waterfall (1500), the frequency
field shows 141071.662. That is, it seems fldigi's passband is outside
the 20 meter PSK31 band and this is why I get no signals. It seems
fldigi not listening to the 20 meter PSK31 band. The waterfall displays
sets of simple vertical lines about 220 Hz apart, each pair separated
by a weak line about 100 Hz from the left line.

Haines


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
