From: Dave Platt <dplatt@radagast.org>
Subject: Re[2]: ax25 with digipeaters
Date: Tue, 27 Jul 2004 10:45:09 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040727174510.4335.qmail@radagast.org>
References: <003101c473b5$d2254830$050010ac@tokland>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <003101c473b5$d2254830$050010ac@tokland>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: arnau@gbt.tfo.upm.es
Cc: linux-hams@vger.kernel.org

Arnau S=E1nchez <arnau@gbt.tfo.upm.es> wrote:
> >I could not get axdigi working, but I'm using digi_ned=20
> >instead, which works fine.
>=20
> I did't know about "digi_ned"... does it work well with ax25?=20

It has worked well for me, in the simple testing I have done,
on a Debian Linux system ("stable" distribution) and a single
KISS-mode TNC.

It's a very flexible, highly-configurable package, with a lot
of "smarts" about how and what it digipeats, and how it
alters the packets' digipeating path when it does so.  Think of
it as a "sendmail for digipeating" (and if that isn't enough
to make the hair stand up on the back of your neck, go for it!)

=46ortunately it's not difficult to create a "cut-down" version
of the configuration, which does the simple sort of straightforward
digipeating you're interested in.  A suitable sample configuration
is provided with the software.
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
