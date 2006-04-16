From: Al Scanandoah <k2zn@rochester.rr.com>
Subject: Any glfer users?
Date: Sun, 16 Apr 2006 13:13:51 -0400
Message-ID: <44427B4F.5010009@rochester.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-hams@vger.kernel.org

Hello

I'm trying to get glfer up and running on my SuSE 10.0 system, but am=20
having little luck.  As best I can tell, I've got all the dependencies=20
in place and configure runs without errors.  However, when I run make,=20
it screeches to a halt with the following:

al@linux:~/glfer-0.3.4> make
make  all-am
make[1]: Entering directory `/home/al/glfer-0.3.4'
if gcc -DHAVE_CONFIG_H -I. -I. -I. -I/usr/include/cairo=20
-I/usr/include/freetype2 -I/usr/X11R6/include -I/usr/include/libpng12=20
-I/opt/gnome/include/gtk-2.0 -I/opt/gnome/lib/gtk-2.0/include=20
-I/opt/gnome/include/atk-1.0 -I/opt/gnome/include/pango-1.0=20
-I/opt/gnome/include/glib-2.0 -I/opt/gnome/lib/glib-2.0/include=20
-ggdb -O2 -Wall -MT g_main.o -MD -MP -MF ".deps/g_main.Tpo" -c -o=20
g_main.o g_main.c; \
then mv -f ".deps/g_main.Tpo" ".deps/g_main.Po"; else rm -f=20
".deps/g_main.Tpo"; exit 1; fi
In file included from g_main.c:34:
g_save_image.h:25: error: conflicting types for=20
=91gdk_pixbuf_get_from_drawable=92
/opt/gnome/include/gtk-2.0/gdk/gdkpixbuf.h:97: error: previous=20
declaration of =91gdk_pixbuf_get_from_drawable=92 was here
g_main.c: In function =91get_main_menu=92:
g_main.c:151: warning: implicit declaration of function=20
=91gtk_accel_group_attach=92
g_main.c: In function =91spect_save_ok=92:
g_main.c:182: warning: assignment discards qualifiers from pointer=20
target type
g_main.c:191: warning: pointer targets in passing argument 3 of=20
=91write_jpeg_file=92 differ in signedness
g_main.c:195: warning: pointer targets in passing argument 3 of=20
=91write_jpeg_file=92 differ in signedness
g_main.c: In function =91open_file_ok=92:
g_main.c:206: warning: assignment discards qualifiers from pointer=20
target type
g_main.c: In function =91save_full_pixmap=92:
g_main.c:1037: warning: pointer targets in passing argument 3 of=20
=91write_jpeg_file=92 differ in signedness
make[1]: *** [g_main.o] Error 1
make[1]: Leaving directory `/home/al/glfer-0.3.4'
make: *** [all] Error 2
al@linux:~/glfer-0.3.4>


Has anyone encountered this before?

Al, K2ZN
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
