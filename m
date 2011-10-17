From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: Compiling FBB
Date: Mon, 17 Oct 2011 13:25:02 +0200
Message-ID: <4E9C108E.2010707@free.fr>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs> <4E993C82.2090601@free.fr> <4E9959B1.20704@dommel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E9959B1.20704@dommel.be>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: marcc@dommel.be
Cc: Miroslav Skoric <skoric@eunet.rs>, linux-hams <linux-hams@vger.kernel.org>, Lee Woldanski <ve7fet@tparc.org>

Hello Marc,

Yes I know that ./configure options allow choosing directories for=20
compile, install, libs etc..
That is why I was talking about default libax25 install options.
In that case, the sequence "./configure, make make install" used by=20
general users, leads to an install of most applications into /usr/local=
/...
I was deploring that this was not the default Debian (Ubuntu) choice fo=
r=20
AX.25.

73 de Bernard, f6bvp


Le 15/10/2011 12:00, Marc Coevoet a =E9crit :
> Op 15-10-11 09:55, Bernard, f6bvp schreef:
>> Hello Miroslav,
>>
>> I now understand the libax25 issue.
>> Debian and alike libax25 packages are installing AX.25 libraries int=
o
>> /usr/lib/ whereas by default xfbb link process is expecting libax25.=
*
>> in /usr/local/lib directory.
>>
>
> No, the link libs are known when compiled (even when different distro=
s
> use different hierarchies). Everything can be configured in an option=
 of
> "configure".
>
>
> see here for some options: (you can build for ARM(tablets) eg in the
> /usr/armlib etc)
>
> sh configure -help
> `configure' configures this package to adapt to many kinds of systems=
=2E
>
> Usage: configure [OPTION]... [VAR=3DVALUE]...
>
> To assign environment variables (e.g., CC, CFLAGS...), specify them a=
s
> VAR=3DVALUE. See below for descriptions of some of the useful variabl=
es.
>
> Defaults for the options are specified in brackets.
>
> Configuration:
> -h, --help display this help and exit
> --help=3Dshort display options specific to this package
> --help=3Drecursive display the short help of all the included package=
s
> -V, --version display version information and exit
> -q, --quiet, --silent do not print `checking ...' messages
> --cache-file=3DFILE cache test results in FILE [disabled]
> -C, --config-cache alias for `--cache-file=3Dconfig.cache'
> -n, --no-create do not create output files
> --srcdir=3DDIR find the sources in DIR [configure dir or `..']
>
> Installation directories:
> --prefix=3DPREFIX install architecture-independent files in PREFIX
> [/usr/local]
> --exec-prefix=3DEPREFIX install architecture-dependent files in EPREF=
IX
> [PREFIX]
>
> By default, `make install' will install all the files in
> `/usr/local/bin', `/usr/local/lib' etc. You can specify
> an installation prefix other than `/usr/local' using `--prefix',
> for instance `--prefix=3D$HOME'.
>
> For better control, use the options below.
>
> Fine tuning of the installation directories:
> --bindir=3DDIR user executables [EPREFIX/bin]
> --sbindir=3DDIR system admin executables [EPREFIX/sbin]
> --libexecdir=3DDIR program executables [EPREFIX/libexec]
> --sysconfdir=3DDIR read-only single-machine data [PREFIX/etc]
> --sharedstatedir=3DDIR modifiable architecture-independent data [PREF=
IX/com]
> --localstatedir=3DDIR modifiable single-machine data [PREFIX/var]
> --libdir=3DDIR object code libraries [EPREFIX/lib]
> --includedir=3DDIR C header files [PREFIX/include]
> --oldincludedir=3DDIR C header files for non-gcc [/usr/include]
> --datarootdir=3DDIR read-only arch.-independent data root [PREFIX/sha=
re]
> --datadir=3DDIR read-only architecture-independent data [DATAROOTDIR]
> --infodir=3DDIR info documentation [DATAROOTDIR/info]
> --localedir=3DDIR locale-dependent data [DATAROOTDIR/locale]
> --mandir=3DDIR man documentation [DATAROOTDIR/man]
> --docdir=3DDIR documentation root [DATAROOTDIR/doc/PACKAGE]
> --htmldir=3DDIR html documentation [DOCDIR]
> --dvidir=3DDIR dvi documentation [DOCDIR]
> --pdfdir=3DDIR pdf documentation [DOCDIR]
> --psdir=3DDIR ps documentation [DOCDIR]
>
> Program names:
> --program-prefix=3DPREFIX prepend PREFIX to installed program names
> --program-suffix=3DSUFFIX append SUFFIX to installed program names
> --program-transform-name=3DPROGRAM run sed PROGRAM on installed progr=
am names
>
> System types:
> --build=3DBUILD configure for building on BUILD [guessed]
> --host=3DHOST cross-compile to build programs to run on HOST [BUILD]
>
> Optional Features:
> --disable-option-checking ignore unrecognized --enable/--with options
> --disable-FEATURE do not include FEATURE (same as --enable-FEATURE=3D=
no)
> --enable-FEATURE[=3DARG] include FEATURE [ARG=3Dyes]
> --enable-maintainer-mode enable make rules and dependencies not usefu=
l
> (and sometimes confusing) to the casual installer
> --disable-dependency-tracking speeds up one-time build
> --enable-dependency-tracking do not reject slow dependency extractors
> --disable-nls do not use Native Language Support
> --enable-threads=3D{posix|solaris|pth|win32}
> specify multithreading API
> --disable-threads build without multithread safety
> --disable-rpath do not hardcode runtime library paths
> --disable-osmupload Disable code to do osm uploads
> --disable-gtktest do not try to compile and run a test GTK+ program
> --disable-gtktest Do not try to compile and run a test GTK program
>
> Optional Packages:
> --with-PACKAGE[=3DARG] use PACKAGE [ARG=3Dyes]
> --without-PACKAGE do not use PACKAGE (same as --with-PACKAGE=3Dno)
> --with-gnu-ld assume the C compiler uses GNU ld default=3Dno
> --with-libpth-prefix[=3DDIR] search for libpth in DIR/include and DIR=
/lib
> --without-libpth-prefix don't search for libpth in includedir and lib=
dir
> --with-libiconv-prefix[=3DDIR] search for libiconv in DIR/include and=
 DIR/lib
> --without-libiconv-prefix don't search for libiconv in includedir and
> libdir
> --with-included-gettext use the GNU gettext library included here
> --with-libintl-prefix[=3DDIR] search for libintl in DIR/include and D=
IR/lib
> --without-libintl-prefix don't search for libintl in includedir and l=
ibdir
> --with-oldgtk Use gtk1.x
> --with-gtk-prefix=3DPFX Prefix where GTK is installed (optional)
> --with-gtk-exec-prefix=3DPFX Exec prefix where GTK is installed (opti=
onal)
>
> Some influential environment variables:
> CC C compiler command
> CFLAGS C compiler flags
> LDFLAGS linker flags, e.g. -L<lib dir> if you have libraries in a
> nonstandard directory <lib dir>
> LIBS libraries to pass to the linker, e.g. -l<library>
> CPPFLAGS (Objective) C/C++ preprocessor flags, e.g. -I<include dir> i=
f
> you have headers in a nonstandard directory <include dir>
> CPP C preprocessor
> YACC The `Yet Another C Compiler' implementation to use. Defaults to
> the first program found out of: `bison -y', `byacc', `yacc'.
> YFLAGS The list of arguments that will be passed by default to $YACC.
> This script will default YFLAGS to the empty string to avoid a
> default value of `-d' given by some make applications.
> PKG_CONFIG path to pkg-config utility
> PKG_CONFIG_PATH
> directories to add to pkg-config's search path
> PKG_CONFIG_LIBDIR
> path overriding pkg-config's built-in search path
> LIBXML2_CFLAGS
> C compiler flags for LIBXML2, overriding pkg-config
> LIBXML2_LIBS
> linker flags for LIBXML2, overriding pkg-config
> LIBCURL_CFLAGS
> C compiler flags for LIBCURL, overriding pkg-config
> LIBCURL_LIBS
> linker flags for LIBCURL, overriding pkg-config
>
> Use these variables to override the choices made by `configure' or to=
 help
> it to find libraries and programs with nonstandard names/locations.
>
>
> Marc
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
