From: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Subject: Re: USB converters and old hardware
Date: Thu, 15 Apr 2010 10:49:42 -0400
Message-ID: <20100415104942.63522s5vbiv7a7i8@mgtmail.com>
References: <201004081508.45770.phillor@telstra.com>
	<20100413135239.89243vh5ioxdtks0@mgtmail.com>
	<g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com>
	<201004151151.38923.phillor@telstra.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <201004151151.38923.phillor@telstra.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

Phil, et alia:

> I have an unbranded duel port USB to serial converter that works perfectly
> with all sorts of serial devices except my Baycom clone modem. Can
> anyone confirm that the Keyspan converter will allow me to use my modem
> once again? The tripplite site does not say that their converter provides a
> genuine serial port and I suspect that it doesn't.

Firstly, I think you mean "dual" not "duel", since we are speaking of  
multiplicitous serial ports not a sword fight.

Secondly, a "genuine serial port" would be just that (a serial port  
implemented within hardware that is NOT a USB to serial port cable),  
and I would not think that anyone (a company or anyone on this list)  
would confirm that something is a "genuine serial port", when in fact  
it is not. To suggest someone would or should do so is ludicrous.

Teriarilly, the manner by which these devices function is to provision  
what could be considered as close to a "genuine serial port" as is  
possible. If one loads the driver, then attaches the appropriate  
USB/Serial cable to the system, then making a small test jig you can  
be assured of its functionality as proper.

To test weather a USB/serial port's functional capabilities, I have a  
DB-9 loopback connector (pins 2 and 3 are shorted together) that  
allows me to test such devices. Once connected, I go into a serial  
terminal software (such as Hyper Terminal for Windows) and attempt to  
type and see if the characters typed are echoed back.

If subsequent to such an exercise, functionality is apparent while  
using the baud rate and communications parameters that are appropriate  
for your application, then the device is functioning and works, period.

I have never seen any situation where a functional serial port/USB  
cable works with one device and not another, when all communications  
parameters are equal. However, that said, there are cases where if you  
set a modem to operate at say, above 56Kbps, and the USB/Serial cable  
only supports up to 9.6Kbps, then you might have a spot of trouble  
there, but this is not an incompatibility so much as a design  
limitation of the USB/Serial device vice the communications parameters  
of the device you wish to communicate with.

I believe most serial based Amateur Radio Packet Modems operate at a  
maximum speed of 9.6Kbps or 19.2Kbps (maybe even 56Kbps in some rare  
cases). Your device maybe configured differently, but I would suggest  
investigating this and the other communications parameters (such as  
parity, word length, stop bits, etc...).


> Even though Soundmodem works well I have found that my Baycom
> modem is far superior in that it will decode packets just above the noise
> level. Rather than fool around with USB to serial converters maybe I might
> be better off looking for a used TNC?
>

You may choose to suspect whatever you like, but a genuine serial port  
would be just that, not using a USB to Serial dongle, thus I doubt any  
company would even write such a thing. It seems you are rather  
frustrated, which I can understand entirely, but that does not relieve  
everyone from thinking with logic and addressing the problem with a  
measured and methodical manner by which to attempt its resolution.

Before we declare the USB/Serial device you have useless, let's  
conduct some of the testing proffered herein above in precedence to  
presuming it is the fault of the USB/Serial device. It might be  
working fine after all.


V/R,

Stuart, N3GWG


Quoting Phil <phillor@telstra.com>:

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
>
> By the way, for those who suggested a PCMCIA option, my laptop does not
> have a PCMCIA slot.
>
> --
> Regards,
> Phil
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
IT2 Stuart Blake Tener, USNR, N3GWG (Extra), MROP
Beverly Hills, CA / Las Vegas, NV / Philadelphia, PA / Washington, DC
mobile: (310) 358-0202
Nextel: 124*233172*14 (direct connect)
e-mail: teners@bh90210.net
Quoting Phil <phillor@telstra.com>:

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
>
> By the way, for those who suggested a PCMCIA option, my laptop does not
> have a PCMCIA slot.
>
> --
> Regards,
> Phil
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
IT2 Stuart Blake Tener, USNR, N3GWG (Extra), MROP
Beverly Hills, CA / Las Vegas, NV / Philadelphia, PA / Washington, DC
mobile: (310) 358-0202
Nextel: 124*233172*14 (direct connect)
e-mail: teners@bh90210.net

