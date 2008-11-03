From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] Hamlib 1.2.8 released
Date: Mon, 3 Nov 2008 22:17:57 +0100
Message-ID: <20081103211757.GJ12042@charybde.local>
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
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>

Good news everyone!

Hamlib-1.2.8 has been released.

Hamlib provides a unified environment for the development of radio and
rotator control applications. The release 1.2.8 includes many
improvements since last official version.

Check it out at http://hamlib.org !

New in 1.2.8:
* New models: BC235, BC250, BC780, PRO-2052,
  BCD396T, BCD996T, K3, FT950
* New pseudo models: netrigctl/netrotctl, backends ala
  rpcrig/rpcrot, but based on rigctld/rotctld
* New rotator backend: GS232A, PcRotor
* Removed microtune backend
* Fixes: DttSP, IC-275, IC-475, IC-725, IC-735, IC-756PRO,
  IC-761, IC-775, IC-781, IC-706*, Kenwood TH/TM models, Orion,
  BC245, BC895, FT-100, FT757GX, FT-857, FT-897, FT-920
* Numerous bindings fixes, esp. for memory channel works
* New commands available in rigctl
* New rotctld to go with rigctld rig daemon.
  The protocol changed, but there's the compatibility
  option -e to pass to the daemon for previous protocol.


Download pages are accessible at http://sourceforge.net/projects/hamlib
rpms, .deb and Win32 DLL's coming soon (MinGW32 build needs a fix)

Please, test it out and report to hamlib-developer@lists.sourceforge.net
Developers are also invited to join the Hamlib team by subscribing to
this mailing list. If your favorite rig is not in the supported list,
feel free to ask. We need more beta-testers, so all the backends can
reach the stable and fully supported state.

Many thanks to all the developers and testers who participated
in this release, and esp. to the ARRL for giving access to rigs.
Contributors and backend maintainers are listed in the AUTHORS file.

Have fun and let us know!

73's de Stephane - F8CFE & the Hamlib team

-------------------------------------------------------------------------
This SF.Net email is sponsored by the Moblin Your Move Developer's challenge
Build the coolest Linux based applications with Moblin SDK & win great prizes
Grand prize is a trip for two to an Open Source event anywhere in the world
http://moblin-contest.org/redirect.php?banner_id=100&url=/
