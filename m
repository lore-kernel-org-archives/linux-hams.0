From: Erik Jakobsen <eja@urbakken.dk>
Subject: Re: gMFSK
Date: Wed, 21 Jan 2004 09:13:14 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <400E349A.6000606@urbakken.dk>
References: <Pine.LNX.4.44.0401211237060.23296-100000@zl2bsj.ampr.org> <1074671989.23819.104.camel@sohva.connect.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1074671989.23819.104.camel@sohva.connect.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Joni_B=E4cklund?= <joni@connect.fi>
Cc: Wilbert Knol <w.knol@niwa.co.nz>, linux-hams <linux-hams@vger.kernel.org>



Joni B=E4cklund wrote:
> Byt the way the fftw libs are included in SuSE, just install both
> fftw and fftw-devel rpms. ( version 2.1.3 )

Ok that's nice and easy.

> I remember to have some troubles to build the rpm version of gMFSK on
> SuSE 8.2 but it was due to different installation of gnome ( all gnom=
e
> related libs etc are on /opt/gnome ). But now the never sources from
> tomi builds just fine as rpms. I just notices once againt thatt you j=
ust
> have to compile and install hamlib as rpm before you can compile rpm =
for
> gMFSK. If you have installed hamlib manually to /usr/local/lib instea=
d
> of using rpm the rpm build of gMFSK will fail due to not founding the
> hamlib. On that case you must compile it manyally to get configure sc=
irt
> fo find the libs. ( maybe editing gmfsk.spec file in the source tarba=
ll
> will help )

I don't use Gnome but KDE, and think this also can give some troubles,=20
but not sure. Will it be fairly easy to could install Gnome too, and=20
easy also to could switch between the 2's ?.

> Good Luck.=20
>=20
> As I told you before the version that I compiled on SuSE 8.2 was 0.5.=
=20

Yes I got it.

> If you still have problems with that gnomecanvas package you can try =
to
> download a never version for SuSE 9 that includes all needed .a files=
=2E
> It seems to be quite same version that was installed on 8.2. This MIG=
HT
> work while it is not recommended to mix library rpms inside different
> releases of SuSE !=20

I can. its it ftp.suse.com ?.


> Joni
> =20
>=20
> On Wed, 2004-01-21 at 15:06, Wilbert Knol wrote:
>=20
>>>>I use SuSE 8.2. Is there any of you, that has gMFSK to run with 8.2=
 ?.
>>>>
>>>>If so, I would be very interested in getting info's on the differen=
t
>>>>packages, that are necessary for it. I think I have had all package=
s
>>
>>On SuSE 8.1 Pro, I have successfully built gMFSK from sources.
>>
>>Download and install fftw-2.1.5 first.
>>You'll need to ./configure and make it twice.
>>The second time with './configure --enable-float' in order to get the
>>single-precision libraries. If you don't do this, gMFSK won't compile=
=2E
>>
>>Secondly, install hamlib, if you have a rig capable of being
>>computer-controlled.
>>
>>Next, edit /etc/ld.so.conf and add the line:
>>/usr/local/lib
>>...if not already there. Then, refresh the linker cache with;
>>ldconfig so the linker knows about the newly installed fftw
>>and hamlib libraries.
>>
>>Lastly, install gMFSK. I use version 0.5, but I have installed
>>0.6beta1 on a Mandrake 9.0 box.
>>
>>
>>>More specifically, the libgnomecanvas-devel package seems to be
>>>missing the file libgnomecanvas-2.a which in my opinion should
>>>be there.
>>
>>I don't have it, and gMFSK works fine.
>>I guess it uses:
>>/opt/gnome2/lib/libgnomecanvas-2.so
>>...which is in the libgnomecanvas RPM that came with the SuSE 8.1 CDs=
=2E
>>
>>As an aside, for user software, I avoid RPMs like the plague.
>>
>>They are great for installing stuff off the CDs, but, for 3rd party
>>software, they are not worth the hassle unless it is an RPM that was
>>built for your particular distribution and version.
>>
>>
>>>Anyone care to help Erik?
>>
>>Hope this helps.
>>
>>Wilbert, ZL2BSJ
>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Med venlig hilsen - Best regards.
Erik Jakobsen - eja@urbakken.dk.
Licensed radioamateur with the callsign OZ4KK.
SuSE Linux 8.2 Proff.
Registered as user #319488 with the Linux Counter, http://counter.li.or=
g.

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
