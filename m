From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: Re: wxGTK-2.4.0
Date: Wed, 15 Jan 2003 22:12:05 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301152212.05203.jonathan.naylor@ggaweb.ch>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi again

I've had a very enjoyable day building different version of wxGTK-2.4.0 
and building LinWSJT and finding what does and doesn't work with it !

LinWSJT does work with wxGTK-2.4.0 but not with all build types:

It will work with wxGTK-2.4.0 built with GTK+ 1.x.y (in my case 1.2.10), 
this is achieved by using "./configure --with-gtk" for wxGTK.

It will sort of work with wxGTK-2.4.0 and GTK+ 2 (in my case 2.2.0) but 
without Unicode support by "./configure --with-gtk --enable-gtk2". When 
I means "sort of works", I mean that the numbers on the spectrum graph 
(the square graph on the right) do not appear, but otherwise FSK441 
operates correctly, JT44 is perfectly OK.

The currently released LinWSJT will not build as Unicode, the next 
release is Unicode compliant but suffers from the same problems as 
above. I think this is a bug in wsGTK-2.4.0 and I will report it to the 
bug tracking database. If I build wxGTK for debugging I get an 
assertion failure when dealing with Pango.

So I recommend using wxGTK-2.4.0 with GTK+ 1.x.y and you should be fine, 
of course you may have to install pkg-config to get it to build in the 
first place.

Jonathan  HB9DRD/G4KLX

