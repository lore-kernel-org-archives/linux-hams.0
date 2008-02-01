From: "Pino Zollo" <pinozollo@gmail.com>
Subject: New Realease of DBLog V. 0.6.3
Date: Fri, 1 Feb 2008 10:57:32 -0300
Message-ID: <005901c864da$7c21b0d0$95ce10ac@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer:x-mimeole;
        bh=GS0NBUpWV3DdqCaUrrNEF9+0oIdtK19xWHpeXQ/oMyM=;
        b=ny7TxQpV5q1Yr7+9vjuq7SVL72WE+Ma6WNxiSfUkVYFobPqdIXnag3WLYpeiwgem6GZN65X8kTtpLuVku3pmbFNPe3XZWOJ4NjBn/LxQQ3xHb8Wg+1THQVD2TLNeKJNidiOYS0OecYV4buGZAtekqS6AapA9g+WGCRLE+/X5j6U=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yahoo PSK group <psk31@yahoogroups.com>, Yahoo linux hams <linuxhams@yahoogroups.com>, ww0e@juno.com, VK5BR <ldbutler@tpg.com.au>, va3db <db@db.net>, sm6cvx@hjelmstrom.se

It is available the version Beta 0.6.3 of DBLog for Linux on the site
http://www.qsl.net/zp4kfx/Linux

Comments and bug reports are welcome.
73 de Pino ZP4KFX
----------------------------------------------------------------------------
--
                        Presentation of DBLog

DBLog is a logging program for radio amateurs based on a relational Data
Base.

It has been developed in Gambas, a sort of Visual Basic for Linux, and
the relational database PostgreSQL.

It has been tested on MySQL by Antonio, IW2OAZ (iw2oaz at eutelia.com).

It should work also with SQLite, but this has not been tested yet.

It allows to log QSOs and export a range of them in ADIF format.

It can read the radio frequency via CAT interface

It includes a CW Keyer based on cwdaemon.

The advantages of using a relational data base both for qso datas and
configuration datas are:

-- The code of DBLog is much simpler.

-- The user can do any kind of fancy query on datas using the standard SQL
   language.

-- The client-sever structure (PostgreSQL and MySQL only) allows a
multi-operator
   club station or DX expedition to have many operators logging into the
same log.
   The log server can even be remote.

-- data back-up can be done using the database features.

-- Other program can be used to analyse datas like psql, pgAdmin III, TOra
for
   PostgreSQL, or Emma, MySQL query browser, MySQL-navigator for MySQL.

-- Anybody can write other programs ( for digimodes, EME, Meteorscatter
etc.)
   who log into the same log, without the need of been integrated into
DBLog.

 The author (me ZP4KFX) endorse the idea that the radio amateur software
should
 be open and free to allow the "home made" also in this area.

 He foresees also an open architecture for all radio amateur programs based
on
 the separation of functions. Datas should be managed by an single data base
 server for all the shack. The various applications should gravitate around
 this data tank, possibly standardised (ADIF fields for the log for
instance).
 This will simplify greatly life both for developers and users.

DBLog is using free software and it is released in source code under the GNU
GPL
licence, so anybody can modify it and improve it.

Beta testers and Gambas programmers are welcome !

73 de  Pino ZP4KFX
pinozollo at gmail.com
http://www.qsl.net/zp4kfx




