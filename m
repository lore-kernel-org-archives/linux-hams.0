From: Andrew Errington <a.errington@lancaster.ac.uk>
Subject: Re: USB sound adapter for use with Tom's soundmodem?
Date: Tue, 21 Jun 2011 19:58:35 +0900
Message-ID: <201106211958.35931.a.errington@lancaster.ac.uk>
References: <49432397.8060304@weca.org> <courier.4943435B.000044D7@radagast.org> <2916.219.89.148.235.1229158504.squirrel@webmail02.lancs.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2916.219.89.148.235.1229158504.squirrel@webmail02.lancs.ac.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi everyone,

A long time ago I wrote in this mailing list about using the GPIO lines which 
are present on some USB sound card chips to control PTT.  This would make a 
self-contained radio interface which would not need a separate wire to a 
parallel or serial port.  I said that if this would work with soundmodem then 
it would be a Good Thing.

Well, I haven't had the chance to do anything for a long time, but recently I 
started dabbling again and I finally got around to doing it.

I have discovered that the CM108 chip has become scarce, and also the packaged 
version of the chip is not so common as these days the chips are often epoxy 
blobbed.  They can still be found however, and there are now successors to 
this chip: CM109 and CM119 for example; and alternatives: SSS1620/1/3.  There 
are also many examples of using the GPIO pins for PTT for Asterisk (app_rpt), 
TheLinkBox and the pcrepeatercontroller projects.  Inspired by these I have 
implemented USB GPIO PTT control in soundmodem and submitted a patch to 
Thomas Sailer and he has incorporated it into soundmodem v0.16.

Please note, it has not been extensively tested.  I don't have a CM108, but I 
have had my modified code working with SSS1621 and SSS1623.  I have a CM119, 
but Linux does not create a /dev/hidrawX node for it (the audio function 
works, but not the HID for buttons etc., so GPIO can't be controlled).

If anyone is interested, please download the source[1] and take a look.  It 
should work with C-Media chips (e.g. CM108), but the vendor and product IDs 
for SSS1621 and SSS1623 must be added if you have these chips.  Actually, I 
have a patch for this if you need it.  On the hardware side, amongst other 
things you have to solder a tiny pin on the chip and connect it to a 
transistor to drive PTT.

73,

Andrew
ZL3AME

[1] http://www.baycom.org/~tom/ham/soundmodem/
