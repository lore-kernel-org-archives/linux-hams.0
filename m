From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: conversd-saupp-1.62a
Date: Fri, 13 Feb 2015 23:59:46 +0000
Message-ID: <cYqBEHCy$o3UFwxI@skywaves.demon.co.uk>
References: <1422692681.5081.9.camel@freemail.gr>
 <54CDB20F.8040201@trinnet.net> <viRt6JJd$g3UFw1b@skywaves.demon.co.uk>
 <20150213190950.GA437@ds20.borg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150213190950.GA437@ds20.borg.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: dl8bcu@dl8bcu.de
Cc: linux-hams@vger.kernel.org

Hi all

made the changes to convers.c as suggested
make clean
make install
make install-all


got a lot of warnings and these look like errors flagged up
which I have extracted
##
make install
user.c:4655:9: warning: ignoring return value of =E2fgets=E2, declared =
with
attribute warn_unused_result [-Wunused-result]
    fgets(lx, 128, fd);
         ^
In file included from /usr/include/stdio.h:937:0,
                 from user.c:15:
In function =E2fgets=E2,
    inlined from =E2last_command=E2 at user.c:1192:15:
/usr/include/i386-linux-gnu/bits/stdio2.h:261:2: warning: call to
=E2__fgets_chk_warn=E2 declared with attribute warning: fgets called wi=
th
bigger size than length of destination buffer [enabled by default]
  return __fgets_chk_warn (__s, __bos (__s), __n, __stream);
  ^
gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
-DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
-DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"localh=
ost\"
-c host.c
host.c: In function =E2h_ecmd_command=E2:
host.c:166:6: warning: variable =E2arglen=E2 set but not used
[-Wunused-but-set-variable]
  int arglen;

##
host.c:164:21: warning: variable =E2params=E2 set but not used
[-Wunused-but-set-variable]
  char *arg, *user, *params;
                     ^
host.c: In function =E2h_netjoin_command=E2:
host.c:2191:22: warning: the address of =E2buffer=E2 will always evalua=
te as
=E2true=E2 [-Waddress]
  lock_j_unlock_other(buffer);
                      ^
host.c:2071:8: note: in definition of macro =E2lock_j_unlock_other=E2
    if (s) \
        ^
host.c: In function =E2h_sysi_command=E2:
host.c:1394:10: warning: ignoring return value of =E2fscanf=E2, declare=
d
with attribute warn_unused_result [-Wunused-result]
    fscanf(fd, "%ld", &uptime);
          ^
host.c:1398:10: warning: ignoring return value of =E2fgets=E2, declared=
 with
attribute warn_unused_result [-Wunused-result]
     fgets(lx, 128, fd);

##
In file included from md5_ampr.c:10:0:
md5.h:60:6: note: expected =E2unsigned char *=E2 but argument is of typ=
e
=E2char *=E2
 void MD5Update(MD5_CTX *mdContext, unsigned char *inBuf, unsigned int
inLen);
      ^
gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
-DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
-DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"localh=
ost\"
-o conversd conversd.o user.o host.o irc.o convert.o config.o tnos.o
log.o cfgfile.o access.o noflood.o hmalloc.o ba_stub.o compression.o
md5.o md5_ampr.o  -lutil
gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
-DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
-DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"localh=
ost\"
-DNO_SHELL -DRAW -DNO_IOCTL \
                convers.c ba_stub.o -o rawconvers
gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
-DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
-DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"localh=
ost\"
-DSETLOGNAMES -DHAVE_LIBREADLINE -DHAVE_READLINE_READLINE_H \
                convers.c ba_stub.o -o convers -lreadline -lncurses
convers.c: In function =E2main=E2:
convers.c:652:23: error: =E2Function=E2 undeclared (first use in this
function)
      rl_event_hook =3D (Function *) do_select_call;
                       ^
convers.c:652:23: note: each undeclared identifier is reported only onc=
e
for each function it appears in
convers.c:652:33: error: expected expression before =E2)=E2 token
      rl_event_hook =3D (Function *) do_select_call;
                                 ^
convers.c:917:10: warning: ignoring return value of =E2system=E2, decla=
red
with attribute warn_unused_result [-Wunused-result]
    system(line + 1);
          ^
make: *** [convers] Error 1

##################


make install-all
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
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
-DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
-DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"localh=
ost\"
-DSETLOGNAMES -DHAVE_LIBREADLINE -DHAVE_READLINE_READLINE_H \
                convers.c ba_stub.o -o convers -lreadline -lncurses
convers.c: In function =E2main=E2:
convers.c:652:23: error: =E2Function=E2 undeclared (first use in this
function)
      rl_event_hook =3D (Function *) do_select_call;
                       ^
convers.c:652:23: note: each undeclared identifier is reported only onc=
e
for each function it appears in
convers.c:652:33: error: expected expression before =E2)=E2 token
      rl_event_hook =3D (Function *) do_select_call;
                                 ^
convers.c:917:10: warning: ignoring return value of =E2system=E2, decla=
red
with attribute warn_unused_result [-Wunused-result]
    system(line + 1);
          ^
make[1]: *** [convers] Error 1
make[1]: Leaving directory `/usr/local/src/ax25/conversd-saupp'
make: *** [install-all] Error 2

###########
73 de Paul G4APl



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
