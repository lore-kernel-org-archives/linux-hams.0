From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 1.0
Date: Tue, 14 Jul 2009 13:26:49 -0400
Message-ID: <200907141326.50196.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=qiCaN5Y2Kwt+ltpmZvQkaPEXtnHrsRYeDcXWL6vkXro=;
        b=wkAfrl7eRGuOLXSRaqWhS/tW/AGLLt3dXlXOMewYITOg9iw7iQx3K9yW807VB/ivkg
         lPGf6m73vAshIzmruV88OHe5WOQDUe5cmo0b8EePZC78KT2hBwlkZYdjmb3foVk+yD3w
         VBGv3YO6kCG5H5FoG7L4eOuHSEf7IQDBV4wwM=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: fldigi-alpha@lists.berlios.de
Cc: Vlad <ua6jd@vfemail.net>, ham-linux@mailman.qth.net, Forum Logger32 <hamlogger@yahoogroups.com>, Linux Hams <linux-hams@vger.kernel.org>, adifdev@yahoogroups.com


Hi everybody,

I have just uploaded the version 1.0 of DBLog on

http://www.qsl.net/zp4kfx/Linux/dblog.html

DBLog is a logger program for Linux inspired to Logger32 and to M1NN_Lo=
gger.

It works in harmony with fldigi for operating digi-modes.

DBLog =A0is UTF-8 compliant and sensitive to the 'locale'.=20

It stores all data's in the RDBM PostgreSQL.

Beyond sources for GAMBAS2 ( http://gambas.sf.net ) there are available=
 the=20
installation packages for Debian, OpenSuSE, Fedora, Mandriva, Ubuntu an=
d=20
Slackware.

It is also available an "Autotool" package.

Changes from the previous release:

-- Simplified database installation: writing  in the database access wi=
ndow
    the name of a new database, it will be created.
-- Improved QSO List window: can not be closed and it is possible to br=
owse
   the  full log
-- Reorganisation of the main logging window: using fldigi it remains v=
isible
   the "worked before" table.
-- Some decoration added.


Bug reports and comments are wellcome.

73 de
Pino ZP4KFX



--=20
Key ID: 0xF6768208=20
Key fingerprint =3D B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
