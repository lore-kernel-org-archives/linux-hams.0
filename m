From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: JT44 on Linux progress
Date: Tue, 3 Sep 2002 20:58:48 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02090320584801.25808@g4klx>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: moon-net@nlsa.com, linux-hams@vger.kernel.org

Hi all

I thought I'd give an update on my JT44 for Linux, for those who are 
interested.

As reported some time ago, the transmit side is working fine. That was 
the easy bit.

I've spent a little time working on both FSK441 and JT44 reception, 
learning a lot along the way. FSK441 is not so good at the moment, but 
having turned my attention to JT44 and learned a few tricks I feel that 
FSK441 can move along quite quickly once I start again on it. FSK441 
reception does work, its just nowhere near as good as the original 
program.

The JT44 receive program was started this morning after a chat with 
Tomi Manninen OH2BNS who game me a condensed DSP tutotial via the 
converse system, thanks Tomi, your words were invaluable. I have JT44 
decoding working at the moment, and on the test files available from 
W3SZ's web site, my JT44 receive is approximately 3dB worse than real 
WSJT. At present it is a non real-time program whereas real WSJT is 
almost real-time if signals are strong enough.

I could go into details about what I did, but I'd probably rather do 
that in private e-mail. The program is open source and is covered by 
the GPL. Anyone who wants a copy of the source is welcome to ask.

I did spend some time working on a GUI using KDE/Qt but gave up in 
disgust, it sucks horribly and the documentation is crap. GTK is far 
better in every respect except it isn't C++. I have found something 
called WxWindows which has C++ bindings and which will allow me to 
compile my program for Windows in due course, all I need to do is 
change the sound card code.

See you at Weinheim ?

Jonathan  HB9DRD/G4KLX

