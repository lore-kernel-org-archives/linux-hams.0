From: richard <richard.bown@blueyonder.co.uk>
Subject: another gmfsk compile prob
Date: Wed, 11 Jan 2006 11:07:52 +0000
Message-ID: <43C4E708.3050005@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: richard.bown@blueyonder.co.uk, linux-hams@vger.kernel.org


This is on a nearly identical machine to mine which compiles OK now.
mandriva 2006, Kernel-2.6.12-12.

Any ideas, I can get at this machine remotely, so if its not too major I can
try and fix it from here.

Tnx
Richard





/usr/include/pango-1.0/pango/pangocairo.h:66: warning: type defaults to
'int' in declaration of 'cairo_font_options_t'
/usr/include/pango-1.0/pango/pangocairo.h:66: error: syntax error before
'*' token
/usr/include/pango-1.0/pango/pangocairo.h:67: error: syntax error before
'*' token
/usr/include/pango-1.0/pango/pangocairo.h:67: warning: type defaults to
'int' in declaration of 'pango_cairo_context_get_font_options'
/usr/include/pango-1.0/pango/pangocairo.h:67: warning: data definition
has no type or storage class
In file included from /usr/include/gtk-2.0/gdk/gdk.h:50,
                  from /usr/include/gtk-2.0/gtk/gtk.h:31,
                  from /usr/include/libgnomeui-2.0/gnome.h:4,
                  from ../../src/main.h:32,
                  from mfsktx.c:42:
/usr/include/gtk-2.0/gdk/gdkscreen.h:51: error: syntax error before
'cairo_font_options_t'
/usr/include/gtk-2.0/gdk/gdkscreen.h:51: warning: no semicolon at end of
struct or union
/usr/include/gtk-2.0/gdk/gdkscreen.h:53: error: syntax error before '}'
token
/usr/include/gtk-2.0/gdk/gdkscreen.h:106: warning: type defaults to
'int' in declaration of 'cairo_font_options_t'
/usr/include/gtk-2.0/gdk/gdkscreen.h:106: error: syntax error before '*'
token
/usr/include/gtk-2.0/gdk/gdkscreen.h:107: error: syntax error before '*'
token
/usr/include/gtk-2.0/gdk/gdkscreen.h:107: warning: type defaults to
'int' in declaration of 'gdk_screen_get_font_options_libgtk_only'
/usr/include/gtk-2.0/gdk/gdkscreen.h:107: warning: data definition has
no type or storage class
mfsktx.c: In function 'sendchar':
mfsktx.c:118: warning: pointer targets in initialization differ in
signedness
mfsktx.c: In function 'mfsk_txprocess':
mfsktx.c:314: warning: pointer targets in assignment differ in signedness
mfsktx.c:315: warning: pointer targets in passing argument 1 of
'statusbar_set_main' differ in signedness
make[2]: *** [mfsktx.o] Error 1
make[2]: Leaving directory `/home/g8bhh/HamApps/gmfsk-0.6/src/mfsk'
make[1]: *** [check-recursive] Error 1
make[1]: Leaving directory `/home/g8bhh/HamApps/gmfsk-0.6/src'
make: *** [check-recursive] Error 1
[root@shack gmfsk-0.6]#



