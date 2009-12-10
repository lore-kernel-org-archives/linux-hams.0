From: Pino Zollo <pinozollo@gmail.com>
Subject: wsjt7 <--> DBLog
Date: Thu, 10 Dec 2009 10:05:55 -0300
Message-ID: <200912101005.56026.pinozollo@gmail.com>
Reply-To: pinozollo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:organization:to
         :subject:date:user-agent:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=Wc3ofpbEktB0hRpjeZMJfW/PTymMcUrT6ibzwOar3HY=;
        b=sq+6WS9g5WuZelwoXLSpuKF/xJeuNWQe6mzYb+LY1uslYrOHZQ0+2YWGhkTtN4hhqn
         PZbamBTWMCit1qeJdVhnysZDdTFRanLnmTAi/54dbs80brESkpJB8zPa1Og40i+d26l2
         dJLT5UCLmXzEaEqg99s0C1RCmgj++cCZpisGc=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wsjt-devel@lists.berlios.de

Hi,

I have uploaded on  http://www.qsl.net/zp4kfx/Linux/WSJT

a version of wsjt.py that interacts with my DBLog.
   http://www.qsl.net/zp4kfx/Linux/ )

It is my first-one with Python so, please, pardon me for the code.

When the new wsjt.py starts it tries to connect to DBLog in TCP on port 3164.

If this succeeds, double-clicking  on a received call, sends it to DBLog.

DBLog will show it in the main window and,eventually, the list of the WB4.

When the QSO is finished, clicking on "Log QSO" of wsjt will log the QSO also 
on DBLog.

Exiting wsjt will disconnect from DBLog.

On the site there are two screen-shots and a tarball of the wsjy7 that I have 
used. This last one has been produced by IK1CHE from the SuSE distribution.
It compiles well on my Debian 5.01; it just takes to copy by hand KVASD_g95 
into /usr/bin.

Read the INSTALL for more information.

best 73

Pino ZP4KFX  pinozollo at gmail . com

-- 
Key ID: 0xF6768208 
Key fingerprint = B16D 0A7C 5B29 A334 CE6A  71F6 EAF8 3D88 F676 8208
Key server: hkp://wwwkeys.eu.pgp.net
