From: N5NW Marty <n5nw@n5nw.org>
Subject: more hamlib and gMFSK problems
Date: Sun, 02 May 2004 22:57:33 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1083553053.5208.6.camel@dhcppc3>
Reply-To: n5nw@n5nw.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thanks for the earlier help.  I think I'm making progress.  I think the
issue is with the hamlib install, although some of the programs like
rigctl run ok.  When I ./configure --enable-hamlib | make | make install
gMFSK, I get the following:

checking for libgnomeui-2.0 hamlib... Package hamlib was not found in
the pkg-config search path.
Perhaps you should add the directory containing `hamlib.pc'
to the PKG_CONFIG_PATH environment variable
No package 'hamlib' found

configure: error: Library requirements (libgnomeui-2.0 hamlib) not met;
consider adjusting the PKG_CONFIG_PATH environment variable if your
libraries are in a nonstandard prefix so pkg-config can find them.
--end of quote--

Config without --enable-hamlib gives a good install, but will not
install hamlib:

checking PACKAGE_LIBS... -pthread -Wl,--export-dynamic -L/usr/X11R6/lib
-lgnomeui-2 -lSM -lICE -lbonoboui-2 -lxml2 -lpthread -lz -lgnomecanvas-2
-lgnome-2 -lpopt -lart_lgpl_2 -lpangoft2-1.0 -lgtk-x11-2.0 -lgdk-x11-2.0
-latk-1.0 -lgdk_pixbuf-2.0 -lpangoxft-1.0 -lpangox-1.0 -lpango-1.0
-lbonobo-2 -lgconf-2 -lgnomevfs-2 -lbonobo-activation -lORBit-2
-lgobject-2.0 -lgthread-2.0 -lm -lgmodule-2.0 -ldl -lglib-2.0
configure: Disabling hamlib support

--end quote--

Apparently my hamlib is not installed correctly.  It is in the directory
/usr/local/lib with a bunch of rig-specific hamlib files, and a
subdirectory called pkgconfig with the files fftw3.pc and hamlib.pc in
it.  I did see a message in the archives that suggested editing
/etc/ld.so.conf to add /usr/local/lib and then running ldconfig, which I
did prior to installing gMFSK.

By the way, the behavior is identical in 0.5 and 0.6beta3, if that
matters (my deduction is that this indicates a problem with the hamlib
install, not gMFSK).

Any ideas on where I'm missing the boat, or what I might do to correct?

de N5NW / NNN0RBB (Marty)
Bellbrook, Ohio

 


