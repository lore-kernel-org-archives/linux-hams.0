From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: Conflicting node name for services
Date: Sat, 21 Dec 2002 09:56:01 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E042CA1.640F51D6@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hello,

At least I understood a problem using telnet on node software by OH2BNS=
=2E There
was a name conflict using node which may be a generic word. So I change=
d the
following and eveything is working fine now.

In /etc/services use the following line:
netrom          3694/tcp                        # OH2BNS's node softwar=
e

And use the following etc/xinetd.d/node file:
service netrom
{
 socket_type  =3D stream
 protocol  =3D tcp
 wait   =3D no
 user   =3D root
 server   =3D /usr/sbin/node
 server_args  =3D node
 disable   =3D no
}

Don't forget to do a "killall -USR2 xinetd" and enjoy.


--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
