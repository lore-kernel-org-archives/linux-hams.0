From: Pino Zollo <pinozollo@gmail.com>
Subject: DBLog 1.4
Date: Mon, 21 Jun 2010 18:08:16 -0400
Message-ID: <201006211808.16334.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:mime-version:content-disposition:message-id
         :content-type:content-transfer-encoding;
        bh=JD4jVJa6f00NJMn16wb6n0nOfp5DY+6fcUKYsHzqvj0=;
        b=VIh6CQH/7skl44ESLgOhC3oEasFbhnRONDSIxud0T/ScZ3N7Jo6J6q0+HCwfwtTT9v
         MinkPujU4cdqMeGafv3QoEbKrcbflN/vgOAXj8SUQKdzIEwCdp5qsrPPFfrbdAY8/WlE
         oDl1BuTHYLw14zwiYXux6MLaLTn/p56XQD7ck=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hi everybody,

I have just uploaded the version 1.4 of DBLog on

http://www.qsl.net/zp4kfx/Linux/DBLog/

NEWS:
    
---- Supports transverters: For every transverter an entry into the new 
table "transverters" of  the database, allows to configure the band, the 
local oscillator and the transceiver band and mode.

---- Al bands up to 1mm are supported.

---- Uses the new  "Extended protocol" with rigctld. It needs Hamlib >= 1.2.11

---- Statistics and summary for DXCC, WAC

---- WEFAX of Fldigi is supported  like a special band.

---- Database backup

---- Update statistics now puts the dxcc number were missed

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

Best 73

Pino ZP4KFX
-- 

"In the universe there is no time existing as a physical reality,
 there is no past, no present and no future"
"Time is a mind construction into which one experiences motion"
"Time is a flow of irreversible material changes"
-Davide Fiscaletti

Key ID: 0xF6768208 
Key fingerprint = B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
