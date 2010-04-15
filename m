From: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Subject: Re: USB converters and old hardware
Date: Thu, 15 Apr 2010 12:56:48 -0400
Message-ID: <20100415125648.885567bbiupkrwg0@mgtmail.com>
References: <201004081508.45770.phillor@telstra.com>
	<20100413135239.89243vh5ioxdtks0@mgtmail.com>
	<g2t9923fd661004132237z48f024d3va4ee598ab4d5cf10@mail.gmail.com>
	<201004151151.38923.phillor@telstra.com> <4BC73703.9030400@ve7hex.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BC73703.9030400@ve7hex.ampr.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: Niall Parker <niall@ve7hex.ampr.org>
Cc: Phil <phillor@telstra.com>, linux-hams@vger.kernel.org

Quoting "Niall Parker" <niall@ve7hex.ampr.org>:
> A Baycom style modem relies on a 'real' serial port because it  
> _isn't_ using the serial port for typical asynchronous  
> communications but rather  twiddling the control/data lines at a bit  
> level via the registers of the once ubiquitous 8250 (and clones)  
> UART. While it is conceivable that one could write a device driver  
> for the USB chips that does the same thing (in particular the FTDI  
> USB/serial chips have some options for bit level control), running  
> the Baycom driver on top of an asynch emulation USB driver is going  
> to be problematic with all the extra latencies involved. A fast  
> enough PC might do it, but as you've found it often won't work at all.

I did not realize that the Baycom modem used the serial port for this,  
and presumed from the originate poster wrote, that it was a  
communications type problem. That said, I would not be surprised if  
the Keyspan is capable of this type of usage anyway; they really do  
make a quality product.

However, if that is the case, then a USB type docking station might be  
a better choice. While they do work via USB, the serial port is "real"  
in most cases, and would provision the type of signaling most likely  
that he requires. eBay might have many choices that are priced  
reasonably.


V/R,

Stuart, N3GWG


> Phil wrote:
>> On Wed, 14 Apr 2010 03:37:03 pm Douglas Cole wrote:
>>> I have to agree, I use the Keyspan adapters at work and at home.
>>> They work for me as well, both the multiport devices as well as the
>>> single port ones (USA19-HS)...
>>> Port replicator for my work HP laptop gives me a 'real' serial port
>>> (COM1 in Win32 land)...
>>>
>>
>> Thanks Doug and Stuart for the extra information.
>>
>> I have an unbranded duel port USB to serial converter that works  
>> perfectly with all sorts of serial devices except my Baycom clone  
>> modem. Can anyone confirm that the Keyspan converter will allow me  
>> to use my modem once again? The tripplite site does not say that  
>> their converter provides a genuine serial port and I suspect that  
>> it doesn't.
>>
>> Even though Soundmodem works well I have found that my Baycom modem  
>> is far superior in that it will decode packets just above the noise  
>> level. Rather than fool around with USB to serial converters maybe  
>> I might be better off looking for a used TNC?
>
> A Baycom style modem relies on a 'real' serial port because it  
> _isn't_ using the serial port for typical asynchronous  
> communications but rather  twiddling the control/data lines at a bit  
> level via the registers of the once ubiquitous 8250 (and clones)  
> UART. While it is conceivable that one could write a device driver  
> for the USB chips that does the same thing (in particular the FTDI  
> USB/serial chips have some options for bit level control), running  
> the Baycom driver on top of an asynch emulation USB driver is going  
> to be problematic with all the extra latencies involved. A fast  
> enough PC might do it, but as you've found it often won't work at all.
>
> A serial TNC on the other hand just talks plain ole asynch serial  
> and will work fine.
>
> 				... Niall
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

