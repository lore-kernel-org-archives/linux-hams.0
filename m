From: Ralf Baechle <ralf@linux-mips.org>
Subject: linux-ax25.org outage
Date: Thu, 31 Dec 2009 09:06:54 +0100
Message-ID: <20091231080654.GA15689@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On December 22 linux-ax25.org's uplink failed.  Despite repeated promises
the company providing the copper (Bloody Telecom) has not managed to fix
the equipment; they last promised _yesterday_ to fix things 24/12/09.
Well done ...

I've re-routed the IP address space to another site but being absent I
unfortunately don't have access to the current data or backups of
linux-ax25.org, so the temporary site is running a 3 month old backup.
This means:

 o If you want to edit the wiki keep in mind that all wiki edits will be
   lost once the actual site is back.  It's just too painful to transplant
   edits from one instance of mediawiki to another.
 o Think if you really want to run a "cvs update".  Cvs being stupid might
   actually perform a downgrade.  This also means we won't do any CVS
   checkins until old machine is back.

   If there is interest I can put a git conversion of the CVS repo online.
   It is newer than the CVS - and won't do silly stuff like downgrading
   just because an upstream repo happens to be out of date.  We should
   probably migrate anyway.

Cheers,

  Ralf
