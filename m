From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB converters and old hardware (Baycom in particular)
Date: Thu, 15 Apr 2010 13:41:58 -0700
Message-ID: <4BC77A16.3050804@radagast.org>
References: <201004081508.45770.phillor@telstra.com>	<20100413135239.89243vh5ioxdtks0@mgtmail.com>	<g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com>	<201004151151.38923.phillor@telstra.com>	<20100415104942.63522s5vbiv7a7i8@mgtmail.com>	<4BC75156.9060907@radagast.org> <y2ask6web1q.fsf@cartman.at.offog.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <y2ask6web1q.fsf@cartman.at.offog.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Adam Sampson wrote:
> Dave Platt <dplatt@radagast.org> writes:
> 
>> I'm not sure how this is being done... but it may not be possible at
>> all in a USB dongle!
> 
> You might be pleasantly surprised. The FTDI USB-to-serial chips have a
> bit-banging mode that's designed for doing this sort of thing, where you
> can tell it to just clock a sequence of bits out to the pins (or read
> one in) at a fixed rate. It'd need some software fiddling, of course,
> and if you're going to that much effort I'd be tempted just to stick a
> microcontroller in the way to give the modem a more convenient serial or
> USB interface...

You're right, I hadn't thought about those particular USB chips in this
context.  They would require something other than the standard serial-port
host driver (i.e. a special driver, or at least some specialized ioctls
or other modes in the existing driver) since they aren't being used
as UARTs.

Yes, sticking a microcontroller between the modem chip and the USB
would certainly ease things.  That's the approach that the TNC-X
takes... it's a PIC micro hooked to a modem chip, which then
connects either to a serial port or to an on-board FTDI serial-to-USB
interface.  It speaks KISS over the host interface, and is thus
fairly easy to support on the host side.

