From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: conversd-saupp-1.62a
Date: Sat, 14 Feb 2015 13:54:26 +0000
Message-ID: <20150214135426.GA12773@ds20.borg.net>
References: <1422692681.5081.9.camel@freemail.gr>
 <54CDB20F.8040201@trinnet.net>
 <viRt6JJd$g3UFw1b@skywaves.demon.co.uk>
 <20150213190950.GA437@ds20.borg.net>
 <cYqBEHCy$o3UFwxI@skywaves.demon.co.uk>
 <20150214111254.GA425@ds20.borg.net>
 <SjBy6FCcxz3UFwCP@skywaves.demon.co.uk>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SjBy6FCcxz3UFwCP@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="euc-kr"
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Sat, Feb 14, 2015 at 12:15:24PM +0000, Paul Lewis wrote:
> Hello Thorsten

Hi Paul!

> I think you are right about that.
> Ok on this change here is the result for info.
>  make install-all

As a rule of thumb, you generally should use a plain 'make' first,
and only if you are satisfied with the result (no errors detected)
proceed with 'make install' etc.
Otherwise with sloppy Makefiles you might end up with a broken
installation that possibly overwrote a working previous version....


> warning: your configuration will be overwritten with
>          the provided example files.
>          do you really want to do this?
>                anyway, a backup is made for every file, as filename~
>          press ^C to interrupt
> sleep 10
> make install install-conf
> make[1]: Entering directory `/usr/local/src/ax25/conversd-saupp'
> gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
> -DOWNER=3D\"daemon\" -DGID=3D\"daemon\" -DCONF_DIR=3D\"/usr/local/con=
v
> ersd-saupp/etc\" -DDATA_DIR=3D\"/usr/local/conversd-saupp/var\"
> -DCONVERSHOST=3D\"localhost\" -DNO_SHELL -DRAW -DNO_IOCTL \
>                 convers.c ba_stub.o -o rawconvers
> convers.c: In function =C3=A2main=C3=A2:
> convers.c:628:0: error: unterminated #else
>  #ifdef NO_IOCTL
>  ^=20

Ok, I suppose you botched the last correction. Did you notice you
needed to replace _two_ old lines with _three_ new lines? And two
of the new lines have a '#' at the beginning.

The whole block should read linke this:

    628 #ifdef  NO_IOCTL
    629     echo =3D 0;
    630 #else
    631     signal(SIGTSTP, SIG_IGN);   /* suspend */
    632     if (tcgetattr(0, &prev_termios)) stop(convtype);
    633     memcpy(&curr_termios, &prev_termios, sizeof(struct termios)=
);
    634     echo =3D curr_termios.c_lflag & ECHO;
    635     curr_termios.c_lflag =3D 0;
    636     curr_termios.c_cc[VMIN] =3D 1;
    637     curr_termios.c_cc[VTIME] =3D 0;
    638 #ifdef HAVE_LIBREADLINE
    639     screenwidth =3D 80;
    640 #if defined (TIOCGWINSZ)
    641     if (ioctl (0, TIOCGWINSZ, &window_size) =3D=3D 0)
    642     {
    643         screenwidth =3D (int) window_size.ws_col;
    644     }
    645 #endif
    646     curr_termios.c_lflag =3D curr_termios.c_lflag & ~ECHO;
    647     // at the time of writing, rl_event_hook is buggy
    648     // http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D14458=
5
    649     rl_event_hook =3D 0;
    650 #ifdef  RL_READLINE_VERSION /* older version have no RL_READLIN=
E_VERSION :( */
    651 #   if (RL_READLINE_VERSION < 0x0400)
    652         rl_event_hook =3D (Function *) do_select_call;
    653 #   endif
    654 #endif
    655 #endif
    656     if (tcsetattr(0, TCSANOW, &curr_termios)) stop(convtype);
    657 #endif


Note that in lines 653 to 655 there are three '#endif's in a row.
In general each '#if' and '#ifdef' needs a corresponding '#endif'.
The compiler (preprocessor, to be precise) tells you, that it cannot fi=
nd
the '#endif' belonging to '#ifdef  NO_IOCTL' (line 628) / '#else' (line=
 630).
The matching '#endif' is in line 657, but that only works out, if the o=
ther
'#if'/'#ifdef's and '#endif's in between are correctly paired.


> convers.c:629:5: error: expected declaration or statement at end of
> input
>      echo =3D 0;
>      ^

This error is a result from the problem above.

> convers.c:591:11: warning: unused variable =C3=A2init_string=C3=A2
> [-Wunused-variable]
>      char *init_string =3D 0;
>            ^

All those 'unused variable' warnings can be more or less safely ignored=
=2E
They are a sign of sloppy programming.

73 Thorsten

> 73 de Paul g4apl
>=20
>=20
>=20
>=20
>=20
> >replace these two lines (line 651-652 in convers.c)
> >
> >    if (RL_READLINE_VERSION < 0x0400)
> >        rl_event_hook =3D (Function *) do_select_call;
> >
> >with these three lines:
> >
> >#   if (RL_READLINE_VERSION < 0x0400)
> >        rl_event_hook =3D (Function *) do_select_call;
> >#   endif
> >
> >
> >The whole package is in a need of a deep overhaul. There's a lot of =
unfinished
> >code in it. And support for some really ancient libraries should pro=
bably just
> >be removed.

--=20
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de               =
       |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Ge=
rmany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130=
=2E8.19] |
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
