From: "Chuck Hast" <wchast@gmail.com>
Subject: Sequencing of USB Serial ports
Date: Sun, 4 Jun 2006 20:13:41 -0400
Message-ID: <620c90570606041713s638711e4oe0fdb48667836ae7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Folks,
I want to set up a machine with multiple USB serial ports, I have found that
these devices do not always come on line as planned.

I have a test machine that has ttyUSB0 and ttyUSB1, each one is assigned
to a TNC and should always come up talking to the same hardware. At
times the one that has been set up to be USB0 will take USB1 and visa-
versa, if I plug a 3rd usb serial port on the machine it really becomes a
crap shoot.

I have been trying to figure out how to tie a particular piece of hardware
(in this case a serial device) to a single device driver. So far have not
been lucky, it appears that these things come up sort of randomly.
I seem to recall seeing a code being read from each usb serial device,
I am wondering if there is a way to get that code to be mapped to the
tty device driver so say device with code (for grins) 1ab3dc will be
mapped to ttyUSB0 regardless of what else is plugged into the thing,
and if for some reason that device is removed USB0 is kept in reserve
until the proper device is plugged back in or I go in and manually
release it (if possible)

This is a FPAC switch running Knoppix (Kernel 2.4.22-xfs). It has all of
the ax25 stuff installed in it, since each tnc represents a link and the
link is of course referenced to the ttyUSBn I need to keep the going to
the right place...

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
