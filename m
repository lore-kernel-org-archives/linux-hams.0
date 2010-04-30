From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: QSSTV Compilation Issues...
Date: Fri, 30 Apr 2010 21:05:08 +0100
Message-ID: <4BDB37F4.5060808@rns-stearn.demon.co.uk>
References: <688897.8364.qm@web37601.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <688897.8364.qm@web37601.mail.mud.yahoo.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I had/have a similar issue when building mythtv for Slackware.

The QT'ish bits from my mythtv.SlackBuild script:

-------------------------------------------------
QTDIR=/usr/lib/qt
export QTDIR

LD_LIBRARY_PATH=${QTDIR}/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH

PATH=${PATH}:${QTDIR}/bin
export PATH
-------------------------------------------------

Obviously fix QTDIR for to suit you system.

Probably what you have done anyway, if so then apologies for the noise.

I gave up on using ldconfig for the QT libs when compiling.

-- 
73 de g1sog
	Richard

