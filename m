From: Dennis Boone <drb@msu.edu>
Subject: Syntorxgen v1.0rel
Date: Sat, 23 Nov 2002 12:15:21 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18FdsI-0005Cc-00@yagi.h-net.msu.edu>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

The first release (v1.0rel) of syntorxgen is now available from
http://msuarc.egr.msu.edu/syntorx/.

Syntorxgen generates code plugs (i.e. sets of channel settings for
frequency, PL, etc.) for Motorola Syntor X transceivers.

It is developed and runs on Linux.  Binaries are also available for
Windows and MS-DOS, and the package should be portable to other
platforms without too much trouble.  The program reads the
specifications for the desired code plug from a simple text file, and
writes an image to a disk in various formats suitable for use with an
EEPROM programmer.

A code plug decoder which reads a code plug and produces a syntorxgen
input file is included, as are a number of sample input files,
scripts for generating test code plugs, etc.

A Debian package is available, courtesy of KC8PUN.

Syntor X radios are built tough, perform well, are relatively
inexpensive, and are suitable for a variety of purposes including
packet.  Voluminous documentation is available on the web.

Dennis Boone
KB8ZQZ
