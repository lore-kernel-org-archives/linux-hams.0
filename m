From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 1.2.14 released
Date: Sun, 31 Jul 2011 10:08:33 -0500
Message-ID: <20110731150833.GN5728@n0nb.us>
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
To: Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>, Ham-Linux <ham-linux@mailman.qth.net>, Fldigi Alpha Team <fldigi-alpha@lists.berlios.de>, Hamlib

The Hamlib team announces the release of Hamlib 1.2.14, the first since
adopting a timed release schedule of 1 Feb and 1 Aug each year.  Changes
since 1.2.13 include:

    * New models: SigFox Transfox, TH-D72A, IC-7410, IC-9100, IC-R9500,
      KX3, V4L2 API support (untested),
    
    * New rotator backends: IF-100, TS-7400
    
    * Fixes and features: K3/KX3, Build Win32 from script,
      rigctld/rotctld ported to Mingw32, Win32 build fixes, remove
      obsolete bundled libtool files, rigctl improvements, FUNcube
      string test (works with V0.0 and V1.0), Yaesu newcat.c fixed to
      use rig->state.current_vfo to store vfo value, add a command to
      halt rigctld, select PTT source in Kenwood backends (TS-590S),
      make sure scan is stopped at IC-9000 opening, thd72 get channel
      data (alpha).


For a complete log of changes to Hamlib 1.2.14, please visit:

http://hamlib.git.sourceforge.net/git/gitweb.cgi?p=hamlib/hamlib;a=shortlog;h=refs/heads/Hamlib-1.2.14


The project welcomes contributions of support for new radio and rotor
models and bug fixes or feature enhancements for existing models.

Future plans include development of "API 3" to tweak the current API as
needed to support newer devices with expanded capabilities and enhance
the current Hamlib API.  Participation by developers using Hamlib in
their programs is welcome.

For the Hamlib team,

73, de Nate >>

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us

------------------------------------------------------------------------------
Got Input?   Slashdot Needs You.
Take our quick survey online.  Come on, we don't ask for help often.
Plus, you'll get a chance to win $100 to spend on ThinkGeek.
http://p.sf.net/sfu/slashdot-survey
