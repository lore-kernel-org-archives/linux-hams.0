From: Bernard f6bvp <f6bvp@free.fr>
Subject: Re: ax25tools axgetput compile error
Date: Sat, 30 Jul 2022 16:08:42 +0200
Message-ID: <e1a3b453-24d4-122e-9620-2c4ea2c69870@free.fr>
References: <32aa83bc-481f-f025-023f-0c173b34efd4@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1659190123;
        bh=FJT5Ey3abnTaVMIEs/jKxLT+h6JBmIAYtYvUGwIepPk=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=bQ8fulELPgbrtusR1FMizFeBP3kX5nkXLx1HNbhP48iOzWbjciF0qHH7CgZElSl23
         WElxxH0kxRFI0AlZ0FjZqXjjr9UhUKCCck/9sL0G4mcPWO8KCWf6MnA2nceDeCz+Bq
         soh9cpAmktuoNPDcEZGdBI/3Ma9tHBavx9ApCydwNoDYWnysmyTP2brVMNAb9bHVmQ
         vnVEedXL6BA+VyO6DW4MrUoL0hz36FijS4lQcTmwl+1WORYY2omvj+R4bXObzRqc3I
         6ZrE1Ti+bbisD+OcGG17R9SnoTSnBjD+VYq/NHfQOnWOzJFXo7IJmvzbK/ZOqbSlhX
         jPWSKyVFieP0Q==
Content-Language: en-US
In-Reply-To: <32aa83bc-481f-f025-023f-0c173b34efd4@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org

As a turn around I added #include <sys/type.h to axgetput.c

#include <sys/types.h>

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif
#include "includes.h"

#include "axgetput.h"

This add made compilation possible ... although with a number of 
warnings in ax25tools compilation.

For example :

gcc -DHAVE_CONFIG_H -I. -I../.. -D_GNU_SOURCE   -g -O2 -MT axgetput.o 
-MD -MP -MF .deps/axgetput.Tpo -c -o axgetput.o axgetput.c
axgetput.c: In function 'eol_convention':
axgetput.c:115:17: warning: ignoring return value of 'write' declared 
with attribute 'warn_unused_result' [-Wunused-result]
   115 |                 write(fderr, BIN_ON, strlen(BIN_ON));
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
axgetput.c:118:17: warning: ignoring return value of 'write' declared 
with attribute 'warn_unused_result' [-Wunused-result]
   118 |                 write(fderr, BIN_OFF, strlen(BIN_OFF));
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mv -f .deps/axgetput.Tpo .deps/axgetput.Po
gcc  -g -O2   -o axgetput axgetput.o util.o proto_bin.o

Bernard


Le 30/07/2022 à 10:37, Bernard f6bvp a écrit :
> Hi,
>
> On Linux ubuntu-f6bvp 5.19.0-rc8-next-20220728-F6BVP-next-1+ #2 SMP 
> PREEMPT_DYNAMIC Fri Jul 29 21:59:56 CEST 2022 x86_64 x86_64 x86_64 
> GNU/Linux
>
> with
>
> gcc version 11.2.0 (Ubuntu 11.2.0-19ubuntu1)
>
> there is a compile error with ax25tools/ ax25/axgetput/axgetput.c
>
> Making all in axgetput
> make[3]: Entering directory 
> '/usr/local/src/ax25/linuxax25-master/ax25tools/ax25/axgetput'
> gcc -DHAVE_CONFIG_H -I. -I../..  -D_GNU_SOURCE   -g -O2 -MT axgetput.o 
> -MD -MP -MF .deps/axgetput.Tpo -c -o axgetput.o axgetput.c
> /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_FR.UTF-8)
> In file included from axgetput.c:18:
> ../../config.h:308:16: error: two or more data types in declaration 
> specifiers
>   308 | #define mode_t int
>       |                ^~~
> ../../config.h:311:15: error: two or more data types in declaration 
> specifiers
>   311 | #define pid_t int
>       |               ^~~
> axgetput.c: In function 'eol_convention':
> axgetput.c:113:17: warning: ignoring return value of 'write' declared 
> with attribute 'warn_unused_result' [-Wunused-result]
>   113 |                 write(fderr, BIN_ON, strlen(BIN_ON));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> axgetput.c:116:17: warning: ignoring return value of 'write' declared 
> with attribute 'warn_unused_result' [-Wunused-result]
>   116 |                 write(fderr, BIN_OFF, strlen(BIN_OFF));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> make[3]: *** [Makefile:380: axgetput.o] Error 1
> make[3]: Leaving directory 
> '/usr/local/src/ax25/linuxax25-master/ax25tools/ax25/axgetput'
> make[2]: *** [Makefile:595: all-recursive] Error 1
> make[2]: Leaving directory 
> '/usr/local/src/ax25/linuxax25-master/ax25tools/ax25'
> make[1]: *** [Makefile:392: all-recursive] Error 1
> make[1]: Leaving directory 
> '/usr/local/src/ax25/linuxax25-master/ax25tools'
>
> make: *** [Makefile:331: all] Error 2
>
>
> How can we fix it in order to compile ax25tools ?
>
>
> 73 de Bernard, f6bvp / ai7bg
>
>
>
-- 
73 de Bernard f6bvp / ai7bg

http://radiotelescope-lavillette.fr/au-jour-le-jour/

