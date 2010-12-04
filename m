From: Peter Barrett <vk6fun@gmail.com>
Subject: xastir compile errors
Date: Sat, 4 Dec 2010 14:54:57 +0800
Message-ID: <AANLkTikcRbH-wOoQ9KB2jYKN+=WMX2nixyJc+QZyyMCc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=bWai+V1WmOcM7NXR+CuhftxjcJISyH5L86aCVC9zT+k=;
        b=w8Oo7+Jd4KMpjTLb39HzT0o1LlEo1i7cwwK2OO8tVb8vmXFgTE2C35egicyNVMZM73
         87Un8EjVDtjM/Houjkgr7BU/LZxH1d6xIqqMP5sU/NMLBjeXqB/PXG2MKCLO3t+7c9Qb
         +/7UfBgGd48VjFcsiKDQk9OEJLIzWcm4aroK0=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

# ./configure --prefix=/usr
checking for a BSD-compatible install... /usr/bin/ginstall -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... ./install-sh -c -d
checking for gawk... gawk
checking whether make sets $(MAKE)... yes

Configuring xastir 2.0.0

checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking for style of include used by make... GNU
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking dependency style of gcc... gcc3
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
checking how to run the C preprocessor... gcc -E
checking whether ln -s works... yes
checking whether make sets $(MAKE)... (cached) yes
checking for gawk... (cached) gawk
checking for ranlib... ranlib
checking for devices... found /dev/ttyS0 and /dev/ttyS1
checking for search paths... done
checking for the pthreads library -lpthreads... no
checking whether pthreads work without any flags... no
checking whether pthreads work with -Kthread... no
checking whether pthreads work with -kthread... no
checking for the pthreads library -llthread... no
checking whether pthreads work with -pthread... yes
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
checking if more special flags are required for pthreads... no
checking for cc_r... gcc
checking whether compiler accepts -Wno-unused-parameter... yes
checking for compiler flags... using -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread
checking for system... Linux
checking for gm... no
checking for /usr/bin/gm.exe... no
checking for convert... no
checking for /usr/bin/convert.exe... no
checking for lpr... /usr/bin/lpr
checking for gv... /usr/bin/gv
checking gv version... gv version test likely exited with error, this
is what it said:
checking for festival... no
checking for gpsman... no
checking for X... libraries /usr/X11R7/lib, headers /usr/X11R7/include
checking whether -R must be followed by a space... neither works
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for library containing tan... -lm
checking for XextAddDisplay in -lXext... yes
checking for XpGetDocumentData in -lXp... yes
checking for XtDisplay in -lXt... yes
checking for XmTextFindString in -lXm... yes
checking for sed... /bin/sed
checking for mv... /bin/mv
checking for xfontsel... /usr/bin/xfontsel
checking curl/curl.h usability... yes
checking curl/curl.h presence... yes
checking for curl/curl.h... yes
checking for curl_global_init in -lcurl... yes
checking for main in -lcompat... no
checking for sched_yield in -lrt... yes
checking whether byte ordering is bigendian... no
checking for Motif headers... in default path
checking for Motif libraries... in default path
checking for working alloca.h... yes
checking for alloca... yes
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking for ANSI C header files... (cached) yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking argz.h usability... yes
checking argz.h presence... yes
checking for argz.h... yes
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking math.h usability... yes
checking math.h presence... yes
checking for math.h... yes
checking netdb.h usability... yes
checking netdb.h presence... yes
checking for netdb.h... yes
checking netinet/in.h usability... yes
checking netinet/in.h presence... yes
checking for netinet/in.h... yes
checking nl_types.h usability... yes
checking nl_types.h presence... yes
checking for nl_types.h... yes
checking stdarg.h usability... yes
checking stdarg.h presence... yes
checking for stdarg.h... yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking sys/file.h usability... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking signal.h usability... yes
checking signal.h presence... yes
checking for signal.h... yes
checking termios.h usability... yes
checking termios.h presence... yes
checking for termios.h... yes
checking for unistd.h... (cached) yes
checking for an ANSI C-conforming const... yes
checking for uid_t in sys/types.h... yes
checking for inline... inline
checking for pid_t... yes
checking for size_t... yes
checking whether time.h and sys/time.h may both be included... yes
checking return type of signal handlers... void
checking whether struct tm is in sys/time.h or time.h... time.h
checking for struct tm.tm_zone... yes
checking for socklen_t... yes
checking for sighandler_t... yes
checking for sig_t... yes
checking for sigjmp_buf... yes
checking for gmtoff in struct tm... yes
checking vfork.h usability... no
checking vfork.h presence... no
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... no
checking for working vfork... (cached) yes
checking whether gcc needs -traditional... no
checking whether getpgrp requires zero arguments... yes
checking for stdlib.h... (cached) yes
checking for GNU libc compatible malloc... no
checking for sys/time.h... (cached) yes
checking for unistd.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for sys/param.h... (cached) yes
checking for alarm... yes
checking for working mktime... no
checking for getpagesize... yes
checking for working mmap... no
checking whether lstat correctly handles trailing slash... no
checking whether stat accepts an empty string... yes
checking for strftime... yes
checking for working strtod... no
checking for pow... yes
checking for __argz_count... yes
checking for __argz_next... yes
checking for __argz_stringify... yes
checking for alarm... (cached) yes
checking for dcgettext... yes
checking for getcwd... yes
checking for getpgrp... yes
checking for gethostbyname... (cached) yes
checking for gethostname... yes
checking for gettimeofday... yes
checking for getwd... yes
checking for inet_ntoa... yes
checking for memmove... yes
checking for mempcpy... yes
checking for memset... yes
checking for mkdir... yes
checking for munmap... yes
checking for pow... (cached) yes
checking for putenv... yes
checking for select... yes
checking for setenv... yes
checking for setlocale... yes
checking for settimeofday... yes
checking for signal... yes
checking for sigignore... yes
checking for snprintf... yes
checking for socket... yes
checking for sqrt... yes
checking for stpcpy... yes
checking for strcasecmp... yes
checking for strchr... yes
checking for strdup... yes
checking for strerror... yes
checking for strncasecmp... yes
checking for strpbrk... yes
checking for strptime... yes
checking for strrchr... yes
checking for strstr... yes
checking for strtof... yes
checking for strtol... yes
checking for strtoul... yes
checking for tzset... yes
checking for vsnprintf... yes
checking for pthread_mutexattr_setkind_np... yes
checking for pthread_mutexattr_settype... yes
checking for strndup... yes
checking for roundf... yes
checking for gettext in -lintl... no
checking shapefil.h usability... yes
checking shapefil.h presence... yes
checking for shapefil.h... yes
checking for DBFOpen in -lshp... no
checking libshp/shapefil.h usability... no
checking libshp/shapefil.h presence... no
checking for libshp/shapefil.h... no
configure: WARNING:
****************************************************************
configure: WARNING: Your system does not have shapelib installed.
Using an internal
configure: WARNING: version.  This may lead to a larger filesize for
the executable.
configure: WARNING: Install shapelib on your system to eliminate this
warning.
configure: WARNING:
****************************************************************
checking pcre.h usability... yes
checking pcre.h presence... yes
checking for pcre.h... yes
checking for pcre_compile in -lpcre... yes
checking X11/xpm.h usability... yes
checking X11/xpm.h presence... yes
checking for X11/xpm.h... yes
checking for library containing XpmWriteFileFromPixmap... none required
checking Xm/XpmI.h usability... no
checking Xm/XpmI.h presence... no
checking for Xm/XpmI.h... no
checking for pj_init in -lproj... no
*** Warning: geotiff requires libproj.
checking netax25/ax25.h usability... yes
checking netax25/ax25.h presence... yes
checking for netax25/ax25.h... yes
checking for ax25_config_load_ports in -lax25... yes
checking for gdal-config... no
configure: WARNING: *** Cannot find gdal-config:  Checking standard
locations ***
checking gdal.h usability... no
checking gdal.h presence... no
checking for gdal.h... no
checking for runpath switch... none
checking if db.h is exists and is usable... yes
checking for a library containing db_create... -ldb-4.4
checking for GraphicsMagick-config... no
checking for Magick-config... no
configure: creating ./config.status
config.status: creating Makefile
config.status: creating callpass/Makefile
config.status: creating config/Makefile
config.status: creating help/Makefile
config.status: creating m4/Makefile
config.status: creating scripts/Makefile
config.status: creating scripts/values
config.status: creating scripts/values.pl
config.status: creating src/Makefile
config.status: creating src/rtree/Makefile
config.status: creating src/shapelib/Makefile
config.status: creating src/shapelib/contrib/Makefile
config.status: creating symbols/Makefile
config.status: creating xastir.spec
config.status: creating xastir-min.spec
config.status: creating xastir-lsb.spec
config.status: creating config.h
config.status: executing depfiles commands
===========================================

xastir 2.0.0 has been configured to use the following
options and external libraries:

MINIMUM OPTIONS:
  ShapeLib (Vector maps) ................. : yes (internal)

RECOMMENDED OPTIONS:
  GraphicsMagick/ImageMagick (Raster maps) : no
  pcre (Shapefile customization) ......... : yes
  dbfawk (Shapefile customization) ....... : yes
  rtree indexing (Shapefile speedups) .... : yes
  map caching (Raster map speedups) ...... : yes
  internet map retrieval ................. : yes (libcurl)

FOR THE ADVENTUROUS:
  AX25 (Linux Kernel I/O Drivers) ........ : yes
  libproj (USGS Topos & Aerial Photos) ... : no
  GeoTiff (USGS Topos & Aerial Photos) ... : no
  Festival (Text-to-speech) .............. : no
  GDAL/OGR (Obtuse map formats) .......... : no
  GPSMan/gpsmanshp (GPS downloads) ....... : no

xastir will be installed in /usr/bin.
Type 'make' to build Xastir (Use 'gmake' instead on some systems).
# make
make  all-recursive
make[1]: Entering directory `/root/src/xastir-2.0.0'
Making all in src
make[2]: Entering directory `/root/src/xastir-2.0.0/src'
Making all in rtree
make[3]: Entering directory `/root/src/xastir-2.0.0/src/rtree'
gcc -DHAVE_CONFIG_H -I. -I../..   -I../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
index.o -MD -MP -MF .deps/index.Tpo -c -o index.o index.c
mv -f .deps/index.Tpo .deps/index.Po
gcc -DHAVE_CONFIG_H -I. -I../..   -I../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
rect.o -MD -MP -MF .deps/rect.Tpo -c -o rect.o rect.c
mv -f .deps/rect.Tpo .deps/rect.Po
gcc -DHAVE_CONFIG_H -I. -I../..   -I../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
node.o -MD -MP -MF .deps/node.Tpo -c -o node.o node.c
mv -f .deps/node.Tpo .deps/node.Po
gcc -DHAVE_CONFIG_H -I. -I../..   -I../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
card.o -MD -MP -MF .deps/card.Tpo -c -o card.o card.c
mv -f .deps/card.Tpo .deps/card.Po
gcc -DHAVE_CONFIG_H -I. -I../..   -I../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
split_l.o -MD -MP -MF .deps/split_l.Tpo -c -o split_l.o split_l.c
mv -f .deps/split_l.Tpo .deps/split_l.Po
rm -f librtree.a
ar cru librtree.a index.o rect.o node.o card.o split_l.o
ranlib librtree.a
make[3]: Leaving directory `/root/src/xastir-2.0.0/src/rtree'
Making all in shapelib
make[3]: Entering directory `/root/src/xastir-2.0.0/src/shapelib'
Making all in contrib
make[4]: Entering directory `/root/src/xastir-2.0.0/src/shapelib/contrib'
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
shpopen.o -MD -MP -MF .deps/shpopen.Tpo -c -o shpopen.o `test -f
'../shpopen.c' || echo './'`../shpopen.c
mv -f .deps/shpopen.Tpo .deps/shpopen.Po
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
shptree.o -MD -MP -MF .deps/shptree.Tpo -c -o shptree.o `test -f
'../shptree.c' || echo './'`../shptree.c
mv -f .deps/shptree.Tpo .deps/shptree.Po
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
dbfopen.o -MD -MP -MF .deps/dbfopen.Tpo -c -o dbfopen.o `test -f
'../dbfopen.c' || echo './'`../dbfopen.c
mv -f .deps/dbfopen.Tpo .deps/dbfopen.Po
rm -f libshape.a
ar cru libshape.a shpopen.o shptree.o dbfopen.o
ranlib libshape.a
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
dbfcat.o -MD -MP -MF .deps/dbfcat.Tpo -c -o dbfcat.o dbfcat.c
mv -f .deps/dbfcat.Tpo .deps/dbfcat.Po
gcc  -g -O2 -pipe -W -Wall -Wpointer-arith -Wstrict-prototypes
-Wno-unused-parameter -pthread  -Wl,--no-keep-memory -L/usr/local/lib
-L/usr/X11R7/lib -o dbfcat dbfcat.o libshape.a -lXm -lXt -lX11
-ldb-4.4 -lrt -lXm -lXt -lXp -lXext -lm -lSM -lICE -lX11 -lcurl -lpcre
-lax25
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
dbfinfo.o -MD -MP -MF .deps/dbfinfo.Tpo -c -o dbfinfo.o dbfinfo.c
mv -f .deps/dbfinfo.Tpo .deps/dbfinfo.Po
gcc  -g -O2 -pipe -W -Wall -Wpointer-arith -Wstrict-prototypes
-Wno-unused-parameter -pthread  -Wl,--no-keep-memory -L/usr/local/lib
-L/usr/X11R7/lib -o dbfinfo dbfinfo.o libshape.a -lXm -lXt -lX11
-ldb-4.4 -lrt -lXm -lXt -lXp -lXext -lm -lSM -lICE -lX11 -lcurl -lpcre
-lax25
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
shpcat.o -MD -MP -MF .deps/shpcat.Tpo -c -o shpcat.o shpcat.c
mv -f .deps/shpcat.Tpo .deps/shpcat.Po
gcc  -g -O2 -pipe -W -Wall -Wpointer-arith -Wstrict-prototypes
-Wno-unused-parameter -pthread  -Wl,--no-keep-memory -L/usr/local/lib
-L/usr/X11R7/lib -o shpcat shpcat.o libshape.a -lXm -lXt -lX11
-ldb-4.4 -lrt -lXm -lXt -lXp -lXext -lm -lSM -lICE -lX11 -lcurl -lpcre
-lax25
gcc -DHAVE_CONFIG_H -I. -I../../..   -I../../../src/shapelib
-I/usr/local/include -I/usr/X11R7/include
-DXASTIR_DATA_BASE=\"/usr/share/xastir\"  -g -O2 -pipe -W -Wall
-Wpointer-arith -Wstrict-prototypes -Wno-unused-parameter -pthread -MT
shpcentrd.o -MD -MP -MF .deps/shpcentrd.Tpo -c -o shpcentrd.o
shpcentrd.c
In file included from shpcentrd.c:79:
shpgeo.h:93:22: error: proj_api.h: No such file or directory
In file included from shpcentrd.c:79:
shpgeo.h:131: error: expected declaration specifiers or '...' before 'projPJ'
shpgeo.h:131: error: expected declaration specifiers or '...' before 'projPJ'
shpgeo.h:132: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'SHPSetProjection'
shpgeo.h:133: error: expected ')' before 'p'
shpcentrd.c: In function 'main':
shpcentrd.c:109: warning: implicit declaration of function 'exit'
shpcentrd.c:109: warning: incompatible implicit declaration of
built-in function 'exit'
shpcentrd.c:117: warning: incompatible implicit declaration of
built-in function 'exit'
shpcentrd.c:127: warning: incompatible implicit declaration of
built-in function 'exit'
make[4]: *** [shpcentrd.o] Error 1
make[4]: Leaving directory `/root/src/xastir-2.0.0/src/shapelib/contrib'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/root/src/xastir-2.0.0/src/shapelib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/root/src/xastir-2.0.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/root/src/xastir-2.0.0'
make: *** [all] Error 2
