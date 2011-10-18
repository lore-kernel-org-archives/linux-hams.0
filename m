From: Dave Platt <dplatt@radagast.org>
Subject: Re: RS232-USB conversion
Date: Tue, 18 Oct 2011 14:16:39 -0700
Message-ID: <4E9DECB7.6050500@radagast.org>
References: <4E93FBEC.7050907@free.fr>	<4E98B35E.1050602@eunet.rs>	<4E993C82.2090601@free.fr>	<4E9959B1.20704@dommel.be>	<4E9DDC6B.8080702@eunet.rs> <20111018212126.3a1053bd.gordonjcp@gjcp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20111018212126.3a1053bd.gordonjcp@gjcp.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gordon JC Pearce <gordonjcp@gjcp.net>
Cc: Miroslav Skoric <skoric@eunet.rs>, linux-hams@vger.kernel.org


> If you use a USB-to-serial adaptor, it will appear as something like /dev/ttyUSB0 in Linux.  In Windows it's a bit hit-or-miss.

Some USB-to-serial adapters (e.g. those from FTDI) come with
individual machine-readable serial numbers scribed into each
individual chip, which can be read out by the host software.

This can be a definite advantage in Linux (and perhaps in Windows
as well) because it's possible to arrange for each specific
physical USB-to-serial adapter, to be assigned the same
device name in /dev each time it is connected.  On modern
Linux distributions you can use the "udev" scripts to
assign a name-alias, if you wish... so, for example, the
adapter you have connected to your TNC might always
be /dev/ttyTNC0.

Without a unique ID in the chip, device-name assignment is much
more hit-or-miss.  If you have two or more such adapters connected,
they may change "names" each time you reboot... it'll depend on just
what order your USB hubs and devices are recognized ("enumerated")
at boot time.  On Linux they'll swap /dev names around, on Windows
they will have different "virtual serial port" COM names.

The Prolific CP2103 USB-to-serial adapter chips (quite popular)
don't generally have IDs in them... I believe this chip *can*
be used with an external (I2C or SPI) EEPROM chip that holds
an ID, but very few manufacturers use this feature.

Interesting note - FTDI now makes a USB-to-serial adapter
which is built into a shell that's the same size as a
DB-9 male or female PC-mount connector, and has the
same pinout.  If you have a device which has a DB-9 RS-232
connector mounted on its PC board, you can unsolder this,
solder in the corresponding FTDI adapter, and your device
now has a USB-serial connection rather than RS-232.

Unfortunately they don't seem to make these to fit the
older DB-25 connector standard.

