From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: problem compiling aprsd-2.2.5-14
Date: Wed, 03 Sep 2003 21:36:11 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F5642AB.3040309@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux HAMs <Linux-hams@vger.kernel.org>

Hi,

Aprsd-2.2.5.14 won't compile on on my system with gcc-3.2.3 
(Slackware-current).
It compiles fine on my older slackware 8.0 system (gcc-2.95.3)

This is the error...

g++ -DHAVE_CONFIG_H -I. -I. -I.. -I../src    -g -O2 -Wall -pipe -pthread 
-c -o utils.o `test -f 'utils.cpp' || echo './'`utils.cpp
In file included from /usr/include/c++/3.2.3/backward/strstream:51,
                 from utils.cpp:29:
/usr/include/c++/3.2.3/backward/backward_warning.h:32:2: warning: 
#warning This file includes at least one deprecated or antiquated 
header. Please consider using one of the 32 headers found in section 
17.4.1.2 of the C++ standard. Examples include substituting the <X> 
header for the <X.h> header for C++ includes, or <sstream> instead of 
the deprecated header <strstream.h>. To disable this warning use 
-Wno-deprecated.
source='validate.cpp' object='validate.o' libtool=no \
depfile='.deps/validate.Po' tmpdepfile='.deps/validate.TPo' \
depmode=gcc3 /bin/sh ../support/depcomp \
g++ -DHAVE_CONFIG_H -I. -I. -I.. -I../src    -g -O2 -Wall -pipe -pthread 
-c -o validate.o `test -f 'validate.cpp' || echo './'`validate.cpp
In file included from /usr/include/c++/3.2.3/backward/strstream:51,
                 from validate.cpp:35:
/usr/include/c++/3.2.3/backward/backward_warning.h:32:2: warning: 
#warning This file includes at least one deprecated or antiquated 
header. Please consider using one of the 32 headers found in section 
17.4.1.2 of the C++ standard. Examples include substituting the <X> 
header for the <X.h> header for C++ includes, or <sstream> instead of 
the deprecated header <strstream.h>. To disable this warning use 
-Wno-deprecated.
g++  -g -O2 -Wall -pipe -pthread   -o aprsd  aprsd.o aprsString.o 
ax25socket.o cpqueue.o crc32.o dupCheck.o aprsdexception.o 
exceptionguard.o history.o httpserver.o mic_e.o mutex.o osdep.o 
queryResp.o rf.o serial.o servers.o string.o utils.o validate.o  -lcrypt 
-lpthread  -lax25
mutex.o(.text+0x136): In function `aprsd::MutexManager::reg_funcs()':
/tmp/aprsd-2.2.5-14/src/mutex.cpp:142: undefined reference to 
`pthread_atfork'
collect2: ld returned 1 exit status
make[2]: *** [aprsd] Error 1
make[2]: Leaving directory `/tmp/aprsd-2.2.5-14/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/tmp/aprsd-2.2.5-14'
make: *** [all] Error 2

Does anybody have a solution for this?

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


