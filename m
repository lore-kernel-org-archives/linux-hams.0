From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Problems in compiling ax25apps on modern systems -- nothing to
 fix?
Date: Sun, 25 Sep 2022 08:25:02 +0200
Message-ID: <65A875CE-F0F9-4008-AC96-29AB6E95FF50@osterried.de>
References: <43ef460e-d884-87ad-b865-0b8dcd1cd9a8@trinnet.net>
 <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
 <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
 <0bb5641b-53a8-ff10-1dbe-b4ac913421e2@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0bb5641b-53a8-ff10-1dbe-b4ac913421e2@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
Cc: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org

Hello Bernard,

congrats, but it does not answer my question.

You mentioned in https://www.spinics.net/lists/linux-hams/msg05082.html compilation errors,
and David sent fixes and askmne to apply, for a problem that I cannot reproduce.

Even more, David's suggested to
  add includes that already exist in the ax25-apps/-tools since 23 years,
and to remove a macro in configure.ac that does not exist. -- with the result that nothing is left to be patched.

I'm still confused about your problems.

vy 73,
	- Thomas  dl9sau



> Am 24.09.2022 um 19:40 schrieb Bernard Pidoux <bernard.f6bvp@gmail.com>:
> 
> Hi David,
> 
> I am using the last kernel available for RaspBerry Pi that includes my recent patch reparing ROSE broken since 5.4.78.
> 
> Linux F6BVP-8 5.15.68-v7+ #1586 SMP Fri Sep 16 12:07:16 BST 2022 armv7l GNU/Linux
> 
> 
> Using the following instructions I can install AX25 library, tools and apps without issues.
> 
> http://44.168.19.18/configuration6_RPi.html
> 
> 
> 
> My updAX25 script is getting and installing AX25 library, tools and apps sources from :
> 
> 
> 
> wget https://github.com/ve7fet/linuxax25/archive/master.zip
> 
> 
> 
> Gcc :
> 
> 
> 
> Using built-in specs.
> 
> COLLECT_GCC=gcc
> 
> COLLECT_LTO_WRAPPER=/usr/lib/gcc/arm-linux-gnueabihf/8/lto-wrapper
> 
> Target: arm-linux-gnueabihf
> 
> Configured with: ../src/configure -v --with-pkgversion='Raspbian 8.3.0-6+rpi1' --with-bugurl=file:///usr/share/doc/gcc-8/README.Bugs --enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++ --prefix=/usr --with-gcc-major-version-only --program-suffix=-8 --program-prefix=arm-linux-gnueabihf- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-bootstrap --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-libitm --disable-libquadmath --disable-libquadmath-support --enable-plugin --with-system-zlib --with-target-system-zlib --enable-objc-gc=auto --enable-multiarch --disable-sjlj-exceptions --with-arch=ar
 mv6 --with-fpu=vfp --with-float=hard --disable-werror --enable-checking=release --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf --target=arm-linux-gnueabihf
> 
> Thread model: posix
> 
> gcc version 8.3.0 (Raspbian 8.3.0-6+rpi1)
> 
> 
> 73 de Bernard, f6bvp
> 
> 

