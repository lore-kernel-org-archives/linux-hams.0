From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: usage of f6fbb via telnet port
Date: Fri, 23 Apr 2004 03:23:18 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40888C26.32381.228C49@localhost>
References: <200404221549.53649.dl4mge@darc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <200404221549.53649.dl4mge@darc.de>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org


---
On 22 Apr 2004 at 15:49, G=FCnther Montag wrote:

> Hello friends,
> i am working at connecting a ham program to f6fbb.
> I want to open a bbs prompt (something like a msg "here is fsfbb.. en=
ter "H"=20
> for help... "M" to see your mails... and so on) via telnet, e.g. by=20
> "telnet localhost 3286" (3286 example for port number.
> The fbb doc says there is a way to have a telnet port besides tnc etc=
=2E
> Is it possible this way, and how to configure? pse tips! tnx!

Yes, you can have telnet access to fbb. De default port is=20
6300 but of course you can use another one.

Notice that telnet access is by default in read only mode.

In my personal experience, for example to give access to fbb=20
from linuxnode on the same machine, telnet access was not=20
fine. I used axip instead.

If you still want telnet access, you have to add 1 tnc and 1=20
port. Then add a line like this to the ports:

#Com Interface Address (device)   Baud
2    9         189C               0

and something like this to the tncs:

#TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode Freq
2    8    2   0      250   2     1     10     00/60   TUWR  Telnet

The address in the port line is the tcp port where to listen=20
in hex (6300 in the example).
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
