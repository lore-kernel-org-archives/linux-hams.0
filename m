From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gMFSK/hamlib/parport
Date: Wed, 18 Feb 2004 22:12:00 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1077135120.1270.67.camel@oh2bns.ampr.org>
References: <20040218152745.GD16991@strauss.udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040218152745.GD16991@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Wed, 2004-02-18 at 17:27, Mike Markowski wrote:

> 	Feature request:
> 	- Are there any patches that allow gMFSK to use
> 	  a parport for PTT?  If not, I'll be glad to look into
> 	  possibly re-using the parport code from soundmodem-0.7.

There is no direct support available. Like Stephane said, hamlib
can control PTT through the parport.

Direct support would be nice and it shouldn't be difficult. The
biggest work would be implementing the config options and GUI
changes for them... :(

> 	Bug report (but maybe in hamlib):
> 	- I'm using an ICOM 706 MkIIg with hamlib on ttyS0 and
> 	  PTT to "none" in gMFSK just for the sake of seeing how
> 	  gMFSK uses hamlib.  When I rotate the rig's tuning knob,
> 	  gMFSK works for a bit nicely updating the spectrum freqs,
> 	  but then I get a "Protocol error" and hamlib is disabled.
> 	  I assume the data out of the rig is changing too rapidly
> 	  for hamlib to capture it?  Or maybe gMFSK is trying to
> 	  reread the data too frequently?

I have had one similar complaint. I think this is really a hamlib
issue but anyway for the next beta I have relaxed the error checking.
The errors are not considered fatal anymore and messages go to the
status bar instead of annoying popups...

> Oh, and I finally looked at gMFSK's "Help".  You know how it goes, when
> all else fails read the manual...  I like how you included so many
> URLs in there Tomi.  But I notice under the Usage section, it talks
> about opening images and how to scroll them.  :-)  Reused text from
> something else I guess?

Most of the contents are bogus ie. left-overs from the Gnome 
documentation project sample documents (which in turn are actually
Eye of Gnome (eog) docs...).

Thanks to Carl VK1KCM the next beta will have a bit more relevant
content.

-- 
Tomi Manninen / OH2BNS / KP20ME04

