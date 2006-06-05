From: Ladislav Vaiz <spam@nagano.cz>
Subject: Re: Sequencing of USB Serial ports
Date: Mon, 5 Jun 2006 15:31:49 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0606051528320.10547@nagano.cz>
References: <620c90570606041713s638711e4oe0fdb48667836ae7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570606041713s638711e4oe0fdb48667836ae7@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Chuck,
recommended way is to use udev. Informations about ttyUSBx are in file in 
/proc/tty/driver/something (I don't remember exact filename).
73 Lada OK1ZIA


On Sun, 4 Jun 2006, Chuck Hast wrote:

> Folks,
> I want to set up a machine with multiple USB serial ports, I have found that
> these devices do not always come on line as planned.
>
> I have a test machine that has ttyUSB0 and ttyUSB1, each one is assigned
> to a TNC and should always come up talking to the same hardware. At
> times the one that has been set up to be USB0 will take USB1 and visa-
> versa, if I plug a 3rd usb serial port on the machine it really becomes a
> crap shoot.
>
> I have been trying to figure out how to tie a particular piece of hardware
> (in this case a serial device) to a single device driver. So far have not
> been lucky, it appears that these things come up sort of randomly.
> I seem to recall seeing a code being read from each usb serial device,
> I am wondering if there is a way to get that code to be mapped to the
> tty device driver so say device with code (for grins) 1ab3dc will be
> mapped to ttyUSB0 regardless of what else is plugged into the thing,
> and if for some reason that device is removed USB0 is kept in reserve
> until the proper device is plugged back in or I go in and manually
> release it (if possible)
>
> This is a FPAC switch running Knoppix (Kernel 2.4.22-xfs). It has all of
> the ax25 stuff installed in it, since each tnc represents a link and the
> link is of course referenced to the ttyUSBn I need to keep the going to
> the right place...
>
> -- 
> Chuck Hast  -- KP4DJT --
> To paraphrase my flight instructor;
> "the only dumb question is the one you DID NOT ask resulting in my going
> out and having to identify your bits and pieces in the midst of torn
> and twisted metal."
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
