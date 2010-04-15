From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB converters and old hardware (in general)
Date: Thu, 15 Apr 2010 10:47:33 -0700
Message-ID: <4BC75135.3030905@radagast.org>
References: <201004081508.45770.phillor@telstra.com>	<20100413135239.89243vh5ioxdtks0@mgtmail.com>	<g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com>	<201004151151.38923.phillor@telstra.com> <20100415104942.63522s5vbiv7a7i8@mgtmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100415104942.63522s5vbiv7a7i8@mgtmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> I have never seen any situation where a functional serial port/USB cable
> works with one device and not another, when all communications
> parameters are equal. However, that said, there are cases where if you
> set a modem to operate at say, above 56Kbps, and the USB/Serial cable
> only supports up to 9.6Kbps, then you might have a spot of trouble
> there, but this is not an incompatibility so much as a design limitation
> of the USB/Serial device vice the communications parameters of the
> device you wish to communicate with.

There are some other issues which can be relevant, and which may
show up as incompatibilities between certain serial ports ("real"
or USB) and certain devices.

For one thing:  voltage.  "True" RS-232 signaling voltages are
bipolar, with a logic-1 being -3 to -12 volts with respect to
ground, and logic-0 being +3 to +12 volts.  The voltage range
between -3 and +3 is a no-sentient-beings'-land - it's
an undefined state.

Serial ports and adapters which want to be truly RS-232
compatible will generate output voltages which swing both
positive and negative.  There are specialized RS-232 driver
chips (the Maxim MAX232 and its cousins are the best known)
which can do this when powered from USB or a similar 5-volt
unipolar power bus - they have voltage doublers/inverters which
can ensure that they can swing their pins at least a few
volts below ground.

Many serial ports these days don't transmit "true RS-232" -
they swing their pins up to +5, and down to ground, but don't
pull the pins to a negative voltage.  They depend on the
receiving device being tolerant of this behavior... and in fact
a majority of serial port receiver circuits set their detection
threshold at somewhere around +1.5 volts, and treat a zero-volt
(ground-level) input as being equivalent to a negative voltage.

I strongly suspect that some inexpensive serial-port adapters
don't generate real RS-232 (negative output voltages).  These
may not work with some older peripherals which assume a true
RS-232 port, and require that the signals swing down well below
ground voltage.

"Parasitic" powering is another issue.  There are a number of
small external peripherals which don't have their own power
supplies, and expect to be able to "steal power" from the
RS-232 port itself... often from the RTS and DTR signals.
These devices may not work reliably if the RTS/DTR pins swing
only a few volts above ground, or if these pins have a high
output impedance and can't source more than a milliamp or
two of current before their voltage sags.

These sorts of voltage and current incompatibilities can
affect both "real" serial ports (e.g. UARTs hooked to the
ISA or PCI or PCMCIA busses) and USB serial-port dongles.
I've heard of devices that will work well with most older
desktop/server PCs, but which don't work with many laptops...
for precisely this reason.

I believe that the Baycom serial modem is probably one such
device.  According to the documentation I found at the
http://www.baycom.org/bayweb/tech/anst.htm page, this device
is parasitically powered from the DTR and RTS lines - it
expects to see a 12-volt level on these pins, and filters
and regulates this down to +5 in order to power its logic
circuitry.  In addition, it appears to assume that the
TX and RX pins are also swinging / to-be-swung +/-12 volts.

This device does *not* include a MAX-232 or similar RS-232
level shifter device, to buffer between its own internal CMOS
logic chips and an RS-232 bus... the documentation makes it
clear that they chose to save money by using a combination
of specific CMOS logic chips and discrete switching transistors.
This saved money, but it looks to me as if it had the side
effect of making the device very dependent on being hooked
to a "true" RS-232 port with high-voltage bipolar voltage
drive.

I rather strongly suspect that this device won't work
properly (without extensive hardware modifications) with any
5-volt-only "pseudo-RS-232" serial port, whether it be one in
a laptop or one in a USB dongle.  Furthermore, it probably
won't work with any serial port whose DTR/RTS pins have a
low drive capability (as I suspect is true for many serial
port USB dongles).

There may very well be serial-port dongles which have
"true" RS-232 outputs:  a MAX-232-type chip powered from
the USB 5-volt bus could swing its outputs to +/- 10 volts,
which would probably work OK, and such a device *could* have
enough drive power on the RTS/DTR pins to power the Baycom.

Unfortunately I can't recommend any specific brand... I haven't
tested for this.  Experimentation would be required.

I imagine it would be possible to build an intermediate
power/level-shifter box, which would sit between the USB
serial-port dongle and the serial modem.  A couple of 9-volt
alkaline batteries, and a few transistors to serve as
level converters, would convert the dongle's 5-volt
output signals to +/-9 signals, and provide enough power to
run the serial modem.


