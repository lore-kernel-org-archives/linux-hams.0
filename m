From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 1.2.15.3 released
Date: Thu, 1 Nov 2012 21:41:07 -0500
Message-ID: <20121102024107.GN32043@n0nb.us>
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
To: Linux Hams <linux-hams@vger.kernel.org>, Hamlib Developers <hamlib-developer@lists.sourceforge.net>

Hamlib 1.2.15.3 is now released and available from:

https://sourceforge.net/projects/hamlib/files/hamlib/1.2.15.3/

Changes in this release from 1.2.15.2 are:

Version 1.2.15.3 2012-11-01
	* Fix configure.ac so that rigctld/rotcld work on Win32 platform
	* Add NSIS script to build executable installer on Win32 platform
	* Remove unsupported commands on IC-756 (non-Pro model) from AK6I
	* Fix set_split in netrigctl.c to properly accept the split value.
		TNX, N2ADR.
	* IC-R8500: Add RIG_LEVEL_AF to has_set_level. TNX John, EI7IG
	* ADAT updates from Frank, DG1SBG, needed for stable operation. 

This is likely the last planned release of the Hamlib 1.2 series.
Development will now focus on the Hamlib 3 series which is now
configured to be ABI compatible with the 1.2 series.

73, de Nate >>

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us

------------------------------------------------------------------------------
LogMeIn Central: Instant, anywhere, Remote PC access and management.
Stay in control, update software, and manage PCs from one command center
Diagnose problems and improve visibility into emerging IT issues
Automate, monitor and manage. Do more in less time with Central
http://p.sf.net/sfu/logmein12331_d2d
