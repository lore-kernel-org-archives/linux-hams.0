From: "ravioli@softhome.net" <ravioli@softhome.net>
Subject: Compile warnings on hfterm with Mandrake
Date: Tue, 09 Mar 2004 22:11:12 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <404E32F0.80308@softhome.net>
References: <20040309022333.GA4377@braddock.com> <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-Hams@vger.kernel.org

A lot of warnings in the last release of hfterm-0.5 can be removed by 
applying this diff.
More information on request.
Remi F4ECW

diff --recursive hf-0.5/dcf77/audioin.c hf-0.5.ORG/dcf77/audioin.c
38d37
< #include <stdlib.h>
diff --recursive hf-0.5/dcf77/audioout.c hf-0.5.ORG/dcf77/audioout.c
36d35
< #include <stdlib.h>
diff --recursive hf-0.5/dcf77/calccorr.c hf-0.5.ORG/dcf77/calccorr.c
33c33
< #include <stdlib.h>
---
 >
35d34
< #include <sys/time.h>
diff --recursive hf-0.5/dcf77/dcfdemod.c hf-0.5.ORG/dcf77/dcfdemod.c
33d32
< #include <stdlib.h>
diff --recursive hf-0.5/dcf77/dcfdemodpn.c hf-0.5.ORG/dcf77/dcfdemodpn.c
32d31
< #include <stdlib.h>
diff --recursive hf-0.5/dcf77/hbgdemod.c hf-0.5.ORG/dcf77/hbgdemod.c
32d31
< #include <stdlib.h>
diff --recursive hf-0.5/dcf77/xgintf.c hf-0.5.ORG/dcf77/xgintf.c
33d32
< #include <stdlib.h>
diff --recursive hf-0.5/hfterm/src/spectrum.c 
hf-0.5.ORG/hfterm/src/spectrum.c
31d30
< #include <string.h>
diff --recursive hf-0.5/l1/user/oss.c hf-0.5.ORG/l1/user/oss.c
38d37
< #include <stdlib.h>
172,175c171
<         struct timespec my_time_spec_nano ;
<         my_time_spec_nano.tv_sec  =   0 ; /* Seconds */
<         my_time_spec_nano.tv_nsec = 100 ; /* Nanoseconds */
<         nanosleep( &my_time_spec_nano /* 100 */ , NULL);
---
 >         nanosleep(100, NULL);
302c298
<     void * m = NULL;
---
 >     void * m;
525c521
<     void *m = NULL;
---
 >     void *m;
646c642
<                 if ( (!fragptr) && ( m!= NULL) ) free(m);
---
 >                 if (!fragptr) free(m);
diff --recursive hf-0.5/l1/user/refclock.c hf-0.5.ORG/l1/user/refclock.c
35c35
< #include <stdlib.h>
---
 >
diff --recursive hf-0.5/os/msg.c hf-0.5.ORG/os/msg.c
307c307
<     /* unsigned int err = ntohl(msg->hdr.err); */
---
 >     unsigned int err = ntohl(msg->hdr.err);
diff --recursive hf-0.5/proto/amtor.c hf-0.5.ORG/proto/amtor.c
31d30
< #include <stdlib.h>
diff --recursive hf-0.5/proto/mkgtortables.c hf-0.5.ORG/proto/mkgtortables.c
213,216c213
<     int i, j;
< #ifdef PARANOID
<     int k ;
< #endif
---
 >     int i, j, k;
diff --recursive hf-0.5/proto/pactor.c hf-0.5.ORG/proto/pactor.c
1020c1020
< #endif /* MARQ_BAD_CRC_GETOUT */
---
 > #endif MARQ_BAD_CRC_GETOUT
1764,1765d1763
< #if 0
<     /* Please see '#if 0' in this function... */
1767d1764
< #endif
diff --recursive hf-0.5/test/testcos.c hf-0.5.ORG/test/testcos.c
31d30
< #include <stdlib.h>
diff --recursive hf-0.5/test/testgettimeofday.c 
hf-0.5.ORG/test/testgettimeofday.c
8d7
< #include <stdlib.h>
diff --recursive hf-0.5/test/testoss.c hf-0.5.ORG/test/testoss.c
5d4
< #include <stdlib.h>
diff --recursive hf-0.5/test/testpoly.c hf-0.5.ORG/test/testpoly.c
5d4
< #include <stdlib.h>

