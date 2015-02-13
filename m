From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: conversd-saupp-1.62a
Date: Fri, 13 Feb 2015 14:53:17 +0000
Message-ID: <viRt6JJd$g3UFw1b@skywaves.demon.co.uk>
References: <1422692681.5081.9.camel@freemail.gr>
 <54CDB20F.8040201@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <54CDB20F.8040201@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org


Hello all

I am trying to install conversd-saupp-1.62a.20090622.tar.gz
on a new Ubuntu 14.4.1 system

and getting the following error. Anyone got any ideas how to over
comethis.
Still lot of warnings in the make, which I ignore as the binaries are
created.

Just not able to create the directories and install the binaries using
the following command.
Anyone have a solution please - may apply to the make install-all as
well

make install-bin
gcc -O2 -s -Wall -Wstrict-prototypes -DWANT_LOG -DFORKPTY
-DOWNER=3D\"daemon\" -DGID=3D\"daemon\"
-DCONF_DIR=3D\"/usr/local/conversd-saupp/etc\"
-DDATA_DIR=3D\"/usr/local/conversd-saupp/var\" -DCONVERSHOST=3D\"localh=
ost\"
-DSETLOGNAMES -DHAVE_LIBREADLINE -DHAVE_READLINE_READLINE_H \
                convers.c ba_stub.o -o convers -lreadline -lncurses
convers.c: In function =E2do_log=E2:
convers.c:255:3: warning: format not a string literal and no format
arguments [-Wformat-security]
   fprintf(stderr, fmt);


73 de Paul G4APL

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
