From: "Juraj Buliscak" <buliscakj@eurotel.sk>
Subject: Re: packet terminal programm
Date: Fri, 26 Apr 2002 09:21:32 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <OF5E48216F.6B3BF863-ONC1256BA7.0026F483@eurotel.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: tpm@prkele.tky.hut.fi
Cc: linux-hams@vger.kernel.org


Hello all...

      I=B4ve instaled Qt-2.3.1 (all rpms from RedHat7.2 - CD1, CD2) and
KDElibs. At this point all looked fine.

Now I tried to install linkt-0.6.99. I started with ./configure, as was
described in documetation. Configure script stops in section when is
checking for Qt with errors. Here is fragment from config.log:

-----------------------------------------------------------------------=
------------------------------------------------------
configure:4985: checking for Qt
tried NO
tried /usr/lib/qt2/lib
tried /usr/lib/qt2
configure:5144: rm -rf SunWS_cache; g++ -o conftest -O2 -fno-exceptions
-fno-check-new -Wall -pedantic -W -Wpointer-arith -Wmissing-prototypes
-Wwrite-strings -Wno-long-long -fno-builtin -I/usr/lib/qt/include -I.
-L/usr/lib/qt/lib -L/usr/X11R6/lib  conftest.C  -lqt -lpng -lz -lm -ljp=
eg
-lXext -lX11 -lSM -lICE  1>&5
conftest.C: In function `int main()':
conftest.C:14: warning: unused variable `QStringList*t'
/tmp/ccNkZdGu.o: In function `main':
/tmp/ccNkZdGu.o(.text+0x3e): undefined reference to `QString::shared_nu=
ll'
/tmp/ccNkZdGu.o(.text+0x71): undefined reference to
`QIconView::QIconView(QWidget*, char const*, unsigned)'
/tmp/ccNkZdGu.o(.text+0x81): undefined reference to
`QIconView::setWordWrapIconText(bool)'
/tmp/ccNkZdGu.o(.text+0x86): undefined reference to `QString::shared_nu=
ll'
/tmp/ccNkZdGu.o(.text+0xa5): undefined reference to
`QString::setLatin1(char const*, int)'
/tmp/ccNkZdGu.o(.text+0xba): undefined reference to `QString::shared_nu=
ll'
/tmp/ccNkZdGu.o(.text+0xc5): undefined reference to
`QStringData::deleteSelf()'
/tmp/ccNkZdGu.o(.text+0xd7): undefined reference to `QIconView::~QIconV=
iew
()'
/tmp/ccNkZdGu.o(.text+0xeb): undefined reference to `QString::shared_nu=
ll'
/tmp/ccNkZdGu.o(.text+0xf2): undefined reference to
`QString::makeSharedNull()'
/tmp/ccNkZdGu.o(.text+0xf9): undefined reference to
`QString::makeSharedNull()'
collect2: ld returned 1 exit status
configure: failed program was:
#include "confdefs.h"
#include <qglobal.h>
#include <qapplication.h>
#include <qapp.h>
#include <qobjcoll.h>
#include <qstring.h>
#include <qstyle.h>
#include <qiconview.h>
#if ! (QT_VERSION >=3D 210)
#error 1
#endif

int main() {
    QStringList *t =3D new QStringList();
    QIconView iv(0);
    iv.setWordWrapIconText(false);
    QString s;
    s.setLatin1("Elvis is alive", 14);
    return 0;
}
-----------------------------------------------------------------------=
------------------------------------------------------

      There is undefined reference to some functions, but in my qt2 fol=
der
I have all this files like qglobal.h, qapp.h, etc.
I don=B4t know what could be wrong. Could you help me?


73, many thanx


Duro, OM8ACE





                                                                       =
                                                                    =20
                      Tomi Manninen                                    =
                                                                    =20
                      <tpm@prkele.tky.hut.f                            =
                                                                    =20
                      i>                                               =
                                                                 To:=20
                      Sent by:                                         =
                                                                    =20
                      linux-hams-owner@vger              Mike Studer <a=
b6cv@earthlink.net>                                                 =20
                      .kernel.org                                      =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                      24.04.2002 18:04                                 =
                                                                 cc:=20
                      Please respond to tpm                            =
                                                                    =20
                                                         <linux-hams@vg=
er.kernel.org>                                                      =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                            Subject:=20
                                                                       =
                                                                    =20
                                                         Re: packet ter=
minal programm                                                      =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20




On Tue, 23 Apr 2002, Tomi Manninen wrote:

> On Tue, 23 Apr 2002, Mike Studer wrote:
>
> > No versions of linkt compile on RedHat 7.2.  I tried Qt 2.3.1 and
2.3.2.
> > Too bad because it looks like a good program.
>
> Hmm... I use RH7.2 and I run LinKT from time to time... I need to che=
ck,
> it may be that it needed some massaging to compile... I'll report to =
you
a
> bit later...

Just checked, linkt-0.6.99-20011124-CVS compiles just fine on my RH7.2.
And it seems to work as well... :)

--
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
