From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: wxGTK-2.4.0 (3)
Date: Thu, 16 Jan 2003 23:33:14 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301162255110.25363-100000@zl2bsj.ampr.org>
References: <200301152212.05203.jonathan.naylor@ggaweb.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200301152212.05203.jonathan.naylor@ggaweb.ch>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>


I had a fiddle with the ./configure script to find out what was 
happening.

Installed is GTK+2
 (gtk+2-1.3.13-2mdk and libgtk+2-devel-1.3.13-2mdk)

And also GTK+1.2:
 (libgtk+1.2-1.2.10-25mdk and libgtk+1.2-devel-1.2.10-25mdk)
for some legacy stuff.

When doing a "./configure", the script apparently assumes GTK+2.

It compares GTK+2 to the 'min_gtk_version' of 2.0.0

Mine (1.3.13) failed this test. As a result, the script then
(for unknown reasons) doesn't run pkg-config. So, it doesn't get the 
CFLAGS and the conftest fails with a misleading error message.

The upshot is, I need GTK+2 version 2.0.0 or later.

> It will work with wxGTK-2.4.0 built with GTK+ 1.x.y (in my case 1.2.10), 
> this is achieved by using "./configure --with-gtk" for wxGTK.
                             ^^^^^^^^^^^^^^^^^^^^^^^
Sure enough..that worked. It is, in fact, mentioned in the wxGTK-2.4.0 
README-GTK.txt...<sheepish grin>...but it doesn't make mention of the 
GTK+2 requirement.

Anyway, I'll carry on with wxGTK-2.4.0 and GTK+ 1.2.10 first.

Many thanks for the pointers, everyone.


Wilbert, ZL2BSJ



