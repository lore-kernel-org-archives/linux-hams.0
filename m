From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: usage of f6fbb via telnet port
Date: Mon, 26 Apr 2004 02:05:13 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <408C6E5A.5543.3F07BA@localhost>
References: <40888C26.32381.228C49@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <200404231632.20056.dr.g.montag@gmx.net>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org
Cc: =?ISO-8859-1?Q?G=FCnther_Montag?= <dr.g.montag@gmx.net>


---
On 23 Apr 2004 at 16:32, G=FCnther Montag wrote:

> Am Freitag 23 April 2004 08:23 schrieb Rodolfo Brasnarof:
> > ---
> >
> > On 22 Apr 2004 at 15:49, G=FCnther Montag wrote:
> > > Hello friends,
> > > i am working at connecting a ham program to f6fbb.
> > > I want to open a bbs prompt (something like a msg "here is fsfbb.=
=2E enter
> > > "H" for help... "M" to see your mails... and so on) via telnet, e=
=2Eg. by
> > > "telnet localhost 3286" (3286 example for port number.
> > > The fbb doc says there is a way to have a telnet port besides tnc=
 etc.
> > > Is it possible this way, and how to configure? pse tips! tnx!
> >
> > Yes, you can have telnet access to fbb. De default port is
> > 6300 but of course you can use another one.
> >
> > Notice that telnet access is by default in read only mode.
> >
>=20
> Hello!
> tnx to John % Rodolfo, now i managed to connect from console via=20
> telnet localhost 6300=20
> to f6fbb,=20
> it is a fine program!
> (tnx Remi for the suggestion!)
> but sorry only read-only - can i change this someway?

Yes. You have to set M Flag in EU command.

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
