From: Erik Jakobsen <eja@urbakken.dk>
Subject: fbb.
Date: Tue, 14 Jan 2003 17:23:49 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030114172349.68ee4def.eja@urbakken.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi.

On my SuSE 8.1 system, I try to install fbb7.04h, but there seems to be 
something, that I have not seen before. I have an fbb7.04h install on an
old SuSE 7.2 computer.

I got to the /src directory, and type make with a Makfile that has been
modified according to the problems a year ago or so.

Here's what I get running make:


eurit:/opt/fbbsrc.704h/src # make
gcc -Wall -Wstrict-prototypes -O2 -g -funsigned-char  -D__LINUX__ -DPROTOTYPES -I../include -I/usr/include/netax25 -DUSE_NCURSES   -c -o arbre.o arbre.c
In file included from ../include/serv.h:97,
                 from arbre.c:32:
../include/fbb_serv.h:41:24: linux/ax25.h: No such file or directory
In file included from ../include/fbb_serv.h:42,
                 from ../include/serv.h:97,
                 from arbre.c:32:
/usr/include/linux/netrom.h:24: parse error before "ax25_address"
/usr/include/linux/netrom.h:28: parse error before "neighbour"
/usr/include/linux/netrom.h:31: parse error before "digipeaters"
/usr/include/linux/netrom.h:31: `AX25_MAX_DIGIS' undeclared here (not in a function)
/usr/include/linux/netrom.h:32: parse error before '}' token
In file included from ../include/fbb_serv.h:43,
                 from ../include/serv.h:97,
                 from arbre.c:32:
/usr/include/linux/rose.h:49: parse error before "ax25_address"
/usr/include/linux/rose.h:51: parse error before "srose_digi"
/usr/include/linux/rose.h:57: parse error before "ax25_address"
/usr/include/linux/rose.h:58: conflicting types for `srose_ndigis'
/usr/include/linux/rose.h:50: previous declaration of `srose_ndigis'
/usr/include/linux/rose.h:59: parse error before "srose_digis"
/usr/include/linux/rose.h:60: parse error before '}' token
/usr/include/linux/rose.h:65: parse error before "ax25_address"
/usr/include/linux/rose.h:67: conflicting types for `ndigis'
/usr/include/linux/netrom.h:30: previous declaration of `ndigis'
/usr/include/linux/rose.h:68: parse error before "digipeaters"
/usr/include/linux/rose.h:68: `AX25_MAX_DIGIS' undeclared here (not in a function)
/usr/include/linux/rose.h:68: conflicting types for `digipeaters'
/usr/include/linux/netrom.h:31: previous declaration of `digipeaters'
/usr/include/linux/rose.h:69: parse error before '}' token
/usr/include/linux/rose.h:78: parse error before "ax25_address"
/usr/include/linux/rose.h:80: parse error before "source_digis"
/usr/include/linux/rose.h:81: parse error before "dest_digis"
/usr/include/linux/rose.h:84: parse error before "fail_call"
In file included from ../include/fbb_serv.h:47,
                 from ../include/serv.h:97,
                 from arbre.c:32:
/usr/include/netax25/axlib.h:28:26: netax25/ax25.h: No such file or directory
/usr/include/netax25/axlib.h:29:26: netrose/rose.h: No such file or directory
In file included from ../include/fbb_serv.h:47,
                 from ../include/serv.h:97,
                 from arbre.c:32:
/usr/include/netax25/axlib.h:52: parse error before "null_ax25_address"
/usr/include/netax25/axlib.h:91: parse error before '*' token
/usr/include/netax25/axlib.h:104: parse error before '*' token
In file included from ../include/fbb_serv.h:157,
                 from ../include/serv.h:97,
                 from arbre.c:32:
/usr/include/stdlib.h:446: `rand' redeclared as different kind of symbol
/usr/include/linux/rose.h:82: previous declaration of `rand'
/usr/include/linux/rose.h:68: storage size of `digipeaters' isn't known
make: *** [arbre.o] Error 1


What is the problem, and what can I do about it ?.

-- 
<mvh Erik Jakobsen> vy 73 de OZ4KK.

