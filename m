From: John Magliacane <kd2bd@yahoo.com>
Subject: Announcing SPLAT! version 1.1.0
Date: Thu, 29 Jan 2004 13:43:02 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040129214302.28508.qmail@web12205.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

SPLAT!, a terrain and RF path analysis application for Linux/Unix,
has been extensively modified by J. D. McDonald in January 2004 to
include the Longley-Rice propagation model using C++ code from NTIA/ITS.

In addition to analyzing line-of-sight propagation paths, SPLAT! now
generates multi-color maps illustrating predicted signal strengths
(path loss), path loss graphs, path loss reports, and terrain height
graphs.  The default Earth radius as well as the default line-of-sight
and path loss analysis range used by SPLAT! may also be modified using
new command-line options.

splat.c was renamed to splat.cpp to reflect changes necessary to merge
with Longley-Rice C++ code.  A C++ compiler (gcc/g++) is now required
to compile SPLAT!.

This new release supercedes the older 1.0.3 version of SPLAT!

For futher information, please see the SPLAT! web site at:

	http://www.qsl.net/kd2bd/splat.html

Until its release is made available through ibiblio.org and
its mirrors, SPLAT! may be downloaded via http at:

	http://www.qsl.net/kd2bd/splat-1.1.0.tar.gz

Happy SPLATting!  :-)


73, de John, KD2BD


=====
Visit John on the Web at:

	http://www.qsl.net/kd2bd/

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
