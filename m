From: Dennis Boone <drb@msu.edu>
Subject: trivnetdb 1.0
Date: Wed, 22 Jan 2003 09:46:48 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18bM9R-0005Br-00@yagi.h-net.msu.edu>
Reply-To: drb@msu.edu
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org, debian-hams@lists.debian.org

If you receive dups of this message, please accept my apologies.  I've
conversed with several of you in different contexts, and I'm losing
track of who is where.

In December I had discussions on a couple of mailing lists and
privately with several individuals about packet-based services, and
about a trivial network database package I wrote for ham use.  I
posted a URL for the bare script at the time.  I had enough inquiries
about the beast that I decided to package it properly.

So, trivnetdb version 1.0 is released.  The package includes the
program itself (somewhat enhanced since December), clear statement of
license (GPL), and some documentation.  The program requires perl and
some assorted perl modules, and a perl DBI compliant database
(e.g. MySQL), and runs on unix hosts.  It can be obtained from:

    http://msuarc.egr.msu.edu/kb8zqz/packet/trivnetdb-1.0.tar.gz

The file is quite small, about 22 kB.

Trivnetdb is designed to be used for public service events like
bike-a-thons, shelter operations, etc, though its capabilities
obviously extend to other uses as well.

Cheers,

Dennis Boone
KB8ZQZ
