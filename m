From: Tapio Sokura <oh2kku@iki.fi>
Subject: Re: Norm Frequency beacon ?
Date: Fri, 28 May 2004 04:02:42 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40B68FB2.8010902@iki.fi>
References: <200405271330.25402.dl4mge@darc.de>	 <20040527125342.GU1749@mea-ext.zmailer.org> <1085680600.31191.151.camel@kronenbourg.scs.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1085680600.31191.151.camel@kronenbourg.scs.ch>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux hams news group <linux-hams@vger.kernel.org>
Cc: -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>

Thomas Sailer wrote:
> The difficulty with the PPS signal is that not every GPS receiver has it
> and it requires some additional hardware to get into the PC. The
> simplest method would be to wire it to the parallel port, but
> unfortunately "real" parports are disappearing quickly.

I'd say most (at least a large part) PCs can read the PPS signal fine 
via a direct connection to serial port DCD line, for example. PPS 
outputs are often TTL, but still work with most PC serial ports. Of 
course this does not help much if you don't have the PPS output on the GPS.

> NMEA perhaps? Given a long enough calibration period this might well be
> precise enough... Does anyone know the timing of the NMEA output? Is it
> aligned to the PPS?

It depends on the GPS, I don't think there is an official standard or 
practice. I'd guess at least the PPS-equipped timing receivers handle 
NMEA in a predefined way to be able to stay on the right second.

   Tapio

