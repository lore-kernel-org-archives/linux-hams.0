From: Bob Nielsen <nielsen@oz.net>
Subject: Error compiling gmfsk
Date: Sat, 4 Mar 2006 16:24:23 -0800
Message-ID: <73DDFD02-BF11-4AE3-922D-56A19AD410EE@oz.net>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-hams@vger.kernel.org

I tried to compile gmfsk using the latest hamlib, but get the  
following error:

make[3]: Entering directory `/home/n7xy/gmfsk-0.6/src/mt63'
if g++ -DHAVE_CONFIG_H -I. -I. -I../.. -DPACKAGE_DATA_DIR=\""/usr/ 
local/share"\" -DPACKAGE_LOCALE_DIR=\""/usr/local/share/locale"\" - 
DORBIT2=1 -pthread -I/usr/local/include -I/usr/include/libgnomeui-2.0  
-I/usr/include/libgnome-2.0 -I/usr/include/libgnomecanvas-2.0 -I/usr/ 
include/gtk-2.0 -I/usr/include/libart-2.0 -I/usr/include/gconf/2 -I/ 
usr/include/libbonoboui-2.0 -I/usr/include/gnome-vfs-2.0 -I/usr/lib/ 
gnome-vfs-2.0/include -I/usr/include/gnome-keyring-1 -I/usr/include/ 
glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/orbit-2.0 -I/usr/ 
include/libbonobo-2.0 -I/usr/include/bonobo-activation-2.0 -I/usr/ 
include/pango-1.0 -I/usr/include/freetype2 -I/usr/lib/gtk-2.0/include  
-I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/libxml2 - 
I../../src -I../../src/misc    -g -O2 -Wall -MT dsp.o -MD -MP -MF  
".deps/dsp.Tpo" \
   -c -o dsp.o `test -f 'dsp.cc' || echo './'`dsp.cc; \
then mv -f ".deps/dsp.Tpo" ".deps/dsp.Po"; \
else rm -f ".deps/dsp.Tpo"; exit 1; \
fi
dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&, typeW,  
typeW, typeW)':
dsp.h:558: error: 'Out' was not declared in this scope
dsp.h: In function 'void LowPass2(typeInp, LowPass2elem&,  
LowPass2weight&)':
dsp.h:565: error: 'Weigth' was not declared in this scope
dsp.h:566: error: 'Out' was not declared in this scope
make[3]: *** [dsp.o] Error 1
make[3]: Leaving directory `/home/n7xy/gmfsk-0.6/src/mt63'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/n7xy/gmfsk-0.6/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/n7xy/gmfsk-0.6'
make: *** [all] Error 2

Any ideas?

Bob, N7XY




