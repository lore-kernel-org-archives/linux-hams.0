From: Christof Bodner <oe8bck@gmx.net>
Subject: Ubuntu 8.10 and AX25
Date: Sun, 05 Oct 2008 19:34:14 +0200
Message-ID: <1223228054.9867.13.camel@rosi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi!

I have a SignaLink USB device and it's working fine, except AX25 in
Linux (mhm, so it's not really working fine, isn't it?)

If I start it with
sudo mdprobe mkiss
sudo soundmodem -v 5

I get 

---
sm[10003]: mkiss: ifname ax0 mtu 256 hwaddr OE8BCK-1 ipaddr 10.0.0.1
netmask 255.255.255.0 broadcast 10.0.0.255
sm[10003]: audio: starting "/dev/dsp2"
sm[10003]: audio: sample rate 9600 input fragsz 256 numfrags 512 output
fragsz 256 numfrags 820
sm[10003]: unknown kiss packet: 0x80 0xa2
sm[10003]: unknown kiss packet: 0x20 0xa2
Tx: fm OE8BCK-1 to QST-0 UI  pid=CC
...
---

Then a lot of Tx frames are sent (would be sent if I would switch in
TX) 

Does anybody know hoe to turn it off at Ubuntu 8.10? 

And then, exactly ONE RX frame is captured, e.g.

Rx: fm OE1UHA-9 to TX0R18-0 via OE1XQR-0,WIDE2-0 UIv pid=F0
`,.Xmz3>/ON THE ROAD

dmesg gives the output:
[ 4763.523335] usb 5-2.1.4: configuration #1 chosen from 1 choice
[ 4763.525286] input: Burr-Brown from TI               USB Audio CODEC
as /class/input/input6
[ 4763.527643] input,hidraw2: USB HID v1.00 Device [Burr-Brown from TI
USB Audio CODEC ] on usb-0000:01:09.2-2.1.4
[ 4764.858704] usbcore: registered new interface driver snd-usb-audio
[ 4834.952618] NET: Registered protocol family 3
[ 4835.007632] mkiss: AX.25 Multikiss, Hans Albas PE1AYX
[ 4850.084131] mkiss: ax0: crc mode is auto.
[ 4850.160087] mkiss: ax0: Trying crc-smack
[ 4850.316183] mkiss: ax0: Trying crc-flexnet

Some other correct RX-frames can be received by restarting soundmodem.
So why do I have to restart soundmodem given this result?
---
sm[10313]: mkiss: ifname ax0 mtu 256 hwaddr OE8BCK-1 ipaddr 10.0.0.1
netmask 255.255.255.0 broadcast 10.0.0.255
sm[10313]: audio: starting "/dev/dsp2"
sm[10313]: audio: sample rate 9600 input fragsz 256 numfrags 512 output
fragsz 256 numfrags 820
sm[10313]: unknown kiss packet: 0x80 0xa2
sm[10313]: unknown kiss packet: 0x20 0xa2
Tx: fm OE8BCK-1 to QST-0 UI  pid=CC
...
--- 

It's a little bit annoying to restart soundmodem each minute, so I need
your tips.

73 de christof, oe8bck

-- 
             (0-0)
---------oOO--(_)--OOo-----------------------------------------------
 Christof Bodner <oe8bck@gmx.net>
   Linux - Life is too short for reboots
         - First they ignore you. Then they laugh at you. Then they
           fight you(*). Then you win. -- Ghandi
---------------------------------------------------------------------
email: mailto:oe8bck@gmx.net
---------------------------------------------------------------------
GnuPG public key: 0xB15DA60F (http://wwwkeys.eu.pgp.net)
Fingerprint 5222 4DEA 773A 60B3 22F9  D244 15EF 6645 B15D A60F
---------------------------------------------------------------------


