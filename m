From: SM6HOC Lars <sm6hoc@telia.com>
Subject: Mandriva 2007 ax25 node kernelerror ?
Date: Sun, 15 Oct 2006 21:57:16 +0200
Message-ID: <4532929C.2010900@telia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030100070806070105080201"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------030100070806070105080201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello !

Somone has a clue of this ?

Look at the attachement

SM6HOC  Lars


--------------030100070806070105080201
Content-Type: text/plain;
 name="node_ax25_error.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="node_ax25_error.txt"

[root@lb4 Desktop]# call lo1 sm6hoc-10
GW4PTS AX.25 Connect v1.11
*** Connected to sm6hoc-10
*** buffer overflow detected ***: call terminated
======= Backtrace: =========
/lib/i686/libc.so.6(__chk_fail+0x41)[0xb7edec41]
/lib/i686/libc.so.6[0xb7ede458]
/lib/i686/libc.so.6(_IO_default_xsputn+0xb7)[0xb7e62527]
/lib/i686/libc.so.6(_IO_vfprintf+0x931)[0xb7e3bea1]
/lib/i686/libc.so.6(__vsprintf_chk+0xad)[0xb7ede50d]
/lib/i686/libc.so.6(__sprintf_chk+0x30)[0xb7ede440]
call[0x804b385]
======= Memory map: ========
08048000-08053000 r-xp 00000000 03:06 1532913    /usr/bin/call
08053000-08054000 rw-p 0000b000 03:06 1532913    /usr/bin/call
08054000-08075000 rw-p 08054000 00:00 0          [heap]
b7dfb000-b7dfd000 rw-p b7dfb000 00:00 0 
b7dfd000-b7dff000 r-xp 00000000 03:06 60443      /lib/libdl-2.4.so
b7dff000-b7e01000 rw-p 00001000 03:06 60443      /lib/libdl-2.4.so
b7e01000-b7f28000 r-xp 00000000 03:06 60422      /lib/i686/libc-2.4.so
b7f28000-b7f29000 r--p 00126000 03:06 60422      /lib/i686/libc-2.4.so
b7f29000-b7f2b000 rw-p 00127000 03:06 60422      /lib/i686/libc-2.4.so
b7f2b000-b7f2e000 rw-p b7f2b000 00:00 0 
b7f2e000-b7f36000 r-xp 00000000 03:06 1756548    /usr/lib/libax25.so.0.0.0
b7f36000-b7f37000 rw-p 00007000 03:06 1756548    /usr/lib/libax25.so.0.0.0
b7f37000-b7f75000 r-xp 00000000 03:06 60503      /lib/libncurses.so.5.5
b7f75000-b7f7d000 rw-p 0003e000 03:06 60503      /lib/libncurses.so.5.5
b7f7d000-b7f7e000 rw-p b7f7d000 00:00 0 
b7f8b000-b7f95000 r-xp 00000000 03:06 60475      /lib/libgcc_s-4.1.1.so.1
b7f95000-b7f96000 rw-p 0000a000 03:06 60475      /lib/libgcc_s-4.1.1.so.1
b7f96000-b7f98000 rw-p b7f96000 00:00 0 
b7f98000-b7fb0000 r-xp 00000000 03:06 60432      /lib/ld-2.4.so
b7fb0000-b7fb1000 r--p 00017000 03:06 60432      /lib/ld-2.4.so
b7fb1000-b7fb2000 rw-p 00018000 03:06 60432      /lib/ld-2.4.so
bfb19000-bfb2e000 rw-p bfb19000 00:00 0          [stack]
bfffe000-bffff000 r-xp bfffe000 00:00 0 
Avbruten (SIGABRT)
[root@lb4 Desktop]# 

--------------030100070806070105080201--
