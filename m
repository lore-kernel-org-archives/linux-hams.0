From: "Andrew B." <ua1cam@sma.spb.ru>
Subject: OE5DXL driver ?
Date: Sun, 22 Dec 2002 23:27:19 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1717384414.20021222232719@sma.spb.ru>
Reply-To: "Andrew B." <ua1cam@sma.spb.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello Friends,

Anybody can help me find driver for OE5DXL-9k6modem for kernel above
2.0.x !? I'll be happy,if it will for 2.2.x or 2.4.x!

I'm not familiar in programming, but seems that adaptation of sources
for newer kernel are possible. Maybe anybody of programmers will help?

Source i get there: http://www2.cddc.vt.edu/linux/apps/ham/drivers/dxlmodem-2a.tar.gz
For now, when i try to compile this sources ,i get errors like this:
-----------------
[root@linux dxlmodem-2a]# make
gcc -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -m486 -pipe -D__KERNEL__ -fomit-frame-pointer -DMODULE -DEXPORT_SYMTAB -DMODVERSIONS -include /usr/include/linux/modversions.h -DNOAX25_H -c dxlmodem.c -o dxlmodem.o
In file included from dxlmodem.c:0:
/usr/include/linux/modversions.h:1:2: #error Modules should never use kernel-headers system headers,
/usr/include/linux/modversions.h:2:2: #error but headers from an appropriate kernel-source
{standard input}: Assembler messages:
{standard input}:9: Warning: Ignoring changed section attributes for .modinfo
make: *** [dxlmodem.o] Error 1
[root@linux dxlmodem-2a]#
------------------

Best regards,
Andrew                          mailto:ua1camATsma.spb.ru

