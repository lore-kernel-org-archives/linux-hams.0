From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: [HELP] Sound card as TNC, Kernel 2.4.22, Intel board
Date: Thu, 30 Oct 2003 23:00:54 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FA19826.5337.4789FB@localhost>
References: <Pine.LNX.4.58.0310290510560.20216@debian.ehrlichtronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.58.0310290510560.20216@debian.ehrlichtronics.com>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Scott Ehrlich <scott@ehrlichtronics.com>

---
On 29 Oct 2003 at 5:20, Scott Ehrlich wrote:

> I have an Intel Pentium 3 board with Debian Woody, Kernel 2.4.22, and am
> trying to get the motherboard sound to act as my TNC.   I want to
> experiment with packet and APRS using the sound card.
> 
> I've compiled a static kernel with AX.25 support, /sbin/ifconfig -a shows
> AX.25 ports exist.   I run Xastir, Configure > Interfaces > Add > AX25 TNC
> > OK and get an error window popping up:
> 
> "Interface error! Error opening interface 0 Hard Fail"
> 
> and the xterm from which I typed xastir offers:
> 
> axconfig: port 1 not active
> axconfig: port 2 not active
> ERROR: problem with axports file
> 
> 
> 
> What am I missing?
> 
> Thanks in advance.

As far as I know, you need to install the usermode 
soundmodem. I don't know if woody includes it, but you can 
download and compile it yourself.

Then you can run the configuration utility, soundmodemconfig 
or something.

Then you need to edit /etc/axports

Then start the soundmodem.

Your soundcard must be supported by oss. Or maybe by alsa 
with oss compatibility enabled.

You need the mkiss kernel module too, in addition to ax25.

I'm not sure, but maybe you need some of the folowing 
packages:

libax25
ax25-tools
ax25-apps

I always install them prior to soundmodem because I need 
them. For example ax25-tools includes kissattach, necesary 
to attach a kiss tnc, and ax25-apps includes listen, that I 
use for monitoring purposes.

I hope you find this usefull. Try to check the ax25-howto 
that can give you more details. If you have any question, 
just ask.

