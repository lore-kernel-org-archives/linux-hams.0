From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 3.0.1 released
Date: Wed, 6 Jan 2016 19:03:08 -0600
Message-ID: <20160107010308.GX10544__21176.3043691919$1452133116$gmane$org@n0nb.us>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date;
	bh=MaT+b2c0JZYE76FRcWNXzK/8104aG++56K96pqJY/ko=; b=HxhRXU72pXRVop3sf9VdUGEisk
	+3FE7/bWHif0TWEv8YbiGlUTtizGl1208wVRsAA1Xf5r2Z3hE8zoKK7w56W09Cu4O+ejTYJCPb85v
	jFZ9gSde89gEl7ejoelFFMvkVZfkHfV1pmhf4FA+2RV6pFuAnyo/Qq8LvjH+nvPWB8H0=;
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>

A new year brings us a new Hamlib release,  Yea!

Okay, it's not that exciting as this is a bug fix release for Hamlib
3.0.  Fortunately, the bugs were minor.

From the NEWS file:

Version 3.0.1
        2016-01-06
        * Fix kenwood_set_mode for ts590s and mode CW, RTTY or AM.
          TNX Tom, DL1JBE
        * Increase retries for many Kenwood radios. Validate Yaesu newcat
          commands.  TNX Bill, G4WJS

The source tarball and Windows 32 bit binaries can be downloaded from:

https://sourceforge.net/projects/hamlib/files/hamlib/3.0.1/

Of note, the Windows packages are once again built with MS VC++ support
that was skipped in 3.0.  However, this support was asked for and has
been restored.

I am testing the building of Windows 64 bit packages.  At this time
support for the USB backends will be missing until Hamlib is ported to
the newer libusb.  Also, I am unsure if MS VC++ support can be provided
for the 64 bit builds.  I would like to hear from anyone who can advise
how this might be accomplished.

Looking ahead I would like to release Hamlib 3.1 sometime in the first
half of February.

For the Hamlib Group and all of the contributors,

73, Nate, N0NB

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us
