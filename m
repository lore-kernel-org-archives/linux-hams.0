From: Gervase Chavasse <g_chavasse@onetel.com>
Subject: gmfsk and SuSE 9.1
Date: Thu, 9 Dec 2004 19:26:05 +0000
Message-ID: <200412091926.06125.g_chavasse@onetel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi everyone

Has anyone succeeded in getting gmfsk-0.6 to work with SUSE 9.1?

I have overcome a number of error messages in the ./configure and make 
processes, but under "make install" I now get the following message:

extract begins
Making install in mt63
make[2]: Entering directory `/usr/local/gmfsk-0.6/src/mt63'
source='dsp.cc' object='dsp.o' libtool=no \
depfile='.deps/dsp.Po' tmpdepfile='.deps/dsp.TPo' \
depmode=none /bin/sh ../../depcomp \
g++ -DHAVE_CONFIG_H -I. -I. -I../.. -DPACKAGE_DATA_DIR=\""/usr/share"\" 
-DPACKAGE_LOCALE_DIR=\""/usr//locale"\" -DORBIT2=1 -pthread 
-I/opt/gnome/include/libgnomeui-2.0 -I/opt/gnome/include/libgnome-2.0 
-I/opt/gnome/include/libgnomecanvas-2.0 -I/opt/gnome/include/gtk-2.0 
-I/usr/include/libart-2.0 -I/opt/gnome/include/gconf/2 
-I/opt/gnome/include/libbonoboui-2.0 -I/opt/gnome/include/glib-2.0 
-I/opt/gnome/lib/glib-2.0/include -I/opt/gnome/include/orbit-2.0 
-I/opt/gnome/include/libbonobo-2.0 -I/opt/gnome/include/gnome-vfs-2.0 
-I/opt/gnome/lib/gnome-vfs-2.0/include 
-I/opt/gnome/include/bonobo-activation-2.0 -I/opt/gnome/include/pango-1.0 
-I/usr/include/freetype2 -I/opt/gnome/lib/gtk-2.0/include 
-I/opt/gnome/include/atk-1.0 -I/usr/X11R6/include 
-I/usr/include/freetype2/config -I/usr/include/libxml2 -I../../src 
-I../../src/misc     -c -o dsp.o `test -f 'dsp.cc' || echo './'`dsp.cc
../../depcomp: line 414: exec: g++: not found
make[2]: *** [dsp.o] Error 127
make[2]: Leaving directory `/usr/local/gmfsk-0.6/src/mt63'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory `/usr/local/gmfsk-0.6/src'
make: *** [install-recursive] Error 1
linux:/usr/local/gmfsk-0.6 #               

extract ends

Line 414 of ../../depcomp is:
 exec "$@"

This has stumped me. Can anyone help?

Gervase GW4URJ
