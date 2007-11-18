From: "Phil" <phillor@telstra.com>
Subject: USB to serial converter question
Date: Mon, 19 Nov 2007 07:16:19 +1000
Message-ID: <001201c82a28$a670d510$cf59ef0a@MOTORHOME>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

Thank you for reading this.

At first sight this may appear to be an off-topic question but it does 
relate to amateur radio because without a functioning serial port I don't 
have any useful amateur radio applications.

I have a USB to serial converter that worked out of the box with successive 
Mandriva versions up until Mandriva 2008. Plugging the USB converter into a 
USB slot used to automatically generate a /dev/ttyUSB0 device; now it 
doesn't. Also, now my PCMCIA modem isn't working, no doubt, for the same 
reason.

modprobe ftdi_sio, which is the module for the converter, causes the 
following error messages to be displayed:

WARNING: Error inserting usbserial 
(/lib/modules/2.6.22.9-laptop-1mdv/kernel/drivers/usb/serial/usbserial.ko.gz): 
Unknown symbol in module, or unknown parameter (see dmesg)

FATAL: Error inserting ftdi_sio 
(/lib/modules/2.6.22.9-laptop-1mdv/kernel/drivers/usb/serial/ftdi_sio.ko.gz): 
Unknown symbol in module, or unknown parameter (see dmesg)

lsusb -v displays information about the converter, so it is known to the 
system.

I can't see anything in dmesg that relates to either module. I have scoured 
the Internet as well as posted questions to the Mandriva mailing list and 
haven't found anything that might lead to the answer. Can anyone offer a 
suggestion?

Regards,
Phil.

