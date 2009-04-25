From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: gmfsk MDV2009x86_64
Date: Sat, 25 Apr 2009 11:48:22 +0200
Message-ID: <49F2DC66.5080600@upmc.fr>
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

Hi Richard,

Using gcc version 4.3.2 (GCC) I had exactly the same errors with gmfsk-=
0.7pre1.

I am not at all familiar with C++
However I turned around the errors by changing the name of RateConverte=
r in
class MFSK_Transmitter
Starting at line 1963 of src/olivia/mfsk.h I changed RateConverter into=
 Rateconverter to avoid the re declaration conflict.

Line 1963 is now :
   RateConverter<Type> Rateconverter; // output rate converter
and further lines in error :
=20
Line 1985=20
          Rateconverter.Free();
etc..

I then compiled and installed gMFSK 0.7-pre1.
It seems to work. But I did no run it online. Olivia mode should be tes=
ted to see if the patch
did not break anything.

73 de Bernard, f6bvp =20


richard a =C3=A9crit :
> Hi
>=20
> All variants of gmfsk 6,7 & hjk
> all fail on building the olivia module in src/olivia
>=20
> mfsk.h:1989: error: declaration of =C3=A2=EF=BF=BD=EF=BF=BDRateConver=
ter<Type> MFSK_Transmitter<Type>::RateConverter=C3=A2=EF=BF=BD=EF=BF=BD
> mfsk.h:1799: error: changes meaning of =C3=A2=EF=BF=BD=EF=BF=BDRateCo=
nverter=C3=A2=EF=BF=BD=EF=BF=BD from =C3=A2=EF=BF=BD=EF=BF=BDclass Rate=
Converter<Type>=C3=A2=EF=BF=BD=EF=BF=BD
> mfsk.h:2248: error: declaration of =C3=A2=EF=BF=BD=EF=BF=BDRateConver=
ter<Type> MFSK_Receiver<Type>::RateConverter=C3=A2=EF=BF=BD=EF=BF=BD
> mfsk.h:1799: error: changes meaning of =C3=A2=EF=BF=BD=EF=BF=BDRateCo=
nverter=C3=A2=EF=BF=BD=EF=BF=BD from =C3=A2=EF=BF=BD=EF=BF=BDclass Rate=
Converter<Type>=C3=A2=EF=BF=BD=EF=BF=BD
>=20
> I've tried gcc3.3-c++ and gcc4.4-c++
> I've also looked at the include line in the Makefile and installed al=
l
> the libs mentioned.
> Ideas ??

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
