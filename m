From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] Hamlib 1.2.5 released
Date: Sun, 26 Feb 2006 23:44:32 +0100
Message-ID: <20060226224432.GU7491@charybde.local>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>

Good news everyone!

Hamlib-1.2.5 has been released.

Hamlib provides a unified environment for the development of radio and
rotator control applications. Release 1.2.5 includes many improvements 
since last official version.  
 
Check it out at http://hamlib.org !  
 
New in 1.2.5:
* frontend API: support for clonable rigs 
  - rigmem: CSV format change 
  - rigctl: new send_cmd for protocol debugging purpose 
  - easy USB devices support 
* new models: AR8600, AR2700, DWT (DLL based under Windows,
		libusb based under other OS, need test) 
* fixes: big AOR update, AR7030, Orion, NRD-545, RX-320, 
	 FT-817, FT-990, TS-2000, Easycomm 
* port: BSD fix of parallel port support 
 
 
Download pages are accessible at http://sourceforge.net/projects/hamlib  
i386 rpms, .deb and Win32 DLL's coming soon.  
 
 
Please, test it out and report to hamlib-developer@lists.sourceforge.net  
Developers are also invited to join the Hamlib team by subscribing to
this mailing list. If your favorite rig is not in the supported list,
feel free to ask.
 
Many thanks to all the developers and testers who participated
in this release. They are listed in the AUTHORS file.

Have fun and let us know!  
 
73's de Stephane - F8CFE / the Hamlib team
