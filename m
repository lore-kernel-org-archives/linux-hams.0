From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: wxGTK-2.4.0
Date: Tue, 14 Jan 2003 22:50:26 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301142218550.7507-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Thanks for reading this. 

I am trying to build LinWSJT.
For this to work, I must build wxGTK-2.4.0 (the wxWindows library) 
from sources, which causes me some grief.

The ./configure script fails with the following message:

checking for GTK+ version...
checking for pkg-config... /usr/bin/pkg-config
checking for GTK+ - version >= 2.0.0... no
*** Could not run GTK+ test program, checking why...
*** The test program failed to compile or link. See the file config.log for the
*** exact error that occured. This usually means GTK+ is incorrectly installed.
configure: error:


The config.log shows this:

configure:12357: checking for GTK+ - version >= 2.0.0
configure:12511: gcc -o conftest    -D_FILE_OFFSET_BITS=64 
-D_LARGE_FILES  conftest.c   1>&5
configure:12503:21: gtk/gtk.h: No such file or directory


In fact, I have both GTK 1.2 _and_ 2.0 installed, including the 
development files. The header files are there, but they are under 

 /usr/include/gtk-1.2/gtk

and

 /usr/include/gtk-2.0/gtk

respectively. The compiler looks for:

 /usr/include/gtk

and can't find them.


I can fix this with a bunch of symlinks... the ./configure 
script then fails to find glib.h, or another include.

I am sure I must be doing something wrong. Is there a way to 
specify paths to header files (like ld.so.conf)?

Any pointers appreciated.


Wilbert, ZL2BSJ

PS: GTK 1.2/2 were installed from RPMs, ex-distro.



