From: Mike Markowski <mm@UDel.Edu>
Subject: gMFSK/hamlib/parport
Date: Wed, 18 Feb 2004 10:27:45 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040218152745.GD16991@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Hi all,

A couple questions about the excellent gMFSK 0.6beta2:

	Feature request:
	- Are there any patches that allow gMFSK to use
	  a parport for PTT?  If not, I'll be glad to look into
	  possibly re-using the parport code from soundmodem-0.7.

	Bug report (but maybe in hamlib):
	- I'm using an ICOM 706 MkIIg with hamlib on ttyS0 and
	  PTT to "none" in gMFSK just for the sake of seeing how
	  gMFSK uses hamlib.  When I rotate the rig's tuning knob,
	  gMFSK works for a bit nicely updating the spectrum freqs,
	  but then I get a "Protocol error" and hamlib is disabled.
	  I assume the data out of the rig is changing too rapidly
	  for hamlib to capture it?  Or maybe gMFSK is trying to
	  reread the data too frequently?

I haven't played around with either yet just in case others are already
aware and working on it.

Oh, and I finally looked at gMFSK's "Help".  You know how it goes, when
all else fails read the manual...  I like how you included so many
URLs in there Tomi.  But I notice under the Usage section, it talks
about opening images and how to scroll them.  :-)  Reused text from
something else I guess?

	Thanks for any info,
	Mike  AB3AP
