From: Joni =?ISO-8859-1?Q?B=E4cklund?= <joni@connect.fi>
Subject: Re: gMFSK
Date: Wed, 21 Jan 2004 09:59:49 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1074671989.23819.104.camel@sohva.connect.fi>
References: <Pine.LNX.4.44.0401211237060.23296-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0401211237060.23296-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Wilbert Knol <w.knol@niwa.co.nz>
Cc: linux-hams <linux-hams@vger.kernel.org>

Byt the way the fftw libs are included in SuSE, just install both
fftw and fftw-devel rpms. ( version 2.1.3 )

I remember to have some troubles to build the rpm version of gMFSK on
SuSE 8.2 but it was due to different installation of gnome ( all gnome
related libs etc are on /opt/gnome ). But now the never sources from
tomi builds just fine as rpms. I just notices once againt thatt you jus=
t
have to compile and install hamlib as rpm before you can compile rpm fo=
r
gMFSK. If you have installed hamlib manually to /usr/local/lib instead
of using rpm the rpm build of gMFSK will fail due to not founding the
hamlib. On that case you must compile it manyally to get configure scir=
t
fo find the libs. ( maybe editing gmfsk.spec file in the source tarball
will help )

Good Luck.=20

As I told you before the version that I compiled on SuSE 8.2 was 0.5.=20

If you still have problems with that gnomecanvas package you can try to
download a never version for SuSE 9 that includes all needed .a files.
It seems to be quite same version that was installed on 8.2. This MIGHT
work while it is not recommended to mix library rpms inside different
releases of SuSE !=20

Joni
=20

On Wed, 2004-01-21 at 15:06, Wilbert Knol wrote:
> > > I use SuSE 8.2. Is there any of you, that has gMFSK to run with 8=
=2E2 ?.
> > >
> > > If so, I would be very interested in getting info's on the differ=
ent
> > > packages, that are necessary for it. I think I have had all packa=
ges
>=20
> On SuSE 8.1 Pro, I have successfully built gMFSK from sources.
>=20
> Download and install fftw-2.1.5 first.
> You'll need to ./configure and make it twice.
> The second time with './configure --enable-float' in order to get the
> single-precision libraries. If you don't do this, gMFSK won't compile=
=2E
>=20
> Secondly, install hamlib, if you have a rig capable of being
> computer-controlled.
>=20
> Next, edit /etc/ld.so.conf and add the line:
> /usr/local/lib
> ...if not already there. Then, refresh the linker cache with;
> ldconfig so the linker knows about the newly installed fftw
> and hamlib libraries.
>=20
> Lastly, install gMFSK. I use version 0.5, but I have installed
> 0.6beta1 on a Mandrake 9.0 box.
>=20
> > More specifically, the libgnomecanvas-devel package seems to be
> > missing the file libgnomecanvas-2.a which in my opinion should
> > be there.
>=20
> I don't have it, and gMFSK works fine.
> I guess it uses:
> /opt/gnome2/lib/libgnomecanvas-2.so
> ...which is in the libgnomecanvas RPM that came with the SuSE 8.1 CDs=
=2E
>=20
> As an aside, for user software, I avoid RPMs like the plague.
>=20
> They are great for installing stuff off the CDs, but, for 3rd party
> software, they are not worth the hassle unless it is an RPM that was
> built for your particular distribution and version.
>=20
> > Anyone care to help Erik?
>=20
> Hope this helps.
>=20
> Wilbert, ZL2BSJ
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Joni B=E4cklund, Tel +358400665775, FAX +35898552247
     Email: joni@connect.fi, oh2njr@sral.fi
  Amateur packet radio AX25: oh2njr@oh2rbj.fin.eu
 Some kind of Homepage: http://www.connect.fi/joni
" The Choice of a GNU generation:  SuSE Linux 9.0 "


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
