From: braddock@braddock.com
Subject: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Mon, 8 Mar 2004 20:23:34 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040309022333.GA4377@braddock.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org
Cc: t.sailer@alumni.ethz.ch

Hi all,
I've been having problems getting user soundmodem to reliably copy on
an Inspiron 8200 linux RedHat9 machine with Intel i810 sound chipset
with a 2.4.25 kernel using the ALSA 1.03 drivers with a Kenwood TH-F6A
HT.  Any help is GREATLY appreciated.

Be warned that this is my first attempt at AX.25, but at this point
I'm pretty sure something must be amiss.

I'm attempting to receive frequent APRS traffic on 144.39 from an APRS
repeater located line-of-sight only about a mile away with 1200 baud
afsk mode with a very clean signal.  Demodulator parameters are afsk
mode, 1200 bits/s, "Frequency 0"=1200, "Frequency 1"=2200.

Using the soundmodemconfig diagnostic windows, what I see is what
appears to be a perfect clean signal during transmission, but an
uselessly high error rate in the decoding.  In the "Receive-Packets"
diagnostic window, when I turn the passall CRC check flag on, I'm
seeing messages that are 30% garbled at best (based on the callsign
addressing portions I can actually read).  With CRC checking enabled,
no packets are passed.

In the scope window I see glimpses of visually very clean modulated
sine waves with no clipping (I would dare say I could probably decode
the bitstream manually from just looking at the scope given enough
time).  The Spectrum Display shows well defined peeks at around 1200
and 2200 hz (twice the noise floor or better assuming the scale is
linear) with a band between during transmission.

Thinking it might just be very sensitive to signal levels, I've spent
literally hours adjusting audio levels of the radio and the mixer, and
swapped cables and adaptors.  I've attempted using line-in (both left
and right channels), mic-in, and even holding the radio speaker up to
the microphone (which doesn't seem to make things that much worse than
they are).

I've got my TH-F6A radio in it's dedicated TNC mode (though I've also
tried normal mode).

Does anyone have any ideas?  I've done a lot of googling and came
across one other posting to the list of a user with an i810 chipset
who had setup soundmodem successfully on two other systems but saw
similar noise problems on the third, but there was no public
resolution to the issue.

As a minor bug report FYI, soundmodem will not work with the OSS Intel
i810 drivers...it fails when it tries to put the driver into single
channel (non-stereo) capture mode.  THAT seems to be a driver issue
(which is why I'm now using ALSA).  That issue was reported to the
list before at http://he.fi/archive/linux-hams/200206/0002.html, but I
thought I might reiterate it.

Please CC: me with any response because I'm not on the list.

	-braddock









