From: Apostolos Kefalas <sv1ljj@raag.org>
Subject: Re: fldigi setup question
Date: Thu, 23 Jun 2016 12:28:24 +0300
Message-ID: <1466674104.1592.6.camel@raag.org>
References: <20160619135457.GN4605@engels.historicalmaterialism.info>
	 <20160623011533.GB12415@engels.historicalmaterialism.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-njpfEdpbxLMavffNfhgM"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160623011533.GB12415@engels.historicalmaterialism.info>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Haines Brown <haines@histomat.net>
Cc: linux-hams@vger.kernel.org


--=-njpfEdpbxLMavffNfhgM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On =CE=A4=CE=B5=CF=84, 2016-06-22 at 21:15 -0400, Haines Brown wrote:=20
> There was no response to the question of my original post. I assume that
> this was because it was too open ended. So I'll be more specific.
>=20
> I'm running debian Wheezy with a SignaLink USB sound card and fldigi
> software. The transmitter is a K3 tuned to 14.070, TX DATA mode USB. My
> computer uses PulseAudio as default. Alsamixer also sees the presence of
> SignaLink's USB Audio CODEC, which is un-muted and at 84%.
>=20
> The SignaLink USB instructions tell me to make sure the software's
> transmit and receive audio card is set to USB Audio CODEC. I go to
> fldigi, Configure, Soundcard. Although PulseAudio is present on the
> computer, not wishing to use PulseAudio for fldigi, I have selected
> PortAudio. I assume I can do this. Am I wrong?

No you are not wrong... though I can not understand why you want to do
that. Portaudio will use ALSA which will redirect you through
Pulseaudio!!!


>=20
> PortAudio does not offer an option to choose the Transmit and Receive
> audio card, but instead the Capture and Playback card. I set PortAudio
> Capture to the SignaLink's USB Audio CODEC card. But the fldigi
> PortAudio Playback does have that option. Its options are Xonar DX (my
> computer's sound card) HDA NNvidia (motherboard audio chip), iec958,
> spdif (a cable?), pulse (PulseAudio?) and default (my computer's Xonar
> sound card?). USB Audio CODEC is not a choice. Should it be? Should I
> instead use iec958?

Make sure you have installed libportaudio packages.

>=20
> Pavucontrol sees "ALSA Plugin [fldigi]" for ALSA Capture under Recording
> and sees PCM2904 Audio Codec Analog Stereo among Output
> Devices. Question: shouldn't what pavucontol sees and the values it sets
> be irrelevant?

See above!!!

>=20
> And the fldigi waterfall is strange. Fldigi is set to PSK31 at
> 14070.000. The waterfall sees noise only in a band at its center
> (14071.240 to 14071.716) and at its extreme left edge (14070.041). While
> the middle region has nothing that looks like signals (unless it itself
> is a broadband signal), the left edge looks as though it is close to the
> IM distortion of a signal just out of range. Although the central region
> has no visible PSK31 signals and I hear no PSK31 warble, it and the
> extreme left produce garbage text ("e S tite ate oee o e too=3D"), whethe=
r
> I set the demodulation for frequency or phase shift. The only effect
> changing the demodulation is that with RTTY, the garbage is upper case.
>=20
> Please help.
>=20
> Haines Brown KB1GRM
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=-njpfEdpbxLMavffNfhgM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa6u4AAoJEC8RbMGjwZ2g2CEQALpRyJ8YiuTQp/JjoAHmcuBy
DYxy+jLqVDghTCpF8giogp0XnvNM5ibgXxvbP8Ga0wVOR2ZX8cc+yyj6IsdfsYsH
wXpbuDqZ2FW6ES4zM8HkaBjoHgsfHx1wHKzAsqcwwUvVBUYs/KlmBVYv4txvx+pr
7kxVw7ssbK7gH/9TG9E/rW5oAlr18TEUMNVQpcKzmOv9S6cXxVBaqRy9GFhP4/ff
UXLQGMY3aiM4AZANSh5ApKjzrqGJDueb2nLoUS14L/j6IgftcQaX0iqdiGw4U5dR
XBi3HrYWvIWdwAkQ37DSNMVGJuarnq5zycNbs+tXMX7KWBgWDYgdpqqjmq/3rfj2
tBdzETCZUzxIM/ztna6GxrAC82s+HoqnN85VGcRcdmSra/B5pHN2b/YGh3XrWR8J
Njg2abYp/aspJp+XCG16zvW+ZTL/gAnvPh/7INycdZQBOFN/QPvEufKsaeAgMO7a
JueDkLZ6yWmdWWCjT43UJA5B6XMvax7PKWol62KQv6l/wT2qGEEJBuLkNm+lIY3e
d4opQaq4JjeX4uG1QdPgQz2GbStY0vW+WTbonJagraNuQG4VJJGlMlJt9jFv1if4
gx8CFiv/d4By4VuJXSrIruwdeJStSvkFRr+mQ8sAq0eLHu3qV8ce8rYcfbcI06mP
XIh+ADdNFjoiU9fpUs7L
=b+tT
-----END PGP SIGNATURE-----

--=-njpfEdpbxLMavffNfhgM--



