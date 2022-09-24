From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Subject: Re: Problems in compiling ax25apps on modern systems -- FIXED
Date: Sat, 24 Sep 2022 19:40:34 +0200
Message-ID: <0bb5641b-53a8-ff10-1dbe-b4ac913421e2@gmail.com>
References: <43ef460e-d884-87ad-b865-0b8dcd1cd9a8@trinnet.net>
 <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
 <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0lfrD7ZleLdHNPUYxj9OTLOSER+pee6RpIp19RzwxO0=;
        b=iF3urywrgD/VNiHguz9bYV8P1YN+eZf0t/A0dcncKMk7K4N4ObP8MKGKGoF2jTIm9d
         0R8KNs7CGCOXHs2zvPW6M0l8e9Zy6UQfs2Q6ohZ2n6jTnsFwxK7g/bUtp5ylxIC0rUsR
         MEKpHqPWk3TAFf/Z24d/63P1rgxKabLSo/UY23uKNxwhstb1t3U5+xeXSUkvwEYyZRzj
         u2npnAZdtEQfesna7P3hmH6kJx3oIPkozyk9rGLepi5yM7LCgPnI7c5NOqAd8tl+/zI6
         aVGxchQmkig4HQRB7tkeKzfaORI6SqhEEqRt60+nGCgbTNstwSczu7XemVo/FjPEfWfg
         KHLg==
Content-Language: en-US
In-Reply-To: <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <dranch@trinnet.net>
Cc: linux-hams@vger.kernel.org, Thomas Osterried <thomas@osterried.de>

Hi David,

I am using the last kernel available for RaspBerry Pi that includes my 
recent patch reparing ROSE broken since 5.4.78.

Linux F6BVP-8 5.15.68-v7+ #1586 SMP Fri Sep 16 12:07:16 BST 2022 armv7l 
GNU/Linux


Using the following instructions I can install AX25 library, tools and 
apps without issues.

http://44.168.19.18/configuration6_RPi.html



My updAX25 script is getting and installing AX25 library, tools and apps 
sources from :



wget https://github.com/ve7fet/linuxax25/archive/master.zip



Gcc :



Using built-in specs.

COLLECT_GCC=gcc

COLLECT_LTO_WRAPPER=/usr/lib/gcc/arm-linux-gnueabihf/8/lto-wrapper

Target: arm-linux-gnueabihf

Configured with: ../src/configure -v --with-pkgversion='Raspbian 
8.3.0-6+rpi1' --with-bugurl=file:///usr/share/doc/gcc-8/README.Bugs 
--enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++ --prefix=/usr 
--with-gcc-major-version-only --program-suffix=-8 
--program-prefix=arm-linux-gnueabihf- --enable-shared 
--enable-linker-build-id --libexecdir=/usr/lib 
--without-included-gettext --enable-threads=posix --libdir=/usr/lib 
--enable-nls --enable-bootstrap --enable-clocale=gnu 
--enable-libstdcxx-debug --enable-libstdcxx-time=yes 
--with-default-libstdcxx-abi=new --enable-gnu-unique-object 
--disable-libitm --disable-libquadmath --disable-libquadmath-support 
--enable-plugin --with-system-zlib --with-target-system-zlib 
--enable-objc-gc=auto --enable-multiarch --disable-sjlj-exceptions 
--with-arch=armv6 --with-fpu=vfp --with-float=hard --disable-werror 
--enable-checking=release --build=arm-linux-gnueabihf 
--host=arm-linux-gnueabihf --target=arm-linux-gnueabihf

Thread model: posix

gcc version 8.3.0 (Raspbian 8.3.0-6+rpi1)


73 de Bernard, f6bvp

