From: Marc Coevoet <marcc@dommel.be>
Subject: Re: Compiling FBB
Date: Sat, 15 Oct 2011 12:00:17 +0200
Message-ID: <4E9959B1.20704@dommel.be>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs> <4E993C82.2090601@free.fr>
Reply-To: marcc@dommel.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E993C82.2090601@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Bernard, f6bvp" <f6bvp@free.fr>
Cc: Miroslav Skoric <skoric@eunet.rs>, linux-hams <linux-hams@vger.kernel.org>, Lee Woldanski <ve7fet@tparc.org>

Op 15-10-11 09:55, Bernard, f6bvp schreef:
> Hello Miroslav,
>
> I now understand the libax25 issue.
> Debian and alike libax25 packages are installing AX.25 libraries into 
> /usr/lib/ whereas by default xfbb link process is expecting libax25.* 
> in /usr/local/lib directory.
>

No, the link libs are known when compiled (even when different distros 
use different hierarchies).  Everything can be configured in an option 
of "configure".


see here for some options: (you can build for ARM(tablets) eg in the 
/usr/armlib etc)

sh configure -help
`configure' configures this package to adapt to many kinds of systems.

Usage: configure [OPTION]... [VAR=VALUE]...

To assign environment variables (e.g., CC, CFLAGS...), specify them as
VAR=VALUE.  See below for descriptions of some of the useful variables.

Defaults for the options are specified in brackets.

Configuration:
   -h, --help              display this help and exit
       --help=short        display options specific to this package
       --help=recursive    display the short help of all the included 
packages
   -V, --version           display version information and exit
   -q, --quiet, --silent   do not print `checking ...' messages
       --cache-file=FILE   cache test results in FILE [disabled]
   -C, --config-cache      alias for `--cache-file=config.cache'
   -n, --no-create         do not create output files
       --srcdir=DIR        find the sources in DIR [configure dir or `..']

Installation directories:
   --prefix=PREFIX         install architecture-independent files in PREFIX
                           [/usr/local]
   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
                           [PREFIX]

By default, `make install' will install all the files in
`/usr/local/bin', `/usr/local/lib' etc.  You can specify
an installation prefix other than `/usr/local' using `--prefix',
for instance `--prefix=$HOME'.

For better control, use the options below.

Fine tuning of the installation directories:
   --bindir=DIR            user executables [EPREFIX/bin]
   --sbindir=DIR           system admin executables [EPREFIX/sbin]
   --libexecdir=DIR        program executables [EPREFIX/libexec]
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data 
[PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
   --datarootdir=DIR       read-only arch.-independent data root 
[PREFIX/share]
   --datadir=DIR           read-only architecture-independent data 
[DATAROOTDIR]
   --infodir=DIR           info documentation [DATAROOTDIR/info]
   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
   --mandir=DIR            man documentation [DATAROOTDIR/man]
   --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
   --htmldir=DIR           html documentation [DOCDIR]
   --dvidir=DIR            dvi documentation [DOCDIR]
   --pdfdir=DIR            pdf documentation [DOCDIR]
   --psdir=DIR             ps documentation [DOCDIR]

Program names:
   --program-prefix=PREFIX            prepend PREFIX to installed 
program names
   --program-suffix=SUFFIX            append SUFFIX to installed program 
names
   --program-transform-name=PROGRAM   run sed PROGRAM on installed 
program names

System types:
   --build=BUILD     configure for building on BUILD [guessed]
   --host=HOST       cross-compile to build programs to run on HOST [BUILD]

Optional Features:
   --disable-option-checking  ignore unrecognized --enable/--with options
   --disable-FEATURE       do not include FEATURE (same as 
--enable-FEATURE=no)
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
   --enable-maintainer-mode  enable make rules and dependencies not useful
                           (and sometimes confusing) to the casual installer
   --disable-dependency-tracking  speeds up one-time build
   --enable-dependency-tracking   do not reject slow dependency extractors
   --disable-nls           do not use Native Language Support
   --enable-threads={posix|solaris|pth|win32}
                           specify multithreading API
   --disable-threads       build without multithread safety
   --disable-rpath         do not hardcode runtime library paths
--disable-osmupload  Disable code to do osm uploads
   --disable-gtktest       do not try to compile and run a test GTK+ program
   --disable-gtktest       Do not try to compile and run a test GTK program

Optional Packages:
   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
   --with-gnu-ld           assume the C compiler uses GNU ld default=no
   --with-libpth-prefix[=DIR]  search for libpth in DIR/include and DIR/lib
   --without-libpth-prefix     don't search for libpth in includedir and 
libdir
   --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and 
DIR/lib
   --without-libiconv-prefix     don't search for libiconv in includedir 
and libdir
   --with-included-gettext use the GNU gettext library included here
   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and 
DIR/lib
   --without-libintl-prefix     don't search for libintl in includedir 
and libdir
--with-oldgtk  Use gtk1.x
   --with-gtk-prefix=PFX   Prefix where GTK is installed (optional)
   --with-gtk-exec-prefix=PFX Exec prefix where GTK is installed (optional)

Some influential environment variables:
   CC          C compiler command
   CFLAGS      C compiler flags
   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
               nonstandard directory <lib dir>
   LIBS        libraries to pass to the linker, e.g. -l<library>
   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
               you have headers in a nonstandard directory <include dir>
   CPP         C preprocessor
   YACC        The `Yet Another C Compiler' implementation to use. 
Defaults to
               the first program found out of: `bison -y', `byacc', `yacc'.
   YFLAGS      The list of arguments that will be passed by default to 
$YACC.
               This script will default YFLAGS to the empty string to 
avoid a
               default value of `-d' given by some make applications.
   PKG_CONFIG  path to pkg-config utility
   PKG_CONFIG_PATH
               directories to add to pkg-config's search path
   PKG_CONFIG_LIBDIR
               path overriding pkg-config's built-in search path
   LIBXML2_CFLAGS
               C compiler flags for LIBXML2, overriding pkg-config
   LIBXML2_LIBS
               linker flags for LIBXML2, overriding pkg-config
   LIBCURL_CFLAGS
               C compiler flags for LIBCURL, overriding pkg-config
   LIBCURL_LIBS
               linker flags for LIBCURL, overriding pkg-config

Use these variables to override the choices made by `configure' or to help
it to find libraries and programs with nonstandard names/locations.


Marc

-- 
The "Penguin" has arrived - and he's not going away - ever.
What's on Shortwave guide: choose an hour, go!
http://shortwave.tk
700+ Radio Stations on SW http://swstations.tk
300+ languages on SW http://radiolanguages.tk

