From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB sound adapter for use with Tom's soundmodem?
Date: Mon, 15 Dec 2008 15:47:00 -0800
Message-ID: <courier.4946EC74.00003B45@radagast.org>
References: <49432397.8060304@weca.org>
 <courier.4943332E.0000255C@radagast.org>
 <4388.219.89.148.235.1229141951.squirrel@webmail02.lancs.ac.uk>
 <courier.4943435B.000044D7@radagast.org>
 <2916.219.89.148.235.1229158504.squirrel@webmail02.lancs.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2916.219.89.148.235.1229158504.squirrel@webmail02.lancs.ac.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, a.errington@lancaster.ac.uk

> How exciting!  Of course, it's hit and miss as to whether you get this
> chip in any particular adaptor, but it's possible that the LEDs are hooked
> up to some fixed function (as you have discovered) but that the GPIO pins
> are free.  It's also possible that the vendor has chosen to disable this
> function as the chips are highly customisable.
>
> Wishful thinking perhaps, especially as I haven't looked for a datasheet
> yet (more to the point, I don't actually have one of these doodads
> either.)
>
> Actually, reading your email again, are these the GPIO endpoints that you
> can't yet work out how to write to?

Yup.  Those are the ones.

There may be some light a'glimmering, though.  In another discussion
today I ran across an open-source project for a general-purpose
programmer board for PIC and AVR and I2C and SPI devices, which uses a
USB-enabled PIC as its basis.  The PIC presents a 64-byte HID packet
interface, and the developer has provided source code for the
Linux software needed to communicate with it and send the packets that
its firmware expects.

By studying this I hope to be able to figure out the magic involved in
accessing one of the CMedia chips' HID endpoints and twizzling its
GPIOs.

If that succeeeds, then it might be possible to gut one of these cheap
dongles. hook it up to a couple of isolation transformers and an
optocoupler, and drive a transceiver with it... a homebrew near-
equivalent to the SignaLink USB.

Doing so would require that the packet software (or whatever) know how
to tell the GPIOs to go up and down.  I'm not sure that the usual
approach of opening a kernel device and using ioctl() calls would be
appropriate... a change to the software to run an external application
to assert and deassert PTT might be preferable.

