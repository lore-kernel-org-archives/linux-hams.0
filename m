From: Thomas Sailer <sailer@scs.ch>
Subject: Re: Norm Frequency beacon ?
Date: Thu, 27 May 2004 19:56:40 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1085680600.31191.151.camel@kronenbourg.scs.ch>
References: <200405271330.25402.dl4mge@darc.de>
	 <20040527125342.GU1749@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040527125342.GU1749@mea-ext.zmailer.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: =?ISO-8859-1?Q?G=FCnther?= Montag <dl4mge@darc.de>, linux hams news group <linux-hams@vger.kernel.org>, -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>

On Thu, 2004-05-27 at 14:53, Matti Aarnio wrote:

> I would use GPS disciplined OCXO myself for that.

The program in question derives its timing from the sample clock of the
soundcard, but this frequency must be calibrated against a precise clock
source with a known frequency.

Currently supported methods are:

- The german timecode transmitter DCF77 on 77.5kHz
- TV horizontal synch frequency (which happens to lie in a frequency
  range soundcards can digitize)

I didn't implement any GPS based method because at the time I did this
GPS receivers were still quite uncommon (im my household at least :))

The difficulty with the PPS signal is that not every GPS receiver has it
and it requires some additional hardware to get into the PC. The
simplest method would be to wire it to the parallel port, but
unfortunately "real" parports are disappearing quickly.

NMEA perhaps? Given a long enough calibration period this might well be
precise enough... Does anyone know the timing of the NMEA output? Is it
aligned to the PPS?

> One possibility might be DVB-T symbol rate clock, which derives itself

Too complex FWIW, IMO.

Tom

