From: =?iso-8859-1?q?Evandro=20Eduardo=20Seron=20Ruiz?= 
	<evandro_ruiz@yahoo.com.br>
Subject: installing packet
Date: Wed, 20 Nov 2002 08:58:55 -0300 (ART)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021120115855.36875.qmail@web20511.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org


 Hello,

 In order to have a packet system installed I have
 downloaded the following packages:

 ibax25-0.0.10.tar.gz
 ax25-tools-0.0.8.tar.gz
 ax25-apps-0.0.6.tar.gz    l

 The first two the instalation succeeded, but when it
 came to the last one I got the following error
message
 after the make install

gcc -DHAVE_CONFIG_H -I. -I. -I..     -g -O2 -Wall -c
call.c
call.c:38:20: curses.h: Arquivo ou diret=F3rio n=E3o
encontrado
make[1]: ** [call.o] Erro 1
make[1]: Saindo do diret=F3rio
`/usr/src/ax25-apps-0.0.6/call'
make: ** [install-recursive] Erro 1

 Could anyone help me solve this.

 Yours,
 Evandro


=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
 Evandro Eduardo Seron Ruiz               PY2PCY

_______________________________________________________________________
Yahoo! GeoCities
Tudo para criar o seu site: ferramentas f=E1ceis de usar, espa=E7o de s=
obra e acess=F3rios.
http://br.geocities.yahoo.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
