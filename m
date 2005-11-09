From: ik1rac@yahoo.it
Subject: Soundmodem (userspace) problems
Date: Wed, 9 Nov 2005 23:34:55 +0100
Message-ID: <200511092334.55583.ik1rac@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi everybody,
I am trying to set up AX.25 on a dual sound card machine. The first on-board 
card is a SiS 7012 delivering system sounds; the second a SoundBlaster 
dedicated to Ham radio. 
Here is the detail

cat /proc/asound/cards
0 [SI7012         ]: ICH - SiS SI7012
                     SiS SI7012 with ALC100,100P at 0xdc00, irq 11
1 [AudioPCI       ]: ENS1371 - Ensoniq AudioPCI
                     Ensoniq AudioPCI ENS1371 at 0xd400, irq 5
2 [UART           ]: MPU-401 UART - MPU-401 UART
                     MPU-401 UART at 0x300, irq 10

The machine is running:
Kubuntu 5.10 - Breezy Badger
kernel 2.6.12

ax25-apps 0.0.6
ax25-tools 0.0.8
libax25 0.0.11
soundmodem 0.7

Here are the steps so far:

sudo soundmodemconfig
Configured IO as soundcard /dev/dsp1 and channel access parameters
then configured channel 0 as an afsk 1200 bps modem using mkiss mode and sm0 
interface name.
Runned diagnostics and everything works like a charm: decodes and transmit.

Then configured /etc/ax25/axports as:
 1       IK1RAC-1        1200    255     2       144.850 MHz (1200 bps)

Then started soundmodem with:
sudo soundmodem
sm[9043]: ioctl: TIOCSETD: No such device (19)

which, I am guessing, means that sm0 interface has not been created.

Then I checked modules and it seems they are loaded:

Module                  Size  Used by
mkiss                   9388  0
ax25                   49644  1 mkiss

So I started digging through the past list posts and found something relative 
to unloading and re-loading sound module kernel before starting soundmodem. 
No luck.

Ok now I am at loss. Am I missing something obvious ? (surely yes!)

Thanks & 73s
