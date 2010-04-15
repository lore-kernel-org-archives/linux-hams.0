From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: USB converters and old hardware (Baycom in particular)
Date: Thu, 15 Apr 2010 22:22:11 +0300
Message-ID: <4BC76763.8080309@sral.fi>
References: <201004081508.45770.phillor@telstra.com>	<20100413135239.89243vh5ioxdtks0@mgtmail.com>	<g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com>	<201004151151.38923.phillor@telstra.com> <20100415104942.63522s5vbiv7a7i8@mgtmail.com> <4BC75156.9060907@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BC75156.9060907@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams <linux-hams@vger.kernel.org>

Dave Platt wrote:

> Another possible gotcha here... the Baycom is being
> used to transmit and receive AX.25 signals, which are
> 1200-bit/second *synchronous* data (HDLC), not asynchronous
> data as a UART normally sends!  Although I don't have a
> schematic of the device and am not certain how this is
> being done, the description at the above page leads me to
> believe that the host software is actually clocking the
> data out, a bit at a time, by toggling the TXD pin at
> the necessary data rate.

In a "baycom modem" the data is sent and received through handshake
lines (DTR and CTS) and one (RTS) is used for PTT. TXD only serves as an
additional power source.

The software (baycom kernel driver) controls the lines directly using
UART register access. All timing is done by the CPU, not the serial port
hardware. Transmit is done using CPU timers and reception relies on
interrupts from handshake line state changes and calculating their time
differences.

In essence, a baycom modem uses the serial port as three general purpose
i/o lines to do bitbanging i/o with stringent timing requirements.

> This just isn't going to work over a USB dongle!

Definitely not.

/Tomi

