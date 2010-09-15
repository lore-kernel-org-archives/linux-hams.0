From: Arno Ernst <df3ds@tech-inter.com>
Subject: Re: RPM package for AX25 libraries
Date: Wed, 15 Sep 2010 15:14:39 +0000
Message-ID: <1284563679.3844.17.camel@hydra>
References: <1283497123.3761.50.camel@hydra>  <4C8FE940.2050600@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C8FE940.2050600@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: DK2CRN <dk2crn@dr5a.de>, zl2arn@xtra.co.nz, iandouglasg3nid@aol.com, rein@couperus.com, linux-hams <linux-hams@vger.kernel.org>

Hi Bernard,

Many thanks for your feedback and effort on ax.25.

With success I tried "checkinstall" without any parameters instead of
"make install" in the respective source directory on both opensuse 11.3
and Ubuntu 10.04. In one case - I forgot wether it was opensuse or
ubuntu the package created by "checkinstall" was automatically installe=
d
whereas in the other case I manually had to install.

Just recently I came across that Christoph (DK2CRN) did work on the
pseudo terminal multiplexer (Unix98 PTY) capability of the Linux
net-tools package.

With his patches "slattach" with Unix98 PTY support was compiled here
which was needed to get xnet/linuxnet as a software (telnet) interface
from pskmail_server to ax.25 working.=20

Maybe this links is also of interest to you.

   http://www.linux-ax25.org/wiki/CVS

73 es tnx agn

arno




On Tue, 2010-09-14 at 23:29 +0200, Bernard Pidoux wrote:
> Hi Arno,
>=20
> You encouraged me to build an RPM package for AX25 softwares.
> I tried without success checkinstall and went to rpmbuild following
> a few documentation and RPM howtos.
> I decided to start with libax25-0.0.12-rc2 including two patches from=
 me.
> After a number of trials, the learning curve started to take off.
> I finally made two RPM packages for 32 and 64 bits systems.
> Due to my tiny experience I was not able to make a relocatable librar=
y.
> Then it has to be moved into /usr/local/lib as explained in the updat=
ed
> FPAC MINI HOWTO chapter 3.
>=20
> http://rose.fpac.free.fr/MINI-HOWTO/#s3
>=20
> Please follow the links for downloading the libax25 rpm packages.
>=20
> I would appreciate any comment about the packages use and if needed
> I will continue the work for patched ax25-tools and ax25-apps.
>=20
> 73 de Bernard, f6bvp
>=20
>=20
>=20
> Le 03/09/2010 08:58, Arno Ernst a =C3=A9crit :
> > Dear Bernard,
> >
> > Many thanks for your ax25 patches and the great HOWTO which really =
help
> > to get Packet Radio running with the (new) pseudo terminal multiple=
xer !
> >
> > Users who followed the steps outlined at
> >
> >       http://rose.fpac.free.fr/MINI-HOWTO/
> >
> > might face difficulties when installing other software that depends=
 on
> > ax25 libraries, tools and applications. The package manager is not =
aware
> > that the latter already has been installed from source.
> >
> > A nice way out is to use  "checkinstall" instead of "make install".
> >
> > "checkinstall" will create a package (Slackware, RPM or Debian) whi=
ch
> > then can be installed with the package manager of the user's Linux
> > distribution.
> >
> > Most distributions already have "checkinstall" in their repositorie=
s. If
> > not the homepage is
> >
> >         http://www.asic-linux.com.mx/~izto/checkinstall/
> >
> >
> > Could you please add "checkinstall" to your MINI-HOWTO ?
> >
> >
> > Below please find a sample "checkinstall" dialogue.
> >
> > mni tnx es 73 de experimental station DA5UWG sysop DF3DS
> >
> > arno
> >
> >   =20


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
