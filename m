From: Patrick Ouellette <pouelle@debian.org>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 14:06:21 -0400
Message-ID: <20120504180621.GB6444@flying-gecko.net>
References: <20120504151424.GC24655@flying-gecko.net>
 <E1SQLMS-00025Q-Iq@mail.kostecke.net>
 <20120504165706.GD24655@flying-gecko.net>
 <CAPSBm51RHEn7ch_A9CDrtUymZtnOJgnkCq_a=F3auq8A_6XFfg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <CAPSBm51RHEn7ch_A9CDrtUymZtnOJgnkCq_a=F3auq8A_6XFfg@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Vodall <wa7nwp@gmail.com>
Cc: linux-hams@vger.kernel.org

On Fri, May 04, 2012 at 10:50:41AM -0700, Bill Vodall wrote:
> >> Has anyone considered making nodejs and ax25 conflict? That would =
be an
> >> easy way of sidestepping this entire namespace issue.
> >>
> >
> > FWIW, I'm fine with that. =A0Apparently either Node.js people are n=
ot
> > OR someone higher in the food chain is not. =A0They are trying to
> > make it so you can have Node.js AND node installed. =A0I suspect th=
e
> > actual cases where this is really desired to be very close to zero.
>=20
> While I don't yet know anything about Node.js, a comment was recently
> made on the wetnet list that the Node.js technology might lead to
> making good use of the inherent nature of AX25 data.
>=20
> If they are marked as conflicting, can it be easily overridden at ins=
tall time?
>=20

Marking the packages as conflicting would get us out of the current
immediate situation and allow another release cycle to develop and
test transition stratigies/plans.

It can be overridden with dpkg --force-conflicts at installation.  This=
 is
certainly not necessarily a long term solution.

As for the usefulness or not of Node.js with ax25 - similar java toolki=
ts=20
exist in the world, web apps are web apps from the user perspective.

The marketing speak from nodejs.org:

Node.js is a platform built on Chrome's JavaScript runtime for easily=20
building fast, scalable network applications. Node.js uses an event-dri=
ven,=20
non-blocking I/O model that makes it lightweight and efficient, perfect=
=20
for data-intensive real-time applications that run across distributed d=
evices.


Not seeing anything particularly well suited to ax25 networks there,
or anything particularly unique in general.


Pat
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
