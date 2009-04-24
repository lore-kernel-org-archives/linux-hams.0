From: richard <richard.bown@blueyonder.co.uk>
Subject: gmfsk on MDV2009x86_64
Date: Fri, 24 Apr 2009 08:50:50 +0100
Message-ID: <20090424085050.158f7de0@richard-g8jvm>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-hams@vger.kernel.org

Hi trying to build gmfsk on a amd64 system

Has anyone built on MDV 2009 x86_64

Its falling over here:-
Making all in olivia
make[3]: Entering directory
`/home/richard-1/Hamapps/gmfsk-0.7pre1/src/olivia' if g++
-DHAVE_CONFIG_H -I. -I. -I../..
-DPACKAGE_DATA_DIR=3D\""/usr/local/share"\"
-DPACKAGE_LOCALE_DIR=3D\""/usr/local/share/locale"\" -DORBIT2=3D1 -pthr=
ead
-I/usr/include/libgnomeui-2.0 -I/usr/include/libart-2.0
-I/usr/include/gconf/2 -I/usr/include/gnome-keyring-1
-I/usr/include/libgnome-2.0 -I/usr/include/libbonoboui-2.0
-I/usr/include/libgnomecanvas-2.0 -I/usr/include/gtk-2.0
-I/usr/include/gnome-vfs-2.0 -I/usr/lib64/gnome-vfs-2.0/include
-I/usr/include/orbit-2.0 -I/usr/include/dbus-1.0
-I/usr/lib64/dbus-1.0/include -I/usr/include/glib-2.0
-I/usr/lib64/glib-2.0/include -I/usr/include/libbonobo-2.0
-I/usr/include/bonobo-activation-2.0 -I/usr/include/libxml2
-I/usr/include/pango-1.0 -I/usr/include/gail-1.0
-I/usr/include/freetype2 -I/usr/include/atk-1.0
-I/usr/lib64/gtk-2.0/include -I/usr/include/cairo
-I/usr/include/pixman-1 -I/usr/include/libpng12 -I../../src
-I../../src/misc    -g -O2 -Wall -MT olivia.o -MD -MP -MF
".deps/olivia.Tpo" \ -c -o olivia.o `test -f 'olivia.cc' || echo
'./'`olivia.cc; \ then mv -f ".deps/olivia.Tpo" ".deps/olivia.Po"; \
else rm -f ".deps/olivia.Tpo"; exit 1; \ fi In file included from
olivia.cc:27: mfsk.h: In member function =E2=80=98void
MFSK_Encoder::PrintOutputBlock()=E2=80=99: mfsk.h:1451: warning: format=
 =E2=80=98%2d=E2=80=99
expects type =E2=80=98int=E2=80=99, but argument 2 has type =E2=80=98si=
ze_t=E2=80=99 mfsk.h: In member
function =E2=80=98void MFSK_HardDecoder::PrintInputBuffer()=E2=80=99: m=
fsk.h:1607:
warning: format =E2=80=98%2d=E2=80=99 expects type =E2=80=98int=E2=80=99=
, but argument 2 has type
=E2=80=98size_t=E2=80=99 mfsk.h: At global scope: mfsk.h:1963: error: d=
eclaration of
=E2=80=98RateConverter<Type> MFSK_Transmitter<Type>::RateConverter=E2=80=
=99
mfsk.h:1775: error: changes meaning of =E2=80=98RateConverter=E2=80=99 =
from =E2=80=98class
RateConverter<Type>=E2=80=99 mfsk.h:2212: error: declaration of
=E2=80=98RateConverter<Type> MFSK_Receiver<Type>::RateConverter=E2=80=99=
 mfsk.h:1775:
error: changes meaning of =E2=80=98RateConverter=E2=80=99 from =E2=80=98=
class
RateConverter<Type>=E2=80=99 make[3]: *** [olivia.o] Error 1 make[3]: L=
eaving
directory `/home/richard-1/Hamapps/gmfsk-0.7pre1/src/olivia' make[2]:
*** [all-recursive] Error 1 make[2]: Leaving directory
`/home/richard-1/Hamapps/gmfsk-0.7pre1/src' make[1]: ***
[all-recursive] Error 1 make[1]: Leaving directory
`/home/richard-1/Hamapps/gmfsk-0.7pre1' make: *** [all] Error 2



the culprit is this, and it driving me nuts, thats if I'm not already :=
)

open("/usr/share/locale/en_GB.UTF-8/LC_MESSAGES/make.mo", O_RDONLY) =3D
-1 ENOENT (No such file or directory)
open("/usr/share/locale/en_GB.utf8/LC_MESSAGES/make.mo", O_RDONLY) =3D =
-1
ENOENT (No such file or directory)
open("/usr/share/locale/en_GB/LC_MESSAGES/make.mo", O_RDONLY) =3D -1
ENOENT (No such file or directory)
open("/usr/share/locale/en.UTF-8/LC_MESSAGES/make.mo", O_RDONLY) =3D -1
ENOENT (No such file or directory)
open("/usr/share/locale/en.utf8/LC_MESSAGES/make.mo", O_RDONLY) =3D -1
ENOENT (No such file or directory)
open("/usr/share/locale/en/LC_MESSAGES/make.mo", O_RDONLY) =3D -1 ENOEN=
T
(No such file or directory)
write(2, "make: "..., 6make: )                =3D 6
write(2, "*** [all] Error 2"..., 17*** [all] Error 2)    =3D 17

I've hit this so many times.
In the past I've located make.mo from another locales as copied it
across to /usr/share/locale/en_GB/LC_MESSAGES/ but I cant find one
anywhere, I've installed locales for russian, spanish and estonian
thats worked in the past but I'm not find make.mo

Its installed by make, and I think its only used on error messages.
any suggestions please
TIA


--=20
Best wishes

Richard Bown

#######################################################################=
##
Registered Linux User 36561
OS: Mandriva 2009 powerpack on AMD Dual Athlon 64 +4400: 8 GB RAM DDR2
Ham Call: G8JVM , QRA IO82SP, Interests Microwave
#######################################################################=
##

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
