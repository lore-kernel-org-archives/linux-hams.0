From: matthew.cook@tekelek.com.au
Subject: Usermode Soundmodem & TTY problems
Date: Fri, 24 Oct 2003 11:37:30 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <OFFB707E04.BA8CFFFF-ONE9256DC9.00062E7D-E9256DC9.000BAC88@LocalDomain>
References: <NCBBKBAJDJIPKFIAFBKLMEFKEJAC.whein3@earthlink.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLMEFKEJAC.whein3@earthlink.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Howdy,

I'm wondering if anyone has experienced problems with the usermode
soundmodem writing received packets in the first tty console after power on
?   From testing it appears to write to the console that started the
soundmodem program.   I have noticed this when remotely restarting
soundmodem while ssh'd into the box from another machine.   I've played
with the -s option but this is for logging errors not packets.   Does
anyone know how to turn this off, is there a conditional define I can
toggle ?

My current setup is;

- VIA C3-800 with 82C686 onboard sound
- Slackware 9.0 (no X11 installed)
- Soundmodem-0.7.tar.gz
- ax25-apps-0.0.6
- ax25-tools-0.0.8
- libax25-0.0.11

Everything above is essentially working its just I cant use the first
console without it being corrupted by the packets decoded by the usermode
soundmodem.   It also makes remote management via ssh a bit of a pain if
you have to restart the soundmodem, remote reboots being a bit scary at
times.

Any pointers would be greatly appreciated.

Cheers

Matthew
VK5ZMC



