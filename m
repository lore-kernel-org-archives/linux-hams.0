From: =?ISO-8859-1?Q?=22R=E9mi?= Chateauneu" <ravioli@softhome.net>
Subject: soundmodem / "SIOCSIFFLAGS no such device"
Date: Wed, 19 Feb 2003 09:29:42 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <b2veij$79l$1@main.gmane.org>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi All !

My config is :
Linux Mandrake 8.2
Soundcard VIA FM801
RPM ax25-tools 0.0.8 and ax25-apps.0.0.6

For the setup, I first do a 'rmmod' of all modules related to the sound
card.
Then setserial /dev/ttyS0 uart none port 0 irq 0

To find the irq and dma parameters of the sound card :
modprobe -c | grep irq

Then:
modprobe hdlcdrv
insmod soundmodem mode="sbc:afsk1200" iobase=0x220 irq=7 dma=1
sethdlc -p -i sm0 mode sbc:afsk1200 io 0x200 irq 7 dma 1 serio 0x3f8

And the final :
ifconfig sm0 hw ax25 X1ABC up

And it tells me :
"SIOCSIFFLAGS: No such device"

Any idea will be extremely cheerfully welcomed !





