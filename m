From: w9ya <w9ya@amsat.org>
Subject: Re: installing packet
Date: Fri, 22 Nov 2002 11:46:58 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200211221146.58145.w9ya@amsat.org>
References: <Pine.LNX.4.44.0211210857510.7780-100000@hanhet.loew.washington.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0211210857510.7780-100000@hanhet.loew.washington.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux Hams <linux-hams@vger.kernel.org>

Actually dependancies in Mandrake are also now taken care of automatica=
lly by=20
using the urpm_ series of tools. There are also many linux distribution=
s that=20
have EXCELLENT dependancy and provides handling these days. This is not=
 to=20
take away from Debian and the apt tools. They are also EXCELLENT as wel=
l, and=20
perhaps more importantly the way the maintainer's system works, problem=
s tend=20
to be rapidly taken care of.

Bob Finch


On Thursday 21 November 2002 12:09 pm, K. David Prince wrote:
> Evandro,
>
> For future reference, you might want to try using the Debian distribu=
tion.
> The packages you mention below are included in the distribution, but =
more
> importantly, when you install any one of them, all the dependencies a=
re
> automatically taken care of and package conflicts are presented for
> resolution.  The Debian distributions are available from numerous arc=
hive
> sites (250+).  If you install Debian, you can use the "netselect-apt"
> command to find the archive sites that will give you the fastest down=
load
> speeds for your network connection.  See <http://www.debian.org/> for
> general information, then go to <http://www.debian.org/distrib/packag=
es>
> view package descriptions.
>
> Good Luck!
>
> Dave
> WB0RAZ
>
> On Thu, 21 Nov 2002, Evandro Eduardo Seron Ruiz wrote:
> >  Thank you all for the help.
> >  It really was not clear for me that I had
> >  to install ncurses-devel not ncurses,
> >  but this was not the only problem.
> >
> >  To make it shorter I found it easier to
> >  install using rpm instead of compiling the
> >  sources. The ax25lib, the tools and the apps
> >  seem to be very dependent of the source code
> >  and not only of the funcionality.
> >
> >  It took me too much time to find the exact
> >  combination of packages wich seems now to
> >  work, which  are:
> >
> >   libax25_0-0.0.10-1mdk
> >   ax25-tools-0.0.8-3mdk
> >   ax25-apps-0.0.6-1mdk
> >
> >  for the Mandrake distribution.
> >
> >  Thank you all so much,
> >
> >  Evandro Ruiz
> >  PY2 PCY
> >
> >
> >
> > =3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >  Evandro Eduardo Seron Ruiz               PY2PCY
> >
> > ___________________________________________________________________=
____
> > Yahoo! GeoCities
> > Tudo para criar o seu site: ferramentas f=E1ceis de usar, espa=E7o =
de sobra e
> > acess=F3rios. http://br.geocities.yahoo.com/
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-ham=
s" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
