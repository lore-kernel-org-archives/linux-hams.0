From: "Ed Guy" <edguy@emcsw.com>
Subject: Re: installing packet
Date: Wed, 20 Nov 2002 08:31:10 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <06ab01c29099$177d9f60$7d01a8c0@sherry>
References: <20021120115855.36875.qmail@web20511.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Evandro Eduardo Seron Ruiz <evandro_ruiz@yahoo.com.br>, linux-hams@vger.kernel.org

Evandro,

You probably need to install the 'ncurses-devel' package.
It supplies the curses.h file.

73
/ed n2uth



----- Original Message -----
=46rom: "Evandro Eduardo Seron Ruiz" <evandro_ruiz@yahoo.com.br>
To: <linux-hams@vger.kernel.org>
Sent: Wednesday, November 20, 2002 6:58 AM
Subject: installing packet


>
>  Hello,
>
>  In order to have a packet system installed I have
>  downloaded the following packages:
>
>  ibax25-0.0.10.tar.gz
>  ax25-tools-0.0.8.tar.gz
>  ax25-apps-0.0.6.tar.gz    l
>
>  The first two the instalation succeeded, but when it
>  came to the last one I got the following error
> message
>  after the make install
>
> gcc -DHAVE_CONFIG_H -I. -I. -I..     -g -O2 -Wall -c
> call.c
> call.c:38:20: curses.h: Arquivo ou diret=F3rio n=E3o
> encontrado
> make[1]: ** [call.o] Erro 1
> make[1]: Saindo do diret=F3rio
> `/usr/src/ax25-apps-0.0.6/call'
> make: ** [install-recursive] Erro 1
>
>  Could anyone help me solve this.
>
>  Yours,
>  Evandro
>
>
> =3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>  Evandro Eduardo Seron Ruiz               PY2PCY
>

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
