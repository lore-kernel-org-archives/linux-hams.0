From: Pino Zollo <pinozollo@gmail.com>
Subject: fldigi and DBLog
Date: Tue, 23 Jun 2009 13:21:15 -0400
Message-ID: <200906231321.16195.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=78ibvlf57pLe7faBeDtSz9Jknpkse+3NCzVnRj5BBGg=;
        b=Bd+agVlB0TFsxpEZBmb6g+djop/8tkeJhb8GqRZWjG+V1ZipgIfqP5tw8kUXlKFLzj
         qd4dJEh7VpcnfOhCe8dPPjsqt5ydgOwktPi32ns35q6obGJF4ZnJ2a+4oP1Y4rJiY2Fd
         sdUQr+Lw2c2o41C/DZug75YmcjbibJFOfHB8g=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fldigi-alpha@lists.berlios.de
Cc: Alberto Guglielmo <a.guglielmo@tcpsas.com>, Vlad <ua6jd@vfemail.net>, ham-linux@mailman.qth.net, Forum Logger32 <hamlogger@yahoogroups.com>, Linux Hams <linux-hams@vger.kernel.org>

Hi everybody,

I have just uploaded the version 0.15.2 of DBLog on

http://www.qsl.net/zp4kfx/Linux/dblog.html

DBLog is a logger program for Linux inspired to Logger32 and to M1NN_Logger.

It works in harmony with fldigi for operating digi-modes.

DBLog  is UTF-8 compliant and sensitive to the 'locale'. 

It stores all data's in the RDBM PostgreSQL.

Beyond sources for GAMBAS2 ( http://gambas.sf.net ) there are available the 
installation packages for Debian, OpenSuSE, Fedora, Mandriva and Ubuntu.

It is also available an "Autotool" package.

All of these need to be tested, so I invite experimenters to give it a try.

Have fun !

73 de Pino
ZP4KFX

-- 
Key ID: 0xF6768208 
Key fingerprint = B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
