From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: wxGTK-2.4.0 (2)
Date: Wed, 15 Jan 2003 20:52:41 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301151950170.7507-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.44.0301141412310.1410-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301141412310.1410-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org


> I looks like maybe GTK really is incorrectly installed.
> 
> Does pkg-config give the correct cflags and libs? On my RH8 box it gives:
> 
>  $ pkg-config --cflags gtk+-2.0
>  -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 
>  -I/usr/include/pango-1.0 -I/usr/include/Xft2 -I/usr/include/freetype2 
>  -I/usr/X11R6/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include


My Mdk8.2 notebook:

# pkg-config --cflags gtk+-2.0
-I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include 
-I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/X11R6/include 
-I/usr/include/freetype2 -I/usr/include/glib-2.0 
-I/usr/lib/glib-2.0/include


(Tomi's RH8:)
>  $ pkg-config --libs gtk+-2.0
>  -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lm -lpangoxft-1.0 
>  -lpangox-1.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0


My Mdk8.2:
# pkg-config --libs gtk+-2.0
-Wl,--export-dynamic -L/usr/X11R6/lib -lgtk-x11-1.3 -lgdk-x11-1.3 -lXi 
-latk -lgdk_pixbuf-1.3 -lm -lpangox -lpangoxft -lXft -lXrender -lXext 
-lX11 -lfreetype -lpango -lgobject-1.3 -lgmodule-1.3 -ldl -lglib-1.3


Hmmm...looks OK.


The config.log error message was, that it couldn't find gtk/gtk.h :

configure:12357: checking for GTK+ - version >= 2.0.0
configure:12511: gcc -o conftest    -D_FILE_OFFSET_BITS=64 
-D_LARGE_FILES  conftest.c   1>&5
configure:12503:21: gtk/gtk.h: No such file or directory
configure: failed program was:
#line 12501 "configure"
#include "confdefs.h"

#include <gtk/gtk.h>
#include <stdio.h>
...etc....


root@zl2bsj # slocate gtk.h
 <snip>
/usr/include/gtk-1.2/gtk/gtk.h
/usr/include/gtk-2.0/gtk/gtk.h


Shouldn't the gcc statement have included something like:

   -I/usr/include/gtk-2.0

for the pre-processor to find /usr/include/gtk-2.0/gtk.h ??

I upgraded pkg-config to 0.14 as suggested, which didn't help (but is 
worth having for the bug fixes:-).


Wilbert, ZL2BSJ



