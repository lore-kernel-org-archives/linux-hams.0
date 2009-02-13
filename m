From: Peter Mallett <zl2bau@xnet.co.nz>
Subject: Ubuntu 8.04 / 8.10
Date: Sat, 14 Feb 2009 00:15:22 +1300
Message-ID: <4995564A.3050308@xnet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hi All,

         I have been trying different distro`s in the last few days and 
they both gave the same results as below.

I have even tried to compile and run fbb 7.04r but this gave the same 
problems.

Has the above distro`s become broken for fbb ?

> *** stack smashing detected ***: /usr/sbin/xfbbd terminated
> ======= Backtrace: =========
> /lib/tls/i686/cmov/libc.so.6(__fortify_fail+0x48)[0xb7e5e138]
> /lib/tls/i686/cmov/libc.so.6(__fortify_fail+0x0)[0xb7e5e0f0]
> /usr/sbin/xfbbd[0x80855a3]
> /usr/sbin/xfbbd[0x80856c5]
> /usr/sbin/xfbbd[0x8083da5]
> /usr/sbin/xfbbd[0x807e4ab]
> /usr/sbin/xfbbd[0x80878d5]
> /usr/sbin/xfbbd[0x804dbdc]
> /lib/tls/i686/cmov/libc.so.6(__libc_start_main+0xe0)[0xb7d87450]
> /usr/sbin/xfbbd[0x804aa01]
> ======= Memory map: ========
> 08048000-080db000 r-xp 00000000 08:21 605287     /usr/sbin/xfbbd
> 080db000-080dd000 rw-p 00093000 08:21 605287     /usr/sbin/xfbbd
> 080dd000-08269000 rw-p 080dd000 00:00 0          [heap]
> b7d1a000-b7d24000 r-xp 00000000 08:21 1403541    /lib/libgcc_s.so.1
> b7d24000-b7d25000 rw-p 0000a000 08:21 1403541    /lib/libgcc_s.so.1
> b7d31000-b7d70000 r--p 00000000 08:21 636870     
> /usr/lib/locale/en_NZ.utf8/LC_CTYPE
> b7d70000-b7d71000 rw-p b7d70000 00:00 0
> b7d71000-b7eba000 r-xp 00000000 08:21 1420840    
> /lib/tls/i686/cmov/libc-2.7.so
> b7eba000-b7ebb000 r--p 00149000 08:21 1420840    
> /lib/tls/i686/cmov/libc-2.7.so
> b7ebb000-b7ebd000 rw-p 0014a000 08:21 1420840    
> /lib/tls/i686/cmov/libc-2.7.so
> b7ebd000-b7ec0000 rw-p b7ebd000 00:00 0
> b7ec0000-b7ec7000 r-xp 00000000 08:21 605061     /usr/lib/libax25.so.0.0.0
> b7ec7000-b7ec8000 rw-p 00007000 08:21 605061     /usr/lib/libax25.so.0.0.0
> b7ec8000-b7eeb000 r-xp 00000000 08:21 1420844    
> /lib/tls/i686/cmov/libm-2.7.so
> b7eeb000-b7eed000 rw-p 00023000 08:21 1420844    
> /lib/tls/i686/cmov/libm-2.7.so
> b7eed000-b7eee000 rw-p b7eed000 00:00 0
> b7ef1000-b7ef3000 rw-p b7ef1000 00:00 0
> b7ef3000-b7efa000 r--s 00000000 08:21 612282     
> /usr/lib/gconv/gconv-modules.cache
> b7efa000-b7efb000 rw-p b7efa000 00:00 0
> b7efb000-b7efc000 r-xp b7efb000 00:00 0          [vdso]
> b7efc000-b7f16000 r-xp 00000000 08:21 1403532    /lib/ld-2.7.so
> b7f16000-b7f18000 rw-p 00019000 08:21 1403532    /lib/ld-2.7.so
> bfccd000-bfce2000 rw-p bffeb000 00:00 0          [stack]
> Aborted
> Configuration error ! Giving up.
> root@iGate:/etc/ax25#
>

Regards ..... Peter

