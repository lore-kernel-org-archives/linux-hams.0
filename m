From: =?iso-8859-1?q?Evandro=20Eduardo=20Seron=20Ruiz?= 
	<evandro_ruiz@yahoo.com.br>
Subject: installing packet
Date: Thu, 21 Nov 2002 10:09:33 -0300 (ART)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021121130933.87823.qmail@web20507.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

 Thank you all for the help.
 It really was not clear for me that I had
 to install ncurses-devel not ncurses,
 but this was not the only problem.

 To make it shorter I found it easier to
 install using rpm instead of compiling the
 sources. The ax25lib, the tools and the apps
 seem to be very dependent of the source code
 and not only of the funcionality.

 It took me too much time to find the exact
 combination of packages wich seems now to
 work, which  are:

  libax25_0-0.0.10-1mdk
  ax25-tools-0.0.8-3mdk
  ax25-apps-0.0.6-1mdk
 =20
 for the Mandrake distribution.

 Thank you all so much,

 Evandro Ruiz
 PY2 PCY=20



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
