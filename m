From: Nuno Miguel Fernandes Sucena Almeida <slug@aeminium.org>
Subject: ppdev0: claim the port first // Device "/dev/parport0" neither
 parport nor serport PATCH
Date: Mon, 8 Jul 2002 07:40:27 +0100 (WEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0207080731370.1481-100000@aeminium.aeminium.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,
	i'm trying to use the soundmodem-0.6 with linux kernel 2.4.16
and PTT with parport.
I'm getting the following error from kernel log:

	ppdev0: claim the port first

and the following output from soundmodem:

sbin/soundmodem=20
sm[3171]: Device "/dev/parport0" neither parport nor serport
sm[3171]: cannot start PTT output



	After a quick look at soundcard/ptt.c

i changed line 90 from

} else if (!ioctl(fd, PPRDATA, &x)) {

to=20

} else if ((!ioctl(fd,PPCLAIM))&&(!ioctl(fd, PPRDATA, &x))) {

and the errors no longer occur.

			Cheers,
					Nuno Sucena Almeida
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Para mais informa=E7=F5es veja http://www.gnupg.org

iD8DBQE9KTPi8HEhaPSUrLkRAnmGAKC0KekSTL5eDAsltppkZbJwB7oVjwCeKvTx
KB0HoMoiBpaWi22vAzJBzzA=3D
=3DM8EW
-----END PGP SIGNATURE-----


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
