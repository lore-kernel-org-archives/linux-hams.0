From: "TIMOTHY POWELL" <kd4iky@peoplepc.com>
Subject: Re: AX25 socket question.
Date: Mon, 15 Jul 2002 05:24:29 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020715052433.18187.h005.c002.wm@mail.peoplepc.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: csmall@eye-net.com.au
Cc: linux-hams@vger.kernel.org

Thanks for the reply.

What I=92m wanting to do is write a program to monitor
local packet activity.  The main goal is to learn
something new and I thought writing packet applications
would be a good start.  From your explanation and from
what I learned this weekend is that listen, listens to
more than just AX25 information which is way more than
I want to do.

My first goal is just to receive packet information and
display it on the screen.  I thought I was starting to
understand sockets but with your explanation and
questions I have discovered that I=92m not understanding
as much as I had originally thought. =20

int socket(int domain, int type, int protocol);

So PF_AX25 is the domain, SOCK_SEQPACKET would be the
type of communication.  So what protocol is used for
receiving AX25 information, or am I still
misunderstanding sockets?

Here might be a better idea of what I=92m trying to do.=20
I got an old PC that I put linux on with AX25 turned
on, for lack of a better description.  I plan to use
the sound card to receive and send packets.  First
thing I wanted to do was to write an application for
monitoring the local packet activity.  Then move to
more difficult programs as I learn more about it.  Are
there any tutorials or documentation specific to AX25
that I could also read along with studying the listen
code?  Thanks for your help.  I hope this gives you a
better idea of what I want to do.

Timothy


On Mon, 15 July 2002, Craig Small wrote

>=20
> On Sun, Jul 14, 2002 at 12:01:11PM -0700, TIMOTHY
POWELL wrote:
> > Got a question about the below code copied from the
> > listen.c file that came with ax25-apps-0.0.4
> >=20
> > if ((s =3D socket(AF_PACKET, SOCK_PACKET,
htons(proto)))
>=20
> listen is doing a low-level (Packet socket)
connection.  This is because
> it wants to receive all traffic.  Quite often you
don't want something
> as low-level as that.
>=20
> > I'm new to sockets so I'm a little confuse.  From
what
> > i read from the man pages about sockets if i want to
> > create a socket for ax.25 I would do something
similar
> > to the following:
> >=20
> > axsock =3D socket(PF_AX25, SOCK_STREAM, <?>) ;
>=20
> This would make a socket with the protocol family of
AX25 and a type of
> STREAM.  AX.25 connections are usually SOCK_SEQPACKET
 I don't think
> STREAMs are defined in AX25 land.
>=20
> > I am assuming that AF_PACKET and SOCK_PACKET, used
in
> > the first piece of code, are just variables used by
the
> > programmer to create any type socket he wanted,
since I
> > couldn't find metion of them in the man pages or any
> Not really, it comes to what protocol level the
packets come in at.
> PACKET is pretty low level, I think SOCK_RAW is lower
still though I
> cannot see the difference between them.
>=20
> > way i wrote the function except for <?> if all i
want
> > to do is create a socket for AX25?  <?> is where the
> Create a socket for AX25 to do WHAT?  The what is the
essential piece of
> information you are missing and it what we need to
help you.
>=20
> >  I tried to find the function=20
> > htons(proto) in the code but couldn't so I'm not
sure
> htons? Host to Network (byte order) for Short ints?
> Makes sure the bits are the right way around, intel
gets them back to
> front.
>=20
> > which protocol to use with AX25.  I looked in the
file
> > /ect/protocols but didn't see anything for AX25, but
> /etc/protocols are the protocols that ride on top of
IP
> As you're playing around "below" IP so it won't help
you.
>=20
> As someone said before, have a look at the existing
code.  It may not be
> perfect but it works and gives you a good start.  I
can tell you more
> specific things to look at once we know what you're
trying to do.
>=20
>  - Craig
> --=20
> Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE=20
95CB C76C E5AC 12CA DFA5
> Eye-Net Consulting http://www.eye-net.com.au/      =20
<csmall@eye-net.com.au>
> MIEEE <csmall@ieee.org>                 Debian
developer <csmall@debian.org>
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
