From: =?iso-8859-1?Q?G=E9rard?= / F6FGZ <f6fgz@free.fr>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 19:59:43 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4170100F.F5F43579@free.fr>
References: <620c9057041015095771b236e0@mail.gmail.com>  <620c9057041013094421cbf279@mail.gmail.com> <20041014025505.66938.qmail@web40824.mail.yahoo.com> <620c9057041014060070eeccf6@mail.gmail.com> <200410141313.i9EDDoah001022@yagi.h-net.msu.edu> <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Dennis Boone a =E9crit :

>         mkiss -c -l -s 19200 /dev/ttyS0 /dev/ptyz0 /dev/ptyz1
>         kissattach /dev/ptyz0 hfport 44.135.96.242
>         kissattach /dev/ptyz0 vhfport 44.135.96.243

I correct your memory ;-)
kissattach /dev/ttyz0 hfport 44.135.96.242
kissattach /dev/ttyz1 vhfport 44.135.96.243

It is important to have ptyxx from one side corresponding to ttyxx on t=
he other
side.
From /usr/src/linux/Documentation/devices.txt:
  2 char        Pseudo-TTY masters
                  0 =3D /dev/ptyp0        First PTY master
                  1 =3D /dev/ptyp1        Second PTY master
                    ...
                255 =3D /dev/ptyef        256th PTY master

                Pseudo-tty's are named as follows:
                * Masters are "pty", slaves are "tty";
                * the fourth letter is one of pqrstuvwxyzabcde indicati=
ng
                  the 1st through 16th series of 16 pseudo-ttys each, a=
nd
                * the fifth letter is one of 0123456789abcdef indicatin=
g
                  the position within the series.

Choose some pairs !


--
73 G=E9rard F6FGZ
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
