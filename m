From: WJuergens@t-online.de (Wolf-Ruediger Juergens)
Subject: Re: Abt gmfsk last version.
Date: Sun, 18 May 2003 14:00:49 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200305181400.49324.wjuergens@t-online.de>
References: <Pine.LNX.4.44.0305132315070.2357-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0305132315070.2357-100000@oh2bns.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello,
After upgrading to gcc-3.2.3 (debian/unstable) gmfsk will not compile anymore.
I define _OPTIMIZE_ it will the compile but than not linking.
Any hints?
It was ok with gcc-3.2.1.

tks es 73 de Wolf, DL2WRJ
-----------------------------------------------------------------------------
(without _OPTIMIZE_ in filter.c)
gcc -DHAVE_CONFIG_H -I. -I. -I../.. -DPACKAGE_DATA_DIR=\""/usr/local/share"\" 
-DPACKAGE_LOCALE_DIR=\""/usr/local/share/locale"\" -DORBIT2=1 -pthread 
-I/usr/include/libgnomeui-2.0 -I/usr/include/libgnome-2.0 
-I/usr/include/libgnomecanvas-2.0 -I/usr/include/gtk-2.0 
-I/usr/include/libart-2.0 -I/usr/include/gconf/2 
-I/usr/include/libbonoboui-2.0 -I/usr/include/glib-2.0 
-I/usr/lib/glib-2.0/include -I/usr/include/orbit-2.0 
-I/usr/include/libbonobo-2.0 -I/usr/include/gnome-vfs-2.0 
-I/usr/lib/gnome-vfs-2.0/include -I/usr/include/linc-1.0 
-I/usr/include/bonobo-activation-2.0 -I/usr/include/pango-1.0 
-I/usr/include/freetype2 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 
-I/usr/include/libxml2      -march=athlon-xp -Wall -c `test -f 'filter.c' || 
echo './'`filter.c
filter.c:20: syntax error before '?' token
filter.c:25: syntax error before "for"
make[3]: *** [filter.o] Fehler 1
make[3]: Leaving directory `/home/knoppix/source/gmfsk-0.5/src/misc'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory `/home/knoppix/source/gmfsk-0.5/src'
make[1]: *** [all-recursive] Fehler 1
make[1]: Leaving directory `/home/knoppix/source/gmfsk-0.5'
make: *** [all] Fehler 2

---------------------------------------------------------------------------
(_OPTIMIZE_ is defined in filter.c, ->linker error)

g++    -march=athlon-xp -o gmfsk  main.o support.o interface.o callbacks.o 
waterfall.o miniscope.o papertape.o gtkdial.o conf.o confdialog.o log.o 
macro.o ptt.o qsodata.o snd.o trx.o mfsk/libmfsk.a mt63/libmt63.a 
rtty/librtty.a throb/libthrob.a psk31/libpsk31.a feld/libfeld.a 
misc/libmisc.a -pthread -Wl,--export-dynamic -L/usr/X11R6/lib -lgnomeui-2 
-lSM -lICE -lbonoboui-2 -lxml2 -lz -lgnomecanvas-2 -lgnome-2 -lart_lgpl_2 
-lpangoft2-1.0 -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 
-lpangoxft-1.0 -lpangox-1.0 -lpango-1.0 -lbonobo-2 -lgconf-2 -lgnomevfs-2 
-lbonobo-activation -lORBit-2 -lm -llinc -lgmodule-2.0 -ldl -lgobject-2.0 
-lgthread-2.0 -lglib-2.0    -lfftw
mfsk/libmfsk.a(mfskrx.o)(.text+0x136): In function `decodesymbol':
: undefined reference to `decayavg'
mfsk/libmfsk.a(mfskrx.o)(.text+0x1c6): In function `decodesymbol':
: undefined reference to `decayavg'
mfsk/libmfsk.a(mfskrx.o)(.text+0x362): In function `softdecode':
: undefined reference to `graydecode'
mfsk/libmfsk.a(mfskrx.o)(.text+0x3bc): In function `softdecode':
: undefined reference to `cmod'
mfsk/libmfsk.a(mfskrx.o)(.text+0x4a0): In function `softdecode':
: undefined reference to `clamp'
mfsk/libmfsk.a(mfskrx.o)(.text+0x59b): In function `mixer':
: undefined reference to `cmul'
mfsk/libmfsk.a(mfskrx.o)(.text+0x6ab): In function `harddecode':
: undefined reference to `cmod'
mfsk/libmfsk.a(mfskrx.o)(.text+0x788): In function `update_syncscope':
: undefined reference to `cmod'
mfsk/libmfsk.a(mfskrx.o)(.text+0x878): In function `synchronize':
: undefined reference to `cmod'
mfsk/libmfsk.a(mfskrx.o)(.text+0xa18): In function `afc':
: undefined reference to `ccor'
mfsk/libmfsk.a(mfsktx.o)(.text+0x94): In function `sendsymbol':
: undefined reference to `grayencode'
mfsk/libmfsk.a(mfsktx.o)(.text+0x6c7): In function `mixer':
: undefined reference to `cmul'
rtty/librtty.a(rttyrx.o)(.text+0x60d): In function `rtty_rxprocess':
: undefined reference to `ccor'
rtty/librtty.a(rttyrx.o)(.text+0x827): In function `mixer':
: undefined reference to `cmul'
rtty/librtty.a(rttypar.o)(.text+0x39): In function `rtty_parity':
: undefined reference to `parity'
rtty/librtty.a(rttypar.o)(.text+0x49): In function `rtty_parity':
: undefined reference to `parity'
throb/libthrob.a(throbrx.o)(.text+0x78): In function `update_syncscope':
: undefined reference to `cmod'
throb/libthrob.a(throbrx.o)(.text+0x12a): In function `findtones':
: undefined reference to `cmod'
throb/libthrob.a(throbrx.o)(.text+0x165): In function `findtones':
: undefined reference to `cmod'
throb/libthrob.a(throbrx.o)(.text+0x1e5): In function `findtones':
: undefined reference to `cmod'
throb/libthrob.a(throbrx.o)(.text+0x220): In function `findtones':
: undefined reference to `cmod'
throb/libthrob.a(throbrx.o)(.text+0x4c4): In function `rx':
: undefined reference to `cmac'
throb/libthrob.a(throbrx.o)(.text+0x572): In function `rx':
: undefined reference to `cmac'
throb/libthrob.a(throbrx.o)(.text+0x623): In function `rx':
: undefined reference to `cmac'
throb/libthrob.a(throbrx.o)(.text+0x684): In function `rx':
: undefined reference to `ccor'
throb/libthrob.a(throbrx.o)(.text+0x8d1): In function `mixer':
: undefined reference to `cmul'
psk31/libpsk31.a(psk31rx.o)(.text+0x1fd): In function `rx_symbol':
: undefined reference to `ccor'
psk31/libpsk31.a(psk31rx.o)(.text+0x352): In function `rx_symbol':
: undefined reference to `cpwr'
psk31/libpsk31.a(psk31rx.o)(.text+0x43e): In function `rx_symbol':
: undefined reference to `cpwr'
psk31/libpsk31.a(psk31rx.o)(.text+0x743): In function `psk31_rxprocess':
: undefined reference to `cmod'
psk31/libpsk31.a(psk31rx.o)(.text+0x789): In function `psk31_rxprocess':
: undefined reference to `cmod'
psk31/libpsk31.a(psk31tx.o)(.text+0x16d): In function `send_symbol':
: undefined reference to `cmul'
feld/libfeld.a(feldrx.o)(.text+0x422): In function `mixer':
: undefined reference to `cmul'
misc/libmisc.a(fftfilt.o)(.text+0x1cf): In function `fftfilt_init':
: undefined reference to `sinc'
misc/libmisc.a(fftfilt.o)(.text+0x1f1): In function `fftfilt_init':
: undefined reference to `sinc'
misc/libmisc.a(fftfilt.o)(.text+0x207): In function `fftfilt_init':
: undefined reference to `hamming'
misc/libmisc.a(fftfilt.o)(.text+0x412): In function `fftfilt_run':
: undefined reference to `cmul'
misc/libmisc.a(filter.o)(.text+0x3b6): In function `filter_run':
: undefined reference to `__mac_g'
misc/libmisc.a(filter.o)(.text+0x3e7): In function `filter_run':
: undefined reference to `__mac_g'
misc/libmisc.a(filter.o)(.text+0x519): In function `filter_I_run':
: undefined reference to `__mac_g'
misc/libmisc.a(filter.o)(.text+0x609): In function `filter_Q_run':
: undefined reference to `__mac_g'
misc/libmisc.a(sfft.o)(.text+0x2cd): In function `sfft_run':
: undefined reference to `csub'
misc/libmisc.a(sfft.o)(.text+0x313): In function `sfft_run':
: undefined reference to `cadd'
misc/libmisc.a(sfft.o)(.text+0x378): In function `sfft_run':
: undefined reference to `cmul'
misc/libmisc.a(viterbi.o)(.text+0xcd): In function `viterbi_init':
: undefined reference to `parity'
misc/libmisc.a(viterbi.o)(.text+0xdd): In function `viterbi_init':
: undefined reference to `parity'
misc/libmisc.a(viterbi.o)(.text+0x7d2): In function `encoder_init':
: undefined reference to `parity'
misc/libmisc.a(viterbi.o)(.text+0x7e2): In function `encoder_init':
: undefined reference to `parity'
collect2: ld returned 1 exit status
make[3]: *** [gmfsk] Fehler 1
make[3]: Leaving directory `/home/knoppix/source/gmfsk-0.5/src'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory `/home/knoppix/source/gmfsk-0.5/src'
make[1]: *** [all-recursive] Fehler 1
make[1]: Leaving directory `/home/knoppix/source/gmfsk-0.5'
make: *** [all] Fehler 2



-- 
Q:      Why did the programmer call his mother long distance?
A:      Because that was her name.
(/usr/games/fortune)
