From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 3.1 released
Date: Sat, 31 Dec 2016 17:32:58 -0600
Message-ID: <20161231233258.GP3974@n0nb.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <hamlib-developer-bounces@lists.sourceforge.net>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=hamlib-developer>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: hamlib-developer-bounces@lists.sourceforge.net
To: Linux Hams <linux-hams@vger.kernel.org>

The Hamlib developers are pleased to close out 2016 with the latest
release of Hamlib, version 3.1.  Begun in July 2000, Hamlib is a library
written in C intended to ease the work of application developers wishing
to access a wide array of amateur radio equipment.  Hamlib 3.1 includes
support for several new models released to the market since the last
Hamlib release, updates and fixes to many more models, support for the
Lua scripting language, and pre-built packages for Microsoft Windows 32
and 64 bit versions.

The major changes in this release include:

Version 3.1
        2016-12-31
        * Fix kenwood_set_mode for ts590s and mode CW, RTTY or AM.
          Tks Tom, DL1JBE
        * Proper IPV6 and dual stack networking. Bill, G4WJS
        * Add a new command line option '--no-restore-ai' ('-n') to rigctl.
          Bill, G4WJS
        * Fix missing PKTUSB mode setting code for FT-817 & FT-897.  Bill, G4WJS
        * New Prosistel rotor backend from IZ7CRX
        * Install daemon man files to man1.  Nate, N0NB
        * Migrate from libusb-0.1 to libusb-1.0.  Stephane, F8CFE
        * Added support for Icom IC-2730.  robinolejnik
        * Added support for the Icom IC-7300. Mike, W9MDB
        * Add send_morse to icom rigs.  Mike, W9MDB
        * added instructions how to compile on OSX. DH1TW
        * New Perseus model.  Stephane, F8CFE
        * Added Lua binding and demo script.  Ervin, HA2OS
        * Added test to support Flex 6300.  Bill, KB4AAA
        * Many bug fixes and feature enhancements to the code base.  See the
          Git commit log for complete details.


The source tar ball and pre-built MS Windows packages are available for
download from:

         https://sourceforge.net/projects/hamlib/files/hamlib/3.1/

For the Hamlib developers,

73, Nate, N0NB

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most 
engaging tech sites, SlashDot.org! http://sdm.link/slashdot
