From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: wxGTK-2.4.0
Date: Tue, 14 Jan 2003 14:19:53 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301141412310.1410-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0301142218550.7507-100000@zl2bsj.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301142218550.7507-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: linux-hams@vger.kernel.org

On Tue, 14 Jan 2003, Wilbert Knol wrote:

> configure:12357: checking for GTK+ - version >= 2.0.0
> configure:12511: gcc -o conftest    -D_FILE_OFFSET_BITS=64 
> -D_LARGE_FILES  conftest.c   1>&5
> configure:12503:21: gtk/gtk.h: No such file or directory

I looks like maybe GTK really is incorrectly installed.

Does pkg-config give the correct cflags and libs? On my RH8 box it gives:

 $ pkg-config --cflags gtk+-2.0
 -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 
 -I/usr/include/pango-1.0 -I/usr/include/Xft2 -I/usr/include/freetype2 
 -I/usr/X11R6/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
 $ pkg-config --libs gtk+-2.0
 -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lm -lpangoxft-1.0 
 -lpangox-1.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

