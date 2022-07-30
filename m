From: Bernard f6bvp <f6bvp@free.fr>
Subject: ax25tools axgetput compile error
Date: Sat, 30 Jul 2022 10:37:21 +0200
Message-ID: <32aa83bc-481f-f025-023f-0c173b34efd4@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1659170242;
        bh=khrX0Z2vGIgiCK7Mfq4JzuJhGctwStUWWCUXO4TNBs4=;
        h=Date:To:Cc:From:Subject:From;
        b=nF+X6/l7fvNyvZrTx9FZ4UydPqd6z59EDxzOCX0iP3D8MrBy0Bw9aJCZTDx2MDMjk
         t+TDVAtlwKsIlzVjEU4mryYml215MRBv/iOGw2Y/SBVkOSpMqjJOLA0Wp7naDXbSsA
         H//jOzhp5SQYEgowuT8IKsJH5HaJDwwQooozoHzcT6PJHrX6r01g83n+jFwORegYMl
         VxyDTVWdrZnb0qDpzkJVZXVJxJHA9cr5ktpnY0K2PfREy9WZJQHrmwM+QDWBuI8sp0
         sX9xmEgVEMbEUX5hnYne+sAZa5v0X80MQ5B/mpvn6KTuVM2g0P2GbyhcPUucaPmxN1
         8t34bKZLAmx/g==
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org

Hi,

On Linux ubuntu-f6bvp 5.19.0-rc8-next-20220728-F6BVP-next-1+ #2 SMP 
PREEMPT_DYNAMIC Fri Jul 29 21:59:56 CEST 2022 x86_64 x86_64 x86_64 
GNU/Linux

with

gcc version 11.2.0 (Ubuntu 11.2.0-19ubuntu1)

there is a compile error with ax25tools/ ax25/axgetput/axgetput.c

Making all in axgetput
make[3]: Entering directory 
'/usr/local/src/ax25/linuxax25-master/ax25tools/ax25/axgetput'
gcc -DHAVE_CONFIG_H -I. -I../..  -D_GNU_SOURCE   -g -O2 -MT axgetput.o 
-MD -MP -MF .deps/axgetput.Tpo -c -o axgetput.o axgetput.c
/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_FR.UTF-8)
In file included from axgetput.c:18:
../../config.h:308:16: error: two or more data types in declaration 
specifiers
   308 | #define mode_t int
       |                ^~~
../../config.h:311:15: error: two or more data types in declaration 
specifiers
   311 | #define pid_t int
       |               ^~~
axgetput.c: In function 'eol_convention':
axgetput.c:113:17: warning: ignoring return value of 'write' declared 
with attribute 'warn_unused_result' [-Wunused-result]
   113 |                 write(fderr, BIN_ON, strlen(BIN_ON));
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
axgetput.c:116:17: warning: ignoring return value of 'write' declared 
with attribute 'warn_unused_result' [-Wunused-result]
   116 |                 write(fderr, BIN_OFF, strlen(BIN_OFF));
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [Makefile:380: axgetput.o] Error 1
make[3]: Leaving directory 
'/usr/local/src/ax25/linuxax25-master/ax25tools/ax25/axgetput'
make[2]: *** [Makefile:595: all-recursive] Error 1
make[2]: Leaving directory 
'/usr/local/src/ax25/linuxax25-master/ax25tools/ax25'
make[1]: *** [Makefile:392: all-recursive] Error 1
make[1]: Leaving directory '/usr/local/src/ax25/linuxax25-master/ax25tools'

make: *** [Makefile:331: all] Error 2


How can we fix it in order to compile ax25tools ?


73 de Bernard, f6bvp / ai7bg



-- 
73 de Bernard f6bvp / ai7bg

http://radiotelescope-lavillette.fr/au-jour-le-jour/

