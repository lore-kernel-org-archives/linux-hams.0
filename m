From: Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: [PATCH] xfbbd: Run the same data files on 64-bit
Date: Sat, 6 Jul 2013 23:24:31 +0200
Message-ID: <0A70646B-CB6F-4FBE-8D10-767502DD78B6@upmc.fr>
References: <4CE0313C.3080804@upmc.fr> <51D738A7.1010505@junglevision.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51D738A7.1010505@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Cathryn,

Thank you for your message.=20
I have been using FBB 7.05e on a 64 bits machine for a while with Mandr=
iva and somce lat year with Mageia Linux distro without problem.
However I never tried to import any data from a previous 32 bits instal=
l for I do not see any necessity to do that.
What kind of data do you want to import  ?

However, would you mind providing a patch created with diff -pruN optio=
ns. This is the one I am used to read.

I will consider it and let you know the results of my tests.

73 de Bernard Pidoux f6bvp

Sent from my iPhone

Le 5 juil. 2013 =C3=A0 23:20, Cathryn Mataga <cathryn@junglevision.com>=
 a =C3=A9crit :

> I'm moving my ham radio server up to 64-bit Fedora 18.  So I'm fixing=
 issues as I hit them.
>=20
> This is against fbbsrc.705e.  When compiled for 64 bits, the code was=
 corrupting all my 32-bit data files.
> I think this is right, that the binary data files should be the same =
between 32 and 64 bit compiles.
>=20
> After applying this patch, I see my user names and messages correctly=
 after copying data from my old 32-bit install to a new 64-bit install.
>=20
> I haven't made any patches in awhile so if anything is wrong let me k=
now.
>=20
> <fbbsrc.705e.sixtyfour.patch>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
