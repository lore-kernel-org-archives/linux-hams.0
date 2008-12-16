From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB sound adapter for use with Tom's soundmodem?
Date: Tue, 16 Dec 2008 12:14:53 -0800
Message-ID: <49480C3D.2000203@radagast.org>
References: <49432397.8060304@weca.org> <courier.4943332E.0000255C@radagast.org> <4388.219.89.148.235.1229141951.squirrel@webmail02.lancs.ac.uk> <courier.4943435B.000044D7@radagast.org> <2916.219.89.148.235.1229158504.squirrel@webmail02.lancs.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2916.219.89.148.235.1229158504.squirrel@webmail02.lancs.ac.uk> 
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


> By studying this I hope to be able to figure out the magic involved in
> accessing one of the CMedia chips' HID endpoints and twizzling its
> GPIOs.

Well, phooey.

I did some digging last night and determined a few things:

-  The USB audio dongle I have doesn't use a CMedia chip.  Rather,
    its chip is from TenX Technologies.

-  The TenX chip is, basically, a USB-enabled 8051 micro with some
    analog capabilities:  a single-channel ADC with differential
    inputs, and a pair of PWM outputs that are filtered down to create
    a continuous analog signal for headphones or speakers.

-  The USB endpoints appear to be managed via the 8051 firmware,
    which is in OTP.

-  The sample rates supported by the audio-in and audio-out
    streaming endpoints are different, and disjoint - there doesn't
    not appear to be a common sound rate for the two interfaces!
    This is unlike the TI chip used in the SignaLink USB, whose input
    sample rates are a superset of the output sample rates.  Use of
    the plughw: ALSA sample rate converter would be required.

-  The chip has plenty of GPIO pins, two of which appear to be wired
    up to the power and activity LEDs on the dongle.

-  Some GPIO pins are intended to be hooked up a keyboard scanning
    matrix.  The HID input-report descriptor provided by this version
    of the chip identifies features like VOLUME UP, MUTE, and so
    forth.  There's also a second HID input report which seems to have
    a bunch of unspecified input flags in it.

-  There is no HID output endpoint, and no output HID reports defined...
    and thus no ability to control any of the GPIO pins from the USB
    host.

Hence, no PTT control in software.  This particular brand of chip
doesn't appear to be suitable for a simple "all in one" packet audio
USB interface, unless chips can be sourced directly from the manufacturer
and some different firmware programmed into them... seems excessive.

The CMedia chips might be a better choice... I'll have to see if I
can find a local cheap source for a USB dongle with one of these in it.

A third alternative would be a USB audio interface which uses one of
the TI streaming audio controller chips... these are also 8051-core
micros, but it appears that the main code is located from an external
EPROM rather than from OTP within the chip.  The SignaLink USB uses
one of these chips - I'll try interrogating its HID report structure
and see whether there are any output reports which might control one
of the GPIO pins.

If so, there may be a very interesting prospect for homebrewers:
the Behringer UCA202.  This is a stereo USB/audio adapter which
(from what I've read) uses one of these TI chips internally... and
it's available for $25-$30 from numerous online sources.  If there's
a way to write its GPIO pins, then a board scavenged from a UCA202,
plus a couple of isolation transformers and an optoisolator for PTT,
might make a very nice packet interface.  And, what's more, it has
stereo-audio goesintas and goesoutas, which means that it could be used
with an I/Q modulator/demodulator front end... software DSP single
sideband or OFDM, anyone?



