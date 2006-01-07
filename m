From: richard <richard.bown@blueyonder.co.uk>
Subject: Re: gmfsk compile
Date: Sat, 07 Jan 2006 18:57:46 +0000
Message-ID: <43C00F2A.9030506@blueyonder.co.uk>
References: <43BFCBEA.7090009@blueyonder.co.uk> <Pine.LNX.4.58.0601071108450.16143@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0601071108450.16143@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Curt Mills <archer@eskimo.com>, linux-hams@vger.kernel.org

Curt Mills wrote:
> On Sat, 7 Jan 2006, richard wrote:
> 
> 
>>Hi guys
>>can anyone throw some light on this compile failure.
>>gcc-4.0.1, kernel-2.6.12-14mdk, mandriva 2006CE, FFTW 2.1.5 and fftw3( needed
>>for other apps)
>>gmsk-0.6,hamlibs 1.2.4 + devel
> 
> 
> It's GCC-4 that's doing it to you.  It enforces stricter compliance
> with the C specs.
> 
> You'd need to go back to the developers and have them change the
> code so that it was in compliance with what GCC-4 expects.  We had
> to do that for the Xastir project because defining functions inside
> functions isn't allowed in GCC-4.x.
> 
Thanks Curt, I thought something like that, but found a patch for dsp.h that allowed it to compile
on this computer, but alsa not my friends.

his compile fails at
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

Thanks
Richard
