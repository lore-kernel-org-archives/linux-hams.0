From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Norm Frequency beacon ?
Date: Thu, 27 May 2004 15:53:42 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040527125342.GU1749@mea-ext.zmailer.org>
References: <200405271330.25402.dl4mge@darc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200405271330.25402.dl4mge@darc.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?G=FCnther?= Montag <dl4mge@darc.de>
Cc: linux hams news group <linux-hams@vger.kernel.org>, -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>

On Thu, May 27, 2004 at 01:30:25PM +0200, G=FCnther Montag  wrote:
> Hello friends
>=20
> does someone know, is there something lik a beacon on the air
> on shortwave or medium wave, ham or radio band, which sends
> a known fixed exact frequency tone in AM, e.g. 1000 Hz or other,
> for calibration?  Something like DCF77 on longwave?
>=20
> We have a real-time pactor program which needs an exact frequency for=
=20
> calibration, and not everyone has an DCF77 receiver.

Dear OM,

I would use GPS disciplined OCXO myself for that.
There have been numerous articles about that in QST, for example.
They are more complex than DCF77 rx, but also versatile, and work
in places where DCF77 doesn't reach -- and as a bonus, you can
get accurate timing well down to microsecond from a commercial
GPS with PPS output.  Adding OCXO disciplining is another story,
of course.

The NCDXF beacon network runs with GPS synced timing, but not with
GPS disciplined frequency, I think.  Those beacons exist all over
the world and frequencies, though.

Alternate methods include asking your local TV network about how
they generate and distribute their TV signals.

In Finland we used to have (during analog link era) a highly accurate
15625 Hz line frequency in TV2 network picture.  Now that they distribu=
te
the signal via digital networks (uncompressed, though) there is noticea=
bly
larger jitter in that timing parameter, and it will end altogether, whe=
n
the analog TV system will get decomissioned in a few years time from no=
w.

One possibility might be DVB-T symbol rate clock, which derives itself
from SDH transmission hierarchy master clocks.  But a receiver to extra=
ct
that is (if possible) even more complex than GPS-OCXO.   The DVB-T, and
DAB do include a possibility to send the same signal at the same freque=
ncy
from multiple transmitters, and a stationary receiver will pick it up j=
ust
fine  (mobile receiver is a bit more challenged, though..)


> tnx!
> --=20
> 73 de
> G=FCnther
> dl4mge@darc.de

73 de Matti, OH2MQK=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
