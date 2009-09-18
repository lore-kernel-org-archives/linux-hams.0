From: "Jose Ng Lee" <jng@psi.net.pa>
Subject: fbbsrc.704r5 compile error
Date: Thu, 17 Sep 2009 19:00:27 -0500
Message-ID: <19EFA90488264123AF73C3EB1EA74B62@ngj>
Reply-To: "Jose Ng Lee" <jng@psi.net.pa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

Hi,

I am using an old Linux Fedora 4 with kernel 2.6.16.14.  On this old 
machine, a few years ago I compiled OK fbb 7.04l and tried again today and 
compiles OK for that version.

I downloaded the source for fbbsrc.704r5 and tried to compile but got this 
error:

[root@hp2at src]# make
gcc -Wall -Wstrict-prototypes -O2 -ggdb2 -funsigned-char  -D__LINUX__ -Wformat-security 
 -D_FORTIFY_SOURCE=3D2 -DPROTOTYPES -I../include -fstack-check -fstack-protector-all 
 -DUSE_NCURSES   -c -o arbre.o arbre.c
cc1: error: unrecognized command line option "-fstack-protector-all"
make: *** [arbre.o] Error 1
[root@hp2at src]#

Please, anyone can help me or what I have to change in the Makefile to make 
it compile OK.

Thanks,
73s Jose / HP2AT 

