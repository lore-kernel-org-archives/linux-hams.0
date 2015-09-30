From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Thu, 01 Oct 2015 01:04:25 +0200
Message-ID: <560C6A79.4070400@eclis.ch>
References: <5605828E.5010104@eclis.ch> <20150929153129.GA31429@linux-mips.org> <560B2CEF.4060209@eclis.ch> <2A123A0E-5F98-44BE-AC11-23B96B7F8925@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2A123A0E-5F98-44BE-AC11-23B96B7F8925@osterried.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Thomas Osterried <thomas@osterried.de>, David Ranch <dranch@trinnet.net>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org

Le 30. 09. 15 22:22, Thomas Osterried a =E9crit :
> Hello,
>
>> Unfortunately the kernel 4.3.0-rc3+ crash the same way. I suspect th=
at the real question is: what in ax25/mkiss make tty_ldisc_hangup() cal=
ling tty_ldisc_open() on a serial port that no longer exists, and how t=
o avoid this ?

=46irst, many many thanks for your time investigating this bug.

> that=92s a good question ;)
>
> We had a long debug sessions today.
>
> tty_ldisc_hangup() always calls tty_ldisc_reinit(tty, N_TTY)) and tty=
_ldisc_open(tty, tty->ldisc)).

Conceptually, is there any good reason to call tty_ldisc_reinit() on a=20
deleted device ? I would like to propose a check in tty_ldisc_hangup()=20
to test if the underlying device still exists. If not the tty can be=20
deleted. That said, I don't know enough this kernel part to assert that=
=20
it's a good proposal or not.

In case the call tty_ldisc_reinit() is really needed, it seem to be=20
acceptable to use the N_TTY line discipline instead of N_AX25 one. My=20
understanding is that this will prevent calling mkiss_open() right afte=
r=20
the mkiss_close().

> mkiss_close() is supposed to be called, because the old interface dis=
appeared (we have the same number of ax25-interfaces bevor and after th=
e plug).

I remember having traced this, and yes mkiss_close() is called before. =
I=20
don't think there is any issue regarding this.

> After the plug, mkiss_open() is called again, because the ldisc defin=
es:
> static struct tty_ldisc_ops ax_ldisc =3D { =85         .open         =
  =3D mkiss_open, =85}

This is certainly the strangest part. How is that possible since the=20
tty_ldisc_reinit() is explicitly called with the N_TTY line discipline=20
in argument ? I would expect that tty_ldisc_reinit() will call this ins=
tead:

struct tty_ldisc_ops tty_ldisc_N_TTY =3D { ...    .open            =3D=20
n_tty_open, ...}

I was unable to catch a problem in tty_ldisc_reinit(tty, N_TTY) that=20
correctly set tty->ldisc so that the tty_ldisc_open(tty, tty->ldisc)=20
must call n_tty_open(). I now suspect that in tty_ldisc_hangup() the=20
reset variable is zero so that tty_ldisc_reinit(tty,=20
tty->termios.c_line) and tty_ldisc_open(tty, tty->ldisc) are called. At=
=20
this point I think that the bug is that some code is missing to set=20
tty->driver->flags |=3D TTY_DRIVER_RESET_TERMIOS before tty_ldisc_hangu=
p()=20
is called.

I fully agree with all the rest of your message, but I believe it=20
describes the logical consequences of an earlier problem.

Regards,
Jean-Christian

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
