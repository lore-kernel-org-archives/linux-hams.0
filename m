From: "TIMOTHY POWELL" <kd4iky@peoplepc.com>
Subject: Re: AX25 socket question.
Date: Tue, 16 Jul 2002 05:19:09 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020716051912.28245.h010.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: tpm@prkele.tky.hut.fi
Cc: linux-hams@vger.kernel.org

Thanks for the information, I didn=92t realize that I
would have to work at that lower level.  But I like
challenges.  I=92m looking for a book right now to get
that will help explain some things to me, I just wish
there was one specific to AX25.  I still plan to work
on the monitoring program, I had planned to get to that
lower level sooner or later but it looks like it will
be sooner.  Thanks for the help and information.   I
have always used other peoples programs before, but
after a while I finally decided to learn to do it
myself just for the challenge and learning experience.=20
I appreciate all the replies.  Thanks.

Timothy
KD4IKY






On Tue, 16 July 2002, Tomi Manninen OH2BNS wrote

>=20
> On Mon, 15 Jul 2002, TIMOTHY POWELL wrote:
>=20
> > int socket(int domain, int type, int protocol);
> >
> > So PF_AX25 is the domain, SOCK_SEQPACKET would be
the
> > type of communication.  So what protocol is used for
> > receiving AX25 information, or am I still
> > misunderstanding sockets?
>=20
> Not necessarily but maybe you're not quite up to what
the different
> protocol layers are.
>=20
> Just like Craig said, when you need to have an AX.25
socket and do
> information transport between two stations, you need a
> PF_AX25,SOCK_SEQPACKET socket. AX.25 does not support
SOCK_STREAM. It does
> support unnumbered data (UI frames) with SOCK_DGRAM.
>=20
> But, the point is (as far as I can see) that what you
want to do is not
> (point to point) information transfer, but network
monitoring. When doing
> that you actually do not want to have a socket that
corresponds to the
> higher level protocol but you want a socket to see
the data from the
> device driver. That is what "listen" does.
>=20
> The same thing applies to applications that monitor
for example the
> internet traffic in your local ethernet segment (eg.
ethereal). They can't
> use PF_INET sockets but something lower level.
>=20
> The listen program uses PF_PACKET as the domain and
SOCK_PACKET as the
> type. This is actually deprecated in new kernels but
still works (see
> packet(7) manual page for more details). Anyway the
general idea is that
> you need to interpret the raw data from the device
driver to do your
> monitoring. PF_PACKET,SOCK_PACKET socket handles the
device dependent part
> for you, basically removing the KISS command byte
when using a KISS TNC
> and maybe something else for other packet radio
drivers, but the actual
> AX.25 and higher level protocol/data interpretation
is left to you (feel
> free to copy from "listen").
>=20
> So writing an application to monitor AX.25 traffic
might not be the
> easiest way to start exploring the world AX.25 as you
really need to do
> the whole protocol decoding in your application.
Writing an application
> for simple information transfer with another packet
radio station is much
> simpler as the kernel handles all the gory protocol
details for you...
>=20
> But, as already said here, you can always re-use the
code from "listen".
> If you are not interested in the upper level
protocols (above plain AX.25)
> you can modify it accordingly (to just hex dump any
higher level data or
> whatever).
>=20
> --=20
> Tomi Manninen           Internet:  oh2bns@sral.fi
> OH2BNS                  AX.25:   =20
oh2bns@oh2rbi.fin.eu
> KP20ME04                Amprnet: =20
oh2bns@oh2rbi.ampr.org
>=20
> -
> To unsubscribe from this list: send the line
"unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=20
http://vger.kernel.org/majordomo-info.html
=0D
________________________________________________
PeoplePC:  It's for people. And it's just smart.=20
http://www.peoplepc.com=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
