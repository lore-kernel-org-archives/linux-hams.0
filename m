From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: conversd-saupp-1.62a
Date: Fri, 13 Feb 2015 19:18:38 +0000
Message-ID: <oRlc2IVO4k3UFwXG@skywaves.demon.co.uk>
References: <1422692681.5081.9.camel@freemail.gr>
 <54CDB20F.8040201@trinnet.net> <viRt6JJd$g3UFw1b@skywaves.demon.co.uk>
 <20150213190950.GA437@ds20.borg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150213190950.GA437@ds20.borg.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: dl8bcu@dl8bcu.de
Cc: linux-hams@vger.kernel.org

Hello Thorsten

Many thanks will give that a try
73 de Paul g4apl

In message <20150213190950.GA437@ds20.borg.net>, Thorsten Kranzkowski=20
<dl8bcu@dl8bcu.de> writes
>On Fri, Feb 13, 2015 at 02:53:17PM +0000, Paul Lewis wrote:
>>
>> Hello all
>
>Hi Paul!
>
>> I am trying to install conversd-saupp-1.62a.20090622.tar.gz
>> on a new Ubuntu 14.4.1 system
>>
>> and getting the following error. Anyone got any ideas how to over
>> comethis.
>> Still lot of warnings in the make, which I ignore as the binaries ar=
e
>> created.
>>
>> Just not able to create the directories and install the binaries usi=
ng
>> the following command.
>> Anyone have a solution please - may apply to the make install-all as
>> well
>>
>> make install-bin
>> gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
>> -DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
>> -DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
>> -DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"loc=
alhost\"
>> -DSETLOGNAMES -DHAVE_LIBREADLINE -DHAVE_READLINE_READLINE_H \
>>                 convers.c ba_stub.o -o convers -lreadline -lncurses
>> convers.c: In function =E2do_log=E2:
>> convers.c:255:3: warning: format not a string literal and no format
>> arguments [-Wformat-security]
>>    fprintf(stderr, fmt);
>
>Strictly speaking, it'a a warning, not an error. But anyway, you need =
to
>fix convers.c:
>
>a) insert a line reading
>       #include <stdarg.h>
>   at the beginning (where the other includes are).
>
>b) make the function do_log (around line 255) look like this:
>
>       int do_log(int level, const char *fmt, ...) {
>         va_list argp;
>         if (level > 2)
>                 return 0;
>         va_start(argp, fmt);
>         vfprintf(stderr, fmt, argp);
>         va_end(argp);
>         return fflush(stderr);
>       }
>
>
>This should do the trick.
>
>73 Thorsten DL8BCU
>
>> 73 de Paul G4APL
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--=20
paul@skywaves.demon.co.uk
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
