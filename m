From: Thomas Osterried <thomas@osterried.de>
Subject: Re: ax25tools axgetput compile error
Date: Fri, 5 Aug 2022 12:50:14 +0200
Message-ID: <B2CDEF4D-5614-4DEF-AF7E-AA5529F53AD3@osterried.de>
References: <CAFAa3YCsS23P3iYg9SXBuSbKX=-OECVqVa+9bLLy4yiv9fHX2A@mail.gmail.com>
 <CAFAa3YB4=1Wb9TXCDXeuM7ERQ+Cokgep+6AqNzb99pynw6b5mA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAFAa3YB4=1Wb9TXCDXeuM7ERQ+Cokgep+6AqNzb99pynw6b5mA@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
Cc: linux-hams@vger.kernel.org, Lee Woldanski <ve7fet@gmail.com>, Bernard Pidoux <f6bvp@free.fr>



> Am 05.08.2022 um 11:41 schrieb Bernard Pidoux <bernard.f6bvp@gmail.com>:
> 
[..]
> 
> Removing the AC_FUNC_MALLOC in configure.ac solved it.
> ll
> DATA TYPES errors
> 
> In file included from beacon.c:1:
> ../config.h:304:15: error: two or more data types in declaration specifiers
>  304 | #define pid_t int
>      |               ^~~
> ../config.h:301:16: error: two or more data types in declaration specifiers
>  301 | #define mode_t int
>      |                ^~~
> 
> Edit configure.ac
> 
> dnl Checks for typedefs, structures, and compiler characteristics.
> AC_HEADER_STDBOOL
> AC_C_CONST
> AC_TYPE_UID_T
> #AC_TYPE_PID_T
> #AC_TYPE_MODE_T
> AC_TYPE_SIZE_T
> m4_warn([obsolete],
> 

perhaps it's more a configure/automake issue  (of that newer version) than a compiler incompatibility..


To be concrete: weather substrings like MODE_T nor mode_t are found on the system whereI compiled:

root@lax25-debug1:/usr/local/src/linux-ax25# find . -type f -exec grep -Hi mode_t '{}' ';' 2>/dev/null 
./libax25/ax25io.c:	new->eolmode = EOLMODE_TEXT;
./libax25/ax25io.c:	if (p->eolmode == EOLMODE_TEXT && c == '\n')
./libax25/ax25io.c:		case EOLMODE_TEXT:
./libax25/ax25io.c:		MODE_EDIT | MODE_TRAPSIG,
./libax25/netax25/ax25io.h:#define EOLMODE_TEXT	0
./libax25/netax25/mheard.h:#define	MHEARD_MODE_TEXT	0x0001
./libax25/netax25/mheard.h:#define	MHEARD_MODE_TEXNET	0x0080
./ax25-tools/ax25/mheardd.c:				mheard->entry.mode |= MHEARD_MODE_TEXT;
./ax25-tools/ax25/mheardd.c:				mheard->entry.mode |= MHEARD_MODE_TEXNET;
./ax25-tools/ax25/axgetput/axgetput.c:static mode_t mode_tty;
./ax25-tools/ax25/axgetput/axgetput.c:		mode_tty = statbuf.st_mode;
./ax25-tools/ax25/axgetput/axgetput.c:	if (mode_tty)
./ax25-tools/ax25/axgetput/axgetput.c:		fchmod(fdin, mode_tty);
./ax25-tools/ax25/axspawn.c:	mode_t homedir_mode = S_IRUSR|S_IWUSR|S_IXUSR|S_IXOTH|(secure_home ? 0 : (S_IRGRP|S_IXGRP));
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXT)
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXT)


And my automake / autoreconf has not overwritten defaults from repro:

[root@www a]# find . -type f -exec grep -Hi mode_t '{}' ';' 2>/dev/null 
./libax25/netax25/mheard.h:#define      MHEARD_MODE_TEXT        0x0001
./libax25/netax25/mheard.h:#define      MHEARD_MODE_TEXNET      0x0080
./libax25/netax25/ax25io.h:#define EOLMODE_TEXT 0
./libax25/ax25io.c:     new->eolmode = EOLMODE_TEXT;
./libax25/ax25io.c:     if (p->eolmode == EOLMODE_TEXT && c == '\n')
./libax25/ax25io.c:             case EOLMODE_TEXT:
./libax25/ax25io.c:             MODE_EDIT | MODE_TRAPSIG,
./ax25-tools/ax25/mheardd.c:                            mheard->entry.mode |= MHEARD_MODE_TEXT;
./ax25-tools/ax25/mheardd.c:                            mheard->entry.mode |= MHEARD_MODE_TEXNET;
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXT)
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXT)
./ax25-tools/ax25/axspawn.c:    mode_t homedir_mode = S_IRUSR|S_IWUSR|S_IXUSR|S_IXOTH|(secure_home ? 0 : (S_IRGRP|S_IXGRP));
./ax25-tools/ax25/axgetput/axgetput.c:static mode_t mode_tty;
./ax25-tools/ax25/axgetput/axgetput.c:          mode_tty = statbuf.st_mode;
./ax25-tools/ax25/axgetput/axgetput.c:  if (mode_tty)
./ax25-tools/ax25/axgetput/axgetput.c:          fchmod(fdin, mode_tty);


Btw, same for your rpl_malloc problem:
root@lax25-debug1:/usr/local/src/linux-ax25# find . -type f -exec grep -Hi rpl_malloc '{}' ';' 2>/dev/null 
root@lax25-debug1:/usr/local/src/linux-ax25# 


My debug system has these versions.
ii  autoconf                         2.69-14                        all          automatic configure script builder
ii  automake                         1:1.16.3-2                     all          Tool for generating GNU Standards-compliant Makefiles



=> Something on your system or your way to prepare is defect.

Something (what?) generated definitions and wrote them to configure.h, and the compiler complained about what he got to eat.
It's like you drive to your petrol station, get 10l fuel, and when you pay, the payment system says "You ordered 10 apples. We have no apple". And you say "what?!".

=> please go back to start.


A good way to bootstrap is

for dir in libax25 ax25-apps ax25-tools; do
  cd $dir && autoreconf --install --force && \
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man && \
    make && make install && cd ..
done


vy 73,
	- Thomas  dl9sau




