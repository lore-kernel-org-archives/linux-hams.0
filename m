From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB sound adapter for use with Tom's soundmodem?
Date: Fri, 12 Dec 2008 21:08:43 -0800
Message-ID: <courier.4943435B.000044D7@radagast.org>
References: <49432397.8060304@weca.org>
 <courier.4943332E.0000255C@radagast.org>
 <4388.219.89.148.235.1229141951.squirrel@webmail02.lancs.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4388.219.89.148.235.1229141951.squirrel@webmail02.lancs.ac.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, a.errington@lancaster.ac.uk

> Here's a report of someone successfully using one in Linux, with a picture
> to show the particular model (there are many USB audio adaptors, but that
> particular plastic moulding style seems common):
>
> http://www.hermann-uwe.de/photoblog/3d-sound-usb-audio-device
>
> Here's some further information on actually getting the driver running:
>
> http://www.hermann-uwe.de/blog/playing-audio-on-the-nslu2

A lot of these inexpensive USB audio dongles seem to use chipset by
CMI.  The one I tried (around $7, mail-order from Taiwan) works fine
iwht the Linux USB audio driver, at least for simple functions.

> Maybe the sampling rate mismatch will be an issue with these devices too.
>
> :(

Could be.  The same remedy should apply - plughw will work on top of
pretty much any hardware implementation.

I think I'll add plughw: entries to the ALSA glue code's dialog, as a
hint to users that there might be a reason to use this feature.

> My particular interest is in the LEDs on the USB thingummybob.  If they
> can be programmed easily then the audio adapter could become a self
> contained audio in/out/PTT device (with the LED line controlling a
> transistor or something for PTT).  I don't yet have a unit to experiment
> with (despite them being very cheap) but I think the idea has merit.  If
> someone else wants to dabble...

Unfortunately, in the case of the CMI-chipset devices I've looked at,
the LED functionality is hardwired by the chip.  Open the audio
endpoints and start doing reads or writes, and the LED starts
blinking.  I couldn't see any way in the chipset register
documentation to control the LEDs directly, or change their behavior
(e.g. non-blinking, illuminate-on-output-only, etc.).  So, I'm afraid
that either a separate serial/parallel-port PTT, or a vox-like PTT
circuit (such as I believe the SignaLink USB uses) will be necessary.

On a related subject - has anyone come across any modern, usable,
halfway-readable sample code for doing Linux USB I/O to HID endpoints?
A fair number of chips seem to have one or more GPIO pins, addressible
via HID endpoints, but I've been quite unable to make any sense of the
various Linux documentation on how one might actually read/write these
sorts of endpoint entities.
