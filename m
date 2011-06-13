From: f8arr <f8arr@f8arr.org>
Subject: Issue with RS232 <-> USB adaptor (FC15)
Date: Mon, 13 Jun 2011 21:24:23 +0200
Message-ID: <4DF663E7.7040100@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hello Hams !

Apologies for the bandwich, but perhaps someone has allready faced it ...


Here is the case :
In order to have a TX port on WSJT I use /dev/ttyUSB0 from prolific pl2303.
At boot, the serial comes up to TX.
On messages I have only this message :

Jun 13 17:00:08 f8arr2-station kernel: [ 3574.706035] usb 3-1: new full 
speed USB device using uhci_hcd and address 8
Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852805] usb 3-1: New USB 
device found, idVendor=067b, idProduct=2303
Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852814] usb 3-1: New USB 
device strings: Mfr=1, Product=2, SerialNumber=0
Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852819] usb 3-1: Product: 
USB-Serial Controller
Jun 13 17:00:08 f8arr2-station kernel: [ 3574.852823] usb 3-1: 
Manufacturer: Prolific Technology Inc.
Jun 13 17:00:08 f8arr2-station kernel: [ 3574.855943] pl2303 3-1:1.0: 
pl2303 converter detected
Jun 13 17:00:08 f8arr2-station kernel: [ 3574.868109] usb 3-1: pl2303 
converter now attached to ttyUSB0
Jun 13 17:00:08 f8arr2-station mtp-probe: checking bus 3, device 8: 
"/sys/devices/pci0000:00/0000:00:1d.1/usb3/3-1"
Jun 13 17:00:08 f8arr2-station mtp-probe: bus: 3, device: 8 was not an 
MTP device

Of course, If I run WSJT it can't commute the TX with an error message 
"Can't connect to /dev/ttyUSB0"

My user is on the "dialout" and "uucp" group.

I tried exactly the same manipulation with my only real RS232 port and 
it works like a charm.. (but dedicated to an other action).
Of course, same configuration was ok under my ubuntu 10.04. but I 
switched to Fedora 15...

If someone had a idea.. it would be great. My freind google didn't came 
with something looking good...

regards
F8ARR - Guillaume
