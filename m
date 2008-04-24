From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 0.9.10
Date: Thu, 24 Apr 2008 16:59:54 -0400
Message-ID: <200804241659.57537.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to:subject:date:user-agent:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=lfDP+pmPID953RBLZ6I8fPkUKam4W/w4zMbz+Eo6b40=;
        b=LHQZc/Ifo3640hcufiyCGIrZqlnpl9d1Vj1CZOW70IUO/zmp8DlA/NnZ5UHW520jvubhmP0WXd1oCYNGfaFxWZBdHOsT2yDVwR3CIbWD4v7PyyURDeiz9Mm5TlnJAENEnDgfJdv1t5UYmqNZCtcLmQoKw+tBIVtUMJ6AoYHeXrI=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yahoo linux hams <linuxhams@yahoogroups.com>, pa0r <rein@couperus.com>, "Marco Di Martino (IW2OHX)" <iw2ohx@eutelia.com>, Linux Hams <linux-hams@vger.kernel.org>, Joop Stakenborg <pg>


The new version of DBLog, the 0.9.10 is available on

http://www.qsl.net/zp4kfx/Linux=20

News:
Added a table and a window which shows spots on the band tuned by the r=
adio=20
ordered by frequency.
This window shows and remembers also the CQ frequency if in RUN mode an=
d heard=20
or worked stations if in S&P mode.
Added entry for State and County to agree to ADIF specs.
Minor inprovements and bug reduction.
A second screenshot is available on the download site.

DBLog uses rigctld daemon from hamlib 1.2.7 to read and set frequency a=
n=20
modes of the radio.
This allows the use of all hamlib supported radios.

DBLog is written in GAMBAS (2) and distributed in source code under the=
 GPL=20
licence.=20
It stores all the data in a RDBM: PostgreSQL is used in the development=
, but=20
MySQL, QSLite3 and Firebird should work too.

DBLog receives cluster spots from xdx, checks them against local statis=
tics=20
and shows the results in a dedicated window.
Clicking on a spot sets the radio RX frequency and eventually the split=
 TX=20
one.
Can transmit CW using cwdaemon.
An azimuthal map centred =A0on the QTH is available via xplanet, showin=
g also=20
the position of the other station.

Comments and bug reports are aways welcome.

73 de
Pino ZP4KFX
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
