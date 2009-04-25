From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gmfsk MDV2009x86_64
Date: Sat, 25 Apr 2009 21:41:03 +0300
Message-ID: <49F3593F.3000204@sral.fi>
References: <20090425012506.71666255@richard-g8jvm>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20090425012506.71666255@richard-g8jvm>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: richard <richard.bown@blueyonder.co.uk>
Cc: linux-hams@vger.kernel.org

richard wrote:
> Hi
>=20
> All variants of gmfsk 6,7 & hjk
> all fail on building the olivia module in src/olivia
>=20
> mfsk.h:1989: error: declaration of =E2=80=98RateConverter<Type> MFSK_=
Transmitter<Type>::RateConverter=E2=80=99
> mfsk.h:1799: error: changes meaning of =E2=80=98RateConverter=E2=80=99=
 from =E2=80=98class RateConverter<Type>=E2=80=99
> mfsk.h:2248: error: declaration of =E2=80=98RateConverter<Type> MFSK_=
Receiver<Type>::RateConverter=E2=80=99
> mfsk.h:1799: error: changes meaning of =E2=80=98RateConverter=E2=80=99=
 from =E2=80=98class RateConverter<Type>=E2=80=99
>=20
> I've tried gcc3.3-c++ and gcc4.4-c++
> I've also looked at the include line in the Makefile and installed al=
l
> the libs mentioned.
> Ideas ??

Try this patch from Debian:

http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=3D12;filename=3Dgmfsk_=
gcc43.diff;att=3D1;bug=3D456105

and let me know...

--=20
Tomi Manninen / OH2BNS / KP20JE01FK
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
