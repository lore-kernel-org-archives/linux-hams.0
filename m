From: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: Compiling last node version.
Date: Thu, 4 Mar 2004 00:04:24 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403040004.24334@www.cabodesantapola.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello all:
We have this problem compiling last node version under Debian/Woody with 2.6.3 
kernel:

linux:~/node-0.3.2# ./configure
Your machine architecture is ... i686
Checking man directory... /usr/share/man
Checking for the existence of the Zlib headers... not found.
            Without Zlib Node will lack compression support
            See INSTALL for more information.

Include support for the AX.25 protocol ? [Y/n]: y
Include support for the NetRom protocol ? [Y/n]: y
Include support for the Rose protocol ? [Y/n]: y
Creating Makefile.include
Creating config.h
Configuration successful
linux:~/node-0.3.2# make
gcc -Wall -Wstrict-prototypes -O2 -g -c user.c
gcc -Wall -Wstrict-prototypes -O2 -g -c util.c
gcc -Wall -Wstrict-prototypes -O2 -g -c nodeusers.c
gcc  -o nodeusers user.o util.o nodeusers.o -lax25 -lax25io
/usr/lib/libax25io.so: referencia a `deflate' sin definir
/usr/lib/libax25io.so: referencia a `inflate' sin definir
/usr/lib/libax25io.so: referencia a `inflateInit_' sin definir
/usr/lib/libax25io.so: referencia a `deflateInit_' sin definir
/usr/lib/libax25io.so: referencia a `inflateEnd' sin definir
/usr/lib/libax25io.so: referencia a `deflateEnd' sin definir
collect2: ld returned 1 exit status
make: *** [nodeusers] Error 1
linux:~/node-0.3.2# dpkg -l | grep ax25
ii  ax25-apps      0.0.6-1        Applications for AX25
ii  ax25-tools     0.0.8-2        AX-25 Tools
ii  libax25        0.0.10-1       ax25 libraries for hamradio applications
ii  libax25-dev    0.0.10-1       ax25 library development files
linux:~/node-0.3.2#

Any help?

Thank's.

- -- 
Ruben Navarro Huedo
eb5esx (arroba) eb5esx.ampr.org
http://www.cabodesantapola.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFARmR40S5G8AO3zN8RAifzAKDAmtN84twRP8KKuVWM7RomE6fpCQCeLzj7
DiF3uR4jAteJZCa9uG50EEI=
=30XM
-----END PGP SIGNATURE-----

