From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 0.9.2
Date: Wed, 16 Apr 2008 15:07:52 -0400
Message-ID: <200804161507.56441.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to:subject:date:user-agent:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=C7pY/NiFjRWq/ILsJvAG68JiXV3Rk1BwstXzQ/08/Qg=;
        b=FGiZ5tUTWpLxp5t624nD2G1leKWY2M92WSghOUsfCTP4YyySPcH7A25ZNVaaCxfI6KglPiLf1cF6D6wa0iSIxpntfG6okRLNlt2jHTxBz9GFqoTQsDGtXPHDSaNWvLo9WQJN+ub6RzriVi6t2I78uFOcRIluJqeeMxBvezc0LgE=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yahoo linux hams <linuxhams@yahoogroups.com>, pa0r <rein@couperus.com>, "Marco Di Martino (IW2OHX)" <iw2ohx@eutelia.com>, Linux Hams <linux-hams@vger.kernel.org>, Joop Stakenborg <pg>

The new version of DBLog, the 0.9.2 is available on

http://www.qsl.net/zp4kfx/Linux 

Now DBLog uses rigctld daemon from hamlib 1.2.7 to read and set frequency an 
modes of the radio.
This allows the use of all hamlib supported radios.

DBLog is written in GAMBAS (2) and distributed in source code under the GPL 
licence. 
It stores all the data in a RDBM: PostgreSQL is used in the development, but 
MySQL, QSLite3 and Firebird should work too.

DBLog receives cluster spots from xdx, checks them against local statistics 
and shows the results in a dedicated window.
Clicking on a spot sets the radio RX frequency and eventually the split TX 
one.
Can transmit CW using cwdaemon.
An azimuthal map centred  on the QTH is available via xplanet, showing also 
the position of the other station.

A Screeshot is available on the downloading page.

Comments and bug reports are aways welcome.

73 de
Pino ZP4KFX
