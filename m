From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: problem compiling ax25-tools
Date: Wed, 27 Aug 2003 18:44:30 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F4CDFEE.5070908@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux HAMs <Linux-hams@vger.kernel.org>

Hi,

I got a problem compiling ax25-tools-0.0.8.
It used to compile just fine on my Slackware 8.1 box, but on 
Slackware-current (9.1 to be..) it stops with these messages.

configure: creating ./config.status
cd . \
  && CONFIG_FILES=Makefile CONFIG_HEADERS= /bin/sh ./config.status
config.status: creating Makefile
config.status: executing depfiles commands
cd . && autoheader
WARNING: Using auxiliary files such as `acconfig.h', `config.h.bot'
WARNING: and `config.h.top', to define templates for `config.h.in'
WARNING: is deprecated and discouraged.

WARNING: Using the third argument of `AC_DEFINE' and
WARNING: `AC_DEFINE_UNQUOTED' allows to define a template without
WARNING: `acconfig.h':

WARNING:   AC_DEFINE([NEED_MAIN], 1,
WARNING:             [Define if a function `main' is needed.])

WARNING: More sophisticated templates can also be produced, see the
WARNING: documentation.
touch ./config.h.in
cd . && /bin/sh ./config.status config.h
config.status: creating config.h
make  all-recursive
make[1]: Entering directory 
`/tmp/build-ax25_tools-0.0.8-i386-2/ax25-tools-0.0.8'
Making all in ax25
make[2]: Entering directory 
`/tmp/build-ax25_tools-0.0.8-i386-2/ax25-tools-0.0.8/ax25'
cd .. && automake --gnu --include-deps ax25/Makefile
ax25/Makefile.am: required file `./depcomp' not found
make[2]: *** [Makefile.in] Error 1
make[2]: Leaving directory 
`/tmp/build-ax25_tools-0.0.8-i386-2/ax25-tools-0.0.8/ax25'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
`/tmp/build-ax25_tools-0.0.8-i386-2/ax25-tools-0.0.8'
make: *** [all] Error 2

I'm compiling with gcc-2.3.2  glib-2.3.2  kernel 2.4.21 and libax25-0.011.
Does anybody have a clue what might be causing this?

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


