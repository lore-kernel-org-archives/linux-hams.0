From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] Hamlib 1.2.4 released
Date: Tue, 5 Apr 2005 22:40:30 +0200
Message-ID: <20050405204030.GL4811@charybde.local>
Mime-Version: 1.0
Return-path: <hamlib-developer-admin@lists.sourceforge.net>
Content-Disposition: inline
Sender: hamlib-developer-admin@lists.sourceforge.net
Errors-To: hamlib-developer-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=hamlib-developer>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>

Good news everyone!

Hamlib-1.2.4 has been released.

Hamlib provides a unified environment for the development of radio and
rotator control applications. Release 1.2.4 includes many fixes since
last official version.

Check it out at http://hamlib.org !

New in 1.2.4:
* frontend API: port_t renamed as hamlib_port_t
* new models: TS-480, VR5000, FT1000MkV Fld
* fixes: TS-570S, AR7030, AR3000A, Orion, FT-897, IC746
* port: - fixed 64bit int handling which potentially fixes
	  backends kenwood/alinco/pcr/uniden/aor/jrc/tentec
	- added xBSD parallel port support


Download pages are accessible at http://sourceforge.net/projects/hamlib
i386 rpms and .deb are already available thanks to Joop PG4I.
Win32 DLL's are coming soon, with VisualBasic and .NET wrappers.
Please note that RPC backends do not build with GCC 4.0pre,
but will hopefully in next release.

Test it out and report to hamlib-developer@lists.sourceforge.net.
Developers are also invited to join the Hamlib team by subscribing to
this mailing list. If your favorite rig is not in the supported list,
feel free to ask.


Many thanks to all the developers and testers who participated
in this release. They are listed in the AUTHORS file.

Have fun and let us know!

73's de Stephane - F8CFE / the Hamlib team


-------------------------------------------------------
SF email is sponsored by - The IT Product Guide
Read honest & candid reviews on hundreds of IT Products from real users.
Discover which products truly live up to the hype. Start reading now.
http://ads.osdn.com/?ad_id=6595&alloc_id=14396&op=click
