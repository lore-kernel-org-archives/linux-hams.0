From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: APRS.
Date: Mon, 22 Dec 2003 07:44:12 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0312211227530.4378-100000@zl2bsj.ampr.org>
References: <3FE49060.50404@urbakken.dk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FE49060.50404@urbakken.dk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Jakobsen <eja@urbakken.dk>
Cc: linux-hams@vger.kernel.org


> I have the PTC-II from the German SCS company. Can it be used for APRS
> with Linux ?.

Under Linux, there is no device driver for Hostmode TNCs such as the
PTC-II, unfortunately. Not for any technical reason that I can see. It
just hasn't been written.

So far, I haven't found a use for the PTC-II with Linux. I have had a go
at running Airmail in the Wine emulator, but it stumbles at the last
hurdle with a com.dll error message.

You may still be able to use the PTC-II for APRS purposes. XASTIR will
drive TNCs directly, presumably in normal cmd: mode. I haven't tried this
myself. It may, or may not work with the PTC-II command set.


Wilbert, ZL2BSJ



