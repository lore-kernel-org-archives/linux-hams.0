From: Luc Langehegermann <lx2gt@gmx.net>
Subject: Problems to compile modem p3d
Date: Sun, 26 Jan 2003 12:37:31 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301261237.31587.lx2gt@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello,

I have be trying to install the p3d decoder from HB9JNX here, without success.

I get:

make[3]: Entering directory `/usr/src/modemp3d-0.1/app/src'
gcc -DHAVE_CONFIG_H -I. -I. -I../.. -I/usr/include/gtk-1.2 
-I/usr/include/glib-1.2 -I/usr/lib/glib/include -I/usr/X11R6/include 
-I/usr/include/gnome-xml -I../../intl -I../.. -I../../matlib -I../../libmisc        
-I../../soundcard -I../../directx/include -I../../directx/include/directx6        
-I../../app    -g -O2 -Wall -c diag.c
diag.c:126: warning: braces around scalar initializer
diag.c:126: warning: (near initialization for `diagstate.rxthread')
diag.c:126: empty scalar initializer
diag.c:126: (near initialization for `diagstate.rxthread')
diag.c:126: initializer element is not constant
diag.c:126: (near initialization for `diagstate.rxthread')
diag.c:126: warning: braces around scalar initializer
diag.c:126: warning: (near initialization for `diagstate.txthread')
diag.c:126: initializer element is not constant
diag.c:126: (near initialization for `diagstate.txthread')
diag.c:126: initializer element is not constant
diag.c:126: (near initialization for `diagstate.txcond.__c_lock')
diag.c:126: initializer element is not constant
diag.c:126: (near initialization for `diagstate.txcond')
diag.c:126: initializer element is not constant
diag.c:126: (near initialization for `diagstate.txmutex.__m_lock')
diag.c:126: initializer element is not constant
diag.c:126: (near initialization for `diagstate.txmutex')
diag.c: In function `stp_send':
diag.c:257: warning: assignment discards qualifiers from pointer target type
diag.c:259: warning: assignment discards qualifiers from pointer target type
make[3]: *** [diag.o] Error 1
make[3]: Leaving directory `/usr/src/modemp3d-0.1/app/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/usr/src/modemp3d-0.1/app'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/modemp3d-0.1'
make: *** [all-recursive-am] Error 2

gcc version is 3.2.1, with glibc 2.3.1.

Thanks for any tip you may have.

73, Luc

