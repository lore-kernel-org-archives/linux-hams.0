From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: gmfsk MDV2009x86_64
Date: Sun, 26 Apr 2009 00:20:54 +0200
Message-ID: <49F38CC6.2000404@upmc.fr>
References: <20090425012506.71666255@richard-g8jvm> <49F3593F.3000204@sral.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49F3593F.3000204@sral.fi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: linux-hams@vger.kernel.org

Patch applied. Thanks Tomi.

=46or Mandriva Linux I had to delete "0.6+" in the lines ++ and --=20

Patch also successfully applied to source of W1HKJ variant gmfsk.hkj.53

However, both give a lot of warnings about inhability to write
configuration file despite I run gnome GUI and  /usr/lib64/pulse/gconf-=
helper
and /usr/lib64/gconfd-2 daemons are loaded.

73 de Bernard, f6bvp


Tomi Manninen a =C3=A9crit :
> richard wrote:
>> Hi
>>
>> All variants of gmfsk 6,7 & hjk
>> all fail on building the olivia module in src/olivia
>>
>> mfsk.h:1989: error: declaration of =C3=A2=EF=BF=BD=EF=BF=BDRateConve=
rter<Type>=20
>> MFSK_Transmitter<Type>::RateConverter=C3=A2=EF=BF=BD=EF=BF=BD
>> mfsk.h:1799: error: changes meaning of =C3=A2=EF=BF=BD=EF=BF=BDRateC=
onverter=C3=A2=EF=BF=BD=EF=BF=BD from=20
>> =C3=A2=EF=BF=BD=EF=BF=BDclass RateConverter<Type>=C3=A2=EF=BF=BD=EF=BF=
=BD
>> mfsk.h:2248: error: declaration of =C3=A2=EF=BF=BD=EF=BF=BDRateConve=
rter<Type>=20
>> MFSK_Receiver<Type>::RateConverter=C3=A2=EF=BF=BD=EF=BF=BD
>> mfsk.h:1799: error: changes meaning of =C3=A2=EF=BF=BD=EF=BF=BDRateC=
onverter=C3=A2=EF=BF=BD=EF=BF=BD from=20
>> =C3=A2=EF=BF=BD=EF=BF=BDclass RateConverter<Type>=C3=A2=EF=BF=BD=EF=BF=
=BD
>>
>> I've tried gcc3.3-c++ and gcc4.4-c++
>> I've also looked at the include line in the Makefile and installed a=
ll
>> the libs mentioned.
>> Ideas ??
>=20
> Try this patch from Debian:
>=20
> http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=3D12;filename=3Dgmfs=
k_gcc43.diff;att=3D1;bug=3D456105=20
>=20
>=20
> and let me know...
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
