From: Stephane Fillod <f8cfe@free.fr>
Subject: [ANN] Hamlib 1.2.10 released
Date: Mon, 2 Nov 2009 23:55:23 +0100
Message-ID: <20091102225523.GC4862@charybde.local>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: Linux HAMs <Linux-hams@vger.kernel.org>

Good news everyone!

Hamlib-1.2.10 has been released.

Hamlib provides a unified environment for the development of radio
and rotator control applications. The release 1.2.10 includes many
improvements since last official version.

The wiki site is available at http://apps.sourceforge.net/mediawiki/hamlib/

Version 1.2.10
* New models: IC-7200, PCR-1500, PCR-2500, RX-340, R&S ESMC, BC898T,
	Si570 AVR-USB, Paragon (skeleton)
* New rotator backends: SPID, GS-232 (not A or B)
* Fixes and features: TH-F7E, K2, FT-920, Yaesu NewCAT, IC-7000, IC-7800,
	IC-910, IC-718, IC-756PROIII, Tentec Orion, Jupiter, RX320, AOR-8000,
	PCR-1000, Video4Linux, all the kenwood backends, GS-232A
* ABI version in backend symbols
* expose PTT/DCD setup through rig_set_conf()
* Parallel port PTT now following cwdaemon (STROBE+INIT) interface
* bindings
* ltdl update

Download pages are accessible at http://sourceforge.net/projects/hamlib,
rpms, .deb and Win32 DLL's coming soon.

Please, check it out and report to hamlib-developer@lists.sourceforge.net
A big update of the kenwood backend has been performed, so we'd like to hear
about Kenwood rig owners. If your favorite rig is not in the supported list,
feel free to ask. We need more beta-testers, so all the backends can reach
the stable and fully supported state.

Many thanks to all the developers and testers who participated
in this release. Contributors and backend maintainers are listed in
the AUTHORS file.

Have fun and let us know!

73 de Stephane - F8CFE & the Hamlib team

