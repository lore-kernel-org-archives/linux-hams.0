From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: Re: wxGTK-2.4.0
Date: Tue, 14 Jan 2003 22:04:38 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301142203.56076.jonathan.naylor@ggaweb.ch>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi Wilbert

I too am having the same fun !

My development is done with wxGTK-2.3.3 and it is perfectly happy with a 
standard installation of GTK+ 1.2.10, but with the latest wxGTK you 
need this pkg-config. So you can try downloading and building 
pkg-config and seeing what happens, they claim that wxGTK-2.4.0 is 
compatible with that version. Pkg-config is at 
http://www.freedesktop.org/software/pkgconfig/ once I have installed 
it, I found that it had identified my GTK+ 1.2.10 and had included it 
in its list of packages.

I would not recommend trying LinWSJT (now at 0.4.2 BTW) with wxGTK 2.4.0 
yet as there are some incompatibilities :-( Nothing too serious, just a 
few hours of sorting some arguments out. I have gone the whole way and 
installed GTK+ 2.2.0 and the rest of the libraries, something I 
wouldn't recommend unless you have a few hours of free time. Try and 
get hold of wxGTK 2.3.3 and use that to build LinWSJT. I will release a 
wxGTK 2.4.0 compatible LinWSJT soon.

I have to say that I am not too happy in the way that they have moved to 
pkg-config, I though the existing framework of gtk-config was perfectly 
adequate.

Such is life.

Jonathan  HB9DRD/G4KLX

