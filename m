From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Norm Frequency beacon ?
Date: Thu, 27 May 2004 23:17:55 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040527201755.GX1749@mea-ext.zmailer.org>
References: <200405271330.25402.dl4mge@darc.de> <20040527125342.GU1749@mea-ext.zmailer.org> <1085680600.31191.151.camel@kronenbourg.scs.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1085680600.31191.151.camel@kronenbourg.scs.ch>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Sailer <sailer@scs.ch>
Cc: =?iso-8859-1?Q?G=FCnther?= Montag <dl4mge@darc.de>, linux hams news group <linux-hams@vger.kernel.org>, -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>

On Thu, May 27, 2004 at 07:56:40PM +0200, Thomas Sailer wrote:
> On Thu, 2004-05-27 at 14:53, Matti Aarnio wrote:
> > I would use GPS disciplined OCXO myself for that.
> 
> The program in question derives its timing from the sample clock of the
> soundcard, but this frequency must be calibrated against a precise clock
> source with a known frequency.

Yea right...   KISS, and all that.
(I have played with ideas of software defined radio receiver,
 where I digitize IF at around 100 MHz, and preprocess it thru
 decimation hardware at first..  Cheap it ain't, and definitely
 not built-into the PC...  lattest Linux Journal had a story of
 this same theme.)

> Currently supported methods are:
> 
> - The german timecode transmitter DCF77 on 77.5kHz
> - TV horizontal synch frequency (which happens to lie in a frequency
>   range soundcards can digitize)
> 
> I didn't implement any GPS based method because at the time I did this
> GPS receivers were still quite uncommon (im my household at least :))
> 
> The difficulty with the PPS signal is that not every GPS receiver
> has it and it requires some additional hardware to get into the PC.
> The simplest method would be to wire it to the parallel port, but
> unfortunately "real" parports are disappearing quickly.
> 
> NMEA perhaps? Given a long enough calibration period this might well be
> precise enough... Does anyone know the timing of the NMEA output? Is it
> aligned to the PPS?

Cheapest "mouse GPSes" (under 100eur) are now interfaced with USB1.1.
In the days of the serial port the time value output in GGA, GLL, or RMC
was the end of the NMEA line terminating LF character.
With USB this becomes somewhat more fuzzy, and the PPS signal
is not available at all (thru USB, that is.)

Inside the "mouse" there is possibly separate chip to do USB interfacing,
and it talks thru serial line to the GPS.  Possibly...
(I didn't find any GPS receiver that actually itself has USB in chip,
thus I believe it is a case of GPS + USB-serial-port chip.)

> Tom

73 de Matti, OH2MQK
