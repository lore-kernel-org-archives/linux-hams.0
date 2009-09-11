From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: mkiss in ubuntu kernels?
Date: Fri, 11 Sep 2009 10:38:56 +0300
Message-ID: <20090911073856.GA4882@mea-ext.zmailer.org>
References: <3013ad3b0909101544p7eed537fudd5fb92a681a4d44@mail.gmail.com> <92FB22CE-A35E-42D3-9623-2E0C5178E5F0@columbia.edu> <3013ad3b0909101948w7bec17bbg71d7124afa9667ff@mail.gmail.com> <alpine.LNX.2.00.0909102050290.3415@wapiti.we7u.net> <3013ad3b0909102210v40792892y391d7597fe0c12a9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3013ad3b0909102210v40792892y391d7597fe0c12a9@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Collin Hockey <hockeyc@umich.edu>
Cc: "Curt, WE7U" <archer@eskimo.com>, Alan Crosswell <alan@columbia.edu>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

On Fri, Sep 11, 2009 at 01:10:01AM -0400, Collin Hockey wrote:
> Hi Curt,
>=20
> Yes, I did go through that tutorial. It got me going to the point
> where I am now :)
>=20
> I think I understand how mkiss works, but my problem is with the newe=
r
> linux kernel pseudo tty setup. Mkiss doesn't report which slave tty i=
t
> has connected each port to because it was designed at a time when
> there were a bunch of matched pairs (ptm0 and pts0 for instance, m
> being for master and s being for slave), whereas now, a program opens
> the single master pseudo tty and it gets a new slave tty from the OS.
> I'm trying to find a reliable way to figure out which tty mkiss has
> connected each port to.
>=20
> Perhaps I'm barking completely up the wrong tree, but that's my
> understanding of it anyway.
>=20
> Thanks a lot for your answers, they're definitely helping me get
> closer to a solution.

You are not at wrong tree, that program is from era before present
pseudo-tty system, when the stupid way it does things did work.

mkiss users are very rare indeed...


I have rewritten mkiss a bit to use modern pty:s, and it is in this
package:

  http://ham.zmailer.org/oh2mqk/libax25/ax25-tools-0.0.9-3.tar.gz

but to use it, you will need also my  libax25  from same directory.
After you take it into use, the information on HOWTO is plain wrong.
See  "man mkiss".   The mkiss will also need associated kissattach.

I did also rework the  kissattach   so that you do not need to set
IP address on AX.25 interface.

My libax25 changes have made it to  cvs@cvs.linux-ax25.org:/home/ax25-c=
vs
but tools changes are still in the pipeline..  Apparently I have to pus=
h
at them again.

> Collin Hockey

   73 de Matti, OH2MQK


> On Thu, Sep 10, 2009 at 11:51 PM, Curt, WE7U <archer@eskimo.com> wrot=
e:
> > On Thu, 10 Sep 2009, Collin Hockey wrote:
> >
> >> I was looking at the information in the mkiss man page
> >> (http://linux.die.net/man/8/mkiss), it seems to claim to be the on=
e
> >> attached to the physical serial port, routing KISS frames through =
two
> >> or more pseudo ttys whose slave ends are attached with kissattach =
to
> >> separate ax.25 network interfaces.
> >
> > Did you look up the Linux AX.25 HOWTO document? =A0That may give yo=
u
> > additional practical info for setting up MKISS.
> >
> > --
> > Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http:/=
/www.eskimo.com/~archer>
> > =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
<http://www.xastir.org>
> > =A0Lotto: =A0A tax on people who are bad at math. - unknown
> > Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
> > The world DOES revolve around me: =A0I picked the coordinate system=
!"
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
