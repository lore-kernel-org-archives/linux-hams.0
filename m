From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] Hamlib 1.2.0 released
Date: Tue, 17 Feb 2004 01:03:37 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040217000337.GC24918@charybde.local>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>, GNU Radio mailing list <discuss-gnuradio@gnu.org>

Good news everyone!

Hamlib-1.2.0 has finally been released.

Hamlib provides a unified environment for the development of radio and
rotator control applications. Release 1.2.0 includes many significant
improvements since last version. Just to name a few, while the API
matures slowly, many backends and new models were added, Python binding
is now there, the MinGW(win32) platform is in the supported list.
Besides improvements and bug fixes, the experimental work has been
continued on SDR, more to come soon, so stay tuned.

Check it out at http://hamlib.org !

New in 1.2.0: 
 * API change:
   - freq_t type changed from long long to double
   - setting_t changed from long long to long int.
   - locator and dec/dms interface rework
   - bump library CURRENT version info
 * new backends: Lowe (HF-235), FlexRadio (SDR-1000), skelton TAPR
     (DSP-10), skelton RFT, Ten-Tec models and many new models & fixes
 * new rotator backends: sartek
 * frontend: emulated transceive mode using polling
 * icom: implemented retry, esp. useful for CI-V
 * icom: pipelined tuning on Optoscan's
 * microtune: no need of root priviledges anymore
 * bindings: added Python, new install method (perl is installed in
 * $prefix)
 * rigmem: new command to load/store memory content from/to XML file
 * port: NetBSD & FreeBSD, mingw32(Windows) port, MacOSX ready
 
Note: Kylix binding needs a maintainer.

Download pages are accessible at http://sourceforge.net/projects/hamlib
i386 rpms and .deb coming soon. Win32 DLL and VisualBasic wrapper are planned.


Please, test it out and report to hamlib-developer@lists.sourceforge.net
Developers are also invited to join the Hamlib team by subscribing to this
mailing list.

Have fun and let us know!

73's de Stephane - F8CFE / the Hamlib team
