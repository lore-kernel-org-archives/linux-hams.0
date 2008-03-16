From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: FBB 7.04p with xfbbX X11 client for FBB working
Date: Sun, 16 Mar 2008 16:24:25 +0100
Message-ID: <47DD3BA9.3050400@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>


Hi All,

I have uploaded xd704p-src.tgz package.
It only differs from 7.04o in that X11 fbb client can be compiled and works.

Here is the related CHANGES file content :

7.04p (F6BVP)
- this version only corrects compilation errors for xfbbX client.
- lesstif, lesstif-devel, libxpm and libxpm-devel packages must be
installed.
- fbb has to be compiled first (and installed).
- then cd into fbb src/X11 directory and run make.
- give xfbbX and xfbbX_cl executable permission and copy both files into
/usr/local/bin
- start fbb using rc.fbb script and run xfbbX client from an X11 console.


Source package is here :

http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704p-src.tgz

73 de Bernard, f6bvp


