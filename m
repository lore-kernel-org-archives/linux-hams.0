From: "ravioli@softhome.net" <ravioli@softhome.net>
Subject: Re: soundcard pactor program: mailbox mode planned
Date: Wed, 10 Mar 2004 19:21:02 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <404F5C8E.8020102@softhome.net>
References: <200403051359.12776.dl4mge@darc.de> <4048D0B5.6030808@softhome.net> <200403101634.46625.dl4mge@darc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403101634.46625.dl4mge@darc.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?G=FCnther_Montag?= <dl4mge@darc.de>, linux-hams@vger.kernel.org

Hi Gunther,

The last release is 7.04j (Not sure of the 'j').
You can download it on http://www.f6fbb.org/
There is also some documentation on ths site :=20
http://www.f6fbb.org/fbbdoc/doc.htm
To be honest, it is somewhat cryptic.
The point is that this software is ten years old, can do a lot of thing=
s,
is very reliable, can be interfaced with tens of TNCs,
can use internet, soundcards, kiss, etc... to send/receive mails.
It can run on very small machines, 486 PCs with DOS, various Linuxes, e=
tc...
It is written in plain C, not C++. Very simple and robust.
Still compatible with the earliest versions.

The params files are really ugly, but once you get accustomed to,
you do not need to change anything.
The files you need to parameter are principally :
forward.sys and port.sys, plus three or four.

Although it is made for amateur use, I've noted that it professionnaly =
used
in Poland, at least.

It is also technically possible to read/write the mail files, and ask=20
fbb to access specific files.
This the approach of a software called 'mailgw', a mail gateway=20
providing SMTP and POP3 servers
(Although I prefer the native servers provided by FBB). This approach=20
has several advantages :
- You do not need to change anything in FBB code.
- This will work on any platform : DOS, Windows, Linux.
- You just need to have your code write/read these files.
- You can statically check your code, without synchronisation with FBB.
Of course, this architecture idea has to be checked.
See "file forward" as keywords.

Please note as well that FBB is already able to interface to Pactor TNC=
=2E
http://www.cqham.ru/rw6at/1998/pactor.htm
Therefore, an elegant solution, giving less work to do, could be based=20
on this :
When FBB uses a Pactor modem, we must give in the port.sys file the nam=
e
of the serial interface where the TNC is plugged : Typically /dev/cua0=20
or more
recently /dev/ttys0.
Search for "/dev/cua0" in the page :=20
http://apollon.dokkyomed.ac.jp/fbbdoc/fmtport.htm
Then :
1 - If it possible to replace cua0 by any local "named socket",
2 - If hfterm is able to read and write to this new "named socket"=20
exactly like a Pactor TNC,
=2E.. then, FBB will interface smoothly to it.
In other words, hfterm would behave exactly like a Pactor TNC, but on a=
=20
'virtual serial port'.
These two points should obviously be checked before any development.

Hope it was not too boring or pedantic :)

Regards.

R=E9mi F4ECW

PS : Have you seen the compile warnings I sent to the list ? Just for=20
your information.
I was a bit afraid of the compile warnings involving :
- nanosleep.
- A free() on a pointer 'void * m' which may have any value.

G=FCnther Montag wrote:
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
