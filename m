From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: RPM package for AX25 libraries
Date: Tue, 14 Sep 2010 23:29:36 +0200
Message-ID: <4C8FE940.2050600@upmc.fr>
References: <1283497123.3761.50.camel@hydra>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1283497123.3761.50.camel@hydra>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Arno Ernst <df3ds@tech-inter.com>
Cc: zl2arn@xtra.co.nz, iandouglasg3nid@aol.com, rein@couperus.com, linux-hams <linux-hams@vger.kernel.org>

Hi Arno,

You encouraged me to build an RPM package for AX25 softwares.
I tried without success checkinstall and went to rpmbuild following
a few documentation and RPM howtos.
I decided to start with libax25-0.0.12-rc2 including two patches from m=
e.
After a number of trials, the learning curve started to take off.
I finally made two RPM packages for 32 and 64 bits systems.
Due to my tiny experience I was not able to make a relocatable library.
Then it has to be moved into /usr/local/lib as explained in the updated
=46PAC MINI HOWTO chapter 3.

http://rose.fpac.free.fr/MINI-HOWTO/#s3

Please follow the links for downloading the libax25 rpm packages.

I would appreciate any comment about the packages use and if needed
I will continue the work for patched ax25-tools and ax25-apps.

73 de Bernard, f6bvp



Le 03/09/2010 08:58, Arno Ernst a =C3=A9crit :
> Dear Bernard,
>
> Many thanks for your ax25 patches and the great HOWTO which really he=
lp
> to get Packet Radio running with the (new) pseudo terminal multiplexe=
r !
>
> Users who followed the steps outlined at
>
>       http://rose.fpac.free.fr/MINI-HOWTO/
>
> might face difficulties when installing other software that depends o=
n
> ax25 libraries, tools and applications. The package manager is not aw=
are
> that the latter already has been installed from source.
>
> A nice way out is to use  "checkinstall" instead of "make install".
>
> "checkinstall" will create a package (Slackware, RPM or Debian) which
> then can be installed with the package manager of the user's Linux
> distribution.
>
> Most distributions already have "checkinstall" in their repositories.=
 If
> not the homepage is
>
>         http://www.asic-linux.com.mx/~izto/checkinstall/
>
>
> Could you please add "checkinstall" to your MINI-HOWTO ?
>
>
> Below please find a sample "checkinstall" dialogue.
>
> mni tnx es 73 de experimental station DA5UWG sysop DF3DS
>
> arno
>
>   =20
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
