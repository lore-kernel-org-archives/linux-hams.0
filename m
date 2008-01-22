From: "Pino Zollo" <pinozollo@gmail.com>
Subject: DBLog a logging program for Linux
Date: Tue, 22 Jan 2008 13:21:55 -0300
Message-ID: <000601c85d12$f1a165a0$a7cf10ac@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer:x-mimeole;
        bh=CgxOw+bohC8oHZcRSobpethl9RpbDu29wluktQauBDM=;
        b=v+ykIV5SiNe436UI6Jygn7bBRTJObPXpHpwt11gaSAUtOnxIfu9fYAth56O/Etl+1cyICXkvVzoxpoLL2apcmYtf+axDG+obOp7m0hhRz8D6nqpwLP7wiB4lAm7yz5PfU491hx/rV7ZV68LBEkY/mYBGraGnHShw2Kx/fZU1+RE=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org




> I have just uploaded in www.qsl.net/zp4kfx/Linux the beta version of
DBLog.

>
>                         Presentation of DBLog
>
> DBLog is a logging program for radio amateurs based on a relational Data
> Base.
>
> It has been developed in Gambas, a sort of Visual Basic for Linux, and
> the relational database PostgreSQL.
>
> It should work also with MySQL and SQLite, but this has not been tested
yet.
>
> It allows to log QSOs and export a range of them in ADIF format.
>
> It can read the radio frequency via CAT interface
>
> It includes a CW Keyer based on cwdaemon.
>
> The advantages of using a relational data base both for qso datas and
> configuration datas are:
>
> -- The code of DBLog is much simpler.
>
> -- The user can do any kind of fancy query on datas using the standard SQL
>    language.
>
> -- The client-sever structure (PostgreSQL and MySQL only) allows a
> multi-operator
>    club station or DX expedition to have many operators logging into the
> same log.
>    The log server can even be remote.
>
> -- data back-up can be done using the database features.
>
> -- Other program can be used to analyse datas like psql, pgAdmin III, TOra
> for
>    PostgreSQL, or Emma, MySQL query browser, MySQL-navigator for MySQL.
>
> -- Anybody can write other programs ( for digimodes, EME, Meteorscatter
> etc.)
>    who log into the same log, without the need of been integrated into
> DBLog.
>
> DBLog is using free software and it is released in source code under the
GNU
> GPL
> licence, so anybody can modify it and improve it.
>
> Beta testers and Gambas programmers are welcome to enhace its
capabilities.
>
> 73 de Pino ZP4KFX
>
>

