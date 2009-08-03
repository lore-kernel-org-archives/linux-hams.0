From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 1.2
Date: Mon, 3 Aug 2009 15:01:51 -0400
Message-ID: <200908031501.51932.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=oaemtDaJaGwL1++2P3r0RBauvDDBAOF8f7H0/dbgNEM=;
        b=w6LwRuiSWfgL4w4+FsJI0e5VT6aYKio4W+0VhcANsROjciR+JrtBFYHdSyBDJu/1rc
         iKgUzFcXeAu3aIxTvP78Bq9rF9oUA5CtSRMJKTBycujvwM9yzl/LERRr4sYRfx+4nJ3V
         lNFU9QSiIYICdZShnzucb6NofMx5pLckqs8Bo=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: wsjt-devel@lists.berlios.de
Cc: Debian Hams <debian-hams@lists.debian.org>, "Ham Software - QTH.net" <ham-software@mailman.qth.net>, ham-linux@mailman.qth.net, Linux Hams <linux-hams@vger.kernel.org>, dblog-Linux-logger@googlegroups.com, fldigi-alpha@lists.berlios.de, Forum Logger32 <hamlogger@yahoogroups.com>

Hi everybody,

I have just uploaded the version 1.2 of DBLog on

http://www.qsl.net/zp4kfx/Linux/DBLog/dblog.html

NEW: Corrected a bug that was causing a crash clicking into an empty WB=
4
          table.

         Added a more precise computation of distance and bearing when=20
         the locator is introduced.


=A0 =A0 =A0* Group home page: http://groups.google.com/group/dblog-Linu=
x-logger
=A0
=A0 =A0 =A0* Group email address dblog-Linux-logger@googlegroups.com

-----------------------------------------------------------------------=
------------------------------------------------
DBLog is a logger program for Linux inspired to Logger32 and to N1MM_Lo=
gger.

It works in harmony with fldigi for operating digi-modes.

DBLog =A0is UTF-8 compliant and sensitive to the 'locale'.=20

It stores all QSO data's and QSL pictures =A0into the RDBM PostgreSQL.

It uses cwdaemon to send CW code, hamlibs to control the radio and xdx
to receive cluster spots.

Can be used by other ham-radio programs as a logger-server (EME or othe=
r=20
digimodes)

Has a Client/Server architecture, so multi-operators stations can log a=
t the=20
same time into the same log.

Beyond sources for GAMBAS2 ( http://gambas.sf.net ) there are available=
 the=20
installation packages for Debian, OpenSuSE, Fedora, Mandriva, Ubuntu an=
d=20
Slackware.
It is also available an "Autotool" package.

It is distributed under the GPL licence.=20

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
