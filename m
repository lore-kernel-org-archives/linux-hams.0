From: Ana Maria Grilo Moreira <ct1drb@vizzavi.pt>
Subject: Abt gmfsk last version.
Date: Tue, 13 May 2003 14:23:20 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3EC0F1C8.6020005@vizzavi.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello to all, best 73.

Name is David near Lisbon in IM58LP.

Like a lot ham linux programs, in fact i use only linux at home, at qrl 
is diferent :).

Today i got new (from last month) version of gmfsk, tryed to compile, 
but give me always same error. Here it is output:

g++     -o gmfsk  main.o support.o interface.o callbacks.o waterfall.o 
miniscope.o papertape.o gtkdial.o conf.o confdialog.o log.o macro.o 
ptt.o qsodata.o snd.o trx.o mfsk/libmfsk.a mt63/libmt63.a rtty/librtty.a 
throb/libthrob.a psk31/libpsk31.a feld/libfeld.a misc/libmisc.a 
-L/opt/gnome2/lib -L/usr/X11R6/lib -lgnomeui-2 -lSM -lICE -lbonoboui-2 
-lgnomecanvas-2 -lgnome-2 -lart_lgpl_2 -lpangoft2-1.0 -lgtk-x11-2.0 
-lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lpangoxft-1.0 -lpangox-1.0 
-lpango-1.0 -lbonobo-2 -lgconf-2 -lgnomevfs-2 -lbonobo-activation 
-lORBit-2 -lxml2 -lz -lm -llinc -lgmodule-2.0 -ldl -lgobject-2.0 
-lgthread-2.0 -lpthread -lglib-2.0    -ldfftw
/usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
undefined reference to `FT_Seek_Stream'
/usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
undefined reference to `FT_Get_Short'
/usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
undefined reference to `FT_Forget_Frame'
/usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
undefined reference to `FT_Access_Frame'
/usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
undefined reference to `FT_Get_Long'
collect2: ld returned 1 exit status
make[3]: *** [gmfsk] Error 1
make[3]: Leaving directory `/home/ct1drb/gmfsk-0.5/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/ct1drb/gmfsk-0.5/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/ct1drb/gmfsk-0.5'
make: *** [all] Error 2


Can anyone help me????

Best 73 to all, till next email

CT1DRB
David Quental

