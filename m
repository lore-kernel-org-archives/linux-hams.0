From: Pino Zollo <pinozollo@gmail.com>
Subject: Proposal for coding in UTF-8
Date: Fri, 10 Jul 2009 16:16:25 -0400
Message-ID: <200907101616.26422.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=xgLAeu++Z4zU+to7m9WLqRkaco/9LTiCGDa7/FnSALE=;
        b=YbFdiPuWh5NPxWL2JLGQ6px+Pif/IjOLcvFUEnGBeBMp5s+Zad8JNOL++0Nq3v88qV
         feo5ZB25pIiVFZdt9Itp4AJjHIDHR+eTaZ0/kHdwnbOdDGle/i+pn34Yl2J/e/Nk2s/U
         SiPjhshSyEdvdqlp6ujQiPhprAM1uRPBJ1H60=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ADIF <adifdev@yahoogroups.com>
Cc: ham-linux@mailman.qth.net, Linux Hams <linux-hams@vger.kernel.org>, Debian Hams <debian-hams@lists.debian.org>

Hi de ZP4KFX

I propose to include into the standard the following tag for the header:

<ENCODING:5>UTF-8 

ENCODING can be absent or can be <ENCODING:10>ISO-8859-1

This is already implemented in my DBLog...see http://www.qsl.net/zp4kfx/Linux


http://www.qsl.net/zp4kfx/Linux/TestUTF8.html

http://www.qsl.net/zp4kfx/Linux/DBLog/Shot-QSO%20List-utf8-%20test.png

DBLog works on Linux and stores data's on PosgreSQL, both of which are UTF-8 
compliant.

DBLog can export both in ISO-8859-1 or in UTF-8.

Importing, if it  finds into the header <ENCODING:5>UTF-8  then does not do 
any coversion.
If it  finds  <ENCODING:10>ISO-8859-1 or no ENCODING tag, then converts into 
UTF-8.

The difference is mainly for the accented vowels (from 128 to 256) that come 
mainly by N1MM or Logger32 ADIF files.

Also other loggers could follow this method or be aware of the ENCODING tag to 
avoid errors.

Best 73 de

Pino ZP4KFX

-- 
Key ID: 0xF6768208 
Key fingerprint = B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
