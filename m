From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ax25ipd configuration problem
Date: Mon, 17 Nov 2003 21:53:59 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200311172153.59999.pa3gcu@zeelandnet.nl>
References: <3FB7E02D.D5CC7D78@free.fr> <200311172107.01132.pa3gcu@zeelandnet.nl> <3FB9326F.152C7AF8@free.fr>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FB9326F.152C7AF8@free.fr>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?q?G=E9rard=20Parat=20=2F=20F6FGZ?= <f6fgz@free.fr>, Linux-Hams <linux-hams@vger.kernel.org>

On Monday 17 November 2003 21:41, G=E9rard Parat / F6FGZ wrote:
> pa3gcu a =E9crit :
> > Without sounding stupid,  a pty/tty is a "pair" used together, so i=
f you
> > use mkiss to attach one side (/dev/ptyp4) and klissattach to attach=
 the
> > otherside (/dev/ttyp4) then how can you attach ax25ipd with /dev/tt=
yp4 as
> > well.?? Or am i missing something here.
>
> Hi Richard,
>
> Yes you are right ...
> So I done a big mistake ;-)
> But I don't understand how to connect an already existing ax25 port t=
o the
> tunnel, i.e. if someone wants to connect via the tunnel to another ax=
25
> station from my radio side.
> I need some light ;-)

If you take a look at my web site (scripts page) there is an example fo=
r a=20
2.2.xx kernel, if i remember correctly not all too much has changed for=
=20
2.4.xx kernels.
All the files axports nrports and so on are there showing the interface=
=2E

Basicly, i attach an interface with kissattach (tty) then ax25ipd goes =
onto=20
the otherside.
Routes are set with iproute2 (ip).
Let me know if you want a more clearer example as i have been told by s=
ome=20
that my scripts are too complicated to be understood.

> --
> 73 G=E9rard F6FGZ

--=20
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
