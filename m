From: Henning Makholm <henning@makholm.net>
Subject: Re: make-3.79.1 bug breaks linux-2.5.24/drivers/net/hamradio/soundmodem
Date: 24 Jun 2002 14:07:34 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <yahptyglw1l.fsf@pc-043.diku.dk>
References: <Pine.LNX.4.21.0206222329070.15173-100000@Consulate.UFP.CX>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: Riley Williams's message of "Sun, 23 Jun 2002 00:01:54 +0100 (BST)"
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Riley Williams <rhw@InfraDead.Org>
Cc: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>, bug-make@gnu.org, Linux Ham Radio <linux-hams@vger.kernel.org>

Scripsit Riley Williams <rhw@InfraDead.Org>

> Linux-Hams package is inherently Linux specific, GNU make is the only
> version of make used with Linux (as far as I have seen anyway), and G=
NU
> make (in all versions I have met) correctly expands $(...) as a singl=
e
> token wherever it is met.

No it doesn't. If it did, it idiomatic rules such as

binary: $(OBJS)
	$(CC) -o $< $(OBJS)

would not work.


It is even easy to check this:

pc-043:~/foo$ cat Makefile
foo =3D a b
bar:
        ./echonum $(foo) stop
pc-043:~/foo$ cat echonum
#! /bin/sh
while true ; do
  echo $1
  [ "$1" =3D stop ] && exit 0 ;
  shift
done
pc-043:~/foo$ gmake bar
=2E/echonum a b stop
a
b
stop
pc-043:~/foo$ gmake --version
GNU Make version 3.79.1, by Richard Stallman and Roland McGrath.
Built for i686-pc-linux-gnu
Copyright (C) 1988, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 2000
        Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

Report bugs to <bug-make@gnu.org>.

pc-043:~/foo$=20

--=20
Henning Makholm        "Hvorfor skulle jeg tale som en slave og en t=E5=
be? Jeg
                =F8nsker ikke, at han skal leve evigt, og jeg ved, at h=
an ikke
               kommer til at leve evigt, uanset om jeg =F8nsker det ell=
er ej."
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
