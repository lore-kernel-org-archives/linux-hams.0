From: Dave Platt <dplatt@radagast.org>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Mon, 13 Jun 2011 12:40:11 -0700
Message-ID: <4DF6679B.1080103@radagast.org>
References: <4DF663E7.7040100@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4DF663E7.7040100@f8arr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: f8arr <f8arr@f8arr.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On 06/13/2011 12:24 PM, f8arr wrote:
> Hello Hams !
> 
> Apologies for the bandwich, but perhaps someone has allready faced it ...
> 
> 
> Here is the case :
> In order to have a TX port on WSJT I use /dev/ttyUSB0 from prolific pl2303.
> At boot, the serial comes up to TX.

I'm not certain what you mean here.  Does this mean that the
transmitter is keyed up into TX, as soon as the system boots
and the USB serial port adapter is recognized by the kernel?

If so, this would suggest one of several things:

-  Your PL2303 adapter is asserting either DTR or RTS
   when it is first initialized, without waiting for some
   program to open the USB serial port.

   [Question - which of these lines are you using to drive
    PTT on your transmitter?]

-  Some (unexpected) program is opening /dev/ttyUSB0 as soon
   as the adapter is connected.

> On messages I have only this message :
> 
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.706035] usb 3-1: new full
> speed USB device using uhci_hcd and address 8
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852805] usb 3-1: New USB
> device found, idVendor=067b, idProduct=2303
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852814] usb 3-1: New USB
> device strings: Mfr=1, Product=2, SerialNumber=0
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852819] usb 3-1: Product:
> USB-Serial Controller
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852823] usb 3-1:
> Manufacturer: Prolific Technology Inc.
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.855943] pl2303 3-1:1.0:
> pl2303 converter detected
> Jun 13 17:00:08 f8arr2-station kernel: [ 3574.868109] usb 3-1: pl2303
> converter now attached to ttyUSB0


> Of course, If I run WSJT it can't commute the TX with an error message
> "Can't connect to /dev/ttyUSB0"

That suggests that either the permissions are wrong, or that some
other program/process has already opened the serial port for
some reason.

> My user is on the "dialout" and "uucp" group.

When the system is in this state, try the following:

	ls -l /dev/ttyUSB0
	lsof | grep ttyUSB0

The output for the first command will show you what
owner/group information was set up for the port during
the hot-plugging.

The output for the second command should help you see
whether there's another program "busying out" the
USB serial port.

> I tried exactly the same manipulation with my only real RS232 port and
> it works like a charm.. (but dedicated to an other action).
> Of course, same configuration was ok under my ubuntu 10.04. but I
> switched to Fedora 15...

That suggests that the adapter itself is OK, and that it's either
an issue of permissions for the port (which would be set via
a configuration file in /etc/udev/), or an issue of some other
program opening the port (maybe something looking for a serial
mouse or a modem?)

