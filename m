From: "Jeremy Utley" <jeremy@jutley.org>
Subject: RE: Compiling JNOS/ Linux
Date: Thu, 24 Jul 2003 01:57:55 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <PEEBJGCPPGPJPGIFDLPJOEAOCAAA.jeremy@jutley.org>
References: <200307240726.28512.Waldemar.Ogonowski@GTservices.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200307240726.28512.Waldemar.Ogonowski@GTservices.pl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org



> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org]On Behalf Of 
> Waldemar Ogonowski

> 
> 
> Hi,
> 
> I have tried compile JNOS v1.11f under Linux (Slackware 9.0) 
> but without 
> success. I have ncurses compiled in /usr/src/ncurses-4.0 and 
> correct path to 

First off, why on earth is ncurses compiled under /usr/src?

Second - why not just use the ncurses libs provided with the slackware
packages?

> include and lib in Makefile JNOS but when compile JNOS this 
> finished with 
> error.: 
>  ---------------
> unix.a(curses.o)(.text+0x224): In function `curses_init':
> /usr/src/jnos/curses.c:283: undefined reference to `MainColors'
> unix.a(curses.o)(.text+0x3db):/usr/src/jnos/curses.c:281: 
> undefined reference 
> to `MainColors'
> unix.a(curses.o)(.text+0x3e8):/usr/src/jnos/curses.c:281: 
> undefined reference 
> to `MainColors'
> unix.a(curses.o)(.text+0x1060): In function `curses_create':
> /usr/src/jnos/curses.c:872: undefined reference to `MainColors'
> unix.a(curses.o)(.text+0x1076):/usr/src/jnos/curses.c:873: 
> undefined reference 
> to `MainColors'
> collect2: ld returned 1 exit status
> make: *** [jnos] Error 1


Try adding the the directory containing the ncurses libraries to 
/etc/ld.so.conf and run ldconfig, then remove/re-extract your JNOS
source code and recompile.

-J-
