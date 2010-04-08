From: Phil <phillor@telstra.com>
Subject: USB converters and old hardware
Date: Thu, 8 Apr 2010 15:08:45 +1000
Message-ID: <201004081508.45770.phillor@telstra.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thank you for reading this.

I have two old hardware items that I would like to put back into service.

The first is a Baycom style modem that of course does not work with USB to 
serial converters because of the non-standard way in which the modem 
interacts with the serial port. An acquaintance told me that genuine USB to 
serial converters are available but a Google search does not indicate this to 
be true. Can anyone suggest how I might be able to use this modem again?

The second question is more programming related and concerns a hardware 
item that used to operate via a parallel port. I thought a USB to parallel 
converter would easily solve this problem but it does not. The converter 
does allow me to use an old printer and it does cause /dev/parport0 to be 
generated. The problem is that ioctl(fd,PPCLAIM) now causes the following 
error message to be displayed:

"Parport claim: No such device or address" 

This indicates to me that the parallel converter does what it is intended to 
do, allow the use of old printers, but nothing else. Is there an alternative 
way to programme such a port? I've played with the outport C instruction 
briefly but I'm unsure of the base address of the port. Are genuine serial and 
parallel ports available for newer computers?

I'm reluctant to build new gear when the old stuff works perfectly.

-- 
Regards,
Phil
