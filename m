From: Niall Parker <niall@ve7hex.ampr.org>
Subject: Re: USB converters and old hardware
Date: Thu, 15 Apr 2010 08:55:47 -0700
Message-ID: <4BC73703.9030400@ve7hex.ampr.org>
References: <201004081508.45770.phillor@telstra.com> <20100413135239.89243vh5ioxdtks0@mgtmail.com> <g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com> <201004151151.38923.phillor@telstra.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <201004151151.38923.phillor@telstra.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

Phil wrote:
> On Wed, 14 Apr 2010 03:37:03 pm Douglas Cole wrote:
>> I have to agree, I use the Keyspan adapters at work and at home.
>> They work for me as well, both the multiport devices as well as the
>> single port ones (USA19-HS)...
>> Port replicator for my work HP laptop gives me a 'real' serial port
>> (COM1 in Win32 land)...
>>
> 
> Thanks Doug and Stuart for the extra information.
> 
> I have an unbranded duel port USB to serial converter that works perfectly 
> with all sorts of serial devices except my Baycom clone modem. Can 
> anyone confirm that the Keyspan converter will allow me to use my modem 
> once again? The tripplite site does not say that their converter provides a 
> genuine serial port and I suspect that it doesn't.
> 
> Even though Soundmodem works well I have found that my Baycom 
> modem is far superior in that it will decode packets just above the noise 
> level. Rather than fool around with USB to serial converters maybe I might 
> be better off looking for a used TNC?

A Baycom style modem relies on a 'real' serial port because it _isn't_ 
using the serial port for typical asynchronous communications but rather 
  twiddling the control/data lines at a bit level via the registers of 
the once ubiquitous 8250 (and clones) UART. While it is conceivable that 
one could write a device driver for the USB chips that does the same 
thing (in particular the FTDI USB/serial chips have some options for bit 
level control), running the Baycom driver on top of an asynch emulation 
USB driver is going to be problematic with all the extra latencies 
involved. A fast enough PC might do it, but as you've found it often 
won't work at all.

A serial TNC on the other hand just talks plain ole asynch serial and 
will work fine.

				... Niall
