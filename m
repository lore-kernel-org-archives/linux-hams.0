From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 1.1
Date: Wed, 29 Jul 2009 12:54:40 -0400
Message-ID: <200907291254.40782.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:mime-version:content-disposition
         :message-id:content-type:content-transfer-encoding;
        bh=aRUhrhuUoH8zL+uPblHMnCR1Ij97DJPbL9c1BDk051E=;
        b=mfgazoQVmPNvHdDDP86ozStBjgygBc75JmYlSoV0XR0b8d6XrOSCePVTt9Dx9+OiiC
         Y6VlCrMvEwmZjYwSHkaHqxqzMo6Xnk9Gb30lX7LmjDcfRA50h80H5JY9flGFnITNvvKJ
         mCEuufXkMuOg/XvbZ1KEkSoYfO0IrAIGht5b0=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: fldigi-alpha@lists.berlios.de
Cc: ham-linux@mailman.qth.net, Forum Logger32 <hamlogger@yahoogroups.com>, Linux Hams <linux-hams@vger.kernel.org>, adifdev@yahoogroups.com, dblog-Linux-logger@googlegroups.com


Hi everybody,

I have just uploaded the version 1.1 of DBLog on

http://www.qsl.net/zp4kfx/Linux/DBLog/dblog.html

NEW: Added the possibility of archiving QSL pictures together with QSO =
infos.
         Corrected a bug in "Worked before" table.
         Improved QSL infos handling.
         A simple manual is now available.

          Works with GAMBAS 2.15=20
          Three columns added into the table 'qso'

     * Group home page: http://groups.google.com/group/dblog-Linux-logg=
er
=20
     * Group email address dblog-Linux-logger@googlegroups.com

-----------------------------------------------------------------------=
------------------------------------------------
DBLog is a logger program for Linux inspired to Logger32 and to M1NN_Lo=
gger.

It works in harmony with fldigi for operating digi-modes.

DBLog =A0is UTF-8 compliant and sensitive to the 'locale'.=20

It stores all data's and QSL pictures  in the RDBM PostgreSQL.

Beyond sources for GAMBAS2 ( http://gambas.sf.net ) there are available=
 the=20
installation packages for Debian, OpenSuSE, Fedora, Mandriva, Ubuntu an=
d=20
Slackware.

It is also available an "Autotool" package.



Bug reports and comments are welcome.

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
