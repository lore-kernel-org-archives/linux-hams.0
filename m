From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB converters and old hardware (Baycom in particular)
Date: Thu, 15 Apr 2010 10:48:06 -0700
Message-ID: <4BC75156.9060907@radagast.org>
References: <201004081508.45770.phillor@telstra.com>	<20100413135239.89243vh5ioxdtks0@mgtmail.com>	<g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com>	<201004151151.38923.phillor@telstra.com> <20100415104942.63522s5vbiv7a7i8@mgtmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100415104942.63522s5vbiv7a7i8@mgtmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Another possible gotcha here... the Baycom is being
used to transmit and receive AX.25 signals, which are
1200-bit/second *synchronous* data (HDLC), not asynchronous
data as a UART normally sends!  Although I don't have a
schematic of the device and am not certain how this is
being done, the description at the above page leads me to
believe that the host software is actually clocking the
data out, a bit at a time, by toggling the TXD pin at
the necessary data rate.

I'm not sure how this is being done... but it may not
be possible at all in a USB dongle!  If they're setting
the UART to some weird data rate, and then transmitting
asynchronous bytes (e.g. one byte transmitted for each
bit they want to send), then maybe it'll work if the
USB dongle is capable of supporting this nonstandard
data rate.

The other way that they might be doing this, is writing
a bit into the UART control registers which turns on and
off the "Send a long space signal now!" feature... in effect,
taking direct control of the TXD line.  If that's the case, I
don't thing that this can be done via a USB dongle (at least,
not for this application), for a critical reason:

-  USB transactions happen once per millisecond.  That's the
   resolution with which you can send commands to the USB
   dongle.

-  Sending 1200 bit/second data via this method would require
   changing the TXD pins setting every 1/1200'th of a second.

Hmmm... let's see...

The Linux kernel driver for the Baycom SER12 modem appears to
be doing some such sort of low-level port trickery... it
bypasses / overrides the standard serial port driver, does
direct register-level control of the UART (works only
with UARTs that are register-compatible with the 8250
and 16xxx family), and appears to be dependent on handling
one interrupt per bit transmitted.

This just isn't going to work over a USB dongle!


