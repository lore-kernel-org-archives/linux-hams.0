From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: conversd-saupp-1.62a
Date: Sat, 14 Feb 2015 12:15:24 +0000
Message-ID: <SjBy6FCcxz3UFwCP@skywaves.demon.co.uk>
References: <1422692681.5081.9.camel@freemail.gr>
 <54CDB20F.8040201@trinnet.net> <viRt6JJd$g3UFw1b@skywaves.demon.co.uk>
 <20150213190950.GA437@ds20.borg.net> <cYqBEHCy$o3UFwxI@skywaves.demon.co.uk>
 <20150214111254.GA425@ds20.borg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150214111254.GA425@ds20.borg.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: dl8bcu@dl8bcu.de
Cc: linux-hams@vger.kernel.org

Hello Thorsten

I think you are right about that.
Ok on this change here is the result for info.
 make install-all
warning: your configuration will be overwritten with
         the provided example files.
         do you really want to do this?
               anyway, a backup is made for every file, as filename~
         press ^C to interrupt
sleep 10
make install install-conf
make[1]: Entering directory `/usr/local/src/ax25/conversd-saupp'
gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\" -DCONF_DIR=3D\"/usr/local/conv
ersd-saupp/etc\" -DDATA_DIR=3D\"/usr/local/conversd-saupp/var\"
-DCONVERSHOST=3D\"localhost\" -DNO_SHELL -DRAW -DNO_IOCTL \
                convers.c ba_stub.o -o rawconvers
convers.c: In function =E2main=E2:
convers.c:628:0: error: unterminated #else
 #ifdef NO_IOCTL
 ^
convers.c:629:5: error: expected declaration or statement at end of
input
     echo =3D 0;
     ^
convers.c:591:11: warning: unused variable =E2init_string=E2
[-Wunused-variable]
     char *init_string =3D 0;
           ^
convers.c:589:11: warning: unused variable =E2p=E2 [-Wunused-variable]
     char *p;
           ^
convers.c:585:29: warning: unused variable =E2daddr=E2 [-Wunused-variab=
le]
     struct sockaddr *addr, *daddr;
                             ^
convers.c:585:22: warning: unused variable =E2addr=E2 [-Wunused-variabl=
e]
     struct sockaddr *addr, *daddr;
                      ^
convers.c:584:18: warning: unused variable =E2daddrlen=E2
[-Wunused-variable]
     int addrlen, daddrlen;
                  ^
convers.c:584:9: warning: unused variable =E2addrlen=E2 [-Wunused-varia=
ble]
     int addrlen, daddrlen;
         ^
convers.c:577:9: warning: unused variable =E2errflag=E2 [-Wunused-varia=
ble]
     int errflag =3D 0;
         ^
convers.c:576:9: warning: unused variable =E2ch=E2 [-Wunused-variable]
     int ch;
         ^
convers.c:574:10: warning: unused variable =E2getopt_opts=E2
[-Wunused-variable]
     char getopt_opts[64];
          ^
convers.c:573:10: warning: unused variable =E2buffer=E2 [-Wunused-varia=
ble]
     char buffer[512];
          ^
convers.c:629:5: warning: control reaches end of non-void function
[-Wreturn-type]
     echo =3D 0;
     ^
make[1]: *** [rawconvers] Error 1
make[1]: Leaving directory `/usr/local/src/ax25/conversd-saupp'
make: *** [install-all] Error 2
73 de Paul g4apl





>replace these two lines (line 651-652 in convers.c)
>
>    if (RL_READLINE_VERSION < 0x0400)
>        rl_event_hook =3D (Function *) do_select_call;
>
>with these three lines:
>
>#   if (RL_READLINE_VERSION < 0x0400)
>        rl_event_hook =3D (Function *) do_select_call;
>#   endif
>
>
>The whole package is in a need of a deep overhaul. There's a lot of un=
finished
>code in it. And support for some really ancient libraries should proba=
bly just
>be removed.
>
>73 Thorsten
--=20
paul@skywaves.demon.co.uk
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
