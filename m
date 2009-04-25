From: richard <richard.bown@blueyonder.co.uk>
Subject: gmfsk MDV2009x86_64
Date: Sat, 25 Apr 2009 01:25:06 +0100
Message-ID: <20090425012506.71666255@richard-g8jvm>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-hams@vger.kernel.org


Hi

All variants of gmfsk 6,7 & hjk
all fail on building the olivia module in src/olivia

mfsk.h:1989: error: declaration of =E2=80=98RateConverter<Type> MFSK_Tr=
ansmitter<Type>::RateConverter=E2=80=99
mfsk.h:1799: error: changes meaning of =E2=80=98RateConverter=E2=80=99 =
from =E2=80=98class RateConverter<Type>=E2=80=99
mfsk.h:2248: error: declaration of =E2=80=98RateConverter<Type> MFSK_Re=
ceiver<Type>::RateConverter=E2=80=99
mfsk.h:1799: error: changes meaning of =E2=80=98RateConverter=E2=80=99 =
from =E2=80=98class RateConverter<Type>=E2=80=99

I've tried gcc3.3-c++ and gcc4.4-c++
I've also looked at the include line in the Makefile and installed all
the libs mentioned.
Ideas ??
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
