From: Nate Bargmann <n0nb@n0nb.us>
Subject: Hamlib 3.0 release announcement
Date: Sat, 19 Sep 2015 09:28:29 -0500
Message-ID: <20150919142829.GS3787@n0nb.us>
Mime-Version: 1.0
Return-path: <bounce-debian-hams=debian-hams=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us; s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=nKeacKbBL3QkgnJSZFZQ1DO4jx4m9Nmy9QHjK9mLqSA=;
	b=ZlTF0yWRAYlhR5xBm6wMB8rvJb4TiKxZRYZTcCHcrATYJKJ3dREZ8eaBWAuZS2huLpjosSOdXpgJVFRRd584kPLOI/qMmxY5g18GFleq/uTlwmV9jMhjDgO0Lkkp3c2FphFojAtHQJD0Ceyo9tATxAH+41Rwv8JwIUGTmOFGAbw=;
Content-Disposition: inline
Resent-Message-ID: <dSUFuKHtHGI.A.ydF.gEX_VB@bendel>
List-Id: <linux-hams.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-hams/>
List-Post: <mailto:debian-hams@lists.debian.org>
List-Help: <mailto:debian-hams-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hams-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hams-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20150919142829.GS3787@n0nb.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>, Dave Freese <w1hkj@bellsouth.net>, Ubuntu Hams Group <ubuntu-hams@lists.launchpad.net>

The Hamlib Group is pleased to announce the release of Hamlib 3.0.

This release of Hamlib introduces a change to the version scheme.
Essentially, the leading '1.' characters have been dropped so '3.0' is a
direct follow on from the '1.2.' releases and has been configured to be
ABI compatible with the '1.2.' releases.

Bug fixes to this release will start with '3.0.1' through '3.0.n'.

The next releases will be '3.1' through '3.n' until the next major
release.


Files are hosted at the Hamlib prjoect page at SourceForge.net:

https://sourceforge.net/projects/hamlib/files/hamlib/3.0/


The changes include:

Version 3.0
        2015-09-20
        * Kill RPC backends and rpc.rigd/rpc.rotd
        * Remove -e|--end-marker option from rigctld and rotctld
        * Build system updates--remove obsolete macros, autogen.sh now
                runs autoreconf to invoke Autotools to bootstrap the build
                system, libltdl is installed into the source tree as a part
                of the build system bootstrap and is included in the source
                tarball, ABI version is set to be compatible with the 1.2
                series, all Autotools installed files are copied rather than
                symlinked and put in the build-aux directory, building
                rigmem and rigmatrix are now user selectable at configure
                run time, building static libraries are disabled by default.
                Fixed TCL binding installation, fixed Perl binding build so it
                is not invoked by 'make dist' and clean up build files.  Cleaned
                up bindings builds to occur in alphabetical order.  Use new
                ax_pkg_swig macro and update ax_python_devel macro.  Test for
                presence of pkg-config before testing for pkg-config use.
        * Implement new RIT/XIT activation/deactivation through rig_get/set_func()
        * IC-PCR1500/2500 default write_delay to 0, IC-746/756, IC-PCR8500
                fixes, pcr.c, pcr1500.c: Add DSP support.  TNX Paul, KE7ZZ
        * WinRadio G313 updates.  TNX Julian Campbel
        * Readline editing and history support added to rigctl interactive
                mode.  Implement options for reading and writing history file.
        * Readline editing and history support added to rotctl interactive
                mode.  Implement options for reading and writing history file.
        * A new manual draft written in Texinfo added.  Both GNU Info and single
                HTML files are built and distributed, requires makeinfo.
        * Android build system support.  See android/README.android.  Android
                Makefile fragments are included in source tarballs.
        * Monolithic library, thanks to Remi Chateauneu for the majority of
                the work!  This allows enabling of a single static library so
                static libs are enabled by default.  Removes dependency on libltdl.
        * Fixes to easycomm, TNX Steve AI4QR.
        * Fixes to port handling allowing PTT and CAT on the same port.  TNX
                Bill, G4WJS.
        * New Peaberry models V1 and V2 added to kit backend.  TNX ON8VQ
                and R2AEE.
        * New IC-7100 model.  TNX Martin, CT1IQI.
        * Use AC_CHECK_LIB macro to search for libusb rather than rely on
            pkg-config.  Preserve environment variables LIBUSB_CFLAGS and
            LIBUSB_LIBS as user precious variables.  Two features,
            --with-xml-support and --enable-usrp still rely on pkg-config so
            only invoke pkg-config when either or both of these features are
            selected.  Only the Winradio g313 model uses libdl so test for it
            only when Winradio backend is enabled.
        * New IC-M700PRO, IC-M710, IC-M802.
        * New Icom ID-5100 model.
        * New rotor, cnctrk by KI4SBL
        * Many backend fixes and updates from many contributors (see Git
          log for complete details).

Also all work from 1.2.15.3 and prior releases.


TODO:

Continue to improve the documentation.  This includes completing the
included manual and migrating content from the old MediaWiki format to
the Markdown format now used by SourceForge.net.  Target: ongoing.

Due to the apparent lack of a libusb package for Windows 64 bit, trial
builds of the current Hamlib for W64 lack support for the USB backends.
The project should transition these backends to the newer libusb 1.0
series.  Target: 3.1.

Continue to accept support for new radios and devices and improvement to
existing radios and devices.  Hamlib has a large list of contributors
and development relies on testing and code contributions from owners of
the many varied radios, rotors, and whatever else Hamlib may come to
support in the future.


The Hamlib Group offers their sincere thanks for everyone whose work has
made this release possible.

73, Nate
