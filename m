From: Tomi Manninen <oh2bns@sral.fi>
Subject: ANN: gMFSK v0.6beta2
Date: Fri, 23 Jan 2004 19:06:12 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1074877572.1299.114.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hi all,

The second beta of gMFSK, the Gnome Multimode HF Terminal program has 
been released to the public. You can find it here:

  http://gmfsk.connect.fi/

This time no RPMs. If you want to build RPMs yourself, do a
"rpmbuild -ta gmfsk-0.6beta2.tar.gz".

Changes in this release include

 - A configuration druid (or wizard) that pops up the first
   time you launch the software

 - New macros: $startqso, $logqso, $clearqso (set qso start 
   time, log qso, clear qso data respectively)

 - Some sample macros/fixtexts

 - CWirc (see http://webperso.easyconnect.fr/om.the/web/helloip/)

 - Support for the upcoming hamlib 1.1.5

 - A few bug fixes and other minor stuff. See the ChangeLog
   for details.

As always, have fun!

-- 
Tomi Manninen / OH2BNS / KP20ME04

