From: terry <wd0fpc@aniota.com>
Subject: SPLAT ...
Date: Thu, 27 Jun 2002 05:57:34 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.10.10206270533440.26718-100000@yossarian.aniota.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

 
... ciao:
  
    "SPLAT!, a terrain analysis application for Linux, has been revised to
include several new features and enhancements.  The changes in version
1.0.3 include the following:"
  
    has anyone been able to get this to compile on a RH box.  first, "C"
is not a programming language i know, so i am definately at a disadvantage
here.
  
    on this system, when './configure' run (as "root"), i get the
following:
  
>               Now building SPLAT! and associated utilities...
>
> ./build: [: ==: binary operator expected
> ./build: [: ==: binary operator expected
> ./build: [: ==: binary operator expected
> ./build: [: ==: binary operator expected
> ./configure: [: ==: binary operator expected
>
> To install SPLAT! and its associated utilities, please
> su to 'root' and execute the install script as follows:
>
>        ./install all
  
    clearly, something in "./build" is failing as it sees 'root' as
something else.
  
    when i invoke the compiler directive to build splat from the command
line, i get the following:
 
> /tmp/cc8vQnKj.o: In function `BZfgets':
> /tmp/cc8vQnKj.o(.text+0x23b6): undefined reference to `BZ2_bzRead'
> /tmp/cc8vQnKj.o: In function `LoadSDF_BZ':
> /tmp/cc8vQnKj.o(.text+0x2686): undefined reference to `BZ2_bzReadOpen'
> /tmp/cc8vQnKj.o(.text+0x287e): undefined reference to `BZ2_bzReadClose'
> collect2: ld returned 1 exit status
 
   from my understanding of it, the bz2 library is named "libbz2.a", which
lives in 'usr//lib'.  i am lost here, any help would be much appreciated
...
 

-- 
73 , de WD0FPC
    aka: terry 

