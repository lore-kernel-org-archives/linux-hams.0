From: Scott Ehrlich <scott@ehrlichtronics.com>
Subject: [HELP] Sound card as TNC, Kernel 2.4.22, Intel board
Date: Wed, 29 Oct 2003 05:20:49 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0310290510560.20216@debian.ehrlichtronics.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I have an Intel Pentium 3 board with Debian Woody, Kernel 2.4.22, and am
trying to get the motherboard sound to act as my TNC.   I want to
experiment with packet and APRS using the sound card.

I've compiled a static kernel with AX.25 support, /sbin/ifconfig -a shows
AX.25 ports exist.   I run Xastir, Configure > Interfaces > Add > AX25 TNC
> OK and get an error window popping up:

"Interface error! Error opening interface 0 Hard Fail"

and the xterm from which I typed xastir offers:

axconfig: port 1 not active
axconfig: port 2 not active
ERROR: problem with axports file



What am I missing?

Thanks in advance.

Scott, WY1Z
