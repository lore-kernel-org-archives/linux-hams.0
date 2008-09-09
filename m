From: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Subject: Re: USB devices
Date: Tue, 09 Sep 2008 09:53:54 -0400
Message-ID: <C4EBF832.22D4D%teners@bh90210.net>
References: <48C63625.3060104@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <48C63625.3060104@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wharms@bfs.de, Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org

Sir:

On 9/9/08 4:39 AM, "walter harms" <wharms@bfs.de> wrote:

> what das dmesg show ?

dmesg is a command in Unix that prints the message buffer of the kernel.

> what does lsusb show ?

lsusb is a utility for displaying information about USB buses in the system
and the devices connected to them

Neither writes or reconfigures anything, thus I suggest you try each one of
them as neither is harmful to your system.

You might wish to pipe them to "less"

lsusb | less

dmesg | less


> 
> re,
>   wh
> 
> Doug schrieb:
>> I have recompiled a kernel 2.6.18.8 for use with ham radio. Prior to the
>> recompile, my usb mass storage devices worked just fine... 16meg memory
>> strip and a 2.5 inch usb hard drive. After the recompile, neither shows
>> up when I plug them in. However, if I run USB VIEWER it shows them plugged
>> in. The USB mouse works just fine. I must of changed something in the
>> recompile, but not quite sure what.. Has anyone got any suggestions. I
>> would like to use both devices.
>> 
>> Thanks
>> Doug VE5DA
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 

Very Respectfully,

IT2 Stuart Blake Tener, USNR
Las Vegas, NV / Beverly Hills, CA / Philadelphia, PA / Washington, DC
Amateur Radio Call Sign: N3GWG (Extra) / Marine Radio Operator Permit (MROP)
email: teners@bh90210.net (also carbon copies to my Blackberry)
phone: +(1) 310.358.0202 (Beverly Hills, CA, forwards to mobile phone)
phone: +(1) 215.338.6005 (Philadelphia, PA, voice mail only)
E-Fax: +(1) 915.773.0935 (Telecopier, fax to email gateway)

Military emails (checked monthly until remote NMCI access is secured)
NIPRNET: stuart.tener@navy.mil
NRO:     teners@nro.mil
DOE:     teners@nv.doe.gov
SIPRNET: NONE
TS/SCI:  tenerstu@nro.ic.gov (GWAN)
TS/SCI:  stuart.b.tener@nga.ic.gov

Confidentiality Notice: This e-mail message, including any attachments, is
for the sole use of the intended recipient(s) and may contain confidential
and/or privileged information, though strictly at the UNCLASSIFIED level.
Any unauthorized review, use, disclosure or distribution is prohibited. If
you are not the intended recipient, please contact the sender by reply
e-mail and destroy all copies of the originate message.



