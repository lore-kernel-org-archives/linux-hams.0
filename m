From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 1.3
Date: Mon, 21 Dec 2009 11:57:26 -0300
Message-ID: <200912211157.26660.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=SmGa7E+hjVMXyPOfGT01ur37mhNyWLKNVLhpPJVqCUk=;
        b=GByrCMWc/zkA6X4jD8YM8TlJFOZIQlkH8o93T4Hgz0Sv6mKJdijbQePBmorvU2QeRj
         x6ANyI605TmsWpoyXobX7Ii/AA/Q3VJn28nH9eJ29PXVLvqvkHn8zHD+uh1lIWrmD90g
         e8iVlD1yC8e6EWel6r2+8uTDl5Z1bj4OV1x7w=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hi everybody,

I have just uploaded the version 1.3 of DBLog on

http://www.qsl.net/zp4kfx/Linux/DBLog/

NEWS:

    --   Introduced DBCluster in alternative to 'xdx'. DBCluster allow to
         select the cluster server from a large table and allows to spot
         worked or heard stations.

   --   Integrated with WSJT 7 for weak signal modes. This needs a modified
        version of wsjt.py available on the same site.

   --  Recognise the new 600m band.

   --  Lots of bugs killed and improvements.   
-------------------------------------------------------------------------------------------------------------------

     * Group home page: http://groups.google.com/group/dblog-Linux-logger
 
     * Group email address dblog-Linux-logger@googlegroups.com

-----------------------------------------------------------------------------------------------------------------------

DBLog is a logger program for Linux inspired to Logger32 and to N1MM_Logger.

It works in harmony with fldigi  and with wsjt for operating digi-modes and
weak signal modes.

DBLog  is UTF-8 compliant and sensitive to the 'locale'. 

It stores all QSO data's and QSL pictures  into the RDBM PostgreSQL.

It uses cwdaemon to send CW code, hamlibs to control the radio and xdx
or DBCluster to receive cluster spots.

Can be used by other ham-radio programs as a logger-server (EME or other 
digimodes as implemnted for wsjt)

Has a Client/Server architecture, so multi-operators stations can log at the 
same time into the same log.

Beyond sources for GAMBAS2 ( http://gambas.sf.net ) there are available the 
installation packages for Debian, OpenSuSE, Fedora, Mandriva, Ubuntu and 
Slackware.
It is also available an "Autotool" package.

It is distributed under the GPL licence. 

Bug reports and comments are welcome.

73 de
Pino ZP4KFX
-- 
Key ID: 0xF6768208 
Key fingerprint = B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
